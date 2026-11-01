#!/usr/bin/env python3

"""Split kickstart's monolithic init.lua into modular Lua files.

This script is intentionally repo-specific. It understands the current section
markers in the single-file init.lua and emits the modular tree into a separate
output root:

* init.lua loader
* one Lua file per core section (options, keymaps, pack, plugins)
* by default, no section headers are emitted (use --section-headers to include them)

Use --write to update files and --check to verify them.
"""

from __future__ import annotations

import argparse
import difflib
import re
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import NoReturn, cast


@dataclass(frozen=True)
class CliArgs:
    source: str
    output_root: str
    write: bool
    check: bool
    section_headers: bool = False


@dataclass(frozen=True)
class SectionHeader:
    title: str
    description: str


SECTION_HEADER_RE = re.compile(r"^-- SECTION (?P<number>\d+): (?P<title>.+)$")
SECTION_DESCRIPTION_RE = re.compile(r"^-- (?P<description>.+)$")
SEPARATOR_LINE = "-- ============================================================"
MODELINE = "-- vim: ts=2 sts=2 sw=2 et"
# Full gh() comments from init.lua:
#    "--- Because most plugins are hosted on GitHub, you can use the helper",
#    "--- function to have less repetition in the following sections.",
#    "---@param repo string",
#    "---@return string",
GH_HELPER = [
    "local function gh(repo) return 'https://github.com/' .. repo end",
]


@dataclass(frozen=True)
class PluginBlock:
    preamble: list[str]
    start: int
    name: str


@dataclass(frozen=False)
class ModuleSpec:
    number: int
    path: Path
    module: str
    uses_gh: bool = False
    split: bool = False
    plugins: list[str] = field(default_factory=list)


FILE_SPECS = [
    ModuleSpec(1, Path("lua/options.lua"), "options"),
    ModuleSpec(2, Path("lua/keymaps.lua"), "keymaps"),
    ModuleSpec(3, Path("lua/pack.lua"), "pack"),
    ModuleSpec(4, Path("lua/kickstart/plugins/ui.lua"), "kickstart.plugins.ui",
               uses_gh=True, split=True),
    ModuleSpec(5, Path("lua/kickstart/plugins/telescope.lua"), "kickstart.plugins.telescope", uses_gh=True),
    ModuleSpec(6, Path("lua/kickstart/plugins/lspconfig.lua"), "kickstart.plugins.lspconfig", uses_gh=True),
    ModuleSpec(7, Path("lua/kickstart/plugins/conform.lua"), "kickstart.plugins.conform", uses_gh=True),
    ModuleSpec(8, Path("lua/kickstart/plugins/blink-cmp.lua"), "kickstart.plugins.blink-cmp", uses_gh=True),
    ModuleSpec(9, Path("lua/kickstart/plugins/treesitter.lua"), "kickstart.plugins.treesitter", uses_gh=True),
]

ALL_SECTION_NUMBERS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

ARGS: CliArgs


def fail(message: str) -> NoReturn:
    raise SystemExit(message)


def read_lines(path: Path) -> list[str]:
    try:
        return path.read_text(encoding="utf-8").splitlines()
    except FileNotFoundError:
        fail(f"missing source file: {path}")


def render(lines: list[str]) -> str:
    text = "\n".join(lines)
    if not text.endswith("\n"):
        text += "\n"
    return text


def parse_section_headers(lines: list[str]) -> dict[int, SectionHeader]:
    headers: dict[int, SectionHeader] = {}
    for idx, line in enumerate(lines):
        match = SECTION_HEADER_RE.match(line)
        if match:
            number = int(match.group("number"))
            title = match.group("title")
            description = ""
            if idx + 1 < len(lines):
                desc_match = SECTION_DESCRIPTION_RE.match(lines[idx + 1])
                if desc_match:
                    description = desc_match.group("description")
            if number in headers:
                fail(f"duplicate section marker {number}")
            headers[number] = SectionHeader(title=title, description=description)
    return headers


def make_header(number: int, header: SectionHeader) -> list[str]:
    result = [
        SEPARATOR_LINE,
        f"-- SECTION {number}: {header.title}",
        f"-- {header.description}",
        SEPARATOR_LINE,
        "",
    ]
    return result


def find_section_headers(lines: list[str]) -> dict[int, int]:
    headers: dict[int, int] = {}
    for idx, line in enumerate(lines):
        match = SECTION_HEADER_RE.match(line)
        if match:
            number = int(match.group("number"))
            if number in headers:
                fail(f"duplicate section marker {number}")
            headers[number] = idx
    return headers



def section_start_index(lines: list[str], header_idx: int) -> int:
    start_idx = header_idx - 1
    if start_idx < 0 or lines[start_idx] != SEPARATOR_LINE:
        fail(f"section header at line {header_idx + 1} is missing its leading separator")
    return start_idx


def section_end_index(lines: list[str], next_header_idx: int | None) -> int:
    if next_header_idx is None:
        for idx in range(len(lines) - 1, -1, -1):
            if lines[idx] == "end":
                return idx
        fail("could not find the final section end")

    end_idx: int = next_header_idx - 2
    if end_idx < 0:
        fail("invalid section boundary before the next header")
    return end_idx


def section_body(lines: list[str]) -> list[str]:
    do_idx = -1
    end_idx = -1
    for idx, line in enumerate(lines):
        if line == "do" and do_idx < 0:
            do_idx = idx

    if do_idx < 0:
        fail("section did not contain a top-level do block")

    for idx in range(len(lines) - 1, do_idx, -1):
        if lines[idx] == "end":
            end_idx = idx
            break

    if end_idx < 0:
        fail("section did not contain a matching end block")

    return lines[do_idx + 1 : end_idx]


def dedent_block(lines: list[str]) -> list[str]:
    dedented: list[str] = []
    for line in lines:
        if line.startswith("  "):
            dedented.append(line[2:])
        else:
            dedented.append(line)
    return dedented


def build_section_module(lines: list[str], uses_gh: bool) -> list[str]:
    body = dedent_block(section_body(lines))
    if uses_gh:
        return [*GH_HELPER, "", *body]
    return body


PLUGIN_NAME_RE = re.compile(r"gh\s*['\"]([^'\"]+)['\"]")


def extract_plugin_name(line: str) -> str:
    """Extract plugin name from a vim.pack.add line.

    From 'vim.pack.add { gh \'folke/todo-comments.nvim\' }' → 'todo-comments'
    From 'if ... then vim.pack.add { gh \'nvim-tree/nvim-web-devicons\' } end' → 'web-devicons'
    """
    match = PLUGIN_NAME_RE.search(line)
    if not match:
        fail(f"could not extract plugin name from: {line}")
    repo = match.group(1)  # e.g. 'folke/todo-comments.nvim'
    name = repo.rsplit('/', 1)[-1]  # strip owner/ → 'todo-comments.nvim'
    return name.removesuffix('.nvim')


def find_setup_block(lines: list[str]) -> tuple[int, int] | None:
    """Find a setup { ... } block and return (start_idx, end_idx) inclusive.

    Works because stylua keeps nested braces indented, so the closing brace
    of the outermost setup block is always at column 0 after dedenting.
    Returns None if no setup block is found.
    """
    for i, line in enumerate(lines):
        if '.setup {' in line:
            for j in range(i + 1, len(lines)):
                if lines[j] == '}':
                    return (i, j)
            break  # setup found but no closing brace
    return None


def extract_setup_content(lines: list[str]) -> str | None:
    """Extract the inner content of a setup { ... } block."""
    block = find_setup_block(lines)
    if block is None:
        return None
    start, end = block
    return '\n'.join(lines[start + 1:end])


def _merge_with_extra(plugin_name: str, content: list[str], source_root: Path) -> list[str]:
    """If a plugin has an extra config file with a setup block, merge them.

    The extra file's setup content is appended to the init.lua version.
    A trailing comma is added to the first block if missing (styLua usually adds it).
    """
    extra_path = source_root / 'lua' / 'kickstart' / 'plugins' / f'{plugin_name}.lua'
    if not extra_path.exists():
        return content

    init_setup = extract_setup_content(content)
    extra_setup = extract_setup_content(read_lines(extra_path))

    if not init_setup or not extra_setup:
        return content

    # Concatenate with comma safety
    merged = init_setup.rstrip()
    if not merged.endswith(','):
        merged += ','
    merged += '\n' + extra_setup

    return replace_setup_block(content, merged)


def replace_setup_block(content: list[str], merged_setup: str) -> list[str]:
    """Replace the existing setup { ... } block in content with a merged version."""
    block = find_setup_block(content)
    if block is None:
        return content
    start, end = block
    result = list(content[:start + 1])  # everything including the setup line
    for ml in merged_setup.split('\n'):
        result.append(ml)
    result.append('}')
    result.extend(content[end + 1:])  # everything after closing brace
    return result


def split_section(section_lines: list[str], spec: ModuleSpec, source_root: Path) -> dict[Path, list[str]]:
    """Split a section into individual plugin files.

    Scans for vim.pack.add lines (not commented-out), groups the preceding
    comment preamble + following code up to the next block, extracts the
    plugin name, mutates spec.plugins with the ordered list of names,
    and returns a mapping of filename → content lines.
    """
    # Strip do/end wrapper and dedent (same as build_section_module does)
    inner = dedent_block(section_body(section_lines))

    # Step 1: Find all vim.pack.add boundaries with their preceding comment preambles
    blocks: list[PluginBlock] = []
    for i, line in enumerate(inner):
        # Skip commented-out lines
        stripped = line.lstrip()
        if stripped.startswith('--'):
            continue
        # Check for vim.pack.add (not necessarily at line start)
        if 'vim.pack.add' in line:
            # Walk backward to collect comment preamble
            preamble: list[str] = []
            for j in range(i - 1, -1, -1):
                if inner[j].strip() == '' or inner[j].strip().startswith('--'):
                    preamble.insert(0, inner[j])
                else:
                    break
            name = extract_plugin_name(line)
            blocks.append(PluginBlock(preamble=preamble, start=i, name=name))

    if not blocks:
        fail("section contains no vim.pack.add blocks")

    # Step 2: Slice lines into blocks (each block = preamble + code up to next preamble)
    outputs: dict[Path, list[str]] = {}
    for idx, block in enumerate(blocks):
        start = block.start
        # End is the start of the next block's preamble, or end of inner
        if idx + 1 < len(blocks):
            next_preamble_start = blocks[idx + 1].start - len(blocks[idx + 1].preamble)
        else:
            next_preamble_start = len(inner)

        # Collect lines from preamble start to just before next block's code
        preamble_start = start - len(block.preamble)
        block_lines = inner[preamble_start:next_preamble_start]

        # Strip leading blank lines so the single "" after gh() is the only separator
        while block_lines and block_lines[0].strip() == '':
            block_lines.pop(0)

        # Add gh helper and format
        if spec.uses_gh:
            content = [*GH_HELPER, "", *block_lines]
        else:
            content = list(block_lines)

        # Post-process: merge with extra config file if one exists
        content = _merge_with_extra(block.name, content, source_root)

        plugin_path = Path(f"lua/kickstart/plugins/{block.name}.lua")
        outputs[plugin_path] = content

    # Step 3: Populate spec.plugins (side effect)
    spec.plugins = [b.name for b in blocks]

    return outputs


def build_plugin_loader() -> list[str]:
    lines = ["-- Load plugin modules in order.", ""]
    for spec in FILE_SPECS[3:]:
        if spec.split:
            for name in spec.plugins:
                lines.append(f"require 'kickstart.plugins.{name}'")
        else:
            lines.append(f"require '{spec.module}'")
    return lines


def build_root_init(prelude: list[str], postlude: list[str]) -> list[str]:
    root = list(prelude)
    if root and root[-1] != "":
        root.append("")

    root.extend(
        [
            "-- [[ Setting options ]]",
            "require 'options'",
            "",
            "-- [[ Basic Keymaps ]]",
            "require 'keymaps'",
            "",
            "-- [[ Set up vim.pack ]]",
            "require 'pack'",
            "",
            "-- [[ Configure and install plugins ]]",
            "require 'plugins'",
        ]
    )
    root.extend(postlude)
    return root


def build_outputs(source_lines: list[str], source_root: Path) -> dict[Path, list[str]]:
    headers = find_section_headers(source_lines)
    section_headers = parse_section_headers(source_lines)
    expected_numbers = ALL_SECTION_NUMBERS
    if sorted(headers) != expected_numbers:
        fail(f"section markers do not match expected set: found {sorted(headers)}, expected {expected_numbers}")

    header_positions = [headers[number] for number in expected_numbers]
    if header_positions != sorted(header_positions):
        fail("section markers are out of order")

    first_header_idx = min(headers.values())
    first_section_start_idx = section_start_index(source_lines, first_header_idx)
    prelude = source_lines[:first_section_start_idx]

    section_lines: list[list[str]] = []
    for i, number in enumerate(expected_numbers):
        next_idx = headers[expected_numbers[i + 1]] if i + 1 < len(expected_numbers) else None
        start = section_start_index(source_lines, headers[number])
        end = section_end_index(source_lines, next_idx)
        section_lines.append(source_lines[start : end + 1])

    def _header(number: int) -> list[str]:
        if ARGS.section_headers:
            return make_header(number, section_headers[number])
        return []

    spec_by_number = {spec.number: spec for spec in FILE_SPECS}
    outputs: dict[Path, list[str]] = {
        Path("init.lua"): build_root_init(prelude, source_lines[section_end_index(source_lines, None) + 1 :]),
    }

    # Process sections first (populates spec.plugins for split sections)
    for i, number in enumerate(expected_numbers[:9]):
        spec = spec_by_number[number]
        if spec.split:
            outputs.update(split_section(section_lines[i], spec, source_root))
        else:
            outputs[spec.path] = [*_header(number), *build_section_module(section_lines[i], spec.uses_gh)]

    # Generate plugins.lua after split sections are processed
    outputs[Path("lua/plugins.lua")] = [*build_plugin_loader(), "", *_header(10), *build_section_module(section_lines[9], False)]

    # Append modeline to every output file
    for lines in outputs.values():
        if lines and lines[-1] != MODELINE:
            lines.append("")
            lines.append(MODELINE)

    return outputs


def write_outputs(outputs: dict[Path, list[str]], root: Path) -> None:
    for rel_path, lines in outputs.items():
        path = root / rel_path
        path.parent.mkdir(parents=True, exist_ok=True)
        _ = path.write_text(render(lines), encoding="utf-8")


def check_outputs(outputs: dict[Path, list[str]], root: Path) -> int:
    exit_code = 0
    for rel_path, lines in outputs.items():
        path = root / rel_path
        expected = render(lines)
        if not path.exists():
            print(f"MISSING {rel_path}")
            exit_code = 1
            continue

        current = path.read_text(encoding="utf-8")
        if current != expected:
            print(f"DIFF {rel_path}")
            diff = difflib.unified_diff(
                current.splitlines(),
                expected.splitlines(),
                fromfile=str(rel_path),
                tofile=f"expected/{rel_path}",
                lineterm="",
            )
            for line in diff:
                print(line)
            exit_code = 1
    return exit_code


def parse_args() -> CliArgs:
    parser = argparse.ArgumentParser(description=__doc__)
    _ = parser.add_argument("--source", default="init.lua", help="Path to the monolithic init.lua source file")
    _ = parser.add_argument("--output-root", required=True, help="Directory where modular files should be written")
    mode = parser.add_mutually_exclusive_group(required=True)
    _ = mode.add_argument("--write", action="store_true", help="Write the split files to disk")
    _ = mode.add_argument("--check", action="store_true", help="Check the split files without writing")
    _ = parser.add_argument("--section-headers", action="store_true", help="Include section headers in generated files")
    namespace = parser.parse_args()
    return CliArgs(
        source=cast(str, getattr(namespace, "source", "init.lua")),
        output_root=cast(str, getattr(namespace, "output_root")),
        write=cast(bool, getattr(namespace, "write", False)),
        check=cast(bool, getattr(namespace, "check", False)),
        section_headers=cast(bool, getattr(namespace, "section_headers", False)),
    )


def main() -> int:
    global ARGS
    ARGS = parse_args()
    source = Path(ARGS.source)
    output_root = Path(ARGS.output_root)
    outputs = build_outputs(read_lines(source), source.parent)

    if ARGS.write:
        write_outputs(outputs, output_root)
        return 0

    return check_outputs(outputs, output_root)


if __name__ == "__main__":
    sys.exit(main())

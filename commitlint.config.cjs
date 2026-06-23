// commitlint.config.cjs — universal across archetypes (§6.4).
// .cjs (not .js) so the file works regardless of the consumer's package.json
// "type" field. Under Node 22+ with "type": "module", a .js file is treated
// as ESM and commitlint 19's cosmiconfig loader fails with
// ERR_REQUIRE_CYCLE_MODULE. .cjs is unambiguously CommonJS.
module.exports = {
  extends: ['@commitlint/config-conventional'],
};

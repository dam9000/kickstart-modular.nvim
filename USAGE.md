export current=$(pwd) && cd ~/.config/ && ln -s $current nvim  && cd $current

# To clear nvim cache

```sh
rm -rf ~/.local/share/nvim/lazy && \
rm -rf ~/.local/state/nvim/lazy && \
rm -rf ~/.config/nvim/lazy-lock.json
```

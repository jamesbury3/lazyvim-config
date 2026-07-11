# Repository Guide

## Structure

- This is a personal LazyVim v8 configuration, not a standalone Lua application. `init.lua` only bootstraps `lua/config/lazy.lua`.
- LazyVim loads `lua/config/options.lua` before startup and loads `keymaps.lua` and `autocmds.lua` on `VeryLazy`; put each customization in the matching file.
- `lua/config/lazy.lua` imports every spec under `lua/plugins/`. Custom specs are eager by default (`defaults.lazy = false`), so add an event, command, key, or `lazy = true` when startup loading is unnecessary.
- `lua/plugins/example.lua` is inert because line 3 returns `{}`. Put real specs in a separate file or deliberately remove that guard; edits below it otherwise have no effect.
- LazyVim extras are selected in `lazyvim.json` (currently Markdown). `lazy-lock.json` pins the resolved plugin commits; expect an intentional plugin sync or extras change to update it.

## Verification

- Format all Lua with `stylua .`; check without rewriting with `stylua --check .`. The repository uses 2 spaces and a 120-column limit from `stylua.toml`.
- For one edited Lua file, use `stylua --check path/to/file.lua` before the full check.
- Smoke-test the actual configuration with `nvim --headless -u init.lua "+qa"`. This loads the installed LazyVim/plugin graph and catches startup errors that a syntax-only check misses.
- There is no repository test suite or CI workflow; use the StyLua check and headless startup check as the default verification sequence.

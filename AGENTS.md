# Repository Guidelines

## Project Structure & Module Organization
This repository is a personal Neovim configuration built on LazyVim. `init.lua` boots the setup through `lua/config/lazy.lua`. Core editor behavior lives in `lua/config/` (`options.lua`, `keymaps.lua`, `autocmds.lua`, `font.lua`). Plugin specs and overrides live in `lua/plugins/`, with one concern per file such as `mason.lua`, `treesitter.lua`, or `neovide.lua`. Dependency state is pinned in `lazy-lock.json`; keep it in sync when plugin versions change.

## Build, Test, and Development Commands
Use Neovim headless commands for validation:

- `nvim --headless "+Lazy! sync" +qa` installs or updates plugins from the current specs.
- `nvim --headless "+Lazy! check" +qa` checks plugin health and lockfile consistency.
- `stylua lua init.lua` formats the Lua sources using the repo config in `stylua.toml`.
- `nvim` starts the config locally for manual verification of keymaps, UI, and plugin behavior.

## Coding Style & Naming Conventions
Lua is formatted with StyLua using spaces, 2-space indentation, and a 120-column limit. Match the existing pattern of returning a plugin spec table from each file in `lua/plugins/*.lua`. Prefer descriptive snake_case filenames such as `status_line.lua` or `image_preview.lua`. Keep plugin customizations isolated by concern instead of growing `lua/plugins/init.lua`.

## Testing Guidelines
There is no automated test suite in this repository. Validate changes by running the headless `Lazy` commands above, then open Neovim and exercise the affected workflow. For plugin changes, confirm startup succeeds with no Lua errors and verify any related command, keymap, or autocmd manually.

## Commit & Pull Request Guidelines
Git history currently uses short, imperative summaries, for example `Initial commit of my Neovim config`. Continue with concise commit subjects that describe the user-facing change, such as `Add Neovide background sync`. Pull requests should include a brief summary, list any updated plugin specs or lockfile changes, and attach screenshots when UI behavior changes.

## Configuration Tips
Do not hardcode machine-specific paths unless required; this repo already contains local assumptions such as `/home/ownvoy/.config/nvim` in `lua/config/lazy.lua`. If you add another environment-specific setting, document it in the PR or inline near the change.

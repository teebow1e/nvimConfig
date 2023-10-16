# teebow1e's Neovim configuration

## Information

This is my personal configuration of [NvChad](https://nvchad.com/) that covers most of the standard editing and coding tasks.

## Features
- Powered by [NvChad](https://nvchad.com/) - blazingly fast, beautiful UI (statusline, tabline, built-in terminal) and themes!
- Configured for Python, JavaScript, C and C++ development.
- Able to understand and build Neovim config development with [neodev.nvim](https://github.com/folke/neodev.nvim/)
- Fast startup time (30ms) thanks to [lazy.nvim](https://github.com/folke/lazy.nvim)
- Supports Discord Rich Presence

## File structures

- `chadrc.lua` - Config the behaviour of NvChad plugins.
- `highlights.lua` - Overridden highlights color.
- `init.lua` - User configuration.
- `mappings.lua` - User mappings.
- `preferences.lua` - This file contains options that are referenced in some functions.

- `utils/` - Contains utility functions.
### `plugins/defaults.lua` 
This file modifies default NvChad plugins' configs.
```
nvim-lspconfig
    null-ls.nvim
mason.nvim
nvim-treesitter
      nvim-ts-context-commentstring
nvim-tree (disabled)
which-key (disabled)
telescope.nvim
    telescope-file-browser.nvim
    telescope-project.nvim
```

### `ui.lua`
This file contains plugins that enhances UI.

```
scrollEOF.nvim
noice.nvim
lspsaga.nvim
rainbow-delimeters.nvim
todo-comments.nvim
trouble.nvim
```

### `tools.lua`
This file contains utility plugins that enhances the editing experience.
```
zen-mode.nvim
markdown-preview.nvim
nvim-puppeteer
better-escape.nvim
neoclip.lua
```

### `misc.lua`
Miscellaneous plugins.
```
presence.nvim
neodev.nvim
```

## Installation
**TLDR**: Install NvChad, then clone this repo into `custom` folders.

### Requirements
- Neovim 0.9.0 or newer version
- NerdFont as your terminal font.
- `git`, `ripgrep`, `gcc`, `make`

### Post-installation
- Install `Treesitter` parser with `:TSInstall`
- Install LSP servers with `:Mason`

> The language parsers and LSP servers should be installed by default.

## Configuration guidelines
To change `Vim` settings use the `init.lua` file.

To add/remove keymappings, use the `mappings.lua` file.

To change plugin related settings use the specific `plugins/category/[name].lua` file. Some of the plugin config can be set up during plugin installation in `plugins/[category].lua` file, where you can add new plugins.


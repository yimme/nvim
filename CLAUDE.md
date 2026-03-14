# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration using **lazy.nvim** as the plugin manager. All configuration is written in Lua.

## Architecture

**Entry point:** `init.lua` loads three config modules then enables LSP servers:
- `config.lazy` — bootstraps lazy.nvim, sets leader key (`<Space>`), and loads all plugins from `lua/plugins/`
- `config.options` — editor settings (4-space tabs, relative line numbers, clipboard, diagnostics, LSP keymaps on attach)
- `config.keymaps` — global keymaps (split navigation with `<C-hjkl>`)

**Plugin specs:** Each file in `lua/plugins/` returns a lazy.nvim plugin spec table. The `lua/plugins/init.lua` returns an empty table — it exists so lazy.nvim can auto-import the `plugins` directory.

**LSP configs:** Native `vim.lsp` configs live in `lsp/` (one file per server). Servers are selectively enabled in `init.lua` via `vim.lsp.enable{}`. Mason handles installation; mason-lspconfig's `automatic_enable` is used for most servers, with `vtsls` and `vue_ls` excluded from auto-enable (they're manually enabled in init.lua).

**Vue + TypeScript setup:** `vtsls` is configured as the primary TS server with `@vue/typescript-plugin` for Vue support. `vue_ls` delegates tsserver requests back to `vtsls` via a custom `on_init` handler — these two servers work as a pair.

## Key Plugin Responsibilities

- **Formatting:** conform.nvim — format-on-save with eslint_d/prettierd (JS/TS/Vue), stylua (Lua), autopep8 (Python), gofmt (Go). eslint_d only runs when an eslint config file exists in the project.
- **Linting:** nvim-lint — eslint_d (JS/TS/Vue), oxlint (Vue), flake8 (Python). Lints on enter, save, insert leave, and text change.
- **Completion:** nvim-cmp with LSP, LuaSnip, buffer, and path sources.
- **Picker/fuzzy finder:** Snacks.nvim picker (replaced telescope, though telescope.lua still exists).
- **File explorer:** Oil.nvim (buffer-based, opened with `-`), Snacks explorer (`<leader>fe`).
- **Git:** lazygit (`<leader>lg`), gitsigns, git-blame.
- **Colorscheme:** catppuccin with auto-dark-mode for OS theme switching.

## Conventions

- Lua files use `stylua` formatting (auto-applied on save).
- Plugin specs use lazy-loading where appropriate (`event`, `cmd`, `keys`).
- Leader key is `<Space>`, local leader is `\`.
- LSP keymaps are set up via `LspAttach` autocmd in `config/options.lua`, not in individual plugin files.

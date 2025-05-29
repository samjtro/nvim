# Claude Code Context

This file contains important context for Claude Code sessions about this Neovim configuration.

## Configuration Overview

This is a kickstart.nvim-based configuration with the following enhancements:
- Transparency enabled (tokyonight theme)
- Enhanced Claude Code plugin integration
- Manual LSP setup to avoid mason-lspconfig automatic_enable errors
- Custom tab settings (4 spaces)
- Neo-tree file explorer
- Enhanced plugins for development

## Key Information

### LSP Configuration
- Uses manual LSP server setup to avoid mason-lspconfig errors
- Located in init.lua around line 722-726
- DO NOT use mason-lspconfig.setup() - it causes automatic_enable errors

### Plugin Structure
- Main config: init.lua
- Custom plugins: lua/custom/plugins/init.lua
- Kickstart plugins: lua/kickstart/plugins/

### Theme Configuration
- tokyonight.nvim with transparency enabled
- Transparent sidebars and floats
- Configuration in init.lua around line 879-886

### Important Commands
- Neo-tree toggle: `\` (backslash key)
- Claude Code: `<C-,>` (Ctrl+comma)
- File search: `<leader>sf`

## Maintenance Instructions

### README Updates
When making significant changes to this configuration, always update the README.md file to reflect:
- New keybindings
- New plugins
- Changed functionality
- Installation/setup changes

Keep the README comprehensive and user-friendly, including:
- Quick start section with essential keybindings
- Full feature list
- Plugin explanations
- Troubleshooting tips

### Known Issues
- mason-lspconfig automatic_enable causes errors - avoid using it
- Use manual LSP setup instead
- Cache clearing may be needed after major changes: `rm -rf ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim`

### Testing
Always test configuration changes with:
```bash
nvim --headless +'lua print("Testing config...")' +qall 2>&1
```

## File Locations
- Config root: ~/.config/nvim/
- Cache: ~/.local/share/nvim/
- State: ~/.local/state/nvim/
- Runtime cache: ~/.cache/nvim/
# Enhanced Neovim Configuration

Based on kickstart.nvim with transparency, enhanced plugins, and Claude Code integration.

## Features

- 🎨 **Transparent Theme**: Tokyo Night with full transparency
- 🤖 **Claude Code Integration**: Enhanced AI coding assistant
- 📁 **File Management**: Neo-tree file explorer
- 🔍 **Fuzzy Finding**: Telescope for files, grep, and more
- 📝 **LSP Support**: Language servers with Mason
- 🎯 **Smart Completion**: Blink.cmp for fast completions
- 🌳 **Syntax Highlighting**: Treesitter for better syntax
- 🔧 **Code Formatting**: Conform.nvim for auto-formatting
- 📦 **Plugin Management**: Lazy.nvim for fast loading

## Quick Start

### Neo-tree File Explorer
- `\` - Toggle Neo-tree file explorer

### Claude Code AI Assistant  
- `<C-,>` - Toggle Claude Code terminal
- `<leader>cc` - Toggle Claude Code
- `<leader>cC` - Continue previous conversation
- `<leader>cV` - Verbose mode

### Floating Terminal
- `<F1>` - Toggle floating terminal
- `<leader>ft` - Toggle floating terminal
- `<F2>` or `<leader>fn` - New floating terminal
- `<F3>` - Previous floating terminal
- `<F4>` - Next floating terminal
- `<F5>` - Kill floating terminal

### Essential Keybindings
- `<leader>sf` - Search files
- `<leader>sg` - Search by grep
- `<leader>sr` - Search recent files
- `gd` - Go to definition
- `<leader>ca` - Code action
- `<leader>f` - Format buffer
- `gcc` - Toggle line comment

## Introduction

This configuration extends kickstart.nvim with transparency, enhanced plugins, and modern development tools.

## Complete Keybinding Reference

### File Navigation
- `\` - Toggle Neo-tree file explorer
- `<leader>sf` - Search files (Telescope)
- `<leader>sg` - Search by grep (Telescope)  
- `<leader>sr` - Search recent files
- `<leader>sw` - Search current word
- `<leader>s.` - Search recent files
- `<leader><leader>` - Find existing buffers

### Floating Terminal (vim-floaterm)
- `<F1>` - Toggle floating terminal
- `<F2>` - New floating terminal
- `<F3>` - Previous floating terminal  
- `<F4>` - Next floating terminal
- `<F5>` - Kill floating terminal
- `<leader>ft` - Toggle floating terminal
- `<leader>fn` - New floating terminal

### Claude Code AI Assistant
- `<C-,>` - Toggle Claude Code terminal
- `<leader>cc` - Toggle Claude Code
- `<leader>cC` - Continue previous conversation
- `<leader>cV` - Verbose mode

### LSP (Language Server)
- `gd` - Go to definition
- `gr` - Go to references
- `gi` - Go to implementation
- `<leader>D` - Type definition
- `<leader>ds` - Document symbols
- `<leader>ws` - Workspace symbols
- `<leader>rn` - Rename variable
- `<leader>ca` - Code action
- `K` - Hover documentation
- `<C-k>` - Signature help

### Diagnostics
- `[d` - Previous diagnostic
- `]d` - Next diagnostic
- `<leader>e` - Show diagnostic error messages
- `<leader>q` - Open diagnostic quickfix list

### Code Editing
- `<leader>f` - Format buffer
- `gcc` - Toggle line comment
- `gbc` - Toggle block comment
- `gc` + motion - Comment motion

### Navigation & Movement
- `s` - Flash jump to character
- `S` - Flash treesitter selection
- `r` - Remote flash (in operator mode)
- `R` - Flash treesitter search

### Window & Buffer Management
- `<Option-Left>` - Move to left window (e.g., Neo-tree)
- `<Option-Right>` - Move to right window (e.g., editor)
- `<Option-Up>` - Move to window above
- `<Option-Down>` - Move to window below
- `<C-w>h/j/k/l` - Alternative window navigation (left/down/up/right)
- `<C-w>w` - Cycle between windows
- Buffer navigation via bufferline (click tabs)
- `:bnext` / `:bprev` - Next/previous buffer
- `<C-\><C-n>` - Exit terminal mode

## Installation

### Install Neovim

Kickstart.nvim targets *only* the latest
['stable'](https://github.com/neovim/neovim/releases/tag/stable) and latest
['nightly'](https://github.com/neovim/neovim/releases/tag/nightly) of Neovim.
If you are experiencing issues, please make sure you have the latest versions.

### Install External Dependencies

External Requirements:
- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation),
  [fd-find](https://github.com/sharkdp/fd#installation)
- Clipboard tool (xclip/xsel/win32yank or other depending on the platform)
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
  - if you have it set `vim.g.have_nerd_font` in `init.lua` to true
- Emoji fonts (Ubuntu only, and only if you want emoji!) `sudo apt install fonts-noto-color-emoji`
- Language Setup:
  - If you want to write Typescript, you need `npm`
  - If you want to write Golang, you will need `go`
  - etc.

> [!NOTE]
> See [Install Recipes](#Install-Recipes) for additional Windows and Linux specific notes
> and quick install snippets

### Install Kickstart

> [!NOTE]
> [Backup](#FAQ) your previous configuration (if any exists)

Neovim's configurations are located under the following paths, depending on your OS:

| OS | PATH |
| :- | :--- |
| Linux, MacOS | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| Windows (cmd)| `%localappdata%\nvim\` |
| Windows (powershell)| `$env:LOCALAPPDATA\nvim\` |

#### Recommended Step

[Fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) this repo
so that you have your own copy that you can modify, then install by cloning the
fork to your machine using one of the commands below, depending on your OS.

> [!NOTE]
> Your fork's URL will be something like this:
> `https://github.com/<your_github_username>/kickstart.nvim.git`

You likely want to remove `lazy-lock.json` from your fork's `.gitignore` file
too - it's ignored in the kickstart repo to make maintenance easier, but it's
[recommended to track it in version control](https://lazy.folke.io/usage/lockfile).

#### Clone kickstart.nvim

> [!NOTE]
> If following the recommended step above (i.e., forking the repo), replace
> `nvim-lua` with `<your_github_username>` in the commands below

<details><summary> Linux and Mac </summary>

```sh
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

</details>

<details><summary> Windows </summary>

If you're using `cmd.exe`:

```
git clone https://github.com/nvim-lua/kickstart.nvim.git "%localappdata%\nvim"
```

If you're using `powershell.exe`

```
git clone https://github.com/nvim-lua/kickstart.nvim.git "${env:LOCALAPPDATA}\nvim"
```

</details>

### Post Installation

Start Neovim

```sh
nvim
```

That's it! Lazy will install all the plugins you have. Use `:Lazy` to view
the current plugin status. Hit `q` to close the window.

#### Read The Friendly Documentation

Read through the `init.lua` file in your configuration folder for more
information about extending and exploring Neovim. That also includes
examples of adding popularly requested plugins.

> [!NOTE]
> For more information about a particular plugin check its repository's documentation.


### Getting Started

[The Only Video You Need to Get Started with Neovim](https://youtu.be/m8C0Cq9Uv9o)

### FAQ

* What should I do if I already have a pre-existing Neovim configuration?
  * You should back it up and then delete all associated files.
  * This includes your existing init.lua and the Neovim files in `~/.local`
    which can be deleted with `rm -rf ~/.local/share/nvim/`
* Can I keep my existing configuration in parallel to kickstart?
  * Yes! You can use [NVIM_APPNAME](https://neovim.io/doc/user/starting.html#%24NVIM_APPNAME)`=nvim-NAME`
    to maintain multiple configurations. For example, you can install the kickstart
    configuration in `~/.config/nvim-kickstart` and create an alias:
    ```
    alias nvim-kickstart='NVIM_APPNAME="nvim-kickstart" nvim'
    ```
    When you run Neovim using `nvim-kickstart` alias it will use the alternative
    config directory and the matching local directory
    `~/.local/share/nvim-kickstart`. You can apply this approach to any Neovim
    distribution that you would like to try out.
* What if I want to "uninstall" this configuration:
  * See [lazy.nvim uninstall](https://lazy.folke.io/usage#-uninstalling) information
* Why is the kickstart `init.lua` a single file? Wouldn't it make sense to split it into multiple files?
  * The main purpose of kickstart is to serve as a teaching tool and a reference
    configuration that someone can easily use to `git clone` as a basis for their own.
    As you progress in learning Neovim and Lua, you might consider splitting `init.lua`
    into smaller parts. A fork of kickstart that does this while maintaining the
    same functionality is available here:
    * [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim)
  * Discussions on this topic can be found here:
    * [Restructure the configuration](https://github.com/nvim-lua/kickstart.nvim/issues/218)
    * [Reorganize init.lua into a multi-file setup](https://github.com/nvim-lua/kickstart.nvim/pull/473)

### Install Recipes

Below you can find OS specific install instructions for Neovim and dependencies.

After installing all the dependencies continue with the [Install Kickstart](#Install-Kickstart) step.

#### Windows Installation

<details><summary>Windows with Microsoft C++ Build Tools and CMake</summary>
Installation may require installing build tools and updating the run command for `telescope-fzf-native`

See `telescope-fzf-native` documentation for [more details](https://github.com/nvim-telescope/telescope-fzf-native.nvim#installation)

This requires:

- Install CMake and the Microsoft C++ Build Tools on Windows

```lua
{'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
```
</details>
<details><summary>Windows with gcc/make using chocolatey</summary>
Alternatively, one can install gcc and make which don't require changing the config,
the easiest way is to use choco:

1. install [chocolatey](https://chocolatey.org/install)
either follow the instructions on the page or use winget,
run in cmd as **admin**:
```
winget install --accept-source-agreements chocolatey.chocolatey
```

2. install all requirements using choco, exit the previous cmd and
open a new one so that choco path is set, and run in cmd as **admin**:
```
choco install -y neovim git ripgrep wget fd unzip gzip mingw make
```
</details>
<details><summary>WSL (Windows Subsystem for Linux)</summary>

```
wsl --install
wsl
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```
</details>

#### Linux Install
<details><summary>Ubuntu Install Steps</summary>

```
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```
</details>
<details><summary>Debian Install Steps</summary>

```
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip curl

# Now we install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo mkdir -p /opt/nvim-linux-x86_64
sudo chmod a+rX /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# make it available in /usr/local/bin, distro installs to /usr/bin
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/
```
</details>
<details><summary>Fedora Install Steps</summary>

```
sudo dnf install -y gcc make git ripgrep fd-find unzip neovim
```
</details>

<details><summary>Arch Install Steps</summary>

```
sudo pacman -S --noconfirm --needed gcc make git ripgrep fd unzip neovim
```
</details>


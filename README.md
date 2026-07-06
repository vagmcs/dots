# Dots

Personal configuration files for macOS managed using [GNU Stow](https://www.gnu.org/software/stow/). The configurations follow the XDG Base Directory specification where possible, keeping the home directory clean and organized.

## Features

- **Shell Configuration**: Zsh + sheldon for plugins
- **Terminal Emulator**: Ghostty
- **Window Manager**: Aerospace
- **Editor**: Neovim
- **Terminal Multiplexer**: Tmux
- **File Manager**: Yazi
- **Development Tools**: Git, IPython, and various CLI utilities
- **Monitoring**: btop, k9s
- **Utilities**: bat, hunk, opencode and more
- **Prompt**: Starship cross-shell prompt
- **Package Management**: Brewfile for macOS packages

## Prerequisites

Install [Homebrew](https://brew.sh/):

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Installation

1. Clone the repository

2. Install packages from Brewfile

```bash
brew bundle install
```

3. Deploy dotfiles with Stow

```bash
stow -t ~ .
```

4. Restart your shell

```bash
exec zsh
```

## Directory Structure

```
.
├── .ammonite/          # Ammonite REPL configuration
├── .config/            # XDG config directory
│   ├── aerospace/      # AeroSpace window manager
│   ├── bat/            # bat (cat alternative)
│   ├── btop/           # System monitor
│   ├── delta/          # Git diff pager
│   ├── ghostty/        # Ghostty terminal
│   ├── git/            # Git configuration
│   ├── hunk/           # hunk configuration
│   ├── ipython/        # IPython configuration
│   ├── k9s/            # Kubernetes CLI
│   ├── lazydocker/     # Docker TUI
│   ├── mpd/            # Music Player Daemon
│   ├── nvim/           # Neovim configuration
│   ├── opencode/       # OpenCode configuration
│   ├── rmpc/           # Rust MPD client
│   ├── sheldon/        # Zsh plugin manager
│   ├── starship.toml   # Starship prompt
│   ├── tmux/           # Tmux configuration
│   ├── vimium_c.json   # Vimium C configuration
│   └── yazi/           # File manager
├── .local/
│   └── bin/            # Custom scripts
├── .shellcheckrc       # ShellCheck configuration
├── .stow-local-ignore  # Stow ignore patterns
├── .zshenv             # Zsh environment variables
├── .zshrc              # Zsh configuration
├── Brewfile            # Homebrew package list
└── README.md           # This file
```

## Uninstall

To remove symlinks created by Stow, navigate to the dots directory and type:

```bash
stow -D -t ~ .
```

## Stow Ignore Patterns

The `.stow-local-ignore` file prevents certain files from being symlinked:

- Version control files (`.git`, `.gitignore`, etc.)
- README and LICENSE files
- Brewfile (package management)

## Notes

- This configuration assumes macOS and uses Homebrew for package management
- XDG Base Directory specification is followed where supported
- Some applications may require additional setup after initial installation
- Custom scripts are located in `.local/bin/`

These are my personal dotfiles. Feel free to use anything you find useful, but please review and understand the configurations before applying them to your own system.

## Inspired By

- [Devops Toolbox](https://www.youtube.com/@devopstoolbox)
- [ThePrimagen](https://www.youtube.com/@ThePrimeTimeagen)
- [DHH](https://www.youtube.com/@dhh37)
- [Josean Martinez](https://www.youtube.com/@joseanmartinez)
- [Felix Kratz](https://github.com/FelixKratz)

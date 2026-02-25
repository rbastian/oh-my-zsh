# Zsh Configuration

Personal zsh configuration files for easy setup on new machines.

## Contents

- `zshrc` - Main zsh configuration (prompt, PATH, aliases, functions)
- `zshenv` - Environment variables (Cargo, uv)
- `zprofile` - Profile initialization (Homebrew, SnowSQL, OrbStack)
- `zsh/_git` - Git completion for zsh

## Features

- Custom prompt with git branch display using native zsh `vcs_info`
- Extended history with timestamps
- direnv integration
- AWS SSO login helper function
- Git completion
- PATH configurations for:
  - Rancher Desktop
  - Homebrew packages (libpq, openjdk)
  - Google Cloud SDK
  - WarpStream
  - NPM global packages
  - Cargo/Rust
  - uv (Python package manager)

## Installation

On a new machine, clone this repo and run the install script:

```bash
git clone git@github.com:rbastian/oh-my-zsh.git
cd oh-my-zsh
./install.sh
```

The install script will:
1. Create symlinks from your home directory to these config files
2. Back up any existing config files with a timestamp
3. Set up the `.zsh` directory for completions

After installation, reload your shell:

```bash
source ~/.zshrc
```

## Functions

### awslogin

Helper function to simplify AWS SSO login and credential export:

```bash
awslogin <profile-name>
```

Example:
```bash
awslogin rbastian-pr-prod
```

## Customization

To customize for your own use, edit the files in this repo and the changes will be reflected immediately (since they're symlinked).

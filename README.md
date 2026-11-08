# Zsh Configuration

Personal zsh configuration files for easy setup on new machines.

## Contents

- `zshrc` - Main zsh configuration (prompt, PATH, aliases, functions)
- `zshenv` - Environment variables (Cargo, uv)
- `zprofile` - Profile initialization (Homebrew, SnowSQL, OrbStack)
- `zshrc.local.example` - Template for machine-specific settings
- `optional/claude-bedrock.zsh` - Claude Code on Bedrock (not loaded by default)

## Features

- Custom prompt with git branch display using native zsh `vcs_info`
- Extended history with timestamps
- direnv integration
- AWS SSO login helper function
- Git completion (zsh built-in)
- PATH configurations for:
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

It is safe to re-run: links that are already correct are left alone.

After installation, reload your shell:

```bash
source ~/.zshrc
```

## Functions

### awslogin

Helper function to simplify AWS SSO login and credential export. It clears any previous AWS credentials and sets `AWS_PROFILE` for the current shell. No AWS profile is active until you run it, and it is the way to switch accounts, since exported credentials take priority over a manually changed `AWS_PROFILE`:

```bash
awslogin <profile-name>
```

Example:
```bash
awslogin my-profile
```

## Machine-specific settings

Settings that vary by machine, such as Rancher Desktop and Turso, belong in `~/.zshrc.local`, which is sourced last and not tracked. Start from the template:

```bash
cp zshrc.local.example ~/.zshrc.local
```

## Optional: Claude Code on Bedrock

Bedrock is off by default. To enable it on a machine, set the model IDs in `optional/claude-bedrock.zsh`, then add this line to `~/.zshrc.local`, using the path to your clone:

```bash
. "$HOME/path/to/oh-my-zsh/optional/claude-bedrock.zsh"
```

Run `awslogin <profile>` before starting Claude Code.

## Customization

To customize for your own use, edit the files in this repo and the changes will be reflected immediately (since they're symlinked).

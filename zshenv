typeset -U path PATH

if [ -f "$HOME/.cargo/env" ]; then . "$HOME/.cargo/env"; fi

# uv
export PATH="$HOME/.local/bin:$PATH"

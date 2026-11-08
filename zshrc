setopt EXTENDED_HISTORY
autoload -Uz compinit
compinit

#source ~/.git-prompt.sh
#setopt PROMPT_SUBST ; PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '
# Load zsh git completion
#source ~/.git-completion.zsh

# direnv
if (( $+commands[direnv] )); then eval "$(direnv hook zsh)"; fi

# Simple git branch in prompt (zsh native)
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:*' enable git
setopt PROMPT_SUBST
PS1='[%n@%m %c${vcs_info_msg_0_}]\$ '

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"; fi

# Add timestamps to the history
export HIST_STAMPS="yyyy-mm-dd"

# WarpStream
export PATH="$HOME/.warpstream:$PATH"

# NPM
export PATH=~/.npm-global/bin:$PATH

# auto-completion
#if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
#  . /opt/local/etc/profile.d/bash_completion.sh
#fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
#        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
#    else
#        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

# AWS LOGIN
awslogin() {
  local profile="$1"
  if [[ -z "$profile" ]]; then
    echo "usage: awslogin <profile>"
    return 1
  fi
  # Clear first so a failed login can't leave the previous account active
  unset AWS_PROFILE AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN AWS_CREDENTIAL_EXPIRATION
  aws sso login --profile "$profile" || return
  eval "$(aws configure export-credentials --profile "$profile" --format env)" || return
  export AWS_PROFILE="$profile"
}

# Machine-specific settings (not tracked, see zshrc.local.example)
if [ -f "$HOME/.zshrc.local" ]; then . "$HOME/.zshrc.local"; fi

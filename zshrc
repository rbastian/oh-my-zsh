setopt EXTENDED_HISTORY
autoload -Uz compinit
compinit
fpath=(~/.zsh $fpath)

#source ~/.git-prompt.sh
#setopt PROMPT_SUBST ; PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '
# Load zsh git completion
#source ~/.git-completion.zsh

# direnv
eval "$(direnv hook zsh)"

# Simple git branch in prompt (zsh native)
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:*' enable git
setopt PROMPT_SUBST
PS1='[%n@%m %c${vcs_info_msg_0_}]\$ '

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/robert.bastian/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/robert.bastian/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/robert.bastian/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/robert.bastian/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/robert.bastian/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Add timestamps to the history
export HIST_STAMPS="yyyy-mm-dd"

# WarpStream
export PATH="/Users/robert.bastian/.warpstream:$PATH"

# NPM
export PATH=~/.npm-global/bin:$PATH

# CLAUDE BEDROCK
export AWS_PROFILE=rbastian-pr-prod
export ANTHROPIC_MODEL=global.anthropic.claude-sonnet-4-5-20250929-v1:0
export ANTHROPIC_DEFAULT_OPUS_MODEL=global.anthropic.claude-opus-4-5-20251101-v1:0
#export ANTHROPIC_MODEL=us.anthropic.claude-sonnet-4-20250514-v1:0
#export ANTHROPIC_MODEL=us.anthropic.claude-3-7-sonnet-20250219-v1:0
export CLAUDE_CODE_USE_BEDROCK=1
export DISABLE_PROMPT_CACHING=0

# Aliasing
alias awsloginprod='aws sso login --profile rbastian-pr-prod && eval $(aws configure export-credentials --profile rbastian-pr-prod --format env)'


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

. "$HOME/.turso/env"

# AWS LOGIN
awslogin() {
  local profile="$1"
  if [[ -z "$profile" ]]; then
    echo "usage: awslogin <profile>"
    return 1
  fi
  aws sso login --profile "$profile" && eval "$(aws configure export-credentials --profile "$profile" --format env)"
}

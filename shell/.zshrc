# The next line enables shell command completion for gcloud.
export PATH="$PATH:/Users/advan/Downloads/google-cloud-sdk/bin"
export PATH="$PATH:/opt/anaconda3/envs/optBench/bin:/opt/anaconda3/condabin"
export PATH="$PATH:/Library/Frameworks/Python.framework/Versions/3.11/bin"
export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:/Users/advan/Library/Application Support/Code/User/globalStorage/github.copilot-chat/debugCommand"


. "$HOME/.local/bin/env"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/advan/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/advan/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/advan/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/advan/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

alias ssha='ssh advaithn@linux.andrew.cmu.edu'

kinit -R advaithn@ANDREW.CMU.EDU &>/dev/null &|

alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias vi="nvim"
alias com="git commit -m "

# zsh-autosuggestions
if [[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# zsh-syntax-highlighting
if [[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# using jetstream2 api
export openai_api_base="https://llm.jetstream-cloud.org/api"
export AIDER_CHAT_MODE="ask"
export AIDER_MODEL="openai/gpt-oss-120b"
# use aider --model openai/gpt-oss-120b --no-gitignore
if [ -f "$HOME/.zsh_secrets" ]; then
    source "$HOME/.zsh_secrets"
fi

if [[ "$TERM" == "xterm-ghostty" ]]; then
  export TERM=xterm-256color
fi

# starship
eval "$(starship init zsh)"

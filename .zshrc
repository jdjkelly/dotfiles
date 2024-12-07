# Starship
eval "$(starship init zsh)"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='cursor'
else
   export EDITOR='vim'
fi

# GPG TTY
export GPG_TTY=$(tty)

# PATH
export PATH=$PATH:/Users/joshuakelly/bin

# Environment variables
export OPENAI_API_KEY=$(security find-generic-password -s 'OpenAI API Key' -w)
export ANTHROPIC_API_KEY=$(security find-generic-password -s 'Anthropic API Key' -w)

# Aliases
alias '??'='gh copilot suggest';

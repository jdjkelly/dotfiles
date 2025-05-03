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
export PATH="$PATH:$HOME/.rvm/bin"

# Environment variables
export OPENAI_API_KEY=$(security find-generic-password -s 'OPENAI_API_KEY' -w)
export ANTHROPIC_API_KEY=$(security find-generic-password -s 'ANTHROPIC_API_KEY' -w)
export DOCKER_HOST=unix:///Users/joshuakelly/.colima/default/docker.sock

# Aliases
alias '??'='gh copilot suggest';
alias ip="curl -s http://ip-api.com/json | jq '.'";
alias gam="/Users/joshuakelly/bin/gam7/gam";
alias gp="git push";
alias gpf="gp --force";
alias ll="eza --color=auto --long --git --no-filesize --icons=always";
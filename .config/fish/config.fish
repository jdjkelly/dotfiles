set fish_greeting

set -x EDITOR nvim
set -x FZF_LEGACY_KEYBINDINGS 0
set -x FZF_DEFAULT_COMMAND 'git ls-tree -r --name-only HEAD 2> /dev/null; or fd --type f --hidden --follow --exclude .git 2> /dev/null'
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -x GPG_TTY (tty)
set -x GREP_COLOR "1;37;45"
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x RBXOPT -X19
set -x TDD 0
set -x GOROOT /usr/local/go
set -x GOPATH $HOME/work/go

# Paths
test -d /usr/local/sbin                      ; and set PATH /usr/local/sbin $PATH
test -d /usr/local/bin                       ; and set PATH /usr/local/bin $PATH
test -d /usr/local/go			     ; and set PATH $GOPATH/bin $PATH
test -d /usr/local/go			     ; and set PATH $GOROOT/bin $PATH
test -d $HOME/.rbenv/bin		     ; and set PATH $HOME/.rbenv/bin $PATH

# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end
function ll    ; tree --dirsfirst -ChFupDaLg 1 $argv ; end

# Utilities
function a        ; command ag --ignore=.git --ignore=log --ignore=tags --ignore=tmp --ignore=vendor --ignore=spec/vcr $argv ; end
function d        ; du -h -d=1 $argv ; end
function df       ; command df -h $argv ; end
function digga    ; command dig +nocmd $argv[1] any +multiline +noall +answer; end
function g        ; git $argv ; end
function grep     ; command grep --color=auto $argv ; end
function httpdump ; sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*" ; end
function ip       ; curl -s http://checkip.dyndns.com/ | sed 's/[^0-9\.]//g' ; end
function localip  ; ipconfig getifaddr en0 ; end
function lookbusy ; cat /dev/urandom | hexdump -C | grep --color "ca fe" ; end
function mp       ; nvim $argv ; end
function t        ; command tree -C $argv ; end
function tmux     ; command tmux -2 $argv ; end
function tunnel   ; ssh -D 8080 -C -N $argv ; end
function vault    ; cd ~/1pass ; python -m SimpleHTTPServer ; end
function view     ; nvim -R $argv ; end
function qr       ; qrencode -o qrcode.png '$argv' ; end

# rbenv
status --is-interactive; and source (rbenv init -|psub)

# nvm
function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end
nvm > /dev/null

# Fuzzy find & vim
function vp
  if test (count $argv) -gt 0
    command nvim $argv
  else
    fzf -m | xargs nvim
  end
end

# View files/dirs
function c
  if test (count $argv) -eq 0
    tree --dirsfirst -aFCNL 1 ./
    return
  end

  for i in $argv
    set_color yellow
    if test (count $argv) -gt 1; echo "$i:" 1>&2; end
    set_color normal

    if test -e $i; and test -r $i
      if test -d $i
        tree --dirsfirst -aFCNL 1 $i
      else if file -b --mime-type $i | string match -q -r '^image\/'
        imgcat $i
      else
        pygmentize -O style=monokai -f console256 -g $i
      end
    else
      set_color red
      echo "Cannot open: $i" 1>&2
    end

    set_color normal
  end
end

function l; c $argv; end

# Completions
function make_completion --argument-names alias command
    echo "
    function __alias_completion_$alias
        set -l cmd (commandline -o)
        set -e cmd[1]
        complete -C\"$command \$cmd\"
    end
    " | source
    complete -c $alias -a "(__alias_completion_$alias)"
end

make_completion g 'git'
make_completion mp 'nvim'
make_completion vp 'nvim'

# fisher
set fisher_home ~/.local/share/fisherman
if test -f $fisher_home/config.fish
  set fisher_config ~/.config/fisherman
  source $fisher_home/config.fish
end

# dev
if test -f /opt/dev/dev.fish
  source /opt/dev/dev.fish
end

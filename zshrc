# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="xxf"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=1

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx kubectl)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

function func_portinuse() {
	lsof -Pan -i tcp -i udp | grep $1
}

function func_findall() {
	grep -RnisI $1 *
}

function func_snmpq() {
	echo 'Usage: snmpq [server] [MIB]'
	snmpwalk -v 1 -c public $1 $2
}

function run() {
    	number=$1
    	shift
    	for i in `seq $number`; do
      		$@ &
    	done
}

function func_superman() {
	man -t $1 | open -fa "Preview"
}

function func_sublime() {
	/Applications/Sublime\ Text.app/Contents/MacOS/Sublime\ Text $1
}

function func_decrypt() {
	if [ "$1" = "" ]
	then
		echo "Usage: decrypt FILE.gpg"
		return
	fi 
	gpg2 --output $1.out --decrypt $1
}

function func_encrypt() {
        if [ "$1" = "" ] || [ "$2" = "" ]
        then
                echo "Usage: encrypt KEY FILE.EXT"
                return
        fi
	gpg2 --armor --encrypt --recipient $1 $2
}

function func_reset_card() {
	pkill -f gpg-agent
	ssh-add -L
}

function func_keybase_encrypt() {
	pbpaste | xargs -I % keybase pgp encrypt $1 -m %
}

function func_fly4() {
	alias fly='fly4'
}

function func_fly5() {
	alias fly='fly5'
}


function func_gcm() {
  default_branch=$(git remote show origin | grep 'HEAD' | cut -d' ' -f5)
  git checkout "$default_branch"
}

alias ll='ls -al'
alias h='history'
alias c='clear'
alias findall=func_findall
alias portinuse=func_portinuse
alias scan='sudo nmap -sP 192.168.1.0/24'
alias ip='clear && ifconfig en0'
alias snmpq='func_snmpq'
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
alias dockercli='eval "$(docker-machine env default)"'
alias sdc='docker rm $(docker ps -a -q) && dockerclean'
alias dockerclean='docker rmi $(docker images --filter "dangling=true" -q)'
alias superman='func_superman'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias edit='func_sublime'
alias k8s='kubectl'
alias routes='sudo netstat -nr'
alias ttr='sudo tcptraceroute'
alias encrypt='func_encrypt'
alias decrypt='func_decrypt'
alias engine_mongo='func_engine_mongo'
alias ry='func_reset_card'
alias atrdomains='func_att_domains'
alias atrips='func_att_ips'
alias gpom='git push origin master'
alias tf='terraform'
alias tff='terraform fmt'
alias tfi='terraform init'
alias tfp='terraform plan -out=plan.plan'
alias tfa='terraform apply plan.plan'
alias tfv='terraform validate'
alias st='/Applications/SourceTree.app/Contents/MacOS/SourceTree &'
alias gnureset='rm -rf ~/.gnupg/S.gpg-agent* && source ~/.zshrc && ssh -T git@github.com'
alias gg='lazygit'
alias xc='pbcopy'
alias xp='pbpaste'
alias keybase_encrypt='func_keybase_encrypt'
alias fly='fly5'
alias defly4='func_fly4'
alias defly5='func_fly5'
alias duors='map_relaystorage'
alias hg='history | grep $1'
alias k="kubectl"
alias fork='open /Applications/Fork.app'
alias history='history -i 0'
alias vault_token='cat ~/.vault-token | pbcopy'
alias gitl="git log --all --graph --pretty=format:'%C(red)%h%Creset -%C(cyan)%d%Creset %s %Cgreen(%cd) %C(bold blue)<%cn>%Creset' --date=short"
alias gitp="git gc --prune=now; git remote prune public"
alias gcm='func_gcm'
alias readme='curl -LO https://repo1.dso.mil/big-bang/apps/library-charts/gluon/-/raw/master/docs/README.md.gotmpl && curl -LO 
https://repo1.dso.mil/big-bang/apps/library-charts/gluon/-/raw/master/docs/.helmdocsignore && curl -LO 
https://repo1.dso.mil/big-bang/apps/library-charts/gluon/-/raw/master/docs/_templates.gotmpl && docker run --rm -v "`pwd`:/helm-docs" -u $(id -u) 
jnorwood/helm-docs:v1.10.0 -s file -t /helm-docs/README.md.gotmpl -t /helm-docs/_templates.gotmpl --dry-run > README.md && rm .helmdocsignore README.md.gotmpl 
_templates.gotmpl'


# Dump a kubernetes secret
# example usage: kubectl -n <namespace> get secret <secret-name> | dump_secret
alias dump_secret='yq -r '\''.data | keys[] as $k | "key: \($k)", "value: \(.[$k])"'\'' | awk '\''/key: / {print $2} /value: / {system("echo "$2" | base64 -d && echo")}'\'''
# show which account you are logged into
alias account='{ aws sts get-caller-identity & aws iam list-account-aliases; } | jq -s ".|add"'

#source `brew --prefix git`/etc/bash_completion.d/git-prompt.sh
#export GIT_PS1_SHOWDIRTYSTATE='1'
#export PS1="\[${COLOR_BLUE}\]\$(__git_ps1) \[${COLOR_RED}\]\w \[${COLOR_NC}\]"

export CLICOLOR=1

export LSCOLORS=GxFxCxDxBxegedabagaced

export JAVA6_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
export JAVA7_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home
export JAVA8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_172.jdk/Contents/Home
export JAVA_HOME=$JAVA8_HOME
export LDFLAGS=-L/usr/local/opt/tcl-tk/lib
export CPPFLAGS=-I/usr/local/opt/tcl-tk/include
export NVM_DIR="$HOME/.nvm"
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/Projects/go
export GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
export PYTHONSTARTUP=$HOME/.pythonstartup

eval $( gpg-agent --daemon )
ssh-add -l

. "$(brew --prefix nvm)/nvm.sh"

export PATH=$PATH:$HOME/bin:$GOROOT/bin:$GOPATH/bin
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if [ "$TERM_PROGRAM" = "iTerm.app" ]; then
  osascript -e 'tell application "System Events" to keystroke "e" using {command down, shift down}'
fi

export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
eval "$(rbenv init -)"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault
setopt complete_aliases

function color {
    case $1 in
    green)
    echo -e "\033]6;1;bg;red;brightness;57\a"
    echo -e "\033]6;1;bg;green;brightness;197\a"
    echo -e "\033]6;1;bg;blue;brightness;77\a"
    ;;
    red)
    echo -e "\033]6;1;bg;red;brightness;270\a"
    echo -e "\033]6;1;bg;green;brightness;60\a"
    echo -e "\033]6;1;bg;blue;brightness;83\a"
    ;;
    orange)
    echo -e "\033]6;1;bg;red;brightness;227\a"
    echo -e "\033]6;1;bg;green;brightness;143\a"
    echo -e "\033]6;1;bg;blue;brightness;10\a"
    ;;
    esac
 }

_direnv_hook() {
  trap -- '' SIGINT;
  eval "$("/usr/local/bin/direnv" export zsh)";
  trap - SIGINT;
}
typeset -ag precmd_functions;
if [[ -z ${precmd_functions[(r)_direnv_hook]} ]]; then
  precmd_functions=( _direnv_hook ${precmd_functions[@]} )
fi
typeset -ag chpwd_functions;
if [[ -z ${chpwd_functions[(r)_direnv_hook]} ]]; then
  chpwd_functions=( _direnv_hook ${chpwd_functions[@]} )
fi

export PATH=$PATH:/Applications/Sublime\ Text.app/Contents/SharedSupport/bin
export EDITOR="subl -w"

PATH="/Users/dgershman/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/dgershman/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/dgershman/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/dgershman/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/dgershman/perl5"; export PERL_MM_OPT;
RPROMPT='$(kube_ps1) - $(echo $KUBECONFIG) (☁ $(echo $AWS_PROFILE))'

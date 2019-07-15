# Path to your oh-my-zsh installation.
export ZSH=/Users/danny/.oh-my-zsh

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
plugins=(git aws docker osx)

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

function func_java6() {
	export JAVA_HOME=$JAVA6_HOME
	echo $JAVA_HOME
}

function func_java7() {
	export JAVA_HOME=$JAVA7_HOME
	echo $JAVA_HOME
}

function func_java8() {
	export JAVA_HOME=$JAVA8_HOME
	echo $JAVA_HOME
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
	man -t $1 | open -f -a /Applications/Preview.app
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

alias ll='ls -al'
alias h='history'
alias c='clear'
alias findall=func_findall
alias portinuse=func_portinuse
alias scan='sudo nmap -sP 192.168.1.0/24'
alias ip='clear && ifconfig en0'
alias java6=func_java6
alias java7=func_java7
alias java8=func_java8
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
alias tfp='terraform plan -out=plan.plan'
alias tfa='terraform apply plan.plan'
alias st='/Applications/SourceTree.app/Contents/MacOS/SourceTree &'
alias gnureset='rm -rf ~/.gnupg/S.gpg-agent* && source ~/.zshrc'
alias gg='lazygit'
alias xc='pbcopy'
alias xp='pbpaste'

eval "$(hub alias -s)"

#source `brew --prefix git`/etc/bash_completion.d/git-prompt.sh
#export GIT_PS1_SHOWDIRTYSTATE='1'
#export PS1="\[${COLOR_BLUE}\]\$(__git_ps1) \[${COLOR_RED}\]\w \[${COLOR_NC}\]"

export CLICOLOR=1

export LSCOLORS=GxFxCxDxBxegedabagaced

export JAVA6_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
export JAVA7_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home
export JAVA8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_172.jdk/Contents/Home
export PATH=/usr/local/jboss-as-mss/bin:/usr/local/sbin:/usr/local/share/npm/bin:$JAVA_HOME_6/bin:$PATH
export JAVA_HOME=$JAVA8_HOME
export LDFLAGS=-L/usr/local/opt/tcl-tk/lib
export CPPFLAGS=-I/usr/local/opt/tcl-tk/include
export NVM_DIR="$HOME/.nvm"
export GOROOT=/usr/local/Cellar/go/1.10.3/libexec
export GOPATH=$HOME/go
export PYTHONSTARTUP=$HOME/.pythonstartup

eval "$(hub alias -s)"

eval $( gpg-agent --daemon )
export SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh
ssh-add -l

. "$(brew --prefix nvm)/nvm.sh"

export PATH=$PATH:/Users/danny/bin:$GOROOT/bin:$GOPATH/bin
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if [ $TERM_PROGRAM = "iTerm.app" ]; then
  osascript -e 'tell application "System Events" to keystroke "e" using {command down, shift down}'
fi

export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
eval "$(rbenv init -)"
export PATH="/usr/local/opt/sbt@0.13/bin:$PATH"

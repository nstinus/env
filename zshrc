#
# Example .zshrc file for zsh 4.0
#
# .zshrc is sourced in interactive shells.  It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#

# THIS FILE IS NOT INTENDED TO BE USED AS /etc/zshrc, NOR WITHOUT EDITING
#return 0	# Remove this line after editing this file as appropriate

# Search path for the cd command
#cdpath=(.. ~ ~/src ~/zsh)

# Use hard limits, except for a smaller stack and no core dumps
#unlimit
#limit stack 8192
#limit core 0
#limit -s

umask 022

# Aliases
if [ -e ~/.zsh_aliases ]
then
    source ~/.zsh_aliases
fi

# Functions                                       
if [ -e ~/.zsh_functions ]
then
    source ~/.zsh_functions
fi

# Environment variables                                       
if [ -e ~/.zsh_env ]
then
    source ~/.zsh_env
fi


# Shell functions
#setenv() { typeset -x "${1}${1:+=}${(@)argv[2,$#]}" }  # csh compatibility
#freload() { while (( $# )); do; unfunction $1; autoload -U $1; shift; done }

# Where to look for autoloaded function definitions
#fpath=($fpath ~/.zfunc)

# Autoload all shell functions from all directories in $fpath (following
# symlinks) that have the executable bit on (the executable bit is not
# necessary, but gives you an easy way to stop the autoloading of a
# particular shell function). $fpath should not be empty for this to work.
#for func in $^fpath/*(N-.x:t); autoload $func

# automatically remove duplicates from these arrays
#typeset -U path cdpath fpath manpath

# # Global aliases -- These do not have to be
# # at the beginning of the command line.
# alias -g M=' | more'
# alias -g H=' | head'
# alias -g T=' | tail'
# alias -g G=' | grep '

#manpath=($X11HOME/man /usr/man /usr/lang/man /usr/local/man)
#export MANPATH

# Hosts to use for completion (see later zstyle)
#hosts=(`hostname` ftp.math.gatech.edu prep.ai.mit.edu wuarchive.wustl.edu)

# Set prompts

autoload -U colors
colors
setopt prompt_subst

git_branch()
{
    git_branch=$(git branch 2>/dev/null | grep -E '^\*' | cut -b 3-)
    if [[ $git_branch != "" ]]
    then
        git_branch=". %{$fg[cyan]%}$git_branch%{$reset_color%} "
    fi
    echo $git_branch
}

PROMPT='%{$fg[yellow]%}%n@%m%{$reset_color%} . %{$fg[blue]%}%~%E%{$reset_color%} $(git_branch). %{$fg[green]%}%*%{$reset_color%}
%{$fg[red]%}%#%{$reset_color%} '
PROMPT2='%{$fg[blue]%}%_%{$reset_color%} > '

#-----------

#zsh ~/prompt.zsh

# Some environment variables
#export MAIL=/var/spool/mail/$USERNAME
#export LESS=-cex3M
#export HELPDIR=/usr/local/lib/zsh/help  # directory for run-help function to find docs

#MAILCHECK=300
HISTSIZE=200
DIRSTACKSIZE=20

# Watch for my friends
#watch=( $(<~/.friends) )       # watch for people in .friends file
#watch=(notme)                   # watch for everybody but me
#LOGCHECK=300                    # check every 5 min for login/logout activity
#WATCHFMT='%n %a %l from %m at %t.'

# Set/unset  shell options
setopt   notify globdots correct pushdtohome cdablevars autolist
setopt   correctall autocd recexact longlistjobs
setopt   autoresume histignoredups pushdsilent noclobber
setopt   autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt bgnice autoparamslash

# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile

# Some nice key bindings
#bindkey '^X^Z' universal-argument ' ' magic-space
#bindkey '^X^A' vi-find-prev-char-skip
#bindkey '^Xa' _expand_alias
#bindkey '^Z' accept-and-hold
#bindkey -s '\M-/' \\\\
#bindkey -s '\M-=' \|

# bindkey -v               # vi key bindings

bindkey -e                 # emacs key bindings
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand

# Setup new style completion system. To see examples of the old style (compctl
# based) programmable completion, check Misc/compctl-examples in the zsh
# distribution.
autoload -U compinit
compinit

# Completion Styles

# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'
    
# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# command for process lists, the local web server details and host completion
#zstyle ':completion:*:processes' command 'ps -o pid,s,nice,stime,args'
#zstyle ':completion:*:urls' local 'www' '/var/www/htdocs' 'public_html'
zstyle '*' hosts $hosts

# Filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' \
    '*?.old' '*?.pro'
# the same for old style completion
#fignore=(.o .c~ .old .pro)

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'

mkdir -p /dev/shm/cache 2>/dev/null
export CCACHE_DIR=/dev/shm/ccache

mkdir -p /tmp/cache/google-chrome 2>/dev/null

if [ -f ~/.zsh_nocorrect ]; then
	while read -r COMMAND; do
		alias $COMMAND="nocorrect $COMMAND"
	done < ~/.zsh_nocorrect
fi

fpath+=('/home/nicolas/Development/nordvpn/completion')
rm ~/.zcompdump
autoload -U compinit && compinit

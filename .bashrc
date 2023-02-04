#
# ~/.bashrc
#

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|alacritty|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

source /usr/share/git/completion/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true

use_color=true


# gets the last 2 dirs
last_two() {
    pwd | awk -F\/ '{print $(NF-1),$(NF)}' | sed 's/ /\//'
}

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	# Original
	# if [[ ${EUID} == 0 ]] ; then
	# 	PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
	# else
	# 	PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
	# fi

	# Original + sua mae functions
	# 	if [[ ${EUID} == 0 ]] ; then
	# 		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\]$(__git_ps1 "(%s)")\[\033[01;32m\]\$\[\033[00m\] '
	# 	else
	# 		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] $(last_two)\[\033[01;32m\]]\$\[\033[00m\]$(__git_ps1 "(%s)")\[\033[01;32m\]\$\[\033[00m\] '
	# 	fi

	# copy paste of sua mae, different colors than above
	if [[ ${EUID} == 0 ]] ; then
			PS1='\[\033[01;32m\][\h\[\033[01;37m\] \W\[\033[01;32m\]]\[\033[01;34m\]$(__git_ps1 "(%s)")\[\033[01;32m\]\$\[\033[00m\] '
	else
			PS1='\[\033[01;32m\][\u\[\033[01;37m\] $(last_two)\[\033[01;32m\]]\[\033[01;34m\]$(__git_ps1 "(%s)")\[\033[01;32m\]\$\[\033[00m\] '
	fi

	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less

xhost +local:root > /dev/null 2>&1

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# NPM Prefix
NPM_PACKAGES="${HOME}/.npm-global-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

export PATH=$HOME/.local/bin:$PATH

# NVM
source /usr/share/nvm/init-nvm.sh

# # If there are multiple matches for completion, Tab should cycle through them
# bind 'TAB':menu-complete
# # Display a list of the matching files
# bind "set show-all-if-ambiguous on"
# # Perform partial completion on the first Tab press,
# # only start cycling full results on the second Tab press
# bind "set menu-complete-display-prefix on"
# # Cycle through history based on characters already typed on the line
# bind '"\e[A":history-search-backward'
# bind '"\e[B":history-search-forward'

# Autoload .nvmrc
find-up () {
    path=$(pwd)
    while [[ "$path" != "" && ! -e "$path/$1" ]]; do
        path=${path%/*}
    done
    echo "$path"
}

cdnvm(){
    cd "$@";
    nvm_path=$(find-up .nvmrc | tr -d '[:space:]')

    # If there are no .nvmrc file, use the default nvm version
    if [[ ! $nvm_path = *[^[:space:]]* ]]; then

        declare default_version;
        default_version=$(nvm version default);

        # If there is no default version, set it to `node`
        # This will use the latest version on your machine
        if [[ $default_version == "N/A" ]]; then
            nvm alias default node;
            default_version=$(nvm version default);
        fi

        # If the current version is not the default version, set it to use the default version
        if [[ $(nvm current) != "$default_version" ]]; then
            nvm use default;
        fi

        elif [[ -s $nvm_path/.nvmrc && -r $nvm_path/.nvmrc ]]; then
        declare nvm_version
        nvm_version=$(<"$nvm_path"/.nvmrc)

        declare locally_resolved_nvm_version
        # `nvm ls` will check all locally-available versions
        # If there are multiple matching versions, take the latest one
        # Remove the `->` and `*` characters and spaces
        # `locally_resolved_nvm_version` will be `N/A` if no local versions are found
        locally_resolved_nvm_version=$(nvm ls --no-colors "$nvm_version" | tail -1 | tr -d '\->*' | tr -d '[:space:]')

        # If it is not already installed, install it
        # `nvm install` will implicitly use the newly-installed version
        if [[ "$locally_resolved_nvm_version" == "N/A" ]]; then
            nvm install "$nvm_version";
        elif [[ $(nvm current) != "$locally_resolved_nvm_version" ]]; then
            nvm use "$nvm_version";
        fi
    fi
}
alias cd='cdnvm'

LS_COLORS+=':ow=01;33'

#aliases
if [ -e $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

work () {
    dir="$HOME/easydeco/projects"
    if [ "$2" = "two" ]; then
        dir="${dir}/two"
    fi
    if [ "$1" = "site" ]; then
        cd "${dir}/easydeco-site"
    elif [ "$1" = "admin" ]; then
        cd "${dir}/easydeco-admin"
    elif [ "$1" = "server" ]; then
        cd "${dir}/easydeco-server"
    elif [ "$1" = "scraper" ]; then
        cd "${dir}/easydeco-products-info-scraper"
		elif [ "$1" = "notes" ]; then
				cd "${dir}/.."
				nvim .
    else
        cd "${dir}/$@"
    fi
}

display () {
	if [ "$1" = "cs" ]; then
		xrandr --output HDMI-0 --off
		xrandr --output eDP-1-1 --off
	else
		sh "$HOME/display_setup.sh"
	fi
}

set -o vi
alias config='/usr/bin/git --git-dir=/home/dclin/.cfg/ --work-tree=/home/dclin'

# History timestamp nad size
export HISTTIMEFORMAT="%h %d %H:%M:%S "
export HISTSIZE=10000
#alias firefox="firefox -P"

eval "$(thefuck --alias)"
eval "$(zoxide init bash)"


# [[ -s "/home/berin/.gvm/scripts/gvm" ]] && source "/home/berin/.gvm/scripts/gvm"

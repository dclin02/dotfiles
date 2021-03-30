# Git
alias g="git"
alias gst="git status"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gcd="git checkout develop"
alias gps="git push"
alias gpl="git pull"
alias grd="git rebase -r develop"

if [ -f "/usr/share/bash-completion/completions/git" ]; then
    source /usr/share/bash-completion/completions/git
    __git_complete g _git
    __git_complete gc _git_checkout
    __git_complete gcb _git_checkout
    __git_complete gps _git_push
    __git_complete gpl _git_pull
else
    echo "Error loading git completions"
fi

alias gh="history | grep"
alias gp="ps aux | grep"
alias i3r="i3-resurrect restore"
alias cscfg="nvim ~/.local/share/Steam/userdata/5250900/730/local/cfg/autoexec.cfg"
alias worknotes="work ..; nvim random_work_buffer.txt"
alias lg="lazygit"


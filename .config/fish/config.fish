zoxide init fish | source
thefuck --alias | source
fish_vi_key_bindings
alias man="batman"
alias cat="bat"
alias ls="exa -a --color=always --group-directories-first --icons"
alias lg="lazygit"
alias tray="/home/berin/tray"
alias notes="tmux attach-session -t notes || tmux new -s notes \"z isaac & lvim notes.txt\""
alias hdmi="tmux attach-session -t hdmi || tmux new -s hdmi"
alias main="tmux attach-session -t main"
alias edp="tmux attach-session -t edp || tmux new -s edp"
alias tempo="curl 'wttr.in/~USP?2QF'"
alias tempo2="curl 'v2.wttr.in/~USP?2QF'"
# alias display /home/berin/display_setup.sh
starship init fish | source

alias config='/usr/bin/git --git-dir=/home/berin/.cfg/ --work-tree=/home/berin'
alias one='dp one && tray'
alias dpdp='dp && tray dp'
alias vb='/home/berin/virtual-background.sh'
alias panda='/home/berin/Gopanda2.AppImage'
alias tf='terraform'
alias kubectl='/home/berin/.asdf/installs/gcloud/412.0.0/bin/kubectl'
alias work "/home/berin/work.sh"
alias kb "/home/berin/keyboard-configure.sh"

direnv hook fish | source
set -gx EDITOR lvim
set -gx BROWSER /usr/bin/firefox

fish_add_path (go env GOPATH)/bin

abbr -a ld lazydocker

source /opt/asdf-vm/asdf.fish
fnm env | source

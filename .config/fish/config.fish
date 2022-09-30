zoxide init fish | source
thefuck --alias | source
fish_vi_key_bindings
alias man="batman"
alias cat="bat"
alias ls="exa -a --color=always --group-directories-first --icons"
alias lg="lazygit"
alias tray="/home/berin/tray"
# alias display /home/berin/display_setup.sh
starship init fish | source

alias config='/usr/bin/git --git-dir=/home/berin/.cfg/ --work-tree=/home/berin'
alias one='dp one && tray'
alias dpdp='dp && tray dp'
alias vb='/home/berin/virtual-background.sh'
alias panda='/home/berin/Gopanda2.AppImage'

direnv hook fish | source
set -gx EDITOR lvim
set -gx BROWSER /usr/bin/firefox

fish_add_path (go env GOPATH)/bin

abbr -a ld lazydocker

bass source ~/.gvm/environments/system
source /opt/asdf-vm/asdf.fish

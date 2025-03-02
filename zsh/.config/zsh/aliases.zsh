alias zc="nvim ~/.config/zsh/.zshrc"
alias za="nvim ~/.config/zsh/aliases.zsh"
alias zs="source ~/.config/zsh/.zshrc"
alias ze="nvim ~/.config/zsh/.zshenv"
alias zse="source ~/.config/zsh/.zshenv"

alias vim="nvim"
alias vi="nvim"
alias nvc="nvim ~/.config/nvim/"

alias ff="find -type f -not -iregex '.*/\.git/.*' | fzf-tmux -p --reverse | xargs -r nvim"

alias work="cd ~/projects"
alias dot="cd ~/dotfiles"

alias :q="exit"
alias py="python"
alias vim="nvim"
alias nf="neofetch"
alias ls='eza --icons --color=always --group-directories-first'
alias ll='eza -alF --icons --color=always --group-directories-first'
alias la='eza -a --icons --color=always --group-directories-first'
alias l='eza -F --icons --color=always --group-directories-first'
alias l.='eza -a | grep -E "^\."'

alias config="cd ~/.config"
alias ndot="~/.config/scripts/ndot.sh"
alias tmux-sessionizer="~/.config/scripts/tmux-sessionizer"

alias htmux="firefox ~/Dotfiles/Docs/tmux"
alias hhypr="firefox ~/Dotfiles/Docs/hyprland"
alias hnvim="firefox ~/Dotfiles/Docs/neovim"

alias grep='grep --color=auto'
alias sshk="kitty +kitten ssh"

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias df='df -h'
alias free='free -h'

alias psmem='ps auxf | sort -nr -k 4 | head -5'

alias pscpu='ps auxf | sort -nr -k 3 | head -5'

alias list_systemctl="systemctl list-unit-files --state=enabled"
alias list_installed="pacman -Q | fzf"

alias gc="gh repo clone"
alias gpr="gh pr create"
alias gprl="gh pr list"

alias lg="lazygit"


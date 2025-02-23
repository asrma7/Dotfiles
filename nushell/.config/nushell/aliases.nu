alias vim = nvim
alias vi = nvim
alias nvc = nvim ~/.config/nvim/

alias work = cd ~/projects
alias dot = cd ~/dotfiles

alias :q = exit

alias py = python3
alias nf = neofetch
alias c = clear
alias l = ls -l
alias la = ls -la
alias ll = ls -l
alias l. = ls -a | grep '^\.'
alias .. = cd ..

alias config = cd ~/.config
alias ndot = ~/.config/scripts/ndot.sh
alias tmux-sessionizer = ~/.config/scripts/tmux-sessionizer

alias grep = grep --color=auto
alias sshk = kitty +kitten ssh

alias cp = cp -i
alias mv = mv -i
alias rm = rm -i

def dfl [] {
    df -h | ^column -t | from ssv
}

def freel [] {
    free -h | ^column -t | from ssv
}

alias df = df -h
alias free = free -h

def psmem [] {
    ps | sort-by mem --reverse | first 5
}

def pscpu [] {
    ps | sort-by cpu --reverse | first 5
}

alias lsservices = systemctl list-unit-files --state=enabled
alias lsinstalled = pacman -Q | fzf

alias gc = gh repo clone
alias gpr = gh pr create
alias gprl = gh pr list

alias lg = lazygit

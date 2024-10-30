HISTSIZE=1000000
SAVEHIST=1000000
CASE_SENSITIVE="true"

export EDITOR="nvim"

export PATH="$HOME/.local/bin":$PATH
export PATH="$HOME/.docker/bin":$PATH
export PATH="$HOME/.tmux/plugins/tmuxifier/bin":$PATH
export PATH="$HOME/flutter/bin":$PATH
export PATH="$HOME/.pub-cache/bin":$PATH
export MANPAGER='nvim +Man!'
export MANWIDTH=999

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(tmuxifier init -)"

case "$(uname -s)" in

Darwin)
	# echo 'Mac OS X'
	;;

Linux)
    # echo 'Linux'
    export XDG_CURRENT_DESKTOP="Wayland"
    export TERMINAL="kitty"
	;;

CYGWIN* | MINGW32* | MSYS* | MINGW*)
	# echo 'MS Windows'
	;;
*)
	# echo 'Other OS'
	;;
esac

# Enable VI keybindings in zsh instead of EMACS (default) keybindings
bindkey -v # bindkey -e (default)

export EDITOR=nvim

# Allow comments 
setopt interactivecomments

# SETUP ZOXIDE (-- the better cd --)
# Environment variables that sets up the database for zoxide
_ZO_DATA_DIR=/home/incog/.zoxideDB/
# Initialize zoxide 
eval "$(zoxide init --cmd cd zsh)"


# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Use thefuck package for correcting last console command
eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias fk)

## case insensitive path-completion
autoload -Uz +X compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

#function y() {
#	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
#	yazi "$@" --cwd-file="$tmp"
#	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
#		builtin cd -- "$cwd"
#	fi
#	rm -f -- "$tmp"
#}

source  ~/.config/zshrc/aliases
source  ~/.config/zshrc/autostart

source  ~/.config/zshrc/additionalFeatures.zsh
source  ~/.config/zshrc/fzfCatppuccin.zsh

#Initialize oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/theme.omp.toml)"


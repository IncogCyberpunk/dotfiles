# Enable VI keybindings in zsh instead of EMACS (default) keybindings
bindkey -v # bindkey -e (default)

export EDITOR=nvim
export QT_SElECT=6
export QT_QPA_PLATFORMTHEME=qt6ct
# Allow comments 
setopt interactivecomments

## CONFIGURE HISTORY IN ZSH
HISTFILE=~/.zsh_history # ~/.zsh_history created if doesn't exist
# How many commands to store in history
HISTSIZE=10000 #Sets the number of commands stored in memory (RAM) during a session
SAVEHIST=10000 #Sets the number of commands saved to HISTFILE when the session ends.

# Share history in every terminal session
setopt SHARE_HISTORY

# SETUP ZOXIDE (-- the better cd --)
# Environment variables that sets up the database for zoxide
# Initialize zoxide 
eval "$(zoxide init --cmd cd zsh)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Use thefuck package for correcting last console command
eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias fk)

# case insensitive path-completion
autoload -Uz +X compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# Make sure zsh is at the directory u were last in while using yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

source  ~/.config/zshrc/aliases
source  ~/.config/zshrc/autostart
source  ~/.config/zshrc/additionalFeatures.zsh
source  ~/.config/zshrc/fzfCatppuccin.zsh

#Initialize oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/theme.omp.toml)"

#Source zsh-autosuggestions 
source ~/.config/zshrc/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Always source zsh-syntax-highlighting at end of .zshrc (A rule of thumb)
source ~/.config/zshrc/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

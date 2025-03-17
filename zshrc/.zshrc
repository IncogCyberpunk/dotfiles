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

#source  ~/.config/zshrc/00-init
#source  ~/.config/zshrc/20-customization
source  ~/.config/zshrc/25-aliases
source  ~/.config/zshrc/30-autostart

source  ~/.config/zshrc/additionalFeatures.zsh
source  ~/.config/zshrc/paths.zsh
source  ~/.config/zshrc/fzfCatppuccin.zsh

#Initialize oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/theme.omp.toml)"


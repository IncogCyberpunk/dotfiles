# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt interactivecomments

#source  ~/.config/zshrc/00-init
#source  ~/.config/zshrc/20-customization
source  ~/.config/zshrc/25-aliases
source  ~/.config/zshrc/30-autostart

source  ~/.config/zshrc/additionalFeatures.zsh
source  ~/.config/zshrc/paths.zsh
source  ~/.config/zshrc/fzfCatppuccin.zsh

source ~/.config/zshrc/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Disabled so as to use the vim keybindindings inside the terminal to delte word  
#bindkey '^H' backward-kill-word

# Disable the left, down , up , right keys   
bindkey -r 'Up'    
bindkey -r 'Down'  
bindkey -r 'Left'  
bindkey -r 'Right' 

bindkey -M viins -r '^J' 
bindkey -M vicmd -r '^J' 

bindkey -r '^\\-D'
bindkey -r "^D"

export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

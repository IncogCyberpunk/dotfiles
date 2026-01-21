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


# CHANGING THE CURSOR BASED ON THE VI MODE
# Enable vi mode
bindkey -v

export KEYTIMEOUT=1

function zle-keymap-select {
    # NOTE: here the value of `keymap` variable which holds the value of current vi mode , is used to set cursor acc. to the mode
    case $KEYMAP in
        # -n flag prevents echo from adding new line
        # -e enables interpretation of the escape sequences like \e , used in ANSI characters to change cursors
        vicmd) echo -ne '\e[2 q';; # block cursor for normal mode
        viins|main) echo -ne '\e[5 q';; # beam cursor for insert mode
        vireplace) echo -ne '\e[3 q';; # underscore cursor for replace mode
    esac
}

# NOTE: now, we register the hook/function that has to be executed to the `zle-keymap-select` event 
zle -N zle-keymap-select

#Ensure cursor resets to beam on new prompt
function zle-line-init {
    echo -ne '\e[5 q'
}

zle -N zle-line-init


# Allow comments 
setopt interactivecomments

setopt autocd
setopt CORRECT
setopt extendedglob

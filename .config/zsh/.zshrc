#!/bin/zsh

#--------------------------------------------------------------------------------------
# Initialize stuff
#--------------------------------------------------------------------------------------
XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
HISTFILE="$ZDOTDIR/history"
export GPG_TTY=$TTY

## Enable p10k instant prompt
if [[ -r "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh" ]] && \
  [[ `tput colors` == 256 ]]; then
  source "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## ZSH Theme
ZSH_THEME="powerlevel10k/powerlevel10k"
if [[ `tput colors` != "256" ]]; then
    setfont -f ter-powerline-v22b.psf.gz
    ZSH_THEME="robbyrussell"
fi

## Save command history after each command
setopt inc_append_history
setopt share_history

#--------------------------------------------------------------------------------------
# Install things if not present
#--------------------------------------------------------------------------------------
export ZSH="$XDG_DATA_HOME/oh-my-zsh"

## Oh My ZSH
[[ -d $ZSH ]] || sh -c "$(wget -O- https://raw.githubusercontent.com/\
ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

## ZSH Syntax Highlighting
[[ -d "$ZSH/custom/plugins/zsh-syntax-highlighting" ]] || git clone https://github.com/\
zsh-users/zsh-syntax-highlighting $ZSH/custom/plugins/zsh-syntax-highlighting

## powerlevel10k
[[ -d "$ZSH/custom/themes/powerlevel10k" ]] || git clone --depth=1 https://\
github.com/romkatv/powerlevel10k.git $ZSH/custom/themes/powerlevel10k

#--------------------------------------------------------------------------------------
# Plugins
#--------------------------------------------------------------------------------------
plugins=(
  compleat
  command-not-found
  zsh-syntax-highlighting
  git
)

#--------------------------------------------------------------------------------------
# Source initialization scripts
#--------------------------------------------------------------------------------------
## Source aliases
[[ -f "$XDG_CONFIG_HOME/aliasrc" ]] &&
  source "$XDG_CONFIG_HOME/aliasrc"

## Source Oh-My-ZSH
[[ -f "$ZSH/oh-my-zsh.sh" ]] && source $ZSH/oh-my-zsh.sh

## Source powerlevel10k configurations
[[ -f "$ZDOTDIR/.p10k.zsh" ]] && source $ZDOTDIR/.p10k.zsh

#!/bin/sh

## Default programs:
export EDITOR="nvim"
export TERM="konsole"
export BROWSER="firefox"
export READER="zathura"

## ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npmrc"
export NPM_CONFIG_PREFIX="$XDG_DATA_HOME/npm"
export NPM_CONFIG_CACHE="$NPM_CONFIG_PREFIX"

export LESSHISTFILE="-"
export INPUTRC="$XDG_CONFIG_HOME/inputrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
# export ALSA_CONFIG_PATH="$XDG_CONFIG_HOME/alsa/asoundrc"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"

# export ANDROID_SDK_HOME="$XDG_DATA_HOME"
# export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
# export JAVA_HOME="$XDG_DATA_HOME/java"
export GOPATH="$XDG_DATA_HOME/go"

export TEXMFHOME="$XDG_DATA_HOME/texmf"
export TEXMFVAR="$XDG_CACHE_HOME/texmf"
export TEXMFCONFIG="$XDG_CONFIG_HOME/texmf"

export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export PUB_CACHE="$XDG_CACHE_HOME/pub"


## Misc
export NVIM_LISTEN_ADDRESS=/tmp/nvim
export PATH="$PATH:$HOME/.local/bin:$NPM_CONFIG_PREFIX/bin:/snap/bin:/usr/local/go/bin:$GOPATH/bin"

### Telegram system tray icon fix:
export TDESKTOP_FORCE_PANEL_ICON=1
export TDESKTOP_DISABLE_TRAY_COUNTER=1


# Start X server if not already running
[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx

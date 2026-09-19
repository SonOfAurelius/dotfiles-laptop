# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh-histfile
HISTSIZE=100000
SAVEHIST=100000
setopt autocd
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/seba/.zshrc'

PROMPT='%B%F{cyan}[%f%F{cyan}%n%f%F{white}@%f%F{cyan}%m%f %1~%F{cyan}]%f$%b '

autoload -Uz compinit
compinit
# End of lines added by compinstall
# . "/home/seba/.deno/env"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/.dotnet/tools"

alias hpr='start-hyprland'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias zj='zellij -l welcome'
alias sp='spotify_player'
alias cc='concord'

alias led1='echo 0 | sudo tee /sys/class/leds/platform::micmute/brightness'
alias led2='echo 0 | sudo tee /sys/class/leds/platform::mute/brightness'

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export XDG_CONFIG_HOME="$HOME/.config"

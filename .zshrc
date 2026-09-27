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

if [[ -n "$DEV_SHELL_NAME" ]]; then
    PROMPT="%B%F{green}[%f%F{green}%n%f%F{white}@%f%F{green}${DEV_SHELL_NAME}%f %1~%F{green}]%f$%b "
else
    PROMPT='%B%F{cyan}[%f%F{cyan}%n%f%F{white}@%f%F{cyan}%m%f %1~%F{cyan}]%f$%b '
fi

autoload -Uz compinit
compinit

export PATH="$HOME/.local/bin:$PATH"

# General
alias hpr='uwsm start hyprland-uwsm.desktop'
alias zj='zellij -l welcome'
alias sp='spotatui'
alias cc='concord'

# Nix aliases
alias nrs='sudo nixos-rebuild switch --flake ~/.config/nixos/'
alias nedit='nvim ~/.config/nixos/configuration.nix'
alias nd='nix develop -c zsh'

# Zsh aliases
alias zedit='nvim ~/.zshrc' 
alias zsource='source ~/.zshrc'

# Misc
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias rway='pkill waybar && waybar &'

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export CGO_ENABLED=1

#!/usr/bin/env bash

cmd="$RESURRECT_COMMAND"

# NixOS Neovim wrapper:
# Strip the provider-disable arguments injected by nixpkgs and restore
# the invocation as plain `nvim ...`.
if [[ "$cmd" =~ /nix/store/[^[:space:]]+-neovim-unwrapped-[^[:space:]]+/bin/nvim[[:space:]] ]]; then
    cmd="${cmd#*\/bin\/nvim }"

    # Drop optional --embed. Zellij should restore the interactive nvim,
    # not Neovim's embedded child process.
    cmd="${cmd#--embed }"

    # Remove the nixpkgs-injected provider initialization.
    cmd="$(printf '%s\n' "$cmd" |
        sed -E 's/^--cmd lua vim\.g\.loaded_node_provider=0;vim\.g\.loaded_perl_provider=0;vim\.g\.loaded_ruby_provider=0;vim\.g\.loaded_python3_provider=0[[:space:]]*//')"

    printf 'nvim %s\n' "$cmd"
else
    printf '%s\n' "$RESURRECT_COMMAND"
fi

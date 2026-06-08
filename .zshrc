PROMPT="%B%m %(4~|%3~|%~) λ %b"

export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:/Users/jonas/Library/Python/3.9/bin
export PATH=$PATH:/Users/jonas/bin
export PATH=$PATH:/Users/jonas/.cargo/bin
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

alias firefox='open /Applications/Firefox.app'
alias code='open -b com.microsoft.VSCode "$@"'
alias cursor='open -b com.todesktop.230313mzl4w4u92 "$@"'
alias caf='caffeinate -di'

# git branch autocomplete
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qNmh-24) ]]; then
  compinit -C
else
  compinit
fi

profile() {
  vim ~/.zshrc;
  . ~/.zshrc;
}

colors () {
    for i in {0..255} ; do
        printf "\x1b[38;5;%smcolour%s\n" "${i}" "${i}"
    done
}

# Deno
# . "/Users/jonas/.deno/env"

# Bun completions
# [ -s "/Users/jonas/.bun/_bun" ] && source "/Users/jonas/.bun/_bun"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# TODO: ?
. "$HOME/.local/bin/env"

# NVM
export NVM_DIR="$HOME/.nvm"
nvm() {
  unset -f nvm
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh" --no-use
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
  nvm "$@"
}

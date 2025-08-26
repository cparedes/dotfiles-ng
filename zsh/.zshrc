# Homebrew

eval "$(/opt/homebrew/bin/brew shellenv)"

# Clone zcomet if necessary
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

# Homebrew completions
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
autoload -Uz compinit
compinit

# Source zcomet.zsh
source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

zcomet load agkozak/agkozak-zsh-prompt
zcomet load ohmyzsh plugins/gitfast

# It is good to load these popular plugins last, and in this order:
zcomet load zsh-users/zsh-syntax-highlighting
zcomet load zsh-users/zsh-autosuggestions

# Run compinit and compile its cache
zcomet compinit

alias kc="kubectl"
export GPG_TTY=$(tty)

# iterm2 settings
export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES

# pyenv

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

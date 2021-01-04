# powerlevel10k instant prompt (cache)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# path to oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

# set zsh theme path
ZSH_THEME="powerlevel10k/powerlevel10k"

# oh-my-zsh standard plugins
plugins=(git)

# setup oh-my-zsh
source $ZSH/oh-my-zsh.sh

# setup powerlevel10k theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# link to ~/.aliases file
if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

# cat todo to console on boot
if [ -f ~/todo.txt ]; then
    cat ~/todo.txt
fi

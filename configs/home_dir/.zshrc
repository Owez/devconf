# powerlevel10k instant prompt (cache)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# path to oh-my-zsh
export ZSH="/home/owen/.oh-my-zsh"

# set zsh theme path
ZSH_THEME="powerlevel10k/powerlevel10k"

# oh-my-zsh standard plugins
plugins=(git)

# setup oh-my-zsh
source $ZSH/oh-my-zsh.sh

# setup powerlevel10k theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ensure notebook is setup for stuff in .aliases
if [ ! -d ~/notebooks/ ]; then
  mkdir ~/notebooks/
fi

# link to ~/.aliases file
if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

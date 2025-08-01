

PS1='[%m:%F{red}%1~%f] '
export PYTHONPATH=$HOME/opt/python:$PYTHONPATH
# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"
HISTFILE=~/.zsh_history         # File to store history
HISTSIZE=100000                 # Number of lines in memory
SAVEHIST=100000                 # Number of lines to save
setopt APPEND_HISTORY          # Don’t overwrite history
setopt SHARE_HISTORY           # Share history between terminals
setopt HIST_IGNORE_DUPS        # Ignore duplicate entries
setopt HIST_REDUCE_BLANKS      # Remove superfluous blanks
source ~/.local/share/zinit/zinit.git/zinit.zsh
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search

fzf-history-widget() {
  BUFFER=$(history -n -r 1 | fzf +s --tac | sed 's/ *[0-9]* *//')
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N fzf-history-widget

bindkey '^R' fzf-history-widget
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
HIST_IGNORE_ALL_DUPS="true"
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"
alias e='f1(){ 
emacs &> /dev/null &
disown;
unset -f f1; };
f1'
#alias python="$HOME/opt/anaconda3/bin/python"
alias ec='f(){ emacsclient $@ &  unset -f f; }; f'
alias kerb='f(){ export KRB5_CONFIG=~/.config/pdckrb/krb5.conf;
                kinit -f vikashp@NADA.KTH.SE <~/.config/pdckrb/passwd; 
                unset -f f;}; f'
alias ls='ls --hyperlink=auto --color=auto'
alias zellij='zellij --layout /home/vikash/.config/zellij/layout.kdl'
alias e29='/home/vikash/opt/emacs-29/bin/emacs --init-directory=/home/vikash/.emacs29.d/'
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
# autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
# zle -N up-line-or-beginning-search
# zle -N down-line-or-beginning-search

#[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
#[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)

# User configuration

#export PATH=$HOME/bin:/usr/local/bin:$PATH
#export MANPATH="/usr/local/man:$MANPATH"
# papis 
alias psh="papis scihub"
alias paf="papis -l arxiv-fl  add --no-open --no-edit --from arxiv "
alias pac="papis -l arxiv-cm add --no-open --no-edit --from arxiv"
alias phed="papis -l hist-phy-ed add --from arxiv"
alias po="papis open"
alias prm="papis rm"
# alias pbib='f(){ papis export --format bibtex $1 >> $2 &; -f f; }; f'
alias pbib="papis export --format bibtex" 

# git and vpn
alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias vpn="netExtender vpn.tifrh.res.in:4433 --user=vikashp --domain=LocalDomain"
alias vpns="netExtender vpns.tifrh.res.in:4433 --user=vikashp --domain=LocalDomain"

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select


alias k4-s='ssh vikashp@10.10.11.17 -Y'
alias k4-m='ssh vikashp@10.10.11.16 -Y'
alias k3='ssh vikashp@10.10.11.13 -Y'
alias k2='ssh vikashp@10.10.11.12 -Y'
alias k1='ssh vikashp@10.10.11.11 -Y'
alias bat='ssh batman@10.10.11.36 -Y'
alias ser2='ssh vikash@10.10.11.35 -Y'
# source $ZSH/oh-my-zsh.sh
export PATH=~/.local/bin:$PATH
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

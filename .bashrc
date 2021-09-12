#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
alias ls='ls --color=auto'

# emacs
alias e='f1(){ 
export PATH=~/opt/miniconda3/bin:$PATH;
export PYTHONPATH=~/opt/python:$PYTHONPATH;
emacs &> /dev/null &
disown;
unset -f f1; };
f1'

alias ec='f(){ emacsclient $@ &  unset -f f; }; f'
# alias ec="/usr/bin/emacsclient -n -c "
# emacs
alias vim="nvim "

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
alias vpn="yes Y|netExtender 210.212.72.213:4433 --user=vikashp  --domain=LocalDomain"


# login accounts
alias param="ssh -Y vikashp@paramshakti.iitkgp.ac.in -p 4422"
alias vk3="ssh -Y vikashp@10.10.11.13"
alias nk3="ssh -Y navdeepr@10.10.11.13"
alias tk3="ssh -Y tapass@10.10.11.13"

alias vk4="ssh -Y vikashp@10.10.11.17"
alias nk4="ssh -Y navdeepr@10.10.11.17"
alias tk4="ssh -Y tapass@10.10.11.17"

export LANG=en_US.UTF-8
export LC_MESSAGES="C"




# fancy ps1
function colorgrid( )
{
    iter=16
    while [ $iter -lt 52 ]
    do
        second=$[$iter+36]
        third=$[$second+36]
        four=$[$third+36]
        five=$[$four+36]
        six=$[$five+36]
        seven=$[$six+36]
        if [ $seven -gt 250 ];then seven=$[$seven-251]; fi

        echo -en "\033[38;5;$(echo $iter)m█ "
        printf "%03d" $iter
        echo -en "   \033[38;5;$(echo $second)m█ "
        printf "%03d" $second
        echo -en "   \033[38;5;$(echo $third)m█ "
        printf "%03d" $third
        echo -en "   \033[38;5;$(echo $four)m█ "
        printf "%03d" $four
        echo -en "   \033[38;5;$(echo $five)m█ "
        printf "%03d" $five
        echo -en "   \033[38;5;$(echo $six)m█ "
        printf "%03d" $six
        echo -en "   \033[38;5;$(echo $seven)m█ "
        printf "%03d" $seven

        iter=$[$iter+1]
        printf '\r\n'
    done
}

if [ "$HOSTNAME" = "kemper" ]; then
    k="\[\033[01;38;5;52m\]k"
    e="\[\033[01;38;5;124m\]e"
    m="\[\033[01;38;5;196m\]m"
    p="\[\033[01;38;5;202m\]p"
    e2="\[\033[01;38;5;208m\]e"
    r2="\[\033[01;38;5;214m\]r"
     __user_and_host="$k$e$m$p$e2$r2"
else
    __user_and_host="\[\033[01;16m\]\h"
fi   

export PS1="$__first_color[$__user_and_host \W]$__last_color "


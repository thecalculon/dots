#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --hyperlink=auto --color=auto'

export TERM=xterm
# emacs
alias e='f1(){ 
export PATH=~/opt/miniconda3/bin:$PATH;
export PYTHONPATH=~/opt/python:$PYTHONPATH;
emacs &> /dev/null &
disown;
unset -f f1; };
f1'

alias ec='f(){ emacsclient $@ &  unset -f f; }; f'
alias kerb='f(){ export KRB5_CONFIG=~/.config/pdckrb/krb5.conf;
                kinit -f vikashp@NADA.KTH.SE <~/.config/pdckrb/passwd; 
                unset -f f;}; f'
alias bes='f(){ 
ssh -o GSSAPIDelegateCredentials=yes -o GSSAPIAuthentication=yes vikashp@beskow.pdc.kth.se; unset -f f; }; f'
alias dar='f(){ 
ssh -vvv -o GSSAPIDelegateCredentials=yes -o GSSAPIAuthentication=yes vikashp@dardel.pdc.kth.se; unset -f f; }; f'

# alias ec="/usr/bin/emacsclient -n -c "
alias teg='f(){ 
ssh -o GSSAPIDelegateCredentials=yes -o GSSAPIAuthentication=yes vikashp@tegner-login-2.pdc.kth.se; unset -f f; }; f'
#
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
alias vpn="netExtender vpn.tifrh.res.in:4433 --user=vikashp --domain=LocalDomain"


# login accounts
alias param="ssh -Y vikashp@paramshakti.iitkgp.ac.in -p 4422"
alias vk3="ssh -Y vikashp@10.10.11.13"
alias nk3="ssh -Y navdeepr@10.10.11.13"
alias tk3="ssh -Y tapass@10.10.11.13"

alias vk4="ssh -Y vikashp@10.10.11.17"
alias nk4="ssh -Y navdeepr@10.10.11.17"
alias tk4="ssh -Y tapass@10.10.11.17"

alias vdgx="ssh -Y vikashp@10.10.11.47"
alias vn65="ssh -Y vikash@norlx65.nordita.org"
alias vn185="ssh -Y vikash@nordita185dl.nordita.su.se"

export LANG=en_US.UTF-8
export LC_MESSAGES="C"

alias gpl="git pull"
alias gps="git push"
alias ga="git add"
alias gc="git commit -m"
alias gcd="git commit -m 'minor'"
#history

PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
export HISTCONTROL=ignoredups
export HISTSIZE=1000
export HISTFILESIZE=1000
shopt -s histappend

#history -w
# history -c
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
    __user_and_host="\033[01;38;5;208m\]\h"
fi   

# export PS1="$__first_color[$__user_and_host \W]$__last_color "
# export PS1="[$__user_and_host \W] "
PS1='[\h:\W]\$ '

alias dw="Xephyr -screen 800x600 -resizeable -no-host-grab :5 & sleep 1 ; DISPLAY=:5 dwm"
alias aw="Xephyr -screen 800x600 -resizeable -no-host-grab :5 & sleep 1 ; DISPLAY=:5 awesome -a"

export PATH=$HOME/opt/bin/stable/usr/bin:$PATH

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

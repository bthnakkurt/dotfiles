[[ $- != *i* ]] && return

alias ls='eza --color=always --color-scale-mode=gradient --icons=always --hyperlink -a --group-directories-first -s=Extension'
alias rm='trash'
alias df='df -h'
alias free='free -h'
alias reboot='sudo reboot'
alias ch='chmod +x'
alias cat='bat'
alias feh='feh --no-fehbg'
alias wget='wget --hsts-file ~/dotfiles/config/wget/wget-hsts'

PS1='[\u@\h \W]\$ '

export PATH="/home/bai/.local/bin:$PATH"
export XAUTHORITY="/tmp/Xauthority"
export INPUTRC="/tmp/inputrc"
HISTFILE="~/.cache/.bash_history"

bind 'TAB:menu-complete'
bind '"\e[Z": menu-complete-backward'
bind "set show-all-if-ambiguous on"
bind "set menu-complete-display-prefix on"

fastfetch -c /home/bai/.config/fastfetch/11.jsonc

shopt -s checkwinsize
shopt -s autocd
export HISTCONTROL="erasedups:ignorespace"

complete -F _command doas

# fnm
FNM_PATH="/home/bai/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

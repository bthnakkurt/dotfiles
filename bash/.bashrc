[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '
alias ls='eza --color=always --color-scale-mode=gradient --icons=always --hyperlink -a --group-directories-first -s=Extension'
alias rm='trash'
alias df='df -h'
alias free='free -h'
alias reboot='sudo reboot'
alias ch='chmod +x'
alias cat='bat'
alias wget='wget --hsts-file ~/dotfiles/config/wget/wget-hsts'
alias gsa="git submodule add"
alias gpush="git add . && git commit -m 'do' && git push"
alias sudo="doas"
alias clear="printf '\E[H\E[3J'"
alias mr="make run"

export MANPAGER="nvim +Man! -"
export gh="https://github.com"
export PATH="$HOME/.local/bin:$PATH"
export XAUTHORITY="/tmp/Xauthority"
export INPUTRC="/tmp/inputrc"
HISTFILE="$HOME/.cache/.bash_history"

bind 'TAB:menu-complete'
bind '"\e[Z": menu-complete-backward'
bind "set show-all-if-ambiguous on"
bind "set menu-complete-display-prefix on"

fastfetch -c $HOME/.config/fastfetch/17.jsonc

shopt -s checkwinsize
shopt -s autocd
export HISTCONTROL="erasedups:ignorespace"

complete -F _command doas

# fnm
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env)"
fi

updatedotfiles() {
   cd /home/bai/.config/
   cp ~/.bash* ~/.config/bash/
   gpush
}

updatenvim() {
   cd /home/bai/.config/nvim/pack/bai/start/
   find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull \;
}
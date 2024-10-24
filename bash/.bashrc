# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='eza --color=always --color-scale-mode=gradient --icons=always --hyperlink -a --group-directories-first -s=Extension'
alias rm='trash'
alias df='df -h'
alias free='free -h'
alias reboot='sudo reboot'
alias update-grub='sudo update-grub'
alias cr='cargo run'
alias ch='chmod +x'
alias cat='bat'

export HISTFILE="/home/bai/.config/bash/.bash_history"
export XCURSOR_THEME="catppuccin"
export XCURSOR_SIZE=20

PS1='[\u@\h \W]\$ '

# fnm
FNM_PATH="/home/bai/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env)"
fi

# pnpm
export PNPM_HOME="/home/bai/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#
# python
export PATH="/home/bai/.local/bin:$PATH"

export PATH=$PATH:/home/bai/.spicetify

bind 'TAB:menu-complete'
bind '"\e[Z": menu-complete-backward'
bind "set show-all-if-ambiguous on"
bind "set menu-complete-display-prefix on"

fastfetch -c /home/bai/.config/fastfetch/11.jsonc

shopt -s checkwinsize
shopt -s autocd
export HISTCONTROL="erasedups:ignorespace"


command_not_found_handle() {
  local PKG="${1}"

  if which xlocate 1>/dev/null 2>/dev/null; then
    local POSSIBLE_PKGS="$(xlocate bin/${PKG}\$ 2>/dev/null | awk '{print $1}' | uniq)"
    [[ -z "${POSSIBLE_PKGS}" ]] && return 127

    echo "possible packages with ${PKG}:"
    echo "${POSSIBLE_PKGS}"
  fi
}

complete -F _command doas

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fnm
FNM_PATH="/home/bai/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
export XCURSOR_PATH=${XCURSOR_PATH}:~/.local/share/icons

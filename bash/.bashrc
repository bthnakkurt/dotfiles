# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='eza -a --color=always --sort=type'
alias rm='trash'
alias df='df -h'

export HISTFILE="/home/bai/.config/bash/.bash_history"

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
sex


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

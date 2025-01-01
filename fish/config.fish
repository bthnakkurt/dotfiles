#source /usr/share/cachyos-fish-config/cachyos-config.fish
function fish_greeting
    fastfetch -c examples/8.jsonc
end

alias gpush="git add . && git commit -m 'bai' && git push"
alias ch='chmod +x'
alias sudo='sudo -E'
alias ls='eza --color=always --color-scale-mode=gradient --icons=always --hyperlink -a --group-directories-first -s=Extension'
alias cat='bat'
alias cr='cargo run'
alias c='clear'

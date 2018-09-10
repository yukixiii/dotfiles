# (d) is default on

# ------------------------------
# General Settings
# ------------------------------
set -x EDITOR nvim       # エディタをnvimに設定
set -x LANG ja_JP.UTF-8  # 文字コードをUTF-8に設定
set -x KCODE u           # KCODEにUTF-8を設定
set -x AUTOFEATURE true  # autotestでfeatureを動かす
# set -x TERM screen-256color
# set -x TERM gnome-256color
set -x TERM xterm-256color
# set -x TERM tmux-256color

fish_vi_key_bindings

# viモードでも、Ctrl-FでAutosuggestionを受け入れる
function fish_user_key_bindings
    for mode in insert default visual
        bind -M $mode \cf forward-char
        bind -M $mode \ef forward-word
    end
end

# ------------------------------
# Other Settings
# ------------------------------
### rbenv ###
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

### Aliases ###
alias v=vim
alias n=nvim
abbr --add t='tmux'
alias ta='tmux attach'
alias tl='tmux ls'
abbr --add d='docker'
abbr --add c='docker-compose'
abbr --add cu='docker-compose up -d'
abbr --add cn='docker-compose down'
alias nv=nvr
alias r=ranger
abbr --add x=xdg-open
alias ls='ls --color=auto'
alias la='ls -a'
alias l='ls -lh --time-style=long-iso'
alias ll='ls -lha --time-style=long-iso'

# alias mosh='LC_CTYPE=en_US.UTF-8 LC_MESSAGES=en_US.UTF-8 LC_ALL=en_US.UTF-8 mosh'

# cd後にls
# これやると移動履歴が保存されないみたいなので保留
# function cd
#     builtin cd $argv; and ls
# end

# neovimのterminal内でneovim側もcd
function ncd
    nvr -c "cd "(realpath $argv)
end

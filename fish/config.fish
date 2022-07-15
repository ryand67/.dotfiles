if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias ll="ls -al"
alias c="clear"
alias ch="clear && cd"
alias sql="sqlite3"

function nv
    nvim $argv
end

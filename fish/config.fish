if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias ll="ls -al"

function nv
    nvim $argv
end

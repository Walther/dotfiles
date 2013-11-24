alias ls='ls -CF --color=auto'
    
function cd()
{
    builtin cd "$*" && ls
}


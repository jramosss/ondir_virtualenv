function cd () {
    # Retrieve all the virtualenvs
    envs=$(for filepath in $(ls -d ~/.virtualenvs/*); do echo $(basename ${filepath}); done)
    # If entering a virtualenv, activate it
    if [[ " ${envs[*]} " =~ "$@" ]] && [[ "$@" != ".." ]] && [[ "$@" != "." ]] && [[ -d "$@" ]]
    then
        builtin cd "$@" && workon "$@"
    # else, we just cd
    else
        builtin cd "$@"
    fi
}

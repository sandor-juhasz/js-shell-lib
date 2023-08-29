
tui_title() {
    gum style "   $1   " --border="rounded"
}

tui_input() {
    local prompt=$1
    local default=$2

    local value
    value=$(gum input --placeholder "${default}" --prompt "${prompt}")
    [[ $? != 0 ]] && return 1
    [[ "$value" == "" ]] && value=$default
    echo "$value"
    return 0
}

tui_confirm_continue() {
    cat
    gum confirm "Continue?"
    [[ "$?" != 0 ]] && die
}

tui_confirm() {
    gum confirm "$1"
}
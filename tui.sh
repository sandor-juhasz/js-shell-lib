
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

#
# First argument: The message to display.
# Second optional argument: default action "Yes" or "No"
#
tui_confirm() {
    local default_action=${2:-Yes}
    gum confirm "$1" --default="${default_action}"
}
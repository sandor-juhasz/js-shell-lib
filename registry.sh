registry_read() {
    if [ -f "${HOME}/.local/var/cache/registry/$1/$2" ]; then
        cat "${HOME}/.local/var/cache/registry/$1/$2"
    fi
}

registry_write() {
    mkdir -p "${HOME}/.local/var/cache/registry/$1"
    echo "$3" >"${HOME}/.local/var/cache/registry/$1/$2"
}
#!/bin/bash
# Shared helpers for install scripts. Source this file; don't execute it.

# link <src> <dst>
# - does nothing if <dst> is already a symlink to <src>
# - otherwise backs up an existing <dst> (never overwriting a previous backup) and creates the symlink
link() {
    local src="$1" dst="$2"

    if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
        return
    fi

    if [ -e "$dst" ] || [ -L "$dst" ]; then
        local backup="${dst}_bk"
        if [ -e "$backup" ] || [ -L "$backup" ]; then
            backup="${dst}_bk.$(date +%Y%m%d%H%M%S)"
        fi
        mv "$dst" "$backup"
        echo "backed up $dst -> $backup"
    fi

    mkdir -p "$(dirname "$dst")"
    ln -sn "$src" "$dst"
    echo "linked $dst -> $src"
}

# append_line <line> <file>
# appends <line> to <file> only if the exact line is not already present
append_line() {
    local line="$1" file="$2"
    touch "$file"
    if ! grep -qxF -- "$line" "$file"; then
        echo "$line" >> "$file"
        echo "appended to $file: $line"
    fi
}

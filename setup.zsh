#!/bin/zsh
set -eu

function install_brew() {
    echo "Install brew:"
    echo "  You should confirm the following commmand from https://brew.sh/index_ja"
    echo "  \$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    read -k "YES_OR_NO?Ok? (y/n): "

    if [[ $YES_OR_NO == y ]]; then
        $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)
    fi
}

type brew || install_brew

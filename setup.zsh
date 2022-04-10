#!/bin/zsh
set -eu

NOCOLOR='\033[0m'
GREEN='\033[0;32m'

function green_echo() {
    echo "${GREEN}$1${NOCOLOR}"
}

function install_brew() {
    green_echo "Install brew:"
    echo "  You should confirm the following commmand from https://brew.sh/index_ja"
    echo "  \$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    read -k "YES_OR_NO?Ok? (y/n): "

    if [[ $YES_OR_NO == y ]]; then
        mkdir -p ~/tmp/setup/
        cd ~/tmp/setup/
        curl -fsSL -o install.sh https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
        chmod +x ./install.sh
        ./install.sh
    fi
}

function brew_bundle() {
    green_echo "Install packages by brew bundle:"
    mkdir -p ~/tmp/setup/
    cd ~/tmp/setup
    curl -fsSL "https://raw.githubusercontent.com/eggc/setup/main/lib/Brewfile" > Brewfile

    echo "  You will install or upgrade following packages"
    cat Brewfile
    read -k "YES_OR_NO?Ok? (y/n): "

    if [[ $YES_OR_NO == y ]]; then
        brew bundle -v
    fi
}

type brew || install_brew

brew_bundle

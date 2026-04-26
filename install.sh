#!/bin/bash
set -euo pipefail

cyan=`tput setaf 6`
reset=`tput sgr0`
pref="${cyan}[SCANTAILOR INSTALLER] ${reset}"

WORKTREE="${WORKTREE:-$HOME/_git/scantailor}"
REPO_URL="${REPO_URL:-https://github.com/macqster/scantailor-advanced-osx.git}"

activate_brew() {
    if [[ -x /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
        return 0
    fi
    if [[ -x /usr/local/bin/brew ]]; then
        eval "$(/usr/local/bin/brew shellenv)"
        return 0
    fi
    return 1
}

if ! command -v brew &> /dev/null
then
while true; do
    read -p "$pref Could not find the HOMEBREW package manager. Do you want to install it ? [Y/N]" yn
    case $yn in
        [Yy]* ) /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
                activate_brew || true
                brew update; break;;
        [Nn]* ) echo "$pref Installation aborted."; exit;;
        * ) echo "$pref Please answer yes or no [Y/N]";;
    esac
done
fi

if ! command -v git &> /dev/null
then
while true; do
    read -p "$pref Could not find the GIT version control system. Do you want to install it ? [Y/N]" yn
    case $yn in
        [Yy]* ) brew install git; break;;
        [Nn]* ) echo "$pref Installation aborted."; exit;;
        * ) echo "$pref Please answer yes or no [Y/N]";;
    esac
done
fi

if [[ -d "$WORKTREE/.git" ]]; then
    cd "$WORKTREE"
else
    mkdir -p "$(dirname "$WORKTREE")"
    git clone "$REPO_URL" "$WORKTREE"
    cd "$WORKTREE"
fi

activate_brew || {
    echo "$pref Could not activate Homebrew shell environment."
    exit 1
}

brew install --formula ${1:-} ./scantailor.rb
echo "$pref Succesfuly installed SCANTAILOR, done."

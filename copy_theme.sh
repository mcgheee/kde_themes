#!/bin/bash
set -euo pipefail

REPO_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

install_dependencies() (
    local ID="" ID_LIKE="" PRETTY_NAME="" VERSION_ID="" VERSION_CODENAME=""
    if ! test -r /etc/os-release; then
        echo "Unable to determine the Linux distribution: /etc/os-release is unavailable." >&2
        return 1
    fi

    . /etc/os-release
    case "${ID:-} ${ID_LIKE:-}" in
        *fedora*|*rhel*)
            if ! rpm -q klassy >/dev/null 2>&1; then
                sudo dnf -y copr enable errornointernet/klassy
                sudo dnf -y install klassy
            fi
            if ! rpm -q plasma-sdk >/dev/null 2>&1; then
                sudo dnf -y install plasma-sdk
            fi
            ;;
        *arch*)
            if ! pacman -Q klassy >/dev/null 2>&1; then
                if command -v yay >/dev/null 2>&1; then
                    yay -S klassy
                elif command -v paru >/dev/null 2>&1; then
                    paru -S klassy
                else
                    echo "Install klassy with an AUR helper (yay or paru), then rerun this script." >&2
                    return 1
                fi
            fi
            if ! pacman -Q plasma-sdk >/dev/null 2>&1; then
                # Refreshing Arch repositories requires a full upgrade, not pacman -Sy.
                sudo pacman -Syu --noconfirm plasma-sdk
            fi
            ;;
        *ubuntu*)
            if ! [[ "$(dpkg-query -W -f='${Status}' klassy 2>/dev/null)" == "install ok installed" ]]; then
                if [[ ! "$VERSION_ID" =~ ^[0-9]+\.[0-9]+$ ]]; then
                    echo "Unable to determine the Ubuntu version for the klassy repository." >&2
                    return 1
                fi
                install_apt_repository "xUbuntu_${VERSION_ID}"
            fi
            install_apt_packages
            ;;
        *debian*)
            if ! [[ "$(dpkg-query -W -f='${Status}' klassy 2>/dev/null)" == "install ok installed" ]]; then
                if [[ "$VERSION_CODENAME" != sid && "$VERSION_CODENAME" != unstable ]]; then
                    echo "Install klassy from a repository compatible with your Debian release, then rerun this script." >&2
                    return 1
                fi
                install_apt_repository Debian_Unstable
            fi
            install_apt_packages
            ;;
        *)
            echo "Unsupported Linux distribution: ${PRETTY_NAME:-unknown}." >&2
            return 1
            ;;
    esac
)

install_apt_repository() (
    local release="$1" scratch
    local url="https://download.opensuse.org/repositories/home:/paulmcauley/${release}"
    scratch="$(mktemp -d)"
    trap 'rm -rf -- "$scratch"' EXIT
    curl -fsSL "${url}/Release.key" -o "$scratch/Release.key"
    gpg --batch --yes --dearmor --output "$scratch/klassy.gpg" "$scratch/Release.key"
    sudo install -m 0644 "$scratch/klassy.gpg" /usr/share/keyrings/home_paulmcauley.gpg
    printf 'deb [signed-by=/usr/share/keyrings/home_paulmcauley.gpg] %s/ /\n' "$url" |
        sudo tee /etc/apt/sources.list.d/home:paulmcauley.list >/dev/null
)

install_apt_packages() {
    local package
    local missing=()
    for package in klassy plasma-sdk; do
        if ! [[ "$(dpkg-query -W -f='${Status}' "$package" 2>/dev/null)" == "install ok installed" ]]; then
            missing+=("$package")
        fi
    done
    if (( ${#missing[@]} )); then
        sudo apt update
        sudo apt install -y "${missing[@]}"
    fi
}

copy_if_present() {
    local source="$1" destination="$2"
    if [[ -e "$source" ]]; then
        cp -R -- "$source" "$destination/"
    else
        printf 'Skipping missing optional configuration: %s\n' "$source" >&2
    fi
}

copy_to_repo() {
    local theme_dir="$REPO_DIR/$1" config
    mkdir -p -- "$theme_dir/dot_config" "$theme_dir/dot_local/share" "$theme_dir/screen_shots"
    copy_if_present "$HOME/.local/share/color-schemes" "$theme_dir/dot_local/share"
    for config in ghostty nvim fish zed zellij starship.toml; do
        copy_if_present "$HOME/.config/$config" "$theme_dir/dot_config"
    done
    copy_if_present "$HOME/.tmux" "$theme_dir"
}

copy_to_local() {
    local theme_dir="$REPO_DIR/$1" config
    mkdir -p -- "$HOME/.config" "$HOME/.local/share" "$HOME/.config/ghostty/shaders"
    copy_if_present "$theme_dir/dot_local/share/color-schemes" "$HOME/.local/share"
    for config in ghostty nvim fish zed zellij starship.toml; do
        copy_if_present "$theme_dir/dot_config/$config" "$HOME/.config"
    done
    copy_if_present "$theme_dir/.tmux" "$HOME"
}

copy_shaders() (
    local repo_url="$1" subdirectory="${2:-.}" scratch
    scratch="$(mktemp -d)"
    trap 'rm -rf -- "$scratch"' EXIT
    git clone --depth 1 -- "$repo_url" "$scratch/repo"
    local shaders=()
    shopt -s nullglob
    shaders=("$scratch/repo/$subdirectory/"*.glsl)
    if (( ${#shaders[@]} == 0 )); then
        echo "No GLSL shaders found in $repo_url ($subdirectory)." >&2
        return 1
    fi
    mkdir -p -- "$HOME/.config/ghostty/shaders"
    cp -- "${shaders[@]}" "$HOME/.config/ghostty/shaders/"
)

usage() {
    echo "Usage: $0 [THEMENAME] (--to-repo | --from-repo)"
    echo "THEMENAME may also be supplied as an environment variable."
    echo "Aliases: --to_repo, --from_repo"
    echo "Themes are stored beside this script. Existing configurations are merged/overwritten."
    echo "--from-repo installs dependencies and downloads shaders; it may require sudo and network access."
}

mode=""
theme_argument=""
for argument in "$@"; do
    case "$argument" in
        --to-repo|--to_repo)
            if [[ -n "$mode" && "$mode" != to_repo ]]; then
                echo "Choose only one copy direction." >&2
                exit 2
            fi
            mode=to_repo
            ;;
        --from-repo|--from_repo)
            if [[ -n "$mode" && "$mode" != from_repo ]]; then
                echo "Choose only one copy direction." >&2
                exit 2
            fi
            mode=from_repo
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        -*)
            echo "Unknown option: $argument" >&2
            usage >&2
            exit 2
            ;;
        *)
            if [[ -n "$theme_argument" ]]; then
                echo "Specify only one theme name." >&2
                exit 2
            fi
            theme_argument="$argument"
            ;;
    esac
done

THEMENAME="${theme_argument:-${THEMENAME:-}}"
if [[ -z "$THEMENAME" || -z "$mode" ]]; then
    usage >&2
    exit 2
fi
if [[ "$THEMENAME" == */* || "$THEMENAME" == . || "$THEMENAME" == .. || "$THEMENAME" == -* ]]; then
    echo "Theme name must be a single directory name and cannot start with a dash." >&2
    exit 2
fi
if [[ -L "$REPO_DIR/$THEMENAME" ]]; then
    echo "Theme directory must not be a symbolic link." >&2
    exit 2
fi

if [[ "$mode" == to_repo ]]; then
    copy_to_repo "$THEMENAME"
else
    if [[ ! -d "$REPO_DIR/$THEMENAME/dot_config" ]]; then
        echo "Theme not found or missing dot_config: $THEMENAME" >&2
        exit 1
    fi
    install_dependencies
    copy_to_local "$THEMENAME"
    copy_shaders "https://github.com/sahaj-b/ghostty-cursor-shaders"
    copy_shaders "https://github.com/0xhckr/ghostty-shaders"
    copy_shaders "https://github.com/linkarzu/dotfiles-latest" "ghostty/shaders"
fi

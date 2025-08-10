#!/usr/bin/env bash
set -euo pipefail

# Update and upgrade existing packages
sudo apt-get update
sudo apt-get upgrade -y

# Remove snapd if present and prevent it from being reinstalled
sudo apt autoremove --purge snapd -y || true
sudo apt-mark hold snapd || true

# Ensure aptitude is available for package management
sudo apt-get install -y aptitude

# Packages to install via aptitude
packages=(
    python3-pip
    python3-virtualenv
    python3-virtualenvwrapper
    ccache
    doxygen
    graphviz
    qttools5-dev-tools
    libhidapi-dev
    libusb-1.0-0-dev
    libprotobuf-dev
    protobuf-compiler
    libudev-dev
    build-essential
    cmake
    pkg-config
    libboost-all-dev
    libssl-dev
    libzmq3-dev
    libpgm-dev
    libnorm-dev
    libunbound-dev
    libsodium-dev
    libunwind8-dev
    liblzma-dev
    libreadline6-dev
    libexpat1-dev
    libgtest-dev
    libavahi-client-dev
    libavahi-core-dev
    libavahi-glib-dev
)

# Install all packages in one call for efficiency
sudo aptitude install -y "${packages[@]}"

# Configure virtualenvwrapper environment variables
profile="$HOME/.profile"
echo 'export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3' >> "$profile"
echo 'export WORKON_HOME="$HOME/.virtualenvs"' >> "$profile"
echo 'export VIRTUALENVWRAPPER_VIRTUALENV="$HOME/.local/bin/virtualenv"' >> "$profile"
echo 'source "$HOME/.local/bin/virtualenvwrapper.sh"' >> "$profile"

# Apply variables for current session as well
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME="$HOME/.virtualenvs"
export VIRTUALENVWRAPPER_VIRTUALENV="$HOME/.local/bin/virtualenv"

# Symlink the virtualenvwrapper script for convenience
ln -sf "$HOME/.local/bin/virtualenvwrapper.sh" /usr/share/virtualenvwrapper/virtualenvwrapper.sh

# Disable sleep modes
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target

# Clone required repositories
mkdir -p "$HOME/repos"
cd "$HOME/repos"
if [ ! -d cups ]; then
    git clone https://github.com/openprinting/cups
fi


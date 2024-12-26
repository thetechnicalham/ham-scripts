#!/bin/bash
#
# Author  : Anthony Woodward
# Date    : 1 December 2024
# Updated : 4 December 2024
# Purpose : Main installer for Ham Radio programs

# Load environment detection
if [ -f "$HOME/ham-scripts/detect-env.sh" ]; then
    source "$HOME/ham-scripts/detect-env.sh"
else
    echo "Error: Environment detection script (detect-env.sh) not found in $HOME/ham-scripts!"
    exit 1
fi


# Variables
REPO_DIR="$INSTALL_DIR/ham-scripts" # Repository directory based on environment
BRANCH="main" # Default branch to pull from

# Check for system updates
echo "Checking for system updates..."
if ! sudo apt-get update; then
    echo "Failed to update package list. Exiting."
    exit 1
fi

# Check for repository updates
echo "Checking for updates from the repository..."
if [ ! -d "$REPO_DIR" ]; then
    echo "Repository directory $REPO_DIR does not exist. Cloning the repository..."
    git clone -b $BRANCH https://github.com/thetechnicalham/ham-scripts.git "$REPO_DIR" || {
        echo "Failed to clone the repository. Exiting.";
        exit 1;
    }
else
    cd "$REPO_DIR" || { echo "Failed to access repository directory $REPO_DIR. Exiting."; exit 1; }
    git fetch origin
    if [ "$(git rev-list HEAD...origin/$BRANCH --count)" -gt 0 ]; then
        echo "Updates found. Pulling the latest changes..."
        git pull origin $BRANCH || { echo "Failed to pull updates. Exiting."; exit 1; }
    else
        echo "No updates found. Proceeding with the installation..."
    fi
    cd - >/dev/null || exit 1
fi

# Start installation
echo "Starting installation..."

# Execute scripts
echo "Installing JS8Spotter..."
bash "$REPO_DIR/Scripts/install-js8spotter.sh" || { echo "Failed to install JS8Spotter. Exiting."; exit 1; }

echo "Installing WSJT-X..."
bash "$REPO_DIR/Scripts/install-wsjtx.sh" || { echo "Failed to install WSJT-X. Exiting."; exit 1; }

# Clean up unnecessary files
echo "Cleaning up unnecessary files..."
sudo apt-get autoremove -y
sudo apt-get clean

echo "Installation complete!"

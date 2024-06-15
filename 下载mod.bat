#!/bin/bash

# Function to install Git
install_git() {
  if [ "$(uname)" == "Darwin" ]; then
    # Install Git on macOS using Homebrew
    if ! command -v brew &>/dev/null; then
      echo "Homebrew not found, installing Homebrew..."
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    echo "Installing Git using Homebrew..."
    brew install git
  elif [ -f /etc/debian_version ]; then
    # Install Git on Debian-based systems
    echo "Installing Git using apt-get..."
    sudo apt-get update
    sudo apt-get install -y git
  elif [ -f /etc/redhat-release ]; then
    # Install Git on Red Hat-based systems
    echo "Installing Git using yum..."
    sudo yum install -y git
  else
    echo "Unsupported OS. Please install Git manually."
    exit 1
  fi
}

# Check if Git is installed
if ! command -v git &>/dev/null; then
  echo "Git not found, installing Git..."
  install_git
else
  echo "Git is already installed."
fi

# Clean untracked files and directories, then pull updates from remote
git clean -fdx
git pull
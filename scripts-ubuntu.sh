#!/bin/bash

# Install zsh if not installed
if ! command -v zsh &> /dev/null
then
    echo "zsh not found, installing..."
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt update && sudo apt install -y zsh
    else
        echo "Unsupported OS - only Linux ATM"
        exit 1
    fi
else
    echo "zsh is already installed."
fi

# Change default shell to zsh
if [[ "$SHELL" != *zsh* ]]; then
    echo "Changing default shell to zsh..."
    chsh -s $(which zsh)
else
    echo "zsh is already the default shell."
fi

# Create .zshrc file if it doesn't exist
ZSHRC_FILE="$HOME/.zshrc"
if [ ! -f "$ZSHRC_FILE" ]; then
    echo "Creating .zshrc file..."
    touch "$ZSHRC_FILE"
fi

# Create .zprofile file if it doesn't exist
ZPROFILE_FILE="$HOME/.zprofile"
if [ ! -f "$ZPROFILE_FILE" ]; then
    echo "Creating .zprofile file..."
    touch "$ZPROFILE_FILE"
fi

# Create .zlogin file if it doesn't exist
ZLOGIN_FILE="$HOME/.zlogin"
if [ ! -f "$ZLOGIN_FILE" ]; then
    echo "Creating .zlogin file..."
    touch "$ZLOGIN_FILE"
fi

# Create .zlogout file if it doesn't exist
ZLOGOUT_FILE="$HOME/.zlogout"
if [ ! -f "$ZLOGOUT_FILE" ]; then
    echo "Creating .zlogout file..."
    touch "$ZLOGOUT_FILE"
fi

echo "Install oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"

# Check if the .zshrc file exists
if [ -f "$ZSHRC_FILE" ]; then
  echo "Setting ZSH_THEME to agnoster..."
  # Use sed to find the line that sets ZSH_THEME and change its value
  sed -i '' 's/^ZSH_THEME=.*/ZSH_THEME="agnoster"/' "$ZSHRC_FILE"
  echo "ZSH_THEME has been updated to agnoster in $ZSHRC_FILE"
else
  echo "$ZSHRC_FILE does not exist."
fi


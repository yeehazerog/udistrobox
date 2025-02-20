#!/bin/sh

echo "Install oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"
chsh -s /bin/zsh

# Path to the .zshrc file
ZSHRC_FILE="$HOME/.zshrc"

# Check if the .zshrc file exists
if [ -f "$ZSHRC_FILE" ]; then
  # Use sed to find the line that sets ZSH_THEME and change its value
  sed -i '' 's/^ZSH_THEME=.*/ZSH_THEME="agnoster"/' "$ZSHRC_FILE"
  echo "ZSH_THEME has been updated to agnoster in $ZSHRC_FILE"
else
  echo "$ZSHRC_FILE does not exist."
fi

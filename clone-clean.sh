#!/bin/bash

set -e

DEST_BASE="${1:-$HOME/sandbox}"

CURRENT_DIR="$(pwd)"
REPO_NAME="$(basename "$CURRENT_DIR")"
RANDOM_HASH="$(head -c 8 /dev/urandom | xxd -p)"
DEST_DIR="$DEST_BASE/${REPO_NAME}-${RANDOM_HASH}"

echo "Cloning $CURRENT_DIR to $DEST_DIR..."

git clone --no-checkout "$CURRENT_DIR" "$DEST_DIR"
cd "$DEST_DIR"
git checkout HEAD -- .

if [ -f "$CURRENT_DIR/.env" ]; then
  cp "$CURRENT_DIR/.env" "$DEST_DIR/.env"
  echo "Copied .env file"
else
  echo "Warning: .env not found in current directory"
fi

echo "Done! Clone at: $DEST_DIR"

if command -v xclip &> /dev/null; then
  echo "cd $DEST_DIR" | xclip -selection clipboard
  echo "Copied 'cd $DEST_DIR' to clipboard"
elif command -v pbcopy &> /dev/null; then
  echo "cd $DEST_DIR" | pbcopy
  echo "Copied 'cd $DEST_DIR' to clipboard"
else
  echo "Run: cd $DEST_DIR"
fi
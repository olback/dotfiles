#!/bin/bash

set -e

TARGET_TRIPLE="x86_64-unknown-linux-gnu"
SAVE_DIR="$HOME/.local/bin"

LATEST_RELEASE_NAME=$(curl -fsSL https://api.github.com/repos/rust-analyzer/rust-analyzer/releases | jq '.[1].name' -r)
TEMPFILE="$(tempfile)"

echo "Downloading rust-analyzer $LATEST_RELEASE_NAME"
curl -o "$TEMPFILE.gz" -fsSL "https://github.com/rust-analyzer/rust-analyzer/releases/download/$LATEST_RELEASE_NAME/rust-analyzer-$TARGET_TRIPLE.gz"
gzip --force -d "$TEMPFILE.gz"
mv $TEMPFILE "$SAVE_DIR/rust-analyzer"
chmod +x "$SAVE_DIR/rust-analyzer"

echo Done


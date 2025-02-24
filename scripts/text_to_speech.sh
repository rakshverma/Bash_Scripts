#!/bin/bash

if ! command -v espeak &>/dev/null; then
    sudo apt install -y espeak || exit 1
fi
if ! command -v gtts-cli &>/dev/null; then
    sudo apt install python3-gtts || exit 1
fi

read -p "Enter text: " text
echo "1) espeak (offline)"
echo "2) gtts (better quality, needs internet)"
read -p "Choice [1/2]: " choice

if [[ "$choice" == "1" ]]; then
    espeak "$text"
elif [[ "$choice" == "2" ]]; then
    read -p "Enter filename: " filename
    gtts-cli "$text" --output "$filename.mp3"
    echo "Saved as $filename.mp3"
else
    echo "Invalid choice"
    exit 1
fi

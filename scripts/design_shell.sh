#!/bin/bash

apply_style() {
  local style=$1
  echo "export PS1='$style'" >> ~/.bashrc
  source ~/.bashrc
}

echo "Choose a terminal design style:"
echo "1. Simple [\\u@\\h \\W]\\$"
echo "2. Informative [\\u@\\h \\w]\\$"
echo "3. Minimal [\\W]\\$"
echo "4. Time-stamped [\\t \\u@\\h:\\w]\\$"
echo "5. Colorful User and Hostname"
echo "6. Reset to Default"

read -p "Enter your choice (1-6): " choice

case $choice in
  1)
    apply_style "\\u@\\h \\W\\$ "
    echo "Applied style: Simple"
    ;;
  2)
    apply_style "\\u@\\h \\w\\$ "
    echo "Applied style: Informative"
    ;;
  3)
    apply_style "\\W\\$ "
    echo "Applied style: Minimal"
    ;;
  4)
    apply_style "\\t \\u@\\h:\\w\\$ "
    echo "Applied style: Time-stamped"
    ;;
  5)
    apply_style "\\[\\033[1;32m\\]\\u\\[\\033[0m\\]@\\[\\033[1;34m\\]\\h\\[\\033[0m\\] \\w\\$ "
    echo "Applied style: Colorful User and Hostname"
    ;;
  6)
    sed -i '/^export PS1=/d' ~/.bashrc
    source ~/.bashrc
    echo "Terminal prompt reset to default."
    ;;
  *)
    echo "Invalid choice. No changes made."
    ;;
esac

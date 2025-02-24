#!/bin/bash

file_types=$(find . -maxdepth 1 -type f | sed -n 's/.*\.//p' | sort | uniq | grep -v '^sh$')

if [[ -z "$file_types" ]]; then
  echo "No files found in the current directory (excluding .sh files)."
  exit 1
fi

for file_type in $file_types; do
  echo "Found files of type: .$file_type"

  echo "Enter the folder name to save .$file_type files (or type 'skip' to skip):"
  read folder_name

  if [[ "$folder_name" == "skip" ]]; then
    echo "Skipping .$file_type files."
    continue
  fi

  if [[ ! -d "$folder_name" ]]; then
    mkdir -p "$folder_name"
  fi

  mv *."$file_type" "$folder_name" 2>/dev/null
  echo "Moved .$file_type files to $folder_name."
done

echo "File organization complete."

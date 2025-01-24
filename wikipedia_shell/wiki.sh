#!/bin/bash

# Function to fetch and display article details
fetch_article_details() {
  local title="$1"
  local encoded_title=$(echo "$title" | sed 's/ /%20/g')
  local content_url="https://en.wikipedia.org/w/api.php?action=query&prop=extracts&explaintext&titles=$encoded_title&format=json"
  local content_response=$(curl -s "$content_url")

  # Extract and display content
  echo "$content_response" | grep -o '"extract":"[^"]*"' | sed 's/"extract":"//;s/\\n/\n/g;s/\\"/"/g;s/"$//'
}

# Main loop
while true; do
  echo "Enter your search query (or type 'q' to quit):"
  read query

  # Exit if user types 'q' or 'exit'
  if [[ "$query" == "q" || "$query" == "exit" ]]; then
    echo "Exiting... Goodbye!"
    break
  fi

  # Encode the query
  encoded_query=$(echo "$query" | sed 's/ /%20/g')

  # Wikipedia API endpoint
  url="https://en.wikipedia.org/w/api.php?action=query&list=search&srsearch=$encoded_query&format=json"

  # Fetch search results
  response=$(curl -s "$url")

  # Check if response is valid
  if [[ -z "$response" ]]; then
    echo "No response received. Please check your internet connection."
    continue
  fi

  # Check if jq is installed
  if ! command -v jq &> /dev/null; then
    echo "Installing jq..."
    sudo apt install -y jq
  fi

  # Extract and display search results
  echo "Search Results:"
  titles=($(echo "$response" | jq -r '.query.search[].title'))
  for i in "${!titles[@]}"; do
    echo "$((i+1)). ${titles[i]}"
  done

  # Prompt user for a choice
  echo "Choose an option to view details (1-${#titles[@]}) or 'q' to quit:"
  read choice

  # Exit if user types 'q'
  if [[ "$choice" == "q" || "$choice" == "exit" ]]; then
    echo "Exiting... Goodbye!"
    break
  fi

  # Validate the user's choice
  if [[ "$choice" -ge 1 && "$choice" -le ${#titles[@]} ]]; then
    selected_title=${titles[$((choice-1))]}
    echo "Fetching details for: $selected_title"
    fetch_article_details "$selected_title"
  else
    echo "Invalid choice. Please try again."
  fi

  echo "--------------------------------------------"
done

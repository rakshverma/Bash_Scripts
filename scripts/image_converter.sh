#!/bin/bash

if ! command -v convert &> /dev/null
then
    echo "ImageMagick not found. Installing..."
    sudo apt-get update
    sudo apt-get install -y imagemagick
    if ! command -v convert &> /dev/null
    then
        echo "Failed to install ImageMagick. Please install it manually."
        exit 1
    fi
fi

echo "Select an image from the folder:"
select input_image in $(ls *.jpg *.png *.jpeg 2>/dev/null); do
    if [[ -n "$input_image" ]]; then
        echo "You selected: $input_image"
        break
    else
        echo "Invalid selection, please select a valid image."
    fi
done

read -p "Enter the output image name (without extension): " output_name
read -p "Enter the desired output format (e.g., jpg, png): " output_format
read -p "Enter the width of the passport photo in pixels (e.g., 600): " width
read -p "Enter the height of the passport photo in pixels (e.g., 600): " height

convert "$input_image" -resize ${width}x${height}! -units PixelsPerInch -density 300 "$output_name.$output_format"

echo "Image has been resized and saved as $output_name.$output_format"


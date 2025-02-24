# 🚀 Utility Scripts Collection

This repository contains a collection of useful shell scripts designed for various tasks, including changing terminal designs, organizing files based on types, initializing framework projects, converting images to passport sizes, and text-to-speech conversion.

## 📂 Folder Structure
```
📦 Utility-Scripts
 ┣ 📜 README.md               📖 Project documentation
 ┣ 📂 scripts                 📁 Folder containing all shell scripts
 ┃ ┣ 🎨 design_shell.sh        🎨 Script to change terminal design and color schemes
 ┃ ┣ 📁 files_arranger.sh      📂 Script to organize files based on type
 ┃ ┣ ⚙️ framework_initializer.sh ⚡ Script to initialize a project with various frameworks (React, Django, Node.js, Flask)
 ┃ ┣ 🖼️ image_converter.sh     🖼️ Script to resize images to passport photo dimensions
 ┃ ┣ 🔊 text_to_speech.sh      🔊 Script for text-to-speech conversion (offline and online)
```

## 📜 Descriptions of Files

### 🎨 `design_shell.sh`: Terminal Design Changer
- This script allows users to change the design (colors, text styles) of their terminal by selecting from various predefined themes.
- **Usage**:
  ```bash
  ./scripts/design_shell.sh
  ```
  Follow the on-screen prompts to choose a theme.

### 📂 `files_arranger.sh`: File Organizer
- Organizes files in a directory based on their file types (excluding `.sh` files).
- **Usage**:
  ```bash
  ./scripts/files_arranger.sh
  ```
  The script will prompt you to specify folder names for each file type.

### ⚙️ `framework_initializer.sh`: Framework Project Initializer
- Quickly initializes a new project with one of the following frameworks:
  - React (via Vite)
  - Django
  - Node.js
  - Flask
- **Usage**:
  ```bash
  ./scripts/framework_initializer.sh
  ```
  Follow the prompts to select a framework and specify the directory.

### 🖼️ `image_converter.sh`: Image Resizer for Passport Photos
- Resizes images to specified passport photo dimensions.
- **Usage**:
  ```bash
  ./scripts/image_converter.sh
  ```
  The script will prompt for an image selection, output format, and dimensions.
- **Dependencies**: Requires `ImageMagick`. The script installs it if not found.

### 🔊 `text_to_speech.sh`: Text-to-Speech Converter
- Converts text to speech using either offline (`espeak`) or online (`gtts`) options.
- **Usage**:
  ```bash
  ./scripts/text_to_speech.sh
  ```
  Choose between `espeak` (offline) or `gtts` (higher quality, requires internet).
- **Dependencies**:
  - `espeak` (for offline TTS)
  - `gtts` (for online TTS)
  - The script installs missing dependencies automatically.

## 🔧 Installation
Ensure the following dependencies are installed for the scripts to work properly:

- **For `design_shell.sh`**: No external dependencies required.
- **For `files_arranger.sh`**: No external dependencies required.
- **For `framework_initializer.sh`**:
  - `Node.js` and `npm` for React and Node.js projects.
  - `Python 3` and `pip` for Django and Flask projects.
- **For `image_converter.sh`**:
  - `ImageMagick` for image processing.
  - To install it:
    ```bash
    sudo apt-get install imagemagick
    ```
- **For `text_to_speech.sh`**:
  - `espeak` for offline text-to-speech.
  - `gtts` for online text-to-speech.
  - To install dependencies:
    ```bash
    sudo apt install espeak
    sudo apt install python3-gtts
    ```

With this collection of scripts, you can efficiently manage terminal designs, organize files, initialize projects, convert images, and generate speech from text, all from the command line! 🚀


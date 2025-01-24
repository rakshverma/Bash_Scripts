# Utility Scripts Collection

This repository contains a collection of useful shell scripts designed for various tasks, including changing terminal designs, organizing files based on types, initializing framework projects, and searching Wikipedia from the shell. Below is the description of the scripts and the folder structure.

## Folder Structure

. ├── design_shell.sh # Script to change terminal design and color schemes ├── files_arranger.sh # Script to organize files based on type ├── framework_initializer.sh # Script to initialize a project with various frameworks (React, Django, Node.js, Flask) ├── wikipedia_shell.sh # Script to search and interact with Wikipedia from the shell └── README.md # Project documentation

### Descriptions of Files

1. **`design_shell.sh`**: Terminal Design Changer
   - This script allows users to change the design (colors, text styles) of their terminal by selecting from various predefined themes.
   - **Usage**:
     ```bash
     ./design_shell.sh
     ```
     Follow the on-screen prompts to choose a theme.

2. **`files_arranger.sh`**: File Organizer
   - This script helps organize files in a directory based on their file types (excluding `.sh` files). It will automatically detect different types of files and prompt the user for a folder name to move them into.
   - **Usage**:
     ```bash
     ./files_arranger.sh
     ```
     The script will prompt you to specify folder names for each file type.

3. **`framework_initializer.sh`**: Framework Project Initializer
   - This script allows the user to quickly initialize a new project with one of the following frameworks:
     - React (via Vite)
     - Django
     - Node.js
     - Flask
   - **Usage**:
     ```bash
     ./framework_initializer.sh
     ```
     Follow the prompts to select a framework and specify the directory for the project.

4. **`wikipedia_shell.sh`**: Wikipedia Shell Search
   - This script allows users to search Wikipedia directly from the terminal. It fetches search results from Wikipedia and displays the titles of matching articles. Users can then choose an article to view further details.
   - **Usage**:
     ```bash
     ./wikipedia_shell.sh
     ```
     Enter a search query and view the article titles returned from Wikipedia.

## Installation

Ensure the following dependencies are installed for the scripts to work properly:

- **For `design_shell.sh`**: No external dependencies required.
- **For `files_arranger.sh`**: No external dependencies required.
- **For `framework_initializer.sh`**:
  - `Node.js` and `npm` for React and Node.js projects.
  - `Python 3` and `pip` for Django and Flask projects.
- **For `wikipedia_shell.sh`**:
  - `curl` for making API requests.
  - `jq` for parsing JSON data returned from Wikipedia.

To install `jq`, run the following command:
```bash
sudo apt-get install jq

### Explanation:
- All details about the folder structure, script usage, and installation are encapsulated within a single code block for simplicity.
- This version presents the content in a clean and concise manner while maintaining clarity on how to use each script.

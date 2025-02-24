#!/bin/bash

echo "Choose a framework/library to initialize:"
echo "1. React"
echo "2. Django"
echo "3. Node.js"
echo "4. Flask"
echo "5. Exit"

read -p "Enter your choice (1-5): " choice

if [[ "$choice" -ge 1 && "$choice" -le 4 ]]; then
  read -p "Enter the directory path where the project should be initialized: " dir_path

  if [[ ! -d "$dir_path" ]]; then
    mkdir -p "$dir_path"
    echo "✅ Directory created at $dir_path."
  fi

  cd "$dir_path" || { echo "❌ Failed to access directory"; exit 1; }
fi

case $choice in
  1)
    echo "🚀 Initializing a React project..."
    mkdir my-react-app && cd my-react-app
    npx create-vite@latest . --template react
    echo "✅ React project initialized in '$dir_path/my-react-app'."
    ;;
  2)
    echo "🚀 Initializing a Django project..."
    read -p "Enter the project name: " django_project

    if [[ -z "$django_project" ]]; then
      echo "❌ Project name cannot be empty."
      exit 1
    fi

    mkdir -p "$django_project"
    cd "$django_project" || { echo "❌ Failed to create project directory."; exit 1; }

    python3 -m venv venv
    source venv/bin/activate

    if ! python3 -m django --version &>/dev/null; then
      pip install django
      if ! python3 -m django --version &>/dev/null; then
        echo "❌ Django installation failed."
        exit 1
      fi
    fi

    python3 -m django startproject "$django_project" .

    deactivate
    echo "✅ Django project '$django_project' initialized inside virtual environment."
    ;;
  3)
    echo "🚀 Initializing a Node.js project..."
    mkdir my-node-app && cd my-node-app
    npm init -y
    echo "✅ Node.js project initialized in '$dir_path/my-node-app'."
    ;;
  4)
    echo "🚀 Initializing a Flask project..."
    read -p "Enter the project name: " flask_project

    if [[ -z "$flask_project" ]]; then
      echo "❌ Project name cannot be empty."
      exit 1
    fi

    mkdir "$flask_project" && cd "$flask_project"
    python3 -m venv venv
    source venv/bin/activate

    pip install flask
    echo "flask" > requirements.txt

    echo -e "from flask import Flask\napp = Flask(__name__)\n\n@app.route('/')\ndef hello():\n    return 'Hello, Flask!'\n\nif __name__ == '__main__':\n    app.run(debug=True)" > app.py

    deactivate
    echo "✅ Flask project '$flask_project' initialized inside virtual environment."
    ;;
  5)
    echo "👋 Exiting. Goodbye!"
    exit 0
    ;;
  *)
    echo "❌ Invalid choice. Please run the script again."
    ;;
esac

#! /usr/bin/env bash
# A script to create a basic Go web server project structure

TEMPLATE_REPO_URL="https://github.com/asrma7/go-web-template.git"

banner() {
    printf "\n\033[1;34m%s\033[0m\n" "$*"
}

banner "Go Web Server Project Creator"
read -p "Enter the project name: " PROJECT_NAME
if [ -z "$PROJECT_NAME" ]; then
    echo "Project name cannot be empty."
    exit 1
fi

if [ -d "$PROJECT_NAME" ]; then
    echo "Directory '$PROJECT_NAME' already exists."
    exit 1
fi

read -p "Enter the module path (e.g., github.com/username/$PROJECT_NAME): " MODULE_PATH
if [ -z "$MODULE_PATH" ]; then
    echo "Module path cannot be empty."
    exit 1
fi

banner "Creating Project"
git clone --depth 1 "$TEMPLATE_REPO_URL" "$PROJECT_NAME"
if [ $? -ne 0 ]; then
    echo "Failed to clone template repository."
    exit 1
fi

cd "$PROJECT_NAME" || exit 1
rm -rf .git

sed -i "s|github.com/asrma7/go-web-template|$MODULE_PATH|g" go.mod
if [ $? -ne 0 ]; then
    echo "Failed to initialize Go module."
    exit 1
fi

find . -type f -name "*.go" -exec sed -i "s|github.com/asrma7/go-web-template|$MODULE_PATH|g" {} +
find . -type f -name "*.md" -exec sed -i "s|go-web-template|$PROJECT_NAME|g" {} +

banner "Installing Dependencies"
go mod tidy
if [ $? -ne 0 ]; then
    echo "Failed to install dependencies."
    exit 1
fi

banner "Initializing Git repository"
git init
git add .
git commit -m "Initial commit"
if [ $? -ne 0 ]; then
    echo "Failed to initialize Git repository."
    exit 1
fi

banner "Project '$PROJECT_NAME' created successfully!"

#!/bin/bash

# Function to check dependencies
check_dependencies() {
    if ! command -v ollama &>/dev/null; then
        echo "Error: Ollama is not installed. Please install it and try again."
        exit 1
    fi

    if ! git rev-parse --is-inside-work-tree &>/dev/null; then
        echo "Error: This script must be run inside a Git repository."
        exit 1
    fi
}

# Function to get the staged git diff
get_git_diff() {
    git diff --staged --cached
}

# Function to generate the commit message using Ollama
generate_commit_message() {
    local diff="$1"
    local prompt="Based on the following git diff, generate a git commit message. 
The message should have:
- A brief summary line (max 50 characters)
- Followed by a blank line
- Then a bulleted list of concise, specific changes.

Here's the diff:

$diff"

    echo "$prompt" | ollama run llama3.2 "Generate a concise git commit message:" || echo ""
}

# Function to handle user interaction
confirm_commit() {
    local generated_message="$1"

    echo "Generated commit message:"
    echo "-------------------------"
    echo "$generated_message"
    echo "-------------------------"
    echo ""

    read -p "Do you want to use this commit message? (y/n): " choice

    if [[ $choice == "y" || $choice == "Y" ]]; then
        git commit -m "$generated_message"
        echo "Changes committed with the generated message."
    elif [[ $choice == "n" || $choice == "N" ]]; then
        echo "Generated commit message only (not committed):"
        echo "$generated_message"
    else
        echo "Invalid input. Commit aborted."
    fi
}

# Main script logic
main() {
    check_dependencies

    local diff
    diff=$(get_git_diff)

    if [ -z "$diff" ]; then
        echo "No changes to commit"
        exit 1
    fi

    local commit_message
    echo "Generating commit message with Ollama..."
    commit_message=$(generate_commit_message "$diff")

    if [ -z "$commit_message" ]; then
        echo "Error: Failed to generate commit message."
        exit 1
    fi

    confirm_commit "$commit_message"
}

# Run the script
main

#!/bin/bash

# Get the git diff
diff=$(git diff --staged --cached)

# Check if there are changes to commit
if [ -z "$diff" ]; then
    echo "No changes to commit"
    exit 1
fi

# Prepare the prompt for Ollama
prompt="Based on the following git diff, generate a git commit message. The message should have a brief summary line (max 50 characters) followed by a blank line and then a bulleted list of specific changes. Each bullet point should start with a hyphen and be concise. Here's the diff:\n\n$diff"

# Run Ollama and get the commit message
echo "Generating commit message with Ollama..."
commit_message=$(echo "$prompt" | ollama run llama2 "Generate a git commit message based on this diff, following the format described:")

# Display the generated commit message
echo "Generated commit message:"
echo "$commit_message"
echo ""

# Prompt user to accept or modify the commit message
read -p "Do you want to use this commit message? (y/n): " choice

if [[ $choice == "y" || $choice == "Y" ]]; then
    # Use the entire generated message as both subject and body
    git commit -m "$commit_message"
    echo "Changes committed with the generated message."
else
    echo "Commit aborted. You can create your own commit message."
fi

# git-ollama-commit
### Ollama-Powered Git Commit Message Generator

This bash script automates the process of generating Git commit messages using Ollama, a local large language model runner. It analyzes the staged changes in a Git repository and uses Ollama to generate a contextually relevant commit message. 

Features:
- Extracts the git diff of staged changes
- Sends the diff to Ollama for commit message generation
- Displays the generated message for user review
- Allows user to accept or reject the generated message
- Commits changes with the accepted message

Requirements:
- Git
- Ollama (with a suitable language model installed)

Usage:
1. Stage your changes with 'git add'
2. Run the script instead of 'git commit'
3. Review and accept/reject the generated commit message

This script streamlines the commit process while ensuring human oversight on the final commit message.

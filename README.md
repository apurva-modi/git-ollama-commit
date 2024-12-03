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


### Installation

1. Download the script: https://github.com/apurva-modi/git-ollama-commit.git
2. Make the script executable: `chmod +x git-ollama-commit`
3. Move the script to a directory in your PATH. For example: `mv git-ollama-commit ~/bin/`
Note: Ensure ~/bin is in your PATH. If it's not, add the following line to your `~/.bashrc` or `~/.bash_profile`:
`export PATH="$HOME/bin:$PATH"`
4. Source your updated bash profile (if you modified it): `source ~/.bashrc  # or source ~/.bash_profile`


## Usage

1. Stage your changes as usual with `git add`.
2. Instead of using `git commit`, run: `git-ollama-commit`
3. The script will generate a commit message based on your staged changes.
4. Review the generated message and choose whether to use it or not.
5. If accepted, the script will commit your changes with the generated message.

## Customization

You can modify the script to use a different Ollama model or adjust the prompt sent to Ollama. Edit the script with a text editor to make these changes.

## Troubleshooting

- If you encounter permission issues, ensure the script is executable and located in a directory where you have execute permissions.
- If Ollama is not generating messages as expected, check that Ollama is installed correctly and that you have pulled the necessary model.
- For any other issues, please check the Ollama documentation or open an issue in this repository.

## Contributing

Contributions to improve the script are welcome! Please feel free to submit a Pull Request or open an Issue for any bugs or enhancements.





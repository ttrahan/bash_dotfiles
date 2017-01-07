# bash_dotfiles

Configuration files I use to customize my dev environment

The .bash_profile file sym-linked from the $HOME directory contains:
```bash
# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don't want to commit.
for file in ~/bash_dotfiles/.{path,bash_prompt,bash_completion,exports,aliases,functions,tools,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
```

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don't want to commit.
for file in ~/dotfiles/.{path,bash_prompt,bash_completion,exports,aliases,functions,tools,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file" && echo "$file complete";
done;
unset file;

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ttrahan/tools/google-cloud-sdk/path.bash.inc' ]; then source '/Users/ttrahan/tools/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ttrahan/tools/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/ttrahan/tools/google-cloud-sdk/completion.bash.inc'; fi

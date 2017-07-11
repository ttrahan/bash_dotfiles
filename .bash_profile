# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don't want to commit.
for file in ~/dotfiles/.{path,bash_prompt,bash_completion,exports,aliases,functions,tools,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tomtra/google-cloud-sdk/path.bash.inc' ]; then source '/Users/tomtra/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tomtra/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/tomtra/google-cloud-sdk/completion.bash.inc'; fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don't want to commit.
for file in ~/dotfiles/.{path,bash_prompt,bash_completion,exports,aliases,functions,tools,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file" && echo "$file complete";
done;
unset file;

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
source '/Users/tomtra/Downloads/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/Users/tomtra/Downloads/google-cloud-sdk/completion.bash.inc'

##
# Your previous /Users/tomtra/.bash_profile file was backed up as /Users/tomtra/.bash_profile.macports-saved_2019-07-26_at_20:50:07
##

# MacPorts Installer addition on 2019-07-26_at_20:50:07: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


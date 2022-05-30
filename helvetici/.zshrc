# Antigen stuff
source $HOME/.config/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle agkozak/zsh-z
antigen bundle zsh-users/zsh-autosuggestions

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

# Personal Settings

# KEYBINDINGS
set -o vi
# vi keybindings are great, but I don't like vi-mode history navigation
bindkey '^ ' autosuggest-accept
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

# LOAD TMUX if we're in our default terminal emulator, not if we're in VSCODE.
# See Vscode config for the arg passed to zsh on start up.
if [ "$IS_VSCODE" != "true" ]
then
    if [ "$TMUX" = "" ]; then tmux; fi;
fi

# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=6"

# ALIASES

alias m="make"
alias c="clear"
alias vimrc="vim ~/.config/nvim/init.vim"
alias ka="killall"
alias k="kubectl"

alias kepler-mysql="~/dev/kepler/bin/cloud_sql_proxy -instances=kepler-production-251715:us-central1:kepler-main=tcp:3308"
alias kepler-postgres="~/dev/kepler/bin/cloud_sql_proxy -instances=kepler-production-251715:us-central1:kepler-postgres=tcp:5434"
alias rrp-mysql="~/dev/rrm/bin/cloud_sql_proxy -instances=rrp-main:us-central1:rrp-main=tcp:3308"

if [ "$IS_VSCODE" != "true" ]
then
# Base16 Shell - Uncomment to base16-shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
	[ -s "$BASE16_SHELL/profile_helper.sh" ] && \
		eval "$("$BASE16_SHELL/profile_helper.sh")"

fi

function note() {
	if [[ $1 == "tech" ]]; then
		notes_dir=~/Documents/Writing/tech/
		date_part=$(date --date="now" "+%A_%b_%d_%Y")
		filename=Tech_Journal_$date_part.md
		vim $notes_dir$filename
	else
		notes_dir=~/Documents/Writing/
		date_part=$(date --date="now" "+%A_%b_%d_%Y")
		filename=Journal_$date_part.md
		vim $notes_dir$filename
	fi
}

# used for finding our dir in Emacs
export JOURNAL_DIR=~/Documents/Writing/

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:~/.emacs.d/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/dev/zig/zig-bootstrap/out/zig-x86_64-linux-musl-baseline/bin
export PATH=$PATH:~/dev/zig/zls
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/share/swift/usr/bin:$PATH"

# Auto-start rbenv
eval "$(rbenv init - zsh)"

function csv {
	cat $1 | column -t -s, -n | less -S
}

function fonts() {
	# Removing the Noto family of fonts because there are SO MANY favorations
	fc-list | grep -v "Noto" | sed -nr 's/.*\.[to]tf: (.*):style.*/\1/p' | sort | uniq
}

alias pbcopy="xclip -selection clipboard -i"

# tmux scripts
function work_rrm() {
	site_dir=~/dev/rrm/services/courses-site

	cd $site_dir

	# create a new session
	tmux new -s RRM -d
	tmux rename-window -t RRM "SERVER"

	# run all our servers and build scripts in one window
	tmux send-keys -t RRM "make" C-m

	tmux split-window -t RRM -v "yarn --cwd assets/css watch"
	tmux split-window -t RRM -h "yarn --cwd assets/web_components watch"

	# create our development window
	tmux new-window -t RRM
	tmux rename-window -t RRM "EDITOR"
	tmux send-keys -t RRM 'vim' C-m

	# attach to our new environment
	tmux select-window -t RRM:1
	tmux switch-client -t RRM
}

function work_kepler() {
	site_dir=~/dev/kepler/kepler/

	cd $site_dir

	# create a new session
	tmux new -s KEPLER -d
	tmux rename-window -t KEPLER "SERVER"

	# run all our servers and build scripts in one window
	tmux send-keys -t KEPLER "make" C-m

	tmux split-window -t KEPLER -v "make build_static"

	# create our development window
	tmux new-window -t KEPLER
	tmux rename-window -t KEPLER "EDITOR"
	tmux send-keys -t KEPLER 'vim' C-m

	# attach to our new environment
	tmux select-window -t KEPLER:1
	tmux switch-client -t KEPLER

	xdg-open http://localhost:8000
}

# Auto-tool puke here
export PATH="/home/helvetici/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

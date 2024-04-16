# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

eval "$(starship init zsh)"

# Disable automatic updates
zstyle ':omz:update' mode disabled

plugins=(git zsh-autosuggestions z)

source $ZSH/oh-my-zsh.sh

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/"
#[ -n "$PS1" ] && \
    #[ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        #source "$BASE16_SHELL/profile_helper.sh"

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(/opt/homebrew/bin/brew shellenv)"

alias c="clear"
alias vim="nvim"
alias vi="nvim"
alias ls="lsd -l --icon=never"
alias nrd="bun run --silent dev"
alias nrs="bun run --silent start"
alias nrt="bun run test"
alias nrb="bun run build"
alias vimrc="nvim $HOME/.config/nvim/init.lua"
alias ka="killall"
alias k="kubectl"

unalias gd
function gd() {
	# Check whether pnpm-lock.yaml exists first, then edit the diff command:
	if [ -f "pnpm-lock.yaml" ]; then
		git diff $@ -- ':!pnpm-lock.yaml'
	else
		git diff $@
	fi
}

function root() {
	cd $(git rev-parse --show-toplevel)
}

VIM_CONFIG_DIR=$HOME/.config/nvim

alias vimcolor="cd $VIM_CONFIG_DIR && nvim $VIM_CONFIG_DIR/after/plugin/color.lua"
alias vimconfig="cd $VIM_CONFIG_DIR && nvim $VIM_CONFIG_DIR/init.lua"

function font() {
	CONFIG_PATH="$HOME/.config/alacritty/alacritty.yml"
	sd 'size: (\d+)' "size: $1" $CONFIG_PATH
}

function kill_port() {
	pids=$(lsof -t -i :$1)
	if [[ -z "$pids" ]]; then
		echo "didn't find anything running on port $1"
	else
		echo "found PID(s) $pids on port $1, sending KILL"
		for pid in $pids; do
			kill -KILL $pid
		done
	fi
}

function clapify {
	echo "${1}" | sed 's/ / 👏 /g'
}

function sarcasm {
	local input=$1
	local output=""
	local length=${#input}

	for (( i=1; i<=length; i++ )); do
	if (( i % 2 == 0 )); then
	    output+=$(echo "${input[i]}" | tr '[:lower:]' '[:upper:]')
	else
	    output+="${input[i]}"
	fi
	done

	echo "$output"
}

alias kepler-postgres="$HOME/dev/kepler/bin/cloud_sql_proxy -instances=kepler-production-251715:us-central1:kepler-postgres=tcp:5434"

if [ "$IS_VSCODE" != "true" ]
then
    # only start tmux in our terminal, not in VSCode:
    # (see VSCode config for how this variable gets set)
    if [ "$TMUX" = "" ]; then tmux new -A -s 0; fi;
fi

# KEYBINDINGS
set -o vi
# vi keybindings are great, but I don't like vi-mode history navigation
bindkey '^ ' autosuggest-accept
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

function note_base_dir() {
	echo "$HOME/dev/"
}

function note() {
	notes_dir="$(note_base_dir)/Notes/"
	date_part=$(date "+%A_%b_%d_%Y")
	filename=Journal_$date_part.md
	vim $notes_dir$filename
}

function question() {
	notes_dir="$(note_base_dir)/Questions/"
	filename=questions.md
	vim $notes_dir$filename
}

function todo() {
	notes_dir="$(note_base_dir)/"
	filename=todo.md
	vim $notes_dir$filename
}

# updates my company's prettier configuration when I am writing markdown files
function update_prose_wrap() {
	node -e "const mod = require('@transport4/prettier-config/index'); mod.proseWrap = 'always'; require('fs').writeFileSync('./node_modules/@transport4/prettier-config/index.js', 'module.exports = ' + JSON.stringify(mod, null, 2) + ';')"
}

# FZF customization
unalias z 2> /dev/null
z() {
    [ $# -gt 0 ] && zshz "$*" && return
    cd "$(zshz -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

# PATH CONFIGURATION

export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:$HOME/dev/thirdparty/zig/0.12.0-dev
export PATH=$PATH:$HOME/dev/thirdparty/zig
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH=$PATH:~/dev/learning/flutter/flutter/bin

export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"

# AUTO-TOOL PUKE

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export DOTNET_PATH="/usr/local/share/dotnet/sdk/"
export PATH="$DOTNET_PATH:$PATH"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/helvetici/dev/kepler/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/helvetici/dev/kepler/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/helvetici/dev/kepler/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/helvetici/dev/kepler/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(rbenv init - zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/michaelhelvey/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

eval "$(direnv hook zsh)"

# bun completions
[ -s "/Users/helvetici/.bun/_bun" ] && source "/Users/helvetici/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bun completions
[ -s "/Users/michaelhelvey/.bun/_bun" ] && source "/Users/michaelhelvey/.bun/_bun"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

[ -f "/Users/michaelhelvey/.ghcup/env" ] && source "/Users/michaelhelvey/.ghcup/env" # ghcup-env

eval $(opam env)

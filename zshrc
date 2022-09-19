source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

export TERM="xterm-256color"
export SPACESHIP_PROMPT_ORDER=(user host dir git node exec_time line_sep jobs exit_code char)
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$HOME/bin:$PATH"
eval "$(rbenv init -)"

alias pr="hub -c core.commentChar='%' pull-request -F $HOME/.github/pull_request_template.md --edit"
alias prd="hub -c core.commentChar='%' pull-request -F $HOME/.github/pull_request_template.md -d --edit"

source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export GOPATH=$HOME/code/go
export PATH=$PATH:$GOPATH/bin
ulimit -n 8096

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

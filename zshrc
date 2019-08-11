source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

export TERM="xterm-256color"
export SPACESHIP_PROMPT_ORDER=(user host dir git node exec_time line_sep jobs exit_code char)
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$HOME/bin:$HOME/code/ruby/github/bin:$PATH"
eval "$(rbenv init -)"

alias pr="hub -c core.commentChar='%' pull-request -F $HOME/.github/pull_request_template.md --edit"
alias prd="hub -c core.commentChar='%' pull-request -F $HOME/.github/pull_request_template.md -d --edit"

source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

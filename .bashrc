# Aliases
alias ll='ls -latr'
alias dockerbad='docker system prune -a --volumes'
alias dce='docker compose exec'
alias cleards="find . -name '.DS_Store' -type f -delete"
 
# Load bash prompt style
BLACK="\[\033[0m\]"
BOLD_RED="\[\033[1;31m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
MAUVE="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
WHITE="\[\033[0;37m\]"
PROMPT_ICON="🧙🏼‍♂️"

parse_git_info() {
   local branch
   branch=$(git branch --no-color 2>/dev/null | sed -n 's/^\* //p')
   [[ -z "$branch" ]] && return
   
   if [[ "$branch" == "(no branch)" ]]; then
       git describe 2>/dev/null | sed 's/.*/[\0]/'
   else
       echo "[$branch]"
   fi
}

build_prompt() {
   local exit_code=$?
   local hist_color="$WHITE"
   [[ $exit_code -ne 0 ]] && hist_color="$BOLD_RED"
   
   local git_info
   git_info=$(parse_git_info)
   [[ -n "$git_info" ]] && git_info=" $YELLOW$git_info"
   
   PS1="\n(${hist_color}\!${WHITE}) ${CYAN}\t ${PROMPT_ICON} ${MAUVE}\u${BLACK} ${BLUE}\w${git_info}${BLACK}\n\$ "
}

tab_title() { echo -ne "\033]0;${PWD##*/}\007"; }

PROMPT_COMMAND="build_prompt; tab_title"

# Load git autocomplete
[[ -f "$HOME/.git-completion.bash" ]] && . "$HOME/.git-completion.bash"

# Initialize
cd ~/Developer
PROMPT_COMMAND="tab_title ; $PROMPT_COMMAND"

# Set the terminal tab title to current directory
function tab_title {
	echo -n -e "\033]0;${PWD##*/}\007"
}

# Ruby version manager
eval "$(/opt/homebrew/bin/rbenv init - bash)"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Postgres
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

export WORKON_HOME=~/.virtualenvs

source /usr/local/bin/virtualenvwrapper.sh
if [ -f /usr/local/etc/bash_completion ]; then . /usr/local/etc/bash_completion; fi
export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"
export PATH=~/eshares/eshares-certificates/bin:$PATH
export PYTHONDONTWRITEBYTECODE=1
export ESHARES_SKIP_GEVENT=1
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#GPG
if [[ -f $HOME/.gpg-agent-info ]]; then
 source ~/.gpg-agent-info
fi
if [[ -S "${GPG_AGENT_INFO%%:*}" ]]; then
 export GPG_AGENT_INFO
else
 eval $( gpg-agent --daemon --write-env-file ~/.gpg-agent-info )
fi
export GPG_TTY=$(tty)

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Set the default editor to vim.
export EDITOR=vim

#keep db
alias teshares="SETTINGS_SWITCHER='test' coverage run --source="eshares" --include="eshares/*" --omit="eshares/*/migrations/*" manage.py unit_tests -v1 -k $1"
#dont keep db
alias tesharesdb="SETTINGS_SWITCHER='test' coverage run --source="eshares" --include="eshares/*" --omit="eshares/*/migrations/*" manage.py unit_tests -v1 $1"
# just for record
#alias aaaaaatesharesdb="SETTINGS_SWITCHER='test' coverage run --source="eshares" --include="eshares/*" --omit="eshares/*/migrations/*" manage.py unit_tests -v1 --failfast $1"

alias diff_unmerged="git diff --name-only --diff-filter=U"
alias jslint="./node_modules/.bin/eslint --ext .js --ext .jsx --cache --config .eslintrc.js ./assets/"
alias pyclean='find . -type f -name "*.py[co]" -delete'
alias cda="cd  ~/eshares"
alias cde="cd  ~/eshares/eshares-certificates"
alias pr_compare="git log develop...${1:-$(git symbolic-ref HEAD)} -p"
function go_to_pr(){
	#!/bin/bash
	# Usage: git open-pr [<branch-name>]
	#
	# Navigates to the pull request for a branch using the web browser.
	# Defaults to current branch.
	set -e

	branch="${1:-$(git symbolic-ref HEAD)}"
	branch="${branch#refs/heads/}"

	remote_url() {
	git remote -v | grep "^$1" | head -1 | grep -o 'github.com[/:]\S\+'
	}

	url="$(remote_url upstream || true)"
	url="${url:-$(remote_url github || true)}"
	url="${url:-$(remote_url origin || true)}"
	url="${url%.git}"

	open "https://${url/://}/pull/${branch//\//%2F}"
}
alias gtp=go_to_pr


function docker_kill_all(){
	docker stop $(docker ps -aq)
	docker rm $(docker ps -aq)
	docker rmi -f $(docker images -qa)
	docker volume rm $(docker volume ls -q)
}
alias docker_kill_all=docker_kill_all



function refresh_ctags(){
	set -e
	PATH="/usr/local/bin:$PATH"
	dir="`git rev-parse --git-dir`"
	git ls-files | ctags --tag-relative -L - -f"$dir/$$.tags" --languages=-javascript,sql,python --python-kinds=-iv
}
alias rctags=refresh_ctags
alias chewie="open ~/chewbacca.mp3 --hide"
alias killcelery="ps -ef | grep celery | grep -v grep | awk {\$2} | xargs kill -9"

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/jmarins/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/jmarins/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/jmarins/google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/jmarins/google-cloud-sdk/completion.bash.inc'
fi

#dunno but postgres is strange
# pg_ctl -D /usr/local/var/postgres stop -s -m fast
export PATH="/usr/local/opt/sqlite/bin:$PATH"

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# default python environment
workon eshares_py3

export ANSIBLE_STDOUT_CALLBACK=debug

# go to eshares-certificates folder
cde

alias blankpdf="convert xc:none -page A4 Blank.pdf"

# General
export EDITOR='mvim -v'

# Virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# For Homebrew, we need to add (ideally, move) /usr/local/bin before /usr/bin
# http://stackoverflow.com/questions/5364614/is-there-a-problem-with-having-usr-local-bin-before-usr-bin-on-the-path-in-os-x
export PATH=/usr/local/bin:$PATH

# Git Bash Autocompletion
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
. /usr/local/etc/bash_completion.d/git-completion.bash
fi

# Terminal Colours
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Node
#export NODE_PATH=/usr/local/lib/node_modules

# -----------------------
# --- General aliases ---
# -----------------------

# -a Include directories whose names begin with .
# -l Use long format
# -F Indicate directories, executables, symlinks etc.
# -h Human readable file sizes
# -T Complete time information
alias ls='ls -alFhT'

# Use MacVim in the terminal
alias vim='mvim -v'

# Fix permissions for homebrew
alias fixbrew='sudo chown -R $USER /usr/local'

# Clean out DNS cache
alias flush='dscacheutil -flushcache'

# Get some lorem
alias lorem='curl http://lorem-ipsum.me/api/text'

# Misc aliases
alias b='bundle exec'
alias o='open .'

# Rails aliases
alias spork='.bin/spork'

# Django
alias run='django-admin.py runserver 3000'

# Generate rdoc
alias gen_rdoc='rdoc -f horo --main README.rdoc *.rdoc lib ext'


# Git aliases
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gb='git branch'
alias gco='git checkout'
alias gpu='git pull'
alias gcl='git clone'

# ----------------------
# --- Rails Projects ---
# ----------------------

cgc() {
  cd $HOME/Lift/canadagolfcard
  if [ "${1}" == "s" ]; then
    b rails server
  fi
  if [ "${1}" == "e" ]; then
    vim
  fi
}

malltip() {
  cd $HOME/Lift/malltip
  if [ "${1}" == "s" ]; then
    b rails server
  fi
  if [ "${1}" == "e" ]; then
    vim
  fi
}

lsc() {
  cd $HOME/Lift/stewardship_directory
  if [ "${1}" == "s" ]; then
    b rails server
  fi
  if [ "${1}" == "e" ]; then
    vim
  fi
}

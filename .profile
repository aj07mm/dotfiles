# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
#if [ -n "$BASH_VERSION" ]; then
#    # include .bashrc if it exists
#    if [ -f "$HOME/.bashrc" ]; then
#       "$HOME/.bashrc"
#    fi
#fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi


#export PATH=$PATH:/usr/lib/python2.7
#/usr/lib/python2.7

export WORKON_HOME=~/env
#export PYTHONPATH="/usr/bin/python"

#source '/usr/local/etc/bash_completion.d/git-prompt.sh'
source /usr/local/bin/virtualenvwrapper.sh

#dpkg-reconfigure keyboard-configuration

export PYTHONDONTWRITEBYTECODE=1
PATH="$HOME/.meteor:$PATH"

#PATH="$HOME/.local/lib/python2.7/site-packages:$PATH"


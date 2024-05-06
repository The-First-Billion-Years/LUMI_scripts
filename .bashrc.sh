# Set PS1 environment
export PS1="\[\033[36m\]\u@\h\[\033[m\]:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

export LC_ALL=en_US.UTF-8

# Autocomplete on tab
set autolist ambigious
set filesc

# Install conda packages
test -s ~/.alias && . ~/.alias || true
module load cray-python/3.10.10

python3 -m venv ~/software
source ~/software/bin/activate


# Terminal completion notification
alias notify='terminal-notifier -message "Done!" -title "Terminal Task Complete!"'

my_rsync() {
    #rsync with notification
    rsync -av -e ssh "$1" "$2" ; notify -message "rsync complete" &
}


# My directories
# export PATH=$PATH:~/bin
# export WORK_DIR=~/Documents/Research
# export CODE_DIR=$WORK_DIR/code

# Code
alias ipy='ipython --pylab'
alias jup='jupyter notebook &'
alias cac="conda activate"
alias cdac="conda deactivate"

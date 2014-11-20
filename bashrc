HISTSIZE=500000

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

function parse_git_dirty() {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
  
function parse_git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

# color codes 

C_NONE='\[\033[0m\]'
C_RED='\[\033[0;31m\]'
C_GREEN='\[\033[0;32m\]'
C_BLUE='\[\033[0;34m\]'
C_YELLOW='\[\033[1;33m\]'
C_WHITE='\[\033[1;37m\]'
C_BOLD='\[\e[1;91m\]'

# pretty bash prompt

PS1="$C_GREEN\u$C_RED|$C_WHITE\w$C_BLUE >$C_NONE "

case $(uname) in
    Linux)
        alias lsa='ls -lah --color=auto'
        alias ls='ls -lh --color=auto'
        alias iptbleshow='iptables -L -n -t nat'
        ;;
    Darwin)
        export DOCKER_HOST=tcp://docker:2375
        export CLICOLOR=1
        export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
        alias lsa='ls -lah'
        alias ls='ls -lh'
        ;;
esac

export EDITOR=vim
export GOROOT=$HOME/go
export GOBIN=$GOROOT/bin
export GOPATH=$HOME/development/gocode

export PATH=$PATH:$GOBIN

# --------------GIT Aliases----------------- #
alias gs='git status -u'
alias gmt='git mergetool'
alias gc='git commit'
alias gca='git commit -a'
alias gcs='git commit -as'
alias gb='git branch -v -v'
alias gaa='git add -A'
alias gco='git checkout'
alias glg='git log --graph --stat --oneline --decorate'
alias gl='git log --graph --oneline --decorate'
alias gm='git merge --no-ff'
alias gtk='gitk'
alias gcl='git clone'
alias gpo='git push origin'
alias gp='git push'
alias gd='git diff'
alias gsl='git stash list'
alias gsa='git stash apply'
alias gpull='git pull'
alias gpullo='git pull origin'
alias gremotes='git remote -v'
alias gcount='git count-objects -H'
alias addlast='git commit --amend –C HEAD'
alias gcount='git fetch --all'
alias resetmaster='git fetch origin && git reset --hard origin/master'
alias gls='git stash list'
# --------------END GIT Aliases----------------- #

alias ztar='tar -zcvf'
alias uztar='tar -zxvf'
alias lstar='tar -ztvf'
alias 7za='7z a'
alias cd..='cd ..'
alias cl='clear'
alias md='mkdir'
alias rd='rmdir'
alias back='popd'

alias encrypt='openssl aes-256-cbc -a -salt '
alias decrypt='openssl aes-256-cbc -d -a '

alias godebug='go build -gcflags "-N -l"'
alias godocserver='godoc -http=:8111'
alias buildall='go build -v . ./...'
alias installall='go install . ./...'
alias gobi='go build -v . ./... && go install . ./...'
alias attach='tmux attach-session -t 0'
alias tree='tree -F'

function remove_images_none() {
    docker rmi $(docker images | grep "<none>" | awk '{print $3}')
}

function clean_merged_branches() {
    git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
}

function build_linux() {
    GOOS=linux GOARCH=amd64 go build -v .
}

function compile() {
    gcc -Wall -g --std gnu99 -O3 $@
}

function hash_dir() {
    find . -type f -o -type d  | cpio -o  | sha1sum
}

function ppjson() {
    cat $1 | python -mjson.tool
}

function linecount() {
    find . -name "*.$1" | xargs wc -l
}

function rm_bridge() {
    ip link set $1 down
    brctl delbr $1
}

function replace() {
    pt -l $1 | xargs perl -pi -E 's/$1/$2/g'
}

function git_winner() {
    git ls-tree --name-only -z -r HEAD|egrep -z -Z -E '\.(go)$' \
       |xargs -0 -n1 git blame --line-porcelain|grep "^author "|sort|uniq -c|sort -nr
}

function docker_bash() {
    docker run -ti --rm --privileged -e DOCKER_GRAPHDRIVER=vfs docker bash
}

# bind mount over docker's libcontainer vendored copy with the libcontainer version
# in my local tree so that I can do a docker build to test docker with the master
# version of libcontainer
function mount_libcontainer() {
    mount -o bind $(readlink /root/libcontainer) $(readlink /root/docker)/vendor/src/github.com/docker/libcontainer
}

function gocover() {
    go test -cover -coverprofile /dev/stderr 2>&1 >/dev/null | go tool cover -func /dev/stdin
}

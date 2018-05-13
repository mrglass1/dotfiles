# bashrc

c_cyan=`tput setaf 6`
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_sgr0=`tput sgr0`

parse_git_branch ()
{
  if git rev-parse --git-dir >/dev/null 2>&1
  then
    gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  else
    return 0
  fi
  echo -e $gitver
}

branch_color ()
{
  if git rev-parse --git-dir >/dev/null 2>&1
  then
    color=""
    #if git diff --quiet 2>/dev/null >&2 
    if git status | grep "nothing to commit" >/dev/null 2>&1 
    then
      color="${c_green}"
    else
      color=${c_red}
    fi
  else
    return 0
  fi
  echo -ne $color
}

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\] \$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


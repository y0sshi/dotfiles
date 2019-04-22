#
# ~/.cshrc
#

limit coredumpsize 0
umask 022

alias ls	ls -F --color=tty
alias ll	ls -l --color=tty
alias la  ls -a --color=tty
alias lla ls -la --color=tty
alias lal ls -al --color=tty
alias rm	rm -i
alias mv	mv -i
alias cp	cp -i
alias ssh ssh -X
alias x         exit
alias ssh_pi	"ssh -p 31697 pi@43.244.17.117"
alias sftp_pi	"sftp -p 31697 pi@43.244.17.117"

# Set prompts
#if ( $TERM == screen ) then
#  promptname=$(print "\ek%m\e\\")$USERNAME
#else
#  promptname=$USERNAME
#endif

set path=($path ~/screen-v.4.6.2/bin)

set prompt="%{\e[04;32m%}%U%B%n@%m:%{\e[0m%}%{\e[01;33m%}%~%u%{\e[0m%} [%{\e[01;36m%}%Y/%W/%D(%d)%b%{\e[0m%}]\n "
#set autologout=1

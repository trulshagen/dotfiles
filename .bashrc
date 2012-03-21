# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

[ -z "$PS1" ] && return

HISTCONTROL=ignoredups:ignorespace
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -e ~/.todo ]; then
    if [ -s ~/.todo ]; then
        echo "Todo:"
        cat ~/.todo
    fi
fi


alias ll='ls -1trh'
alias la='ls -A'
alias l='ls -CF'
alias ll='ls -alF'
alias go='gnome-open'
alias eboks='ssh -CX scriptkid@eboks -p 1300'
alias wgetie='wget --referer="http://www.google.com" --user-agent="Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322)" --header="Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5" --header="Accept-Language: en-us,en;q=0.5" --header="Accept-Encoding: gzip,deflate" --header="Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7" --header="Keep-Alive: 300"'
alias nrkp3='mplayer mms://straumr.nrk.no/nrk_radio_p3_h'
alias p3='mplayer http://lyd.nrk.no/nrk_radio_p3_mp3_h'
alias mp3='mplayer mms://straumr.nrk.no/nrk_radio_mp3_h'
alias p4='mplayer mms://mms-cluster2.nextra.no/P4_Norge'
alias nrj='mplayer mms://live.alleredge.com/AE_NRJ_High'
alias p5='mplayer http://mms-live.online.no/P5_Oslo'
alias jamaica='mplayer http://radio.bigupradio.com:8005/listen.pls'
alias wefunk='mplayer http://207.200.96.226:8018/;stream.mp3'
alias digitalimported='mplayer mms://wstream5a.di.fm/vocaltrance'
alias energydance='mplayer http://broadcast.infomaniak.net/energydance-high.mp3'


if [ $(id -u) -eq 0 ];
	then # you are root, set red colour prompt
		PS1='\[\e[1;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '
	else # normal
		#PS1='\[\e[0;32m\]\u\[\e[0;37m\] @ \[\e[0;32m\]\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '
        PS1='$(ps_smile) ($(date +%H:%M:%S)) \033[34m\u@\h\033[0m:\033[33m\w\033[0m\n\$ '
fi

export PYTHONSTARTUP=~/.pythonrc

ps_smile()
{
    if [ $? == 0 ]; then
        echo -ne "\033[1;32m:)\033[0m"
    else
        echo -ne "\033[1;31m:(\033[0m"
   fi
}



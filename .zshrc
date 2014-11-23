# This file is sourced only for interactive shells. It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#
# Global Order: zshenv, zprofile, zshrc, zlogin

#Paths and exports
fpath=(~/.zsh $fpath)
export EDITOR='nano'
export PYTHONPATH='${PYTHONPATH}:/home/tobias/data/Persoenliche_Daten/Dropbox/myUni/Python/ownPackage'

#ibus
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#export QT_IM_MODULE=ibus

# for Matlab
#export MATLAB_JAVA=$JAVA_HOME/jre

# for home/end and so on
if [[ "$TERM" != emacs ]]; then
	bindkey -e
	[[ -z "$terminfo[kdch1]" ]] || bindkey -M emacs "$terminfo[kdch1]" delete-char
	[[ -z "$terminfo[khome]" ]] || bindkey -M emacs "$terminfo[khome]" beginning-of-line
	[[ -z "$terminfo[kend]" ]] || bindkey -M emacs "$terminfo[kend]" end-of-line
fi


# do a cd if the written text in the cli is not a command but is a dir
setopt AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS

# for colored dirs with cd
eval "`dircolors`"

# complete not just at the end  
setopt complete_in_word

# History: dont put cli lines beginnign with space into command history
setopt hist_ignore_space hist_ignore_all_dups append_history share_history HIST_FIND_NO_DUPS
export HISTFILE=~/.history
export HISTSIZE=10000
export SAVEHIST=10000

# praktische aliase
alias feh='feh --scale-down --geometry 1360x1024 --magick-timeout 2'
alias vim='vim -p'
alias reboot='systemctl reboot'
alias halt='systemctl poweroff'
alias mplayer='mplayer -vo vaapi -va vaapi'
alias ls='ls --color=auto --group-directories-first'
alias le='ls -lisa'
# the following 2 without symlinks
alias files='ls -l | grep ^- | wc -l'
alias directories='ls -l | grep ^d | wc -l'
# with symlinks
alias contents='ls | wc -l'
alias grep='grep --color=auto'
alias less='less -S -M'
alias df='df -h'
alias du='du -c -h'
alias du1='du  --max-depth=1'
alias diff='colordiff'
alias mkdir='mkdir -p -v'
alias pg='ps -Af | grep $1'
#alias tree='tree -d'
alias 'dirs'='dirs -v'
alias 'passc'='pass -c'
# safety features
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'                    
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
#music and video
alias -s flv=mplayer
alias -s mkv=mplayer
alias -s mp3=mplayer
alias -s m4a=mplayer
alias -s avi=mplayer
alias -s pdf=evince
#pictures
alias -s jpg=feh
alias -s jpeg=feh
alias -s png=feh
#textfiles
alias -s tex=vim
alias -s txt=vim
#archives
alias -s tar='tar xf'
alias -s bz='tar xf'
alias -s gz='tar xf'
alias -s tgz='tar xf'
alias -s bz2='tar xjvf'
alias -s rar='unrar x'
alias -s zip='7z x'
alias -s 7z='7z x'
#nice ls
if (which ls++ > /dev/null) ; then
	alias ll='ls++ -l'
	alias la='ls++ -la'
	alias llh='ls++ -lh'
	alias lah='ls++ -lah'
else
	alias ll='ls -l --color=auto'
	alias la='ls -la --color=auto'
	alias llh='ls -lh --color=auto'
	alias lah='ls -lah --color=auto'
fi
# most
if (which most > /dev/null) ; then
	export PAGER='most'
	alias mountlm='mount -l | column -t | most'
else
	export PAGER='less'
fi
#update system
alias updateall='yaourt -Syua'
#remove packages
alias remove=pacman -Rs
#copy output to clipboard
alias clip="tr -d '\n' | xsel --clipboard"
#mount windows Partition
alias mountwin='sudo mount /dev/sda2 /home/tobias/win'
# print last phoneCalls
alias incalls='python /home/tobias/Dropbox/myUni/Python/readTelephoneProtocolOut/printLastCalls.py'
alias checkOTR='python /home/tobias/Dropbox/myUni/Python/otrChecker/compare.py /home/tobias/Videos/allVids.txt .'
alias checkOTRself='python /home/tobias/Dropbox/myUni/Python/otrChecker/compare.py . .'

#colored manual
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}


# print a errormessage when commands dosent match any files (echo hund*)
setopt no_match 
# print a error message when in case of errorous patterns like: echo [-         
setopt bad_pattern 
# X='*' echo $x                   <-- i would see all files if thise were on
unsetopt glob_subst 
unsetopt ksh_glob             # i dont do korn shell
unsetopt ksh_arrays           # i dont do korn shell
unsetopt ksh_autoload         # i dont do korn shell
# some historic korn shell compatibility stuff, i dont do korn shell
unsetopt prompt_percent 
setopt prompt_subst         # enable fancy substitution syntax in shell prompts
setopt no_check_jobs        # don't warn me about background processes when exiting
setopt no_hup               # don't kill background processes when exiting
unsetopt rm_star_silent       # warn me when i do rm *
# dont lower the priority of processes i send to the background
unsetopt bg_nice   
#dont spam console when bg-processes finish, show the message on return or ctrl-c   
unsetopt notify       
unsetopt globdots             # rm * should not remove .somefile
unsetopt csh_junkie_history   # i dont do c shell
unsetopt csh_junkie_loops     # i dont do c shell
unsetopt csh_null_glob        # i dont do c shell
unsetopt csh_junkie_quotes    # i dont do c shell
#unsetopt extended_glob        # dont do too fancy globbing, i wont use it anyways

###############################################

export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=01;30;42:ow=01;34;04:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:"

###############################################

zstyle ':completion:*:sudo:*' command-path  /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*'        list-colors   ${(s.:.)LS_COLORS}
zstyle ':completion:*'        list-prompt   %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*'        menu          select=long-list select=0
zstyle ':completion:*'        select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' use-cache on


zmodload zsh/complist
bindkey -M menuselect '^o' accept-and-infer-next-history
bindkey -M menuselect '^M' .accept-line

autoload -U compinit
compinit

autoload -U promptinit && promptinit
if prompt -l | grep -q angizia ; then
	prompt angizia
fi
########################################ü



# for a command-not-found hook (install pkgfile)
source /usr/share/doc/pkgfile/command-not-found.zsh
[ -r /etc/profile.d/cnf.sh ] && . /etc/profile.d/cnf.sh

# correct spelling
#setopt correct

#HASHES for z.B. ~nao
 nao=/home/angizia/repos/nao/naoTeamRepo/firmware_4.0
 ex=/home/angizia/repos/studium/yesod/referat/ex

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# bind key up and key down for all terminals
bindkey "^[[1;5A" history-search-backward
bindkey "^[[1;5B" history-search-forward

# bind key up and key down for all terminals
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

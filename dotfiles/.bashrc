# set UTF-8 support
export LC_ALL="en_US.UTF-8"
# make Terminal interact with user in English
export LANG="en_US"
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export MPV_HOME="~/.config/mpv/"

export PATH=/home/John/bin:$PATH

alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/ 
\1/'"

alias byzm1="byz -x 0 -y 0 -w 1680 -h 1050"
alias byzm2="byz -x 1680 -y 0 -w 1920 -h 1080"

alias ls="ls --color=always"
alias ll="ls -l"
alias global_sync="sudo emerge --sync && sudo layman -S"

function .t()
{
    echo -e "\033]2;$*\007"
}

u2space()
{
    for file in *; do
        echo Renaming "$file" to "${file//_/ }"
        mv "$file" "${file//_/ }"
    done
}

colortest()
{
T=' x '   # The test text
for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' '  36m' '1;36m' '  37m' '1;37m';
 do FG=${FGs// /}
 echo -en "\033[$FG  $T  "
 for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
   do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
 done
 echo;
done
}

#youtube() {
#
#    /cygdrive/c/Users/John/Documents/Programs/mplayer2-x86_64-latest/mplayer2.exe -framedrop --cache=302400 $(/cygdrive/c/Users/John/Desktop/youtube-dl/youtube-dl -g https://www.youtube.com/watch\?v=${1});
#}

youtube () {
    /cygdrive/c/Users/John/Documents/Programs/mplayer2-x86_64-latest/mplayer2.exe -framedrop $(/cygdrive/c/Users/John/Desktop/youtube-dl/youtube-dl -g $1) --cache=256000 --cache-min=0.15;
}

strmpv () {
	livestreamer.exe -p mpv.exe $1 best
}

strpot () {
	if [[ $1 == *twitch* ]]
	then
		livestreamer.exe --player-passthrough hls -p sumire.exe $1 best
	fi

	if [[ $1 == *youtube* ]]
	then
		livestreamer.exe --player-passthrough http -p sumire.exe $1 best
	fi
}

echo -n -e "\033]0;Spooky Shell\007"

mkdir(){ /bin/mkdir -p "$@" && cd "$_"; }

#source ~/photons

TXTBLK='\e[0;30m'               # Black - Regular
TXTRED='\e[0;31m'               # Red
TXTGRN='\e[0;32m'               # Green
TXTYLW='\e[0;33m'               # Yellow
TXTBLU='\e[0;34m'               # Blue
TXTPUR='\e[0;35m'               # Purple
TXTCYN='\e[0;36m'               # Cyan
TXTWHT='\e[0;37m'               # White
BLDBLK='\e[1;30m'               # Black - Bold
BLDRED='\e[1;31m'               # Red
BLDGRN='\e[1;32m'               # Green
BLDYLW='\e[1;33m'               # Yellow
BLDBLU='\e[1;34m'               # Blue
BLDPUR='\e[1;35m'               # Purple
BLDCYN='\e[1;36m'               # Cyan
BLDWHT='\e[1;37m'               # White
UNDBLK='\e[4;30m'               # Black - Underline
UNDRED='\e[4;31m'               # Red
UNDGRN='\e[4;32m'               # Green
UNDYLW='\e[4;33m'               # Yellow
UNDBLU='\e[4;34m'               # Blue
UNDPUR='\e[4;35m'               # Purple
UNDCYN='\e[4;36m'               # Cyan
UNDWHT='\e[4;37m'               # White
BAKBLK='\e[40m'                 # Black - Background
BAKRED='\e[41m'                 # Red
BAKGRN='\e[42m'                 # Green
BAKYLW='\e[43m'                 # Yellow
BAKBLU='\e[44m'                 # Blue
BAKPUR='\e[45m'                 # Purple
BAKCYN='\e[46m'                 # Cyan
BAKWHT='\e[47m'                 # White
TXTRST='\e[0m'                  # Text Reset
     
TXT233='\e[38;5;233m'      
TXT234='\e[38;5;234m' 
TXT235='\e[38;5;235m' 
TXT236='\e[38;5;236m'           # Darkest Grey - Regular
TXT237='\e[38;5;237m'           # Darker Grey
TXT238='\e[38;5;238m'    
TXT230='\e[38;5;230m'         # Darker Grey
TXT000='\e[38;5;000m'           # Dark Grey
TXT232='\e[38;5;232m'           # Black
TXTBRD='\e[38;5;088m'           # Bright Red
TXTBBR='\e[38;5;196m'           # Brightest Red
     
BAK233='\e[48;5;233m' 
BAK234='\e[48;5;234m' 
BAK235='\e[48;5;235m'           # Darkest Grey - Background
BAK236='\e[48;5;236m'           # Darker Grey
BAK237='\e[48;5;237m'           # Darker Grey
BAK000='\e[48;5;000m'           # Dark Grey
BAKBRD='\e[48;5;130m'           # Bright Red
BAKBBR='\e[48;5;166m'           # Brightest Red


#PROMPT
################################################################################
# cool prompt stuff
# based on a function found in bashtstyle-ng 5.0b1
# Original author Christopher Roy Bratusek (http://www.nanolx.org)
# Last arranged by zach Tue Jul 24 06:40:19 EDT 2012
function pre_prompt {
    specPWD=$(echo -n ${PWD} | sed "s/\/Users\/$USER/~/")	#Should now properly sed path of current user
    newPWD=$specPWD
    let promptsize=$(echo -n "              __${specPWD}"\ | wc -c | 
tr -d " ")
    let fillsize=(${COLUMNS})-${promptsize}
fill=""
    while [ "$fillsize" -gt "0" ]
    do 
       fill="${fill} "
    	let fillsize=${fillsize}-1
    done
    if [ "$fillsize" -lt "0" ]
    then
        let cutt=1-${fillsize}
        newPWD="…$(echo -n $specPWD | sed -e 
"s/\(^.\{$cutt\}\)\(.*\)/\2/")"
    fi
}

PROMPT_COMMAND=pre_prompt

PS1="\`if [ \$? = 0 ]; 
then echo \"${TXT236}${BAK233} \$ ${TXT233}${BAK234}‡${TXTGRN}${BAK234} \u${TXT238}@${BLDCYN}\h ${TXT234}${BAKBLU}‡${TXTRST}${BAKBLU}${TXT234} \$newPWD\${fill}${TXTRST}\n﻿\"; 
else echo \"${TXT233}${BAKRED} ! ${TXTRED}${BAK234}‡${TXTGRN}${BAK234} \u${BLDBLK}@${BLDCYN}\h ${TXT234}${BAKBLU}‡${TXTRST}${BAKBLU}${TXT234} \$newPWD\${fill}${TXTRST}\n﻿\"; 
fi\`"

PS2="${TXTBLK}»${TXTRST}"
PS3="${TXTBLK}»${TXTRST}"
PS4="${TXTBLK}»${TXTRST}"

export SHELL=/bin/bash
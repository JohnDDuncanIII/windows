# set UTF-8 support
export LC_ALL="en_US.UTF-8"
# make Terminal interact with user in English
export LANG="en_US"
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/ \1/'"

alias byzm1="byz -x 0 -y 0 -w 1680 -h 1050"
alias byzm2="byz -x 1680 -y 0 -w 1920 -h 1080"

alias ls="ls --color=always"
alias ll="ls -l"
alias global_sync="sudo emerge --sync && sudo layman -S"

u2space()
{
    for file in *; do
        echo Renaming "$file" to "${file//_/ }"
        mv "$file" "${file//_/ }"
    done
}

echo -n -e "\033]0;shell\007"

mkdir(){ /bin/mkdir -p "$@" && cd "$_"; }

source ~/photons

#TEXT COLORS
################################################################################
TXTBLK='\e[0;30m' 		# Black - Regular
TXTRED='\e[0;31m' 		# Red
TXTGRN='\e[0;32m' 		# Green
TXTYLW='\e[0;33m' 		# Yellow
TXTBLU='\e[0;34m' 		# Blue
TXTPUR='\e[0;35m' 		# Purple
TXTCYN='\e[0;36m' 		# Cyan
TXTWHT='\e[0;37m' 		# White
BLDBLK='\e[1;30m' 		# Black - Bold
BLDRED='\e[1;31m' 		# Red
BLDGRN='\e[1;32m' 		# Green
BLDYLW='\e[1;33m' 		# Yellow
BLDBLU='\e[1;34m' 		# Blue
BLDPUR='\e[1;35m' 		# Purple
BLDCYN='\e[1;36m' 		# Cyan
BLDWHT='\e[1;37m' 		# White
UNDBLK='\e[4;30m' 		# Black - Underline
UNDRED='\e[4;31m' 		# Red
UNDGRN='\e[4;32m' 		# Green
UNDYLW='\e[4;33m' 		# Yellow
UNDBLU='\e[4;34m' 		# Blue
UNDPUR='\e[4;35m' 		# Purple
UNDCYN='\e[4;36m' 		# Cyan
UNDWHT='\e[4;37m' 		# White
BAKBLK='\e[40m'   		# Black - Background
BAKRED='\e[41m'   		# Red
BAKGRN='\e[42m'   		# Green
BAKYLW='\e[43m'   		# Yellow
BAKBLU='\e[44m'   		# Blue
BAKPUR='\e[45m'   		# Purple
BAKCYN='\e[46m'   		# Cyan
BAKWHT='\e[47m'   		# White
TXTRST='\e[0m'    		# Text Reset

TXT236='\e[38;5;236m'		# Darkest Grey - Regular
TXT241='\e[38;5;241m'		# Darker Grey
TXT000='\e[38;5;000m'		# Dark Grey
TXT232='\e[38;5;232m'		# Black
TXTBRD='\e[38;5;088m'		# Bright Red
TXTBBR='\e[38;5;196m'		# Brightest Red

BAK236='\e[48;5;236m'		# Darkest Grey - Background
BAK241='\e[48;5;241m'		# Darker Grey
BAK000='\e[48;5;000m'		# Dark Grey
BAKBRD='\e[48;5;088m'		# Bright Red
BAKBBR='\e[48;5;166m'		# Brightest Red


#PROMPT
################################################################################
# cool prompt stuff
# based on a function found in bashtstyle-ng 5.0b1
# Original author Christopher Roy Bratusek (http://www.nanolx.org)
# Last arranged by zach Tue Jul 24 06:40:19 EDT 2012
function pre_prompt {
    specPWD=$(echo -n ${PWD} | sed "s/\/Users\/$USER/~/")	#Should now properly sed path of current user
    newPWD=$specPWD
    let promptsize=$(echo -n "                 __${specPWD}"\ | wc -c | tr -d " ")
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
        newPWD="…$(echo -n $specPWD | sed -e "s/\(^.\{$cutt\}\)\(.*\)/\2/")"
    fi
}

PROMPT_COMMAND=pre_prompt

PS1="\`if [ \$? = 0 ]; then echo \"${TXT236}${BAK241} \$ ${TXT241}${BAK236}‡\"; else echo \"${BLDWHT}${BAKBRD} ! ${TXTBRD}${BAK236}‡\"; fi\`${TXTGRN}${BAK236} \u${BLDWHT}${BAK236}@${BLDBLU}machine ${TXT236}${BAKBLU}‡${TXTRST}${BAKBLU}${BLDBLU} \$newPWD\${fill}${TXTRST}\n${TXT241}\[\e[0m\]"

PS2="${TXTBLK}»${TXTRST}"
PS3="${TXTBLK}»${TXTRST}"
PS4="${TXTBLK}»${TXTRST}"

export SHELL=/bin/bash

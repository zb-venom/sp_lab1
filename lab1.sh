#!/bin/bash

#colors
RED='\e[91m'
YELLOW='\e[93m'
GREEN='\e[92m'
BLUE='\e[94m'
MAGENTA='\e[95m'
CYAN='\e[96m'
BLACK='\e[30m'
WHITE='\e[37m'

#BG
BGGREEN='\e[42m'

#font
BOLD='\e[1m'
BLINK='\e[5m'
UNDERLINE='\e[4m'

NORMAL='\e[0m'

while true;
do
    command cd /home
    printf "\033c"
	echo -e "\t${GREEN}┌─────────────────────┐"
	        echo -e "\t│${BGGREEN}                     ${NORMAL}${GREEN}│"
	        echo -e "\t│${BGGREEN} ${BOLD}${WHITE}Created by ZBVenom  ${NORMAL}${GREEN}│"
	        echo -e "\t│${BGGREEN}                     ${NORMAL}${GREEN}│"
	        echo -e "\t└─────────────────────┘${NORMAL}\n"
	
	echo -e "${BOLD}Created by${NORMAL}\t\t${GREEN}Zaborskikh Artyom${NORMAL}"
	echo -e "${BOLD}Group${NORMAL}\t\t\t${GREEN}717-1${NORMAL}"
	echo -e "${BOLD}Program${NORMAL}\t\t\t${MAGENTA}Laboratory work #1${NORMAL}"
	echo -e "${BOLD}About&Help${NORMAL}\t\t${BLUE}1. The program looks for files, detects changes."
	echo -e "\t\t\t2. In order to select the current date and time, enter ${UNDERLINE}n${NORMAL}${BLUE}"
	echo -e "\t\t\t3. Be good"
	echo -e "\t\t\t4. Well 4 is not enough" 
	echo -e "\t\t\t${BLINK}${YELLOW}5. Well 5 so 5${NORMAL}" 
	   
	
	echo -e "\n${CYAN}Current directory: \t${BOLD}$PWD${NORMAL}"
	echo -en "[Enter file name]$ > "
    while read line; do
        echo -en "\033[1A\033[2K"        
        if [ -z `find "$PWD" -name $line` ]
        then
            echo -en "${RED}File not found. Try again (Y/N)? ${NORMAL}" >/dev/stderr 
            while read line; do
                echo -en "\033[1A\033[2K${NORMAL}"               
                if [ "$line" == "Y" -o "$line" == "y" ];
                then
                    echo -en "[Enter file name]$ > "
                    break
                else 
                    echo -en "\n\n${RED}By! By!${NORMAL}\t\t"
                    sleep .5
                    echo -en "\r"
                    printf "\033c"
                    exit
                fi
            done            
        else
            break 
        fi
    done
    file="$PWD/$line"
    echo -e "${CYAN}Selected file: \t\t${BOLD}$file${NORMAL}"
    
    echo -en "[Enter date&time [YY.mm.dd HH:MM:SS]]$ > "
    while read line; do
        echo -en "\033[1A\033[2K"
        line=${line//./-}  
        if [ -z "$(date -d "$line" 2>/dev/null)" ]
        then
            echo -en "${RED}Invalid date&time. Try again.(Y/N)? ${NORMAL}" >/dev/stderr
            while read line; do
                echo -en "\033[1A\033[2K${NORMAL}"               
                if [ "$line" == "Y" -o "$line" == "y" ];
                then
                    echo -en "[Enter date&time [YY.mm.dd HH:MM:SS] ]$ > "
                    break
                else 
                    echo -en "\n\n${RED}By! By!${NORMAL}\t\t"
                    sleep .5
                    echo -en "\r"
                    printf "\033c"
                    exit
                fi
            done            
        else
            break 
        fi
    done
    
    fileTime=$(command date -r $file +%s)   
    fileFullTime=$(command date -r $file "+%Y.%m.%d %H:%M:%S")
    userTime=$(command date -d "$line" +%s)
    userFullTime=$(command date -d "$line" '+%Y.%m.%d %H:%M:%S')
    echo -e "${CYAN}Selected date&time: \t${BOLD}$userFullTime${NORMAL}"
    
    if [ $fileTime -gt $userTime ]
    then 
        echo -e "\n${YELLOW}CODE: ${BOLD}120${NORMAL}"
        echo -e "${GREEN}The content of the file was changed after: ${BOLD}$userFullTime${NORMAL}"
        echo -e "${BLUE}Last Modified: ${BOLD}$fileFullTime${NORMAL}\n"
    else 
        echo -e "\n${MAGENTA}The content of the file has not been changed after: ${BOLD}$userFullTime${NORMAL}"
        echo -e "${BLUE}Last Modified: ${BOLD}$fileFullTime${NORMAL}\n"
    fi
    
    while read -p "Try again.(Y/N)? " >/dev/stderr line; do
        echo -en "\033[1A\033[2K"               
        if [ "$line" == "Y" -o "$line" == "y" ];
        then
            break
        else 
            echo -en "\n${RED}By! By!${NORMAL}\t\t"
            sleep .5
            echo -en "\r"
            printf "\033c"
            exit
        fi
    done
    
done


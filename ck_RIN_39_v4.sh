#!/bin/bash

#create function
run_check(){
    #setting custom colors
    GR='\033[1;32m' # Green
    YL='\033[1;33m' # Yellow
    NC='\033[0m'    # No Color

    #display processes of RIN test
    ps aux | grep -i vulcan

    # if output is less than 110 char, display that test is currently running. Else, display test is completed
    [ 110 -lt $(ps aux | grep -i vulcan | wc -m) ] && echo -e "${YL}RIN Test Running...${NC}" || echo -e "${GR}RIN Test stopped${NC}"

}

#record time of script execution
start=`date +%s`

#infinite loop that executes the script every 30 sec
while true
do
    clear
    run_check
    date
    end=`date +%s`    #update duration every time the loop iterates
    runtime=$((end-start))    #calculate duration so far
    echo -e "\nRuntime:"
    #format duration in form of hours : minutes : seconds
    date -ud "@$runtime" +"%H hours %M minutes %S seconds"
    sleep 1    #set time interval
done


#To execute, run like this: ./ck_RIN_39_v4.sh

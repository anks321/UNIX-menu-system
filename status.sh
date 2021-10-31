#!/bin/bash
currentdate(){
    clear
    echo -e "Today's date is $(date +%d/%m/%Y)"
    echo -e "And it is $(date +%"I:%M:%S %p") right now"
    echo
    read -n 1 -r -s -p $'Press any key to return to System Status menu \n'
    clear
}
diskusage() {
    echo -e "Disk usage of system is: \n $(df -h)" | less -r --prompt="Press q to return to System Status menu"
    clear
}
localandenv() {
    echo -e "The local and environment variables are: \n $(printenv)" | less -r --prompt="Press q to return to System Status menu"
    clear
}
processstat() {
    local exp='^[0-9]+$'
    read -p "Enter a valid process id to see process status: " pid_n
    if ! [[ $pid_n =~ $exp ]]; then
        echo -e "Input by the user  is not a number"
    elif ps -e | cut -c 2-8 | grep -wq $pid_n; then
        ps $pid_n
    else 
        echo -e "No such process id exists"
    fi
    echo 
    echo
    read -n 1 -r -s -p $'Press any key to return to System Status menu...\n'
    clear
}
clear
	
while [  "$reading" != "5" ]
do
echo -e "\t\tSYSTEM STATUS COMMANDS\n"
echo -e "\n1 -- Display the current date and time"
echo -e "\n2 -- Current disk usage"
echo -e "\n3 -- List current local and environmental"
echo -e "\n4 -- Display process status information"
if [ $mode = novice ]; then
    echo -e "\n5 -- Quit -- Return to Main Menu\n"
else
    echo -e "\n5 -- Exit Program\n"
fi
read -n 1  -ep"			Enter your Choice: "  reading
clear
case $reading in
1)  
    currentdate ;;
2)
    diskusage ;;
3)
    localandenv ;;
4)
    processstat ;;
5)
    clear
    exit 0;;
*)
    clear
	echo -e "\t\tWrong input: Enter correct choice [1-5]\n";;
esac
done

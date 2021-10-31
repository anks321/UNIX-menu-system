#!/bin/bash

novice_mode(){

	local reading 
	clear
	while [  "$reading" != "4" ]
	do
	echo -e "\t\tMain Menu\n"
	
	echo -e "\n1 -- File and Directory Management Commands"
    echo -e "\n2 -- Text Processing Commands"
    echo -e "\n3 -- System Status Commands"
    echo -e "\n4 -- Exit\n"
	
	read -n 1  -ep"			Enter your Choice: "  reading
	case $reading in
    1) 
		bash File.sh ;;
    2) 
		bash text.sh ;;
    3) 
		bash status.sh ;;
	4)  clear
		exit 0 ;;
	*)  clear
		echo -e "\t\tWrong input: Enter correct choice [1-4]\n";;
	esac
	done
}
expert_mode() {
	clear
	case "$1" in 
	file) 
		bash File.sh ;;
    text) 
		bash text.sh ;;
    status) 
		bash status.sh ;;
	help)
		bash helpmenu.sh ;;
		
	*)  
		echo -e "\t\tWrong input: Enter correct arguments [file,text,status]"
		echo -e "\t\tEnter help as argument to veiw the help menue for more info";;
	esac
}
if (($# == 0));
	then
	export mode=novice
	novice_mode
else
	export mode=expert
	expert_mode "$1"
fi
#!/bin/bash
echo -e "\t\tINSTRUCTIONS ON HOW TO USE THE MAIN MENU"
echo 
echo -e "Enter \".\\myhelp.sh\" without any arguments to execute the menu in novice mode"
echo -e "Enter \".\\myhelp.sh\" without any arguments to execute the menu in expert mode"
echo
echo -e "There are four command line arguments: \"file\", \"text\", \"status\" and \"help\""
echo -e "\n\"file\" \t\tThis  argument takes the user directly to the File Management menu where the user can perform common file management operations such  as \n \t\tdisplaying the contents of a file , displaying size of a file , removing a file, copying a file and listing files in a directory "
echo -e "      \t\tTo use in expert mode enter \".\\myhelp.sh file\" in the terminal"
echo -e "\n\"text\" \t\tThis  argument takes the user directly to the Text Processing menu where the user can perform common Text Processing operations such as \n \t\tfinding a specific pattern in a text file , counting number of lines ,words and characters in file and displaying the line difference between two files."
echo -e "      \t\tTo use in expert mode enter \".\\myhelp.sh text\" in the terminal"
echo -e "\n\"status\" \tThis  argument takes the user directly to the System Status menu where the user can see differnt system information such as \n \t\tcurrent date and time, disk usage,local and environmental variables and process status information"
echo -e "      \t\tTo use in expert mode enter \".\\myhelp.sh status\" in the terminal"
echo -e "\n\"help\" \t\tThis argument displays the cuurent instruction window to the user"
echo -e "      \t\tTo use in expert mode enter \".\\myhelp.sh help\" in the terminal"
echo
read -n 1 -r -s -p $'Press any key to exit\n'
clear

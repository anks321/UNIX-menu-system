#!/bin/bash

fileoutput() {
    local file
    local flag
    read -p "Enter complete path of all the the files : " file
    for f in $file; do
        if [[ -f "$f" ]]; then
            flag=1
            if [[ -r "$f" ]]; then
                echo -e "The contents of $f is: \n $(cat $f)" | less -r --prompt="press q to continugo to next page"
            else
                echo -e "The file is not readable"
            fi
        fi
    done

    if [[ $flag != 1 ]]; then
        echo -e " No File found "
    fi
    read -n 1 -r -s -p $'Enter any key to return to File Management Menue\n'
    clear
    
}
filecopy() {
    local flag
    local file
    local location
    read -p "Enter the complete path of the files to copy: " file
    read -p "Enter the complete path of the directory to copy the files to: " location
    for f in $file; do
        if [[ -f "$f" && -d "$location" ]]; then
            flag=1
            cp -t "$location" "$file"
            echo -e "Copied $f to $location\n"
        fi
    done

    if [[ $flag != 1 ]]; then
        echo -e "No File found or invalid directory location"
    fi

    read -n 1 -r -s -p $'Enter any key to return to File Management Menue\n'
    clear
}

fileremove(){
    local file
    local flag
    read -p "Enter the complete path of all the files : " file
    for f in $file; do
        if [[ -f "$f" ]]; then
            flag=1
            echo -e "$(rm $f)"
            echo -e "$f has been deleted \n"
        fi
    done

    if [[ $flag != 1 ]]; then
        echo -e " No file found "
    fi
    read -n 1 -r -s -p $'Enter any key to return to File Management Menu\n'
    clear

}
filelist() {
    local directory
    local flag
    read -p "Enter the complete path of all the directory : " directory

    for d in $directory; do
        if [[ -d "$d" ]]; then
            flag=1
            echo -e "List of files in  $d is: $(ls $d)" | less -r --prompt="Press q to go to next page"
        fi
    done

    if [[ $flag != 1 ]]; then
        echo -e "No Directory found"
    fi

    read -n 1 -r -s -p $'Enter any key to return to File Management Menu\n'
    clear
}
filesize() {
    local file
    local flag
    read -p "Enter the complete path of all the files: " file

    for f in $file; do
        
        if [[ -f "$f" ]]; then
            flag=1
            echo -e "Size of $f is : \n $(du -h "$f" |cut -f1 ) \n"     
        fi
    done

    if [[ $flag != 1  ]]; then
        echo -e "No File found"
    fi
    read -n 1 -r -s -p $'Enter any key to return to File Management Menu\n'
    clear
}

    
 
clear
while [  "$reading" != "6" ]
do
echo -e "\t\tFILE AND DIRECTORY MANAGEMENT COMMANDS\n"
echo -e "\n1 -- Display the contents of a file"
echo -e "\n2 -- Remove a file"
echo -e "\n3 -- Copy a file"
echo -e "\n4 -- List a file"
echo -e "\n5 -- Size of a file"
if [ $mode = novice ]; then
    echo -e "\n6 -- Quit -- Return to Main Menu"
else
    echo -e "\n6 -- Exit Program"
fi
read -n 1  -ep"			Enter your Choice: "  reading
clear
case $reading in
1)  
    fileoutput ;;
2)
    fileremove ;;
3)
    filecopy ;;
4)
    filelist ;;
5) filesize ;;
6)
    clear
    exit 0;;
*)
    clear
	echo -e "\t\tWrong input: Enter correct choice [1-6]\n";;
esac
done



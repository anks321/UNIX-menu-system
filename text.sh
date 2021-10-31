#!/bin/bash
patternsearch() {
    local file
    local pattern
    local flag
    read -p "Enter complete path of all the files: " file
    read -p "Enter the pattern to  search for: " pattern
    for f in $file; do
        if [ -f "$f" ]; then
            if file "$f" | grep -q text; then
                flag=1
                if grep -Eq "$pattern" "$f"; then
                    echo -e "File $f :\n $(grep -Enos "$pattern" "$f")"| less -r --prompt="Press q to continue"
                    
                else
                    echo "file $f has no matching for $pattern" | less -r --prompt="Press q to continue"
                fi
            fi
        fi
    done

    if [[ $flag != 1 ]]; then
        echo -e "No File Found"
    fi
    echo
    read -n 1 -r -s -p $'Press any key to return to Text commands menu\n'
    clear
}
wordcount(){
    local file
    local flag
    read -p "Enter the path of the file: " file

    for f in $file; do
        if [ -f "$f" ]; then
            if file "$f" | grep -q text; then
                flag=1
                echo -e "$f has $(wc -l $f | cut -d " " -f1) lines, $(wc -w $f | cut -d " " -f1) words and $(wc -m $f | cut -d " " -f1) characters.\n" | less -r --prompt="Press q to continue"
            fi
        fi
    done

    if [[ $flag != 1 ]]; then
        echo -e "No File Found"
    fi

    read -n 1 -r -s -p $'Press any key to return to Text commands menu\n'
    clear
}
filediff(){
    local first
    local second
    read -p "Enter the path of the first file: " first
    read -p "Enter the path of the second file: " second
    if file "$first" | grep -q text; then
        if file "$second" | grep -q text; then
            if [[ ! -f $first ]];then
                echo "Wrong file name or path of first file "
            elif [[ ! -f $second ]];then
                echo "Wrong file name or path of second file " 
            else
                diff  -y $first $second | less -r --prompt="Press q to continue"
            fi
        else
            echo "$second is not a text file"
        fi
    else 
        echo "$first is not a text file"
    fi
    echo
    read -n 1 -r -s -p $'Press any key to return to Text commands menu\n'
    clear
}


    
clear
	
while [  "$reading" != "4" ]
do
echo -e "\t\tTEXT PROCESSING COMMANDS\n"
echo -e "\n1 -- Search a file for a pattern"
echo -e "\n2 -- Count lines, words, and characters in specified files"
echo -e "\n3 -- Display line differences between two files"
if [ $mode = novice ]; then
    echo -e "\n4 -- Quit -- Return to Main Menu\n"
else
    echo -e "\n4 -- Exit Program\n"
fi
read -n 1  -ep"			Enter your Choice: "  reading
clear
case $reading in
1)  
    patternsearch ;;
2)
    wordcount ;;
3)
    filediff ;;
4)
    clear
    exit 0;;
*)
    clear
	echo -e "\t\tWrong input: Enter correct choice [1-4]\n";;
esac
done


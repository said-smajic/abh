#!/bin/bash


#use script as it follows(my example): ./logs_stats.sh /home/ubuntu/Desktop/Bash/tmp/logs/ Chrome . To find exact path of the logs folder, navigate do the directory and run pwd in terminal

echo "path: $1";
echo "word: $2";

declare -a dir_array            # array where path will be stored
declare -a word_count_array     # array where will number of specific word will be stored
declare -i i=0;                 # counter
declare -i j=0;                 # counter

path="${1}*"                    # assign arg1 to variable "path"
word=$2                         # assign arg2 to variable "word"


# check if no argument is passed - exit the program if no arguments are passed
if [ $# -eq 0 ]; then
    echo "No arguments provided. Please enter following command to run the script: ./logs_stats.sh <arg1> (/path/) <arg2> (word) "
    exit 1
fi

# check if directory (provided in arg1) exists - if no exit the program
if [ -d "$1" ];
then
    echo "$1 Directory exists. Wait until we check all the files."
else
	echo "$1 Directory does not exist."
    exit 1
fi

# for loop which assign output to arrays
for f in $path
do
    dir_array[i]="Name of the file: ${f##*/} | Size: $(ls -lah $f |cut -d ' ' -f 5) | Total lines count: $(wc -l $f | cut -d ' ' -f1) | Word '$word' count: $(grep -c ${word} $f) "
    word_count_array[i]="$(grep -c ${word} $f)"
    i=i+1
done

# for loop - sorting files by number of specific word (arg2) - bubble sort
for ((i = 0; i<${#word_count_array[@]}; i++))
do

    for((j = 0; j<${#word_count_array[@]}-i-1; j++))
    do

        if [ ${word_count_array[j]} -gt ${word_count_array[$((j+1))]} ]
        then
            # swap
            temp=${word_count_array[j]}
            temp1=${dir_array[j]}
            word_count_array[$j]=${word_count_array[$((j+1))]}
            dir_array[$j]=${dir_array[$((j+1))]}
            word_count_array[$((j+1))]=$temp
            dir_array[$((j+1))]=$temp1
        fi
    done
done

# for loop - sorted array
for ((i =${#dir_array[@]}-1; i>=0; i--))
do
    echo "============================================";
    echo ${dir_array[i]}
done
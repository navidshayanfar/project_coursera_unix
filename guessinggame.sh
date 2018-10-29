#! usr/bin/env bash
# file name: project



function search_engine {
        if [[ $guess -gt $num_files ]]
        then
                echo "Your guess is too high. Please provide a lower value and press enter again:"
                read guess
        elif [[ $guess -eq $num_files ]]
        then
                echo "Congratulations! The correct number of files in the current directory is: $guess"
                break
        else
                echo "Your guess is too low. Please provide a higher value and press enter again:"
                read guess
        fi
}



num_total=$(ls $PWD | wc -l)
num_folders=$(ls -p $PWD | grep / | wc -l)
num_files=$(echo "$num_total - $num_folders" | bc -l)
#echo $num_total $num_folders $num_files
echo "How many files are in the current directory? Guess something! Write a number that you think is true and press enter:"
count=1
read guess
while [[ $count -gt 0 ]]
do
	search_engine $guess
	count=$(echo "$count+1" | bc -l)
done

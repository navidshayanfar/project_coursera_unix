#! usr/bin/env bash
# file name: project


# This function is a search engine and guide the user to a correct guess. It compare the guess with the exact value of the file numbers and if the guess is higher or lower, it will provide corresponding information and ask for another guess.

function search_engine {
        if [[ $guess -gt $num_files ]]
        then
                echo "Your guess is too high. Please provide a lower value and press enter again:"
                read guess
        elif [[ $guess -lt $num_files ]]
        then
                echo "Your guess is too low. Please provide a higher value and press enter again:"
                read guess
        fi
}


# Here we find the total number of files and folders in the current directory and substract the number of folders from total to compute the number of files.

num_total=$(ls $PWD | wc -l)
num_folders=$(ls -p $PWD | grep / | wc -l)
num_files=$(echo "$num_total - $num_folders" | bc -l)

#Main body of program

echo "How many files are in the current directory? Guess something! Write a number that you think is true and press enter:"
read guess
while [[ $num_files -ne $guess ]]
do
	search_engine $guess
done
echo "Congratulations! The correct number of files in the current directory is: $guess"

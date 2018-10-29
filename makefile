#README.md:
#	touch README.md
#	echo "Title" > README.md
#	date >> README.md
#	wc -l  search.sh | awk '{print $1}' >> README.md
all: clean README.md
README.md: guessinggame.sh
	echo "Guess the number of files in the current directory" > README.md
	echo "" >> README.md
	echo "The number of lines of code contained in guessinggame.sh is:" >> README.md
	(wc -l guessinggame.sh | egrep -o "[0-9]+") >> README.md
	echo "" >> README.md
	date >> README.md
clean:
	rm README.md

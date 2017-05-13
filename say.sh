#!/bin/sh
## script using macOS's built in say command to convert text to aiff file
## can input from txt file, or enter text during script execution

#change to Desktop
cd ~/Desktop && clear

echo "Please enter your message: " && read message
echo " "

if [ -z "$message" ]
        then echo "Please enter filename from Desktop, or full path to input file: " && read ifile
        	echo " "
        
        
        if [ -z "$ifile" ]
        then echo "No message entered."
		exit 2
	fi
fi

echo "File to save to (blank for none): " && read ofile
echo " "

say -v ?
echo "Which voice would you like to use? (blank for default): " && read voice
echo " "

if [ -z "$voice" ]
	then voice="Samantha"
fi


if [ -z "$ifile" ]
	then echo "Performing in $voice's voice"

	if [ -z "$ofile" ]
		then say -v $voice $message
	fi


	if [ -n "$ofile" ]
		then say -v $voice -o ~/Desktop/"$ofile".aiff $message 
	    	 say -v $voice $message && say -v Alex "has been saved."
	fi
fi

if [ -n "$ifile" ]
	then echo "Performing in $voice voice"
	if [ -z "$ofile" ]
		then say -v "$voice" -f "$ifile"
	fi
	if [ -n "$ofile" ]
		then say -v "$voice" -f "$ifile" -o ~/Desktop/"$ofile".aiff 
		     say -v Alex "File has been saved."
	fi
fi







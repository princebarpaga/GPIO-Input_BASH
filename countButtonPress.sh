#!/bin/bash

# 0 RED, 1 BLUE, 2 YELLOW, 3 GREEN, 4 BUZZER, 5 BUTTON

countsbutton=0
counter=0
read=$(gpio read 5)

while true
do
    read=$(gpio read 5)
    if [ "$read" -eq 0 ]
    then
        
        ((countsbutton++))
	./waitForButtonPress.sh
	((counter++))
	echo "$counter"
        ./setbits.sh "$countsbutton"

        if [ "$countsbutton" -eq 16 ]
        then
            countsbutton=0
        fi

        if [ "$countsbutton" -eq 0 ]
        then
            gpio write 4 1 # buzzer beeps
            sleep 1
            gpio write 4 0 # buzzer stops beeping
        fi
    fi
done

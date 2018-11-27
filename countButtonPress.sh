#!/bin/bash

# 0 RED, 1 BLUE, 2 YELLOW, 3 GREEN, 4 BUZZER, 5 BUTTON

countsbutton=0

while true
do
	./waitForButtonPress.sh
        ./setbits.sh "$countsbutton"
        ((countsbutton++))

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
    
done

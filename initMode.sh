#!/bin/bash
# PIN #'S: 0 RED 1 GREEN 2 YELLOW 3 BLUE

gpio mode 5 in #Sets pin 5 (button as the input)
gpio mode 5 up # Sets pin 5 to pull up resisitor

for value in {0..4}
do
	gpio mode $value out
        gpio write $value 0
done

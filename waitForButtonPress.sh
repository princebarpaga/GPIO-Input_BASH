#!/bin/bash
#Pin 0 RED 1 GREEN 2 YELLOW 3 BLUE

gpio mode 5 in #Sets pin 5 (button as the input)
gpio mode 5  up # Sets pin 5 to pull up resisitor

value=$(gpio read 5)

#Sets the value of pin 0-4 value
for pin  in {0..4}
do
  gpio mode $pin out

done

while [ $value -eq  1 ]
do
 echo BUTTON NOT PRESSED
 value=$(gpio read 5)
 echo $value
 sleep 0.1
 clear
done

while [ $value -eq  0 ]
do
 echo BUTTON PRESSED
 value=$(gpio read 5)
 echo $value
 sleep 0.1
 clear
done


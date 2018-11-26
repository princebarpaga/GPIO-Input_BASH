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
count=0 
press=0
while true
do

value=$(gpio read 5)
#./waitForButtonPress.sh

if [ $value -eq 0 ]
then
  sleep 0.01
  count=$(($count+ 1))
  ./waitForButtonPress.sh  
  press=$(($press + 1))
  ./setbits.sh "$count"
  echo Number of times button is pressed : $press
  echo Value of Pin 5: $value 
fi

if [ $count -eq 16 ]
then
  press=$press
  count=0
  gpio write 4 1
 
  gpio write 4 0
fi
if [ $press -gt 15 ]
then
   sleep 0.5
   press=$(($press + 0))
   echo Number of times Button pressed: $press
fi 
press=$(($press + 0))
echo Value of Pin 5: $value 
echo Number of times button pressed: $press
sleep 0.5
clear
done





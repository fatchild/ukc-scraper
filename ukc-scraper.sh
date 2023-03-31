#! /bin/bash

url="https://www.ukclimbing.com/logbook/crags/old_man_of_hoy-281/east_face_route_original_route-"

# for ((n=0;n<1000;n++))
for ((n=315430;n<689000;n++))
do
    output=$(wget -qO- "$url$n" | grep -iE "Dan Varian|John Hunt") 
    length=${#output}
    if [ $length -gt 0 ]
    then
        echo FOUND. $url$n
    fi
    sleep 0.1
    # echo $n
done


str="this is a string"
n=${#str}
echo "Length of the string is : $n "

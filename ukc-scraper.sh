#! /bin/bash

url="https://www.ukclimbing.com/logbook/crags/crag-1/route-"
request_delay=0

# Headers
echo "url, output (match)"

for ((n=480620;n<6890000;n++))
do
    output=$(wget -qO- "$url$n" | grep -iE "Dan Varian|dan varian|d varian|dan v|D. Varian.|D Varian|Dan V|Dan v|dan V|dan v")
    match=${#output}
    if [ $match -gt 0 ]
    then
        echo $url$n, $match
    fi
    sleep $request_delay
done
#! /bin/bash

url="https://www.ukclimbing.com/logbook/crags/crag-1/route-"
request_delay=2
concurrent_requests=10

# Headers
echo "url"


match_on_name () {
    output=$(wget -qO- "$url$1")
    match_faist=$(echo $output | grep -iE "Dan Varian|dan varian|d varian|dan v|D. Varian.|D Varian|Dan V|Dan v|dan V|dan v")
    match_length=${#match_faist}
    if [ $match_length -gt 0 ]
    then
        echo $url$1
    fi
}


for ((n=480620;n<6890000;n += $concurrent_requests))
do
    for ((x=0;x<$concurrent_requests;x++))
    do
        # echo "Adding request" $x $(expr $n + $x)
        match_on_name "$(expr $n + $x)" &
    done
    wait
    sleep $request_delay
done
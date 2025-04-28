#!/bin/bash

default=HZaTo2l2g
# Handle 0.1 to 0.9,  1 to 30
# for m in $(seq 0.1 0.1 0.9) {1..10} {15,20,25,30}
for m in $(seq 0.1 0.1 0.9)
do
    # format m file name (Replace . with p)
    m_formatted=$(echo "$m" | tr '.' 'p')

    echo Generating Gridpack for mass M$m
    
    ./gridpack_generation.sh "$default"_M"$m_formatted" ./cards/13p6TeV/"$default"_M"$m_formatted"

done
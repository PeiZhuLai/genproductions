#!/bin/bash

default=$(basename $(pwd))
# Handle 0.1 to 0.9
for m in $(seq 0.1 0.1 0.9)
do
    # format m file name (Replace . with P)
    m_formatted=$(echo "$m" | tr '.' 'p')
    # Keep Mass Point as float
    mass_value="$m"
    if [[ $m == [1-9]* ]]; then
        mass_value="$m.0"
    fi

    echo Copying mass M$m
    newdir=../"$default"_M"$m_formatted"
    mkdir $newdir
    cp "$default"_customizecards.dat $newdir/"$default"_M"$m_formatted"_customizecards.dat
    cp "$default"_extramodels.dat $newdir/"$default"_M"$m_formatted"_extramodels.dat
    cp "$default"_proc_card.dat $newdir/"$default"_M"$m_formatted"_proc_card.dat
    cp "$default"_run_card.dat $newdir/"$default"_M"$m_formatted"_run_card.dat
    # modify output name
    sed -i 's/'$default'/'$default'_M'$m_formatted'/g' $newdir/"$default"_M"$m_formatted"_proc_card.dat
    # Modify mass parameter
    sed -i 's/AMASS/'$mass_value'/g' $newdir/"$default"_M"$m_formatted"_customizecards.dat
done
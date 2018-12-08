#!/bin/bash
changes=()
while read change; do
  changes+=( "$change" )
done < "input.txt"
total="0"
declare -A frequencies
frequencies=(["0"]=true)
totalFound=false
firstRepeatFound=false
for ((i=0; i < ${#changes[@]}; i++)); do
  total="$(($total${changes[i]}))"
  if [ $firstRepeatFound = false ]; then
    if [ ${frequencies["$total"]} ]; then
      echo "First repeat frequency: $total"
      firstRepeatFound=true
      break
    fi
  fi
  frequencies["$total"]+=true
  if [ $i = $((${#changes[@]}-1)) ]; then
    if [ $totalFound = false ]; then
      echo "Total: $total"
      totalFound=true
    fi
    if [ $firstRepeatFound = false ]; then
      i=-1
    fi
  fi
done

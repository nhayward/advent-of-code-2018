#!/bin/bash
numTwice=0
numThrice=0
declare -A charCounts
while read box_id; do
  charCounts=()
  for ((i=0; i<${#box_id}; i++)); do
    if [ ${charCounts["${box_id:$i:1}"]} ]; then
      charCounts["${box_id:$i:1}"]=$((${charCounts["${box_id:$i:1}"]}+1))
    else
      charCounts["${box_id:$i:1}"]=1
    fi
  done
  foundTwice=false
  foundThrice=false
  for count in ${charCounts[@]}; do
    if [ $foundTwice = false ] && [ $count = 2 ]; then
      numTwice=$(($numTwice+1))
      foundTwice=true
    fi
    if [ $foundThrice = false ] && [ $count = 3 ]; then
      numThrice=$(($numThrice+1))
      foundThrice=true
    fi
  done
done < "input.txt"
echo "Twice: $numTwice"
echo "Thrice: $numThrice"
echo "checksum: $(($numTwice*$numThrice))"
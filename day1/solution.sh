changes=()
while read change; do
  changes+=( "$change" )
done < "input.txt"
total="0"
frequencies=("0")
totalFound=false
firstRepeatFound=false
for ((i=0; i < ${#changes[@]}; i++)); do
  total="$(($total${changes[i]}))"
  if [ $firstRepeatFound = false ]; then
    for item in ${frequencies[@]}; do
      if [ $item = $total ]; then
        echo "First repeat frequency: $total"
        firstRepeatFound=true
        break
      fi
    done
  fi
  frequencies+=("$total")
  if [ $i = $((${#changes[@]}-1)) ]; then
    if [ $totalFound = false ]; then
      echo "Total: $total"
      totalFound=true
    fi
    if [ $firstRepeatFound = false ]; then
      echo "repeating"
      i=-1
    fi
  fi
done

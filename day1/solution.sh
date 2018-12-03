expression="0"
while read change
do
  expression="$expression$change"
done < "input.txt"
echo "$(($expression))"
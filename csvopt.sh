#!/bin/sh
if [ -f "$2" ]; then
 echo "Hooray, Processing ..." 
else
 echo "File does not exist, Please Try again and define a CSV file as argument"
 echo "[USAGE]: $./csvscript.sh csvfile "
 exit 1
fi
while getopts ":fitu" option;
do
 case $option in 
 f)
  while read -r line
  do
  count=$(echo "$line" | awk -F, '{ print NF; exit }')
  if [ "$count" -gt 14 ]; then
    Allfields=$(echo "$line" | awk -F',' '{printf "%s", $0}')
    echo "$Allfields" >> $2.bad
  fi
  done< ~/$2
  ;;
 t)
  while read -r line
  do
  field1=$(echo "$line" | awk -F',' '{printf "%s", $1}' | tr -d ',')
  if ! [ "$field1" -gt 2147483647 -o "$field1" -gt 0 ]; then
   Allfields=$(echo "$line" | awk -F',' '{printf "%s", $0}')
   echo "$Allfields" >> $2.badts
  fi
  done < ~/$2 > /dev/null 2>&1
  ;;
 i)
  while read -r line
  do
  field3=$(echo "$line" | awk -F',' '{printf "%s", $3}' | tr -d ',')
  if ! [ $(echo "$field3" | awk '/^([0-9]{1,3}[.]){3}([0-9]{1,3})$/{print $1}') ]; then
    Allfields=$(echo "$line" | awk -F',' '{printf "%s", $0}')
    echo "$Allfields" >> $2.badip
  fi
  done < ~/$2
  ;;
 u)
  awk -F ',' '{print $2}' "$2" | sort | uniq -c >> $2.userlist
  ;;
esac
done

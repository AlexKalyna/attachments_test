#!/bin/sh

path="/home/runner/work/api_monorepo/api_monorepo/collections/TestAPICollections/test_attachments/"
file="./collections/TestAPICollections/Faction_Portal_API_Tests.postman_collection.json"
tmpfile="./collections/TestAPICollections/tmp.json"

cp $file $tmpfile
lines=$(cat $tmpfile | grep src | wc -l | cut -c 7-)
all_src=$(cat $tmpfile | grep src | cut "-d " -f2 | sed 's/"//g')

echo "Count src in json file is - ${lines}"
rm -f $file

for line in ${all_src}
do 
  original="\"src\": \"$line\""
  new="\"src\": \"$path$line\""
  echo "----"
  echo "$new"
  echo "$original"
  sed "s|$original|$new|g" $tmpfile > $file

  rm -f $tmpfile
  cp $file $tmpfile
done 

rm -f $tmpfile
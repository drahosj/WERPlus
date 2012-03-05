#! /bin/bash

echo -n "Enter server username: "
read SERVER_USERNAME

echo -n "Enter server address: "
read SERVER_ADDRESS

echo -n "Enter server port: "
read SERVER_PORT

while true
pushd target

do

#####Begin File Detection#####

TARGET_SIZE=`du . | cut -f 1`

while [ "$TARGET_SIZE" = "4" ]
do
	sleep 1
	TARGET_SIZE=`du . | cut -f 1`
done

sleep 5

#####Begin Raw Data Acquisition#####

FILENAME=`ls`

unzip $FILENAME

rm -f $FILENAME

cp -r Documents/1/Pages ./

rm -r Pages/_rels

pushd Pages

cat `ls` | grep -i unicodestring= | cut -d '"' -f 16 | tail -n +6 | head -n -1 > ../../output/pairings
cat `ls` | grep -i unicodestring= | cut -d '"' -f 16 | head -n 1 > ../../output/event
cat `ls` | grep -i "unicodestring=\"round" | cut -d '"' -f 16 | cut -d ' ' -f 2 > ../../output/round

popd

#####CLEANUP TARGET#####

for FILE in `ls`
do
	rm -r $FILE 
done
popd

#####Begin Formatting Pairings as Tab-Separated Values#####

pushd output

echo -n "" > pairings.tsv

cat pairings | while read LINE_CONTENTS
do
for ELEMENT in $LINE_CONTENTS
do
	echo -n $ELEMENT >> pairings.tsv
	echo -n '	' >> pairings.tsv
done
echo >> pairings.tsv
done
rm pairings
mv pairings.tsv pairings
popd

#####Send data to server and call MySQL Refresh Script#####

ssh $SERVER_USERNAME@$SERVER_ADDRESS -p $SERVER_PORT 'rm -r tournament-server/output'

scp -r  -P $SERVER_PORT output $SERVER_USERNAME@$SERVER_ADDRESS:tournament-server/

ssh $SERVER_USERNAME@$SERVER_ADDRESS -p $SERVER_PORT 'tournament-server/refresh-mysql.sh'

done

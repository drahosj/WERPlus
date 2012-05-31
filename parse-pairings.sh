#! /bin/bash
#####Begin Raw Data Acquisition#####
echo "Parsing pairings..."

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

#ssh $SERVER_USERNAME@$SERVER_ADDRESS -p $SERVER_PORT 'rm -r tournament-server/output'

#scp -r  -P $SERVER_PORT output $SERVER_USERNAME@$SERVER_ADDRESS:tournament-server/

#ssh $SERVER_USERNAME@$SERVER_ADDRESS -p $SERVER_PORT 'tournament-server/refresh-mysql.sh'

#####Call MySQL Refresh Script Locally#####
rm -r ~/tournament-server/output
cp -r output ~/tournament-server/output
~/tournament-server/refresh-mysql-local.sh

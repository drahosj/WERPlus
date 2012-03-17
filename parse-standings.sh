#! /bin/bash
#####Begin Raw Data Acquisition#####
cat `ls` | grep -i unicodestring= | cut -d '"' -f 16 | tail -n +8 > ../../output/standings
cat `ls` | grep -i unicodestring= | cut -d '"' -f 16 | head -n 1 > ../../output/event

popd

#####CLEANUP TARGET#####

for FILE in `ls`
do
	rm -r $FILE 
done
popd

#####Begin Formatting Pairings as Tab-Separated Values#####

pushd output

echo -n "" > standings.tsv

cat standings | while read LINE_CONTENTS
do
for ELEMENT in $LINE_CONTENTS
do
	echo -n $ELEMENT >> standings.tsv
	echo -n '	' >> standings.tsv
done
echo >> standings.tsv
done
rm standings
mv standings.tsv standings
popd

#####Send data to server and call MySQL Refresh Script#####

ssh $SERVER_USERNAME@$SERVER_ADDRESS -p $SERVER_PORT 'rm -r tournament-server/output'

scp -r  -P $SERVER_PORT output $SERVER_USERNAME@$SERVER_ADDRESS:tournament-server/

#ssh $SERVER_USERNAME@$SERVER_ADDRESS -p $SERVER_PORT 'tournament-server/refresh-mysql-standings.sh'

#####Call MySQL Refresh Script Locally#####
#rm -r ~/tournament-server/output
#cp -r output ~/tournament-server/output
#~/tournament-server/refresh-mysql-local-standings.sh

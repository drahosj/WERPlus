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

FILENAME=`ls`

echo -n "File $FILENAME found. Waiting for write to finish."

OLD_SIZE=1
NEW_SIZE=0
while [ `echo $OLD_SIZE` != `echo $NEW_SIZE` ]
do 
	OLD_SIZE=`stat $FILENAME | grep Size | cut -d ' ' -f 4`
	echo $OLD_SIZE
	sleep 1
	echo -n .
	echo $NEW_SIZE
	NEW_SIZE=`stat $FILENAME | grep Size | cut -d ' ' -f 4`
done
echo ""	
echo "Write Finished. Parsing file"

if [ `cat $FILENAME | grep -i pairings` == "" ]
then
	source ../parse-standings.sh
else
	source ../parse-pairings.sh
fi
done

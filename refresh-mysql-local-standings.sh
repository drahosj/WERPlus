#! /bin/bash

pushd ~/tournament-server/output

EVENT=`cat event`
echo "delete from STANDINGS;" > script.sql
	mysql tournamentdb < script.sql
cat pairings | while read LINE_CONTENTS
do
	TABLE=`echo $LINE_CONTENTS | cut -f 1 -d ' '`
	lastNameP=`echo $LINE_CONTENTS | cut -f 2 -d ' '`
	firstNameP=`echo $LINE_CONTENTS | cut -f 3 -d ' '`
	
	echo "insert into TOURNAMENT_TABLE values (default, '$EVENT', '$ROUND', '$TABLE', '$lastNameP', '$firstNameP', '$dciP', '$lastNameO', '$firstNameO', '$dciO', '$points' );" > script.sql
	mysql tournamentdb < script.sql
done

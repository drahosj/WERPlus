#! /bin/bash

pushd ~/tournament-server/output

EVENT=`cat event`
ROUND=`cat round`

cat pairings | while read LINE_CONTENTS
do
	TABLE=`echo $LINE_CONTENTS | cut -f 1 -d ' '`
	lastNameP=`echo $LINE_CONTENTS | cut -f 2 -d ' '`
	firstNameP=`echo $LINE_CONTENTS | cut -f 3 -d ' '`
	dciP=`echo $LINE_CONTENTS | cut -f 4 -d ' '`
	lastNameO=`echo $LINE_CONTENTS | cut -f 5 -d ' '`
	firstNameO=`echo $LINE_CONTENTS | cut -f 6 -d ' '`
	dciO=`echo $LINE_CONTENTS | cut -f 7 -d ' '`
	points=`echo $LINE_CONTENTS | cut -f 8 -d ' '`
	
	echo "insert into TOURNAMENT_TABLE values (default, '$EVENT', '$ROUND', '$TABLE', '$lastNameP', '$firstNameP', '$dciP', '$lastNameO', '$firstNameO', '$dciO', '$points' );" > script.sql
	mysql tournamentdb < script.sql
done

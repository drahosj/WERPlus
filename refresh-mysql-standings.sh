#! /bin/bash

pushd ~/tournament-server/output

EVENT=`cat event`

cat pairings | while read LINE_CONTENTS
do
	RANK=`echo $LINE_CONTENTS | cut -f 1 -d ' '`
	lastName=`echo $LINE_CONTENTS | cut -f 2 -d ' '`
	firstName=`echo $LINE_CONTENTS | cut -f 3 -d ' '`
	points=`echo $LINE_CONTENTS | cut -f 4 -d ' '`
	omw=`echo $LINE_CONTENTS | cut -f 5 -d ' '`
	gw=`echo $LINE_CONTENTS | cut -f 6 -d ' '`
	ogw=`echo $LINE_CONTENTS | cut -f 7 -d ' '`
	
	echo "insert into TOURNAMENT_TABLE values (default, '$EVENT', $RANK, '$ogw', '$lastName', '$firstName', '$omw', '$gw', '$firstNameO', '$ogw');" > script.sql
	mysql tournamentdb < script.sql
done

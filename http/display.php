<html>
<head>
</head>
<body>
<table border=1 cellspacing=1 cellpadding=6><tr>
<td>Event</td>
<td>Round</td>
<td>Table</td>
<td>Last Name</td>
<td>First Name</td>
<td>Opponent Last Name</td>
<td>Opponent First Name</td>
<td>Points</td></tr>
<?php
$username="tournament";
$password="mtg-tournament";
$database="tournamentdb";

mysql_connect(localhost,$username,$password);
@mysql_select_db($database) or die( "Unable to select database");

$query="SELECT * FROM TOURNAMENT_TABLE WHERE dciP='$_GET[dciNumber]'";
$result=mysql_query($query);

$num=mysql_numrows($result);

mysql_close();

$i=0;
while ($i < $num) {


$event=mysql_result($result,$i,"event");
$rnd=mysql_result($result,$i,"round");
$tbl=mysql_result($result,$i,"gameTable");
$lastP=mysql_result($result,$i,"lastNameP");
$firstP=mysql_result($result,$i,"firstNameP");
$lastO=mysql_result($result,$i,"lastNameO");
$firstO=mysql_result($result,$i,"firstNameO");
$pts=mysql_result($result,$i,"points");

echo 
"<tr>
<td>$event</td>
<td>$rnd</td>
<td>$tbl</td>
<td>$lastP</td>
<td>$firstP</td>
<td>$lastO</td>
<td>$firstO</td>
<td>$pts</td>
</tr>";

$i++;
}
echo "</table><form action=\"display.php?dciNumber=$_GET[dciNumber]\" method=\"post\">
<input type=\"submit\" value=\"Refresh\"/></form>";
?>
</body>
</html>

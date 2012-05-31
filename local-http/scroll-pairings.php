<html>
<head>
</head>
<body bgcolor="black">
<p align="justify"><font size=6 color="white"><u>==================A-L==========================================M-Z=========================</u></font></p>
</br>
<table borders=1 cellspacing=20 cellpadding=0>
<tr>
<td><font size=5 color=white><u>Table</u></font></td>
<td><font size=5 color=white><u>Last Name</u></font></td>
<td><font size=5 color=white><u>First Name</u></font></td>
<td><font size=5 color=white><u>Op. Last Name</u></font></td>
<td><font size=5 color=white><u>Op. First Name</u></font></td>
<td><font size=5 color=white><u>Points</u></font></td>
<td><font size=5 color=black><u>space</u></font></td>
<td><font size=5 color=white><u>Table</u></font></td>
<td><font size=5 color=white><u>Last Name</u></font></td>
<td><font size=5 color=white><u>First Name</u></font></td>
<td><font size=5 color=white><u>Op. Last Name</u></font></td>
<td><font size=5 color=white><u>Op. First Name</u></font></td>
<td><font size=5 color=white><u>Points</u></font></td>
</tr>
</table>



<?php
echo "<font color=white>$letter</font>";

$username="root";
$password="toor";
$database="tournamentdb";
mysql_connect(localhost,$username,$password);

@mysql_select_db($database) or die( "Unable to select database");


$query="SELECT * FROM TOURNAMENT_TABLE ORDER BY lastNameP;";
$result=mysql_query($query);

$num=mysql_numrows($result);

mysql_close();

$i=0;

?>

<marquee direction="up" bgcolor="black" width=49.8% height=800 scrollamount=6>
<table borders=1 cellspacing=20 cellpadding=0>
<tr>
<td><font size=5 color=black><u>Table</u></font></td>
<td><font size=5 color=black><u>Last Name</u></font></td>
<td><font size=5 color=black><u>First Name</u></font></td>
<td><font size=5 color=black><u>Op. Last Name</u></font></td>
<td><font size=5 color=black><u>Op. First Name</u></font></td>
<td><font size=5 color=black><u>Points</u></font></td>
</tr>

<?

while ($i < $num){
$tbl=mysql_result($result,$i,"gameTable");
$lastP=mysql_result($result,$i,"lastNameP");
$firstP=mysql_result($result,$i,"firstNameP");
$lastO=mysql_result($result,$i,"lastNameO");
$firstO=mysql_result($result,$i,"firstNameO");
$pts=mysql_result($result,$i,"points");

$letter = substr($lastP, 0, 1);

if ($letter == "M") break;
if ($letter == "N") break;
if ($letter == "O") break;
if ($letter == "P") break;
if ($letter == "Q") break;
if ($letter == "R") break;
if ($letter == "S") break;
if ($letter == "T") break;
if ($letter == "U") break;
if ($letter == "V") break;
if ($letter == "W") break;
if ($letter == "X") break;
if ($letter == "Y") break;
if ($letter == "Z") break;
if ($letter == "m") break;
if ($letter == "n") break;
if ($letter == "o") break;
if ($letter == "p") break;
if ($letter == "q") break;
if ($letter == "r") break;
if ($letter == "s") break;
if ($letter == "t") break;
if ($letter == "u") break;
if ($letter == "v") break;
if ($letter == "w") break;
if ($letter == "x") break;
if ($letter == "y") break;
if ($letter == "z") break;



echo 
"<tr>
<td><font size=5 color=white>$tbl</font></td>
<td><font size=5 color=white>$lastP</font></td>
<td><font size=5 color=white>$firstP</font></td>
<td><font size=5 color=white>$lastO</font></td>
<td><font size=5 color=white>$firstO</font></td>
<td><font size=5 color=white>$pts</font></td>
</tr>";
$i++;

}?>
</table>
</marquee>
<marquee direction="up" bgcolor="black" width=49.8% height=800 scrollamount=6>
<table borders=1 cellspacing=20 cellpadding=0>
<tr>
<td><font size=5 color=black><u>Table</u></font></td>
<td><font size=5 color=black><u>Last Name</u></font></td>
<td><font size=5 color=black><u>First Name</u></font></td>
<td><font size=5 color=black><u>Op. Last Name</u></font></td>
<td><font size=5 color=black><u>Op. First Name</u></font></td>
<td><font size=5 color=black><u>Points</u></font></td>
</tr>

<?
mysql_connect(localhost,$username,$password);

@mysql_select_db($database) or die( "Unable to select database");


$query="SELECT * FROM TOURNAMENT_TABLE ORDER BY lastNameP;";
$result=mysql_query($query);

$num=mysql_numrows($result);

mysql_close();

while ($i < $num){
echo "<font size=5 color=white>$j</font>";
$tbl=mysql_result($result,$i,"gameTable");
$lastP=mysql_result($result,$i,"lastNameP");
$firstP=mysql_result($result,$i,"firstNameP");
$lastO=mysql_result($result,$i,"lastNameO");
$firstO=mysql_result($result,$i,"firstNameO");
$pts=mysql_result($result,$i,"points");

echo 
"<tr>
<td><font size=5 color=white>$tbl</font></td>
<td><font size=5 color=white>$lastP</font></td>
<td><font size=5 color=white>$firstP</font></td>
<td><font size=5 color=white>$lastO</font></td>
<td><font size=5 color=white>$firstO</font></td>
<td><font size=5 color=white>$pts</font></td>
</tr>";
$i++;
}?>
</table>
</marquee></body></html>

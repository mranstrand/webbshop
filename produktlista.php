<?php

/**
 * Visar en lista med produkter för användaren
 * Skapad av Michael Ranstrand
 * Datum: 2014-12-02
 *
 */

//Variabler för databaskoppling
$dbhost     = "localhost";
$dbname     = "webbshop";
$dbuser     = "root";
$dbpass     = "";

//Koppla till databasen
$DBH = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);

// Välj felhantering (här felsökningsläge)
$DBH->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING );

// Förbered databasfråga med placeholders (markerade med : i början)
$STH = $DBH->prepare("SELECT * FROM tbl_produkter");

//Utför frågan
$STH->execute();

//Stänger databaskopplingen
$DBH = null;

$arr = $STH->fetchAll();
?>


<html>
<head>
    <meta charset="UTF-8">
</head>
<body>

<?php
foreach($arr as $value){

    echo "<a href='produkt.php?productId=" . $value["produktid"] . "'>" . $value["produktnamn"] . "</a><br>";

}
?>

</body>
</html>
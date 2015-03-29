<?php

//Variabler för databaskoppling
$dbhost     = "localhost";
$dbname     = "The_Great_Shop";
$dbuser     = "root";
$dbpass     = "";

//Koppla till databasen
$DBH = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);

// Välj felhantering (här felsökningsläge)
$DBH->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING );

// Förbered databasfråga med placeholders (markerade med : i början)
$STH = $DBH->prepare("INSERT INTO tbl_produkt(artikelnr, artikel, pris, beskrivning, saldo, bildURL) VALUES (:artikelnr, :artikel, :pris, :beskrivning, :saldo, :bildURL)");

//Ersätt placeholders med värden från variabler

$STH->bindParam(':artikel', $_POST["artikel"]);
$STH->bindParam(':artikelnr', $_POST["artikelnr"]);
$STH->bindParam(':pris', $_POST["pris"]);
$STH->bindParam(':beskrivning', $_POST["beskrivning"]);
$STH->bindParam(':saldo', $_POST["saldo"]);
$STH->bindParam(':bildURL', $_POST["bildURL"]);

//Utför frågan
$STH->execute();

//Stänger databaskopplingen
$DBH = null;

//header("Location: productList.php");

?>



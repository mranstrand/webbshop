<?php
$name = $_POST["prodName"];
$price = $_POST["prodPrice"];
$descrip = $_POST["prodDescrip"];
$img = $_POST["prodImg"];
$status = $_POST["prodStatus"];

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
$STH = $DBH->prepare("INSERT INTO tbl_produkter(produktnamn, bildlank, pris, beskrivning, saldo) VALUES (:name, :img, :price, :description, :status)");

//Ersätt placeholders med värden från variabler

$STH->bindParam(':name', $name);
$STH->bindParam(':img', $img);
$STH->bindParam(':description', $descrip);
$STH->bindParam(':price', $price);
$STH->bindParam(':status', $status);

//Utför frågan
$STH->execute();

//Stänger databaskopplingen
$DBH = null;

//header("Location: productList.php");

?>



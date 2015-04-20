<?php
/**
 * Created by PhpStorm.
 * User: michaelranstrand
 * Date: 15-01-12
 * Time: 13:48
 */

session_start();

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
$STH = $DBH->prepare("SELECT * FROM view_varukorg WHERE orderid = :orderid");

$STH->bindParam(':orderid', $_SESSION["orderID"]);

//Utför frågan
$STH->execute();

//Stänger databaskopplingen
$DBH = null;

$arr = $STH->fetchAll();

foreach ($arr as $orderrad){

    echo  "<br>Artikelnummer = " . $orderrad["artikelnr"]. " Artikelnamn = " .
        $orderrad["artikel"] . ". antal = " . $orderrad["antal"] . " pris = " .
        $orderrad["pris"]. " Summa = " . $orderrad["belopp"];

}
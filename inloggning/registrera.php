<?php
/**
 * Created by PhpStorm.
 * User: Macbook
 * Date: 2014-09-22
 * Time: 13:14
 */


//Hämta värden från formuläret
$username = $_POST["username"];
$password = $_POST["password"];

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
$STH = $DBH->prepare("INSERT INTO tbl_kunder (kundnamn, password) value (:username, :password)");

//Ersätt placeholders med värden från variabler
$STH->bindParam(':username', $username);
$STH->bindParam(':password', $password);

//Utför frågan
$STH->execute();

//Stänger databaskopplingen
$DBH = null;
?>
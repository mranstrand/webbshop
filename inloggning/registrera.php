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
$fname = $_POST["fname"];
$lname = $_POST["lname"];
$adress = $_POST["adress"];
$postal = $_POST["postal"];
$phone = $_POST["phone"];
$email = $_POST["email"];

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
$STH = $DBH->prepare("INSERT INTO tbl_kund (namn, efternamn, adress, tel, mail, login, passwd, postadress, datum) value (:namn, :efternamn, :adress, :tel, :mail, :login, :passwd, :postadress, CURRENT_DATE())");

//Ersätt placeholders med värden från variabler
$STH->bindParam(':namn', $fname);
$STH->bindParam(':efternamn', $lname);
$STH->bindParam(':adress', $adress);
$STH->bindParam(':tel', $phone);
$STH->bindParam(':mail', $email);
$STH->bindParam(':login', $username);
$STH->bindParam(':passwd', $password);
$STH->bindParam(':postadress', $postal);

//Utför frågan
$STH->execute();

//Stänger databaskopplingen
$DBH = null;
?>
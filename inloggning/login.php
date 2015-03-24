<?php
/**
 * Created by PhpStorm.
 * User: Macbook
 * Date: 2014-09-22
 * Time: 13:14
 */
session_start();

//Hämta värden från formuläret
$username = $_POST["username"];
$password = $_POST["password"];

//Variabler för databaskoppling
$dbhost     = "localhost";
$dbname     = "the_great_shop";
$dbuser     = "root";
$dbpass     = "";

//Koppla till databasen
$DBH = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);

// Välj felhantering (här felsökningsläge)
$DBH->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING );

// Förbered databasfråga med placeholders (markerade med : i början)
$STH = $DBH->prepare("SELECT * FROM tbl_kund WHERE login = :username AND passwd = :password");

//Ersätt placeholders med värden från variabler
$STH->bindParam(':username', $username);
$STH->bindParam(':password', $password);

//Utför frågan
$STH->execute();



//Undersök om nåfon användare matchar frågan
if($row = $STH->fetch()){

    $_SESSION["kundnamn"] = $row["login"];
    $_SESSION["kundid"] = $row["ID"];
    print_r($_SESSION);
    //header("Location: index.php");

    $STH = $DBH->prepare("INSERT INTO tbl_order (kundID, status, regdat) value (:kundID, :status, CURRENT_DATE())");

    $status = "varukorg";
    //Ersätt placeholders med värden från variabler
    $STH->bindParam(':kundID', $_SESSION["kundid"]);
    $STH->bindParam(':status', $status);

    //Utför frågan
    $STH->execute();


}

//Stänger databaskopplingen
$DBH = null;
?>
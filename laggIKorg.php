<?php
/**
 * Created by PhpStorm.
 * User: michaelranstrand
 * Date: 15-01-12
 * Time: 13:27
 */

session_start();

$productId = $_GET["productId"];
$antal = $_POST["antal"];

$_SESSION["cart"]["products"][] = array("productId" => $productId, "antal" => $antal);


//Variabler för databaskoppling
$dbhost     = "localhost";
$dbname     = "the_great_shop";
$dbuser     = "root";
$dbpass     = "";

//Koppla till databasen
$DBH = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);

// Välj felhantering (här felsökningsläge)
$DBH->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING );

$STH = $DBH->prepare("INSERT INTO tbl_orderrader (antal, orderid, produktid) value (:antal, :orderID, :produktID)");

//Ersätt placeholders med värden från variabler
$STH->bindParam(':antal', $antal);
$STH->bindParam(':orderID', $_SESSION["orderID"]);
$STH->bindParam(':produktID', $productId);

//Utför frågan
$STH->execute();

?>

<html>
<body>

Du lade till <?php echo $antal?> st. av produkt med id: <?php echo $productId?>

<a href="visaKorg.php">Visa varukorg</a>

</body>

</html>
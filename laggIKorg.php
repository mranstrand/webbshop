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

?>

<html>
<body>

Du lade till <?php echo $antal?> st. av produkt med id: <?php echo $productId?>

<a href="visaKorg.php">Visa varukorg</a>

</body>

</html>
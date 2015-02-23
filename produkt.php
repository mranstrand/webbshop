<?php
/**
 * Visar en produkt för användaren
 * Skapad av Michael Ranstrand
 * Datum: 2014-12-02
 *
 */

//Ta emot id för den produkt som skall visas
$productID = $_GET["productId"];

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
$STH = $DBH->prepare("SELECT * FROM tbl_produkter WHERE produktid = :id");

//Ersätt placeholders med värden från variabler
$STH->bindParam(':id', $productID);

//Utför frågan
$STH->execute();

//Stänger databaskopplingen
$DBH = null;

//Undersök om nåfon användare matchar frågan
$row = $STH->fetch();

    $productName = $row["produktnamn"];
    $productPrice = $row["pris"];
    $productImg = $row["bildlank"];
    $productDescription = $row["beskrivning"];



?>

<html>
<head>
    <meta charset="UTF-8"/>
</head>
<body>
<h1><?php echo $productName; ?></h1>
<br/>
<img src="<?php echo $productImg; ?>" /> <br/>
<h2>Pris: <?php echo $productPrice; ?> kr</h2>
<?php echo $productDescription; ?>

<form action="laggIKorg.php?productId=<?php echo $productID ?>" method="post">

    <input type="text" name="antal">
    <input type="submit">

</form>
</body>
</html>
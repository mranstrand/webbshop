<?php

    session_start();

    //include "login/admin_auth.php";
?>

<html>

<head>

    <title>Registrera produkt</title>
    <meta charset="utf-8">

</head>

<body>
    <h1>Registrera produkt</h1>
    <form action="nyprodukt.php" method="post"><br>
       Namn: <input type="text" name="prodName"><br>
       Pris: <input type="text" name="prodPrice"><br>
       Bildlänk: <input type="text" name="prodImg"><br>
       Lagerstatus: <input type="text" name="prodStatus"><br>
        Beskrivning: <input type="text" name="prodDescrip"><br>
        <input type="submit">

    </form>

</body>
</html>
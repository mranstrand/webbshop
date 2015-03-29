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
       Namn: <input type="text" name="artikel"><br>
        Nummer: <input type="text" name="artikelnr"><br>
       Pris: <input type="text" name="pris"><br>
       Bildlänk: <input type="text" name="bildURL"><br>
       Lagersaldo: <input type="text" name="saldo"><br>
        Beskrivning: <input type="text" name="beskrivning"><br>
        <input type="submit">

    </form>

</body>
</html>
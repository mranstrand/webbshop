<?php
/**
 * Created by PhpStorm.
 * User: michaelranstrand
 * Date: 15-01-12
 * Time: 13:48
 */

session_start();

$cart = $_SESSION["cart"]["products"];

// Loopa igenom produkter i varukorg

foreach ($cart as $product){

    echo  "<br>Id = " . $product["productId"] . ". antal = " . $product["antal"];

}
<?php

if(!isset($_SESSION["username"])){

    header("location: login/loginform.php");

}else{

    echo "Du är inloggad som: " . $_SESSION["username"];

}

?>
<?php

if(!isset($_SESSION["adminname"])){

header("location: login/admin_loginform.php");

}else{

echo "Du är inloggad som admin: " . $_SESSION["adminname"];

}

?>
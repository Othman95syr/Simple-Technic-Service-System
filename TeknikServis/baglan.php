<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbase= "teknikservis";

try{
    $conn=new PDO("mysql:host=$servername;dbname=$dbase;charset=utf8","$username","$password");
}catch (PDOException $error){
    echo "VERI TABANI BAGLANTISI SAGLANAMADI !";
    die($error->getMessage());
}
?>

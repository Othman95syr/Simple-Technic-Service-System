<?php

if(isset($_POST['girisbtn']))
{
    require_once "baglan.php";
    $uname=$_POST["uname"];
    $psw=$_POST["psw"];
    $sorgu=$conn->prepare("SELECT * FROM yetkili WHERE kadi=? and sifre=?");// sql yazarak verilerin doğruluğunu kontrol ediyoruz.
    $sorgu->execute(array($uname,$psw));//Kontrol edilecek olan değişkenleri yazdık
    $islem=$sorgu->fetch();// Burada sorguyu parcalayarak girilen bilgilerin karşılığı varmı dedik

    if($islem)// Karşığılı varsa buraya gir dedik
     {
         session_start();
         $_SESSION['uname'] = $islem['kadi'];// Giriş yaptığımız kullanici adımızı SEssion atadık
         $_SESSION['ad'] = $islem['ad'];
         $_SESSION['soyad'] = $islem['soyad'];
         $_SESSION['id'] = $islem['id'];
         include "yonlendirme.php";
         yonlendir("panel/teknikerpanel.php");//Yönlendirmemizi yapıyoruz.
     }
    else//Eğer girilen bilgiler eşleşmiyorsa
    {
        $alert = "Kullanıcı Adınız veya Şifreniz Yanlış";
        echo "<script type='text/javascript'>alert('$alert');</script>";
    }
}

?>
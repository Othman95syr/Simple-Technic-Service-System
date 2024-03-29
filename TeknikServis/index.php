<!doctype html>
<html lang="tr">
<head>
    <link href="https://fonts.googleapis.com/css?family=Ubuntu&amp;subset=latin-ext" rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico"/>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="css-js/index.css" rel="stylesheet" type="text/css">
    <title>Teknik Servis Otomasyonu</title>
</head>
<body>
    <div class="container-div">
        <div id="right-div">
            <button class="button button-tekniker" onclick="openForm()">Tekniker Girişi</button><br>

            <div class="form-popup" id="myForm">
                <form  class="form-container" method="post">
                    <h1>Tekniker Girişi</h1>
                    <label for="uname"><b>Kullanıcı Adı</b></label>
                    <input type="text" placeholder="Kullanıcı Adınızı Girin" name="uname" required>
                    <label for="psw"><b>Şifre</b></label>
                    <input type="password" placeholder="Şifrenizi Girin" name="psw" required>
                    <?php  include "login.php"; ?>
                    <button type="submit" class="btn" name="girisbtn">Giriş Yap</button>
                    <button type="button" class="btn cancel" onclick="closeForm()">İptal Et</button>
                </form>
            </div>
        
            <button class="button button-musteri" onclick="openForm1()">Müşteri Girişi</button>
            <!-- Sorgulama formu !-->
            <div class="form-popup1" id="myForm1">
                <form action="sorgulama.php" class="form-container1" method="get">
                    <h1>Ürün Sorgulama</h1>
                    <label for="tel"><b>Telefon(Ornek=123456)</b></label>
                    <input type="tel" placeholder="Telefon Numaranızı Girin" name="tel" required>
                    <button type="submit" class="btn1" >Sorgula</button>
                    <button type="button" class="btn1 cancel1" onclick="closeForm1()">Kapat</button>
                </form>
            </div>
        </div>
    </div>
    <script src="css-js/js-index.js" type="text/javascript"></script>
</body>
</html>
<?php
     require_once "baglan.php";
     if(isset($_POST['save']))
   {
        $id = 7;
        $status=true;
        $feedback=$_POST["feedback"];
        $id=$_POST["id"];
        $sql = " UPDATE servis SET status=1, feedback ='". $feedback."' WHERE id=$id  ";
        
        $stmt=$conn->prepare($sql);
        $stmt->execute();
        if($stmt){
            $alert = "done";
            echo "<script type='text/javascript'>alert('$sql');</script>";
        }
        else{
            $alert = "not done";
            echo "<script type='text/javascript'>alert('$alert');</script>";
        }
   }
            ?>
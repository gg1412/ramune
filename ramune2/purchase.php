<?php
$siteTitle="購入完了";
require('head.php');
require('header.php');
require('function.php');

var_dump($_POST['m_id']);
?>


<style>
.main {
    margin: 0 auto;
    padding: 70px;
    width: 680px;
    border: 5px solid #f1f1f1;
}
h2 {
    padding:20px;
    text-align:center;
}
p {
    padding-left:280px;
    padding-top:10px;
}
.link {
    text-align:right;
}
.img {
    padding:0 30px 0px 30px;
}

</style>

<?php
$username=$_POST['username'];
$name=$_POST['name'];
$price=$_POST['price'];
$pic=$_POST['pic1'];

try {
    $dbh=dbConnect();
    $stmt = $dbh->prepare('INSERT INTO history (user_name,product_name, price, pic, user_id,date) value(:user_name,:product_name, :price,:pic,:user_id, :date)');
    $stmt->execute(array(':user_name' => $username ,  ':product_name' => $name, ':price' => $price, ':pic' => $pic,':user_id' => $_SESSION['user_id'], ':date' => date('Y-m-d H:i:s')));

}catch(Exception $e){
    echo 'エラー' . $e->getMessage();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <div class="main">
        <h2>購入完了</h2>
        <div class="img">
            <img src="<?php echo showImg(sanitize($_POST['pic1'])); ?>" alt="商品写真1">
        </div>
        <br>
        <form action="history.php" method="post">
        <p>出品者: <?php echo ($_POST['username']) ? $_POST['username'] : 'noname'; ?></p>
        <p>商品名:<?php echo $_POST['name']; ?></p>
        <p>金額:<?php echo $_POST['price']; ?></p>
        <input type="submit" value="購入履歴">
        </form>

        <div class="link">
        <a href="mypage.php">マイページへ</a>
        </div>
        
    </div>
<?php 
require('footer.php');
?>
</body>
</html>


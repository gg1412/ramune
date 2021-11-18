<?php
$siteTitle="購入完了";
require('head.php');
require('header.php');
require('function.php');
?>


<style>
.main {
    margin: 0 auto;
    padding: 30px;
    width: 680px;
    border: 5px solid #f1f1f1;
}

h2 {
    padding:20px;
}

p {
    font-family:'Noto Sans Japanese';
}
</style>

<div class="main">
<h2>購入完了</h2>
<img src="<?php echo showImg(sanitize($_POST['pic1'])); ?>" alt="商品写真1">
<p>出品者: <?php echo ($_POST['username']) ? $_POST['username'] : 'noname'; ?></p>
<p>商品名:<?php echo $_POST['name']; ?></p>
<p>金額:<?php echo $_POST['price']; ?></p>
</div>
<?php 
require('footer.php');
?>
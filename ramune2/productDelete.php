<?php
$siteTitle = '商品削除';
require('head.php');
?>

<?php
    require('header.php');
?>

<?php

try {
    $user = "root";
    $password = "";
    $dbh = new PDO ("mysql:host=localhost;dbname=ramune;charset=utf8", "$user", "$password");
    $stmt = $dbh->prepare('DELETE FROM product WHERE id = :id');
    $stmt->execute(array(':id'=> $_GET["id"]));
    
} catch (Exception $e) {
    echo 'エラーが発生しました。:' . $e->getMessage();
}

// try {
//     $user = "root";
//     $password = "";
//     $dbh = new PDO ("mysql:host=localhost;dbname=ramune;charset=utf8", "$user", "$password");
//     $stmt = $dbh->prepare('DELETE FROM like WHERE product_id = :product_id');
//     $stmt->execute(array(':product_id'=> $_GET["id"]));
//     echo "削除しました";
// } catch (Exception $e) {
//     echo 'エラーが発生しました。:' . $e->getMessage();
// }

?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="style2.css">
    <title>削除完了</title>
  </head>
  <body>          
  <?php if(!empty($stmt)): ?>
    <div class="form">
        <h3>削除完了</h3>
        <br>
        <a href="mypage.php">
            <button type="button">マイページに戻る</button>
        </a>
    </div>
    <?php endif; ?>
  </body>
</html>

<?php
    require('footer.php');
?>

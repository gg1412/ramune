<?php
require('function.php');

debugLogStart();
require('auth.php');

$siteTitle="購入履歴";
require('head.php');
require('header.php');

$u_id = $_SESSION['user_id'];
$historyData = getMyhistory($u_id);
?>

<!-- <style>
  .example {
    width:50%;
    height:50%;
  }

  .left {
    float:left;
  }
</style> -->

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="style.css">
</head>
<body>
<div id="contents" class="site-width">
<h1 class="page-title">購入済み商品</h1>
<section id="main">
        <section class="list panel-list">
          <?php
           if(!empty($historyData)):
             foreach($historyData as $key => $val):
          ?>
            <div class="panel-head">
            <br>
              <img src="<?php echo showImg(sanitize($val['pic'])); ?>" alt="<?php echo sanitize($val['product_name']); ?>" class="example">
            </div>
            <div class="panel-body">
                出品者:<?php if(!empty($val['user_name'])) { echo sanitize($val['user_name']); } else { echo "noname"; } ?>
                <br>
                商品名:<?php echo sanitize($val['product_name']); ?>
                <br>
                金額:¥<?php echo sanitize(number_format($val['price'])); ?></span></p>
            </div>
          </a>
          <?php
            endforeach;
          endif;
          ?>
</section>
        </div>


</body>
</html>

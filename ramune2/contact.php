<?php
$siteTitle = 'お問い合わせ';
require('head.php');
?>

<?php
require('header.php');
require('function.php');
?>

<?php

$pageFlag = 0;

if(!empty($_POST['btn_confirm'])){
  $pageFlag = 1;
}
?>

<?
// if(!empty($_POST)){
//   $name = $_POST['name'];
//   $phone = $_POST['phone'];
//   $email = $_POST['email'];
//   $text = $_POST['text'];

//   validMaxLen($name,'name');
//   validTel($phone,'phone');
//   validMaxLen($email,'email');
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style2.css">
    <title>お問い合わせ</title>
</head>
<body>

<!-- 入力 -->
<?php if($pageFlag === 0 ) : ?>
<div class="box_con06">
        <form method="post" action="contact.php">
        <h1>入力画面</h1>
        <ul class="formTable">
          <li>
            <p class="title"><em>ご用件</em></p>
            <div class="box_det"><select name="list">
                <option value="">選択してください</option>
                <option value="質問">質問</option>
                <option value="トラブルについて">トラブルについて</option>
                <option value="機能要望">機能要望</option>
                <option value="不具合">不具合</option>
                <option value="その他">その他</option>
              </select></td>
          </li>
          <li>
            <p class="title"><em>お名前</em></p>
            <div class="box_det"><input size="20" type="text" class="wide" name="name" /></div>
          </li>
          <li>
            <p class="title"><em>電話番号（半角）</em></p>
            <div class="box_det"><input size="30" type="tel" class="wide" name="phone" /></div>
          </li>
          <li>
            <p class="title"><em>メールアドレス（半角）</em></p>
            <div class="box_det"><input size="30" type="email" class="wide" name="email" /></div>
          </li>
          <li>
            <p class="title"><em>お問い合わせ内容</em></p>
            <div class="box_det"><textarea name="text" cols="50" rows="5" ></textarea></div>
          </li>
        </ul>
        <p class="btn">
            <span><input type="submit" name="btn_confirm" value="確認" /></span>
        </p>
      </form>
    </div>
    <?php endif; ?>

    <!-- 確認 -->
    <?php if($pageFlag === 1 ) : ?>

    <div class="box_con06">
    <form method="post" action="registContact.php">
    <h1>確認画面</h1>
    <ul class="formTable">
          <li>
            <p class="title"><em>ご用件</em></p>
            <div class="box_det"><?php echo h($_POST['list']) ;?></div>
          </li>
          <br>
          <li>
            <p class="title"><em>お名前</em></p>
            <div class="box_det"><?php echo h($_POST['name']) ;?></div>
          </li>
          <br>
          <li>
            <p class="title"><em>電話番号（半角）</em></p>
            <div class="box_det"><?php echo h($_POST['phone']) ;?></div>
          </li>
          <br>
          <li>
            <p class="title"><em>メールアドレス（半角）</em></p>
            <div class="box_det"><?php echo h($_POST['email']) ;?></div>
          </li>
          <br>
          <li>
            <p class="title"><em>お問い合わせ内容</em></p>
            <div class="box_det"><?php echo h($_POST['text']) ;?></textarea></div>
          </li>
        </ul>
    <input type="submit" name="btn_submit" value="送信する">
    <a href="contact.php" class="link">戻る</a>
    
    <input type="hidden" name="list" value="<?php echo h($_POST['list']) ;?>">
    <input type="hidden" name="name" value="<?php echo h($_POST['name']) ;?>">
    <input type="hidden" name="phone" value="<?php echo h($_POST['phone']) ;?>">
    <input type="hidden" name="email" value="<?php echo h($_POST['email']) ;?>">
    <input type="hidden" name="text" value="<?php echo h($_POST['text']) ;?>">
    </form>
    </div>
    <?php endif; ?>
    <?php
    require('footer.php');
    ?>
</body>
</html>
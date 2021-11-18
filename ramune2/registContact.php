<?php
$siteTitle = 'お問い合わせ完了';
require('head.php');
?>

<?php
    require('header.php');
    require('function.php');
?>

<?php
    try {
      $user = "root";
      $password = "";
      $dbh = new PDO ("mysql:host=localhost;dbname=ramune;charset=utf8", "$user", "$password");
      $stmt = $dbh->prepare('INSERT INTO question set detail="'.$_POST['list'] .'",name="'.$_POST['name'] .'",phone="'.$_POST['phone'] .'",email="'.$_POST['email'] .'",text="'.$_POST['text'] .'",date=NOW()');
      $stmt->execute();

//           $from = '2011070@i-seifu.jp';
//           $email = $_POST['email'];
//           $subject = '【お問い合わせ】受付確認メール';
//           $list = $_POST['list'];
//           $name = $_POST['name'];
//           $phone = $_POST['phone'];
//           $text = $_POST['text'];
//           $comment = <<<EOF
//           {$name}様

//           お問合せありがとうございました。
//           以下の内容でお問い合わせと受付いたしました。

//           ----------お問い合わせ内容-----------
//           ご用件:{$list}
//           名前:{$name}
//           電話番号:{$phone}
//           メールアドレス:{$email}
//           お問い合わせ内容:{$text}
// EOF;
//           sendMail($from, $email, $subject, $comment);
    } catch (Exception $e) {
      echo 'エラーが発生しました。:' . $e->getMessage();
    }
    ?>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="style2.css">
</head>
<body>
</html>
<?php if(!empty($stmt)): ?>
<div class="form">
  <h3>お問い合わせありがとうございます</h3>
  <br>
  <!-- <p>お問い合わせありがとうございました。</p>
  <p>内容を確認のうえ、回答させて頂きます。</p>
  <p>しばらくお待ちください。</p>
  <br> -->
  <a href="mypage.php">
    <button type="button">マイページに戻る</button>
  </a>
</div>
<?php endif; ?>
<?php
require('footer.php')
?>
</body>



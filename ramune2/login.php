<?php
require('function.php');

require('auth.php');

//ログイン画面処理
if(!empty($_POST)){
  debug('post送信があります');

  //変数にユーザー情報を代入
  $email = $_POST['email'];
  $pass = $_POST['pass'];
  $pass_save = (!empty($_POST['pass_save'])) ? true : false;

  //未入力チェック
  validRequired($email, 'email');
  validRequired($pass, 'pass');


  if(empty($err_msg)){
    //email形式チェク
    validEmail($email, 'email');
    //email最大文字数チェック
    validMaxLen($email, 'email');

    //パスワード半角英数字チェック
    validHalf($pass, 'pass');
    //パスワード最大文字数チェック
    validMaxLen($pass, 'pass');
    //パスワード最小文字数チェック
    validMinLen($pass, 'pass');

   if(empty($err_msg)){

     try {
       $dbh = dbConnect();
       $sql = 'select password,id from users WHERE email = :email AND delete_flg = 0';
       $data = array(':email' => $email);

       $stmt = queryPost($dbh,$sql,$data);
       $result = $stmt->fetch(PDO::FETCH_ASSOC);

       //パスワード照合
       if(!empty($result) && password_verify($pass,array_shift($result))){

         //ログイン有効期限
         $seslimit = 60*60;
         //ログイン日時を現在日時に
         $_SESSION['login_date'] = time();

         //ログイン保持にチェックがある場合
         if($pass_save){
           //ログイン有効期限を３０日にリセット
           $_SESSION['login_limit'] = $seslimit*24*30;

         }else{
           //次回からログイン保持しないのでログイン有効期限を１時間後にセット
           $_SESSION['login_limit'] = $seslimit;
         }

         //ユーザーIDを格納
         $_SESSION['user_id'] = $result['id'];
         header("Location:mypage.php");//マイページへ

       }else{
         $err_msg['common'] = MSG09;
       }
     }catch (Exception $e){
       error_log('エラー発生：' . $e->getMessage());
       $err_msg['common'] = MSG07;
     }
   }
  }
}
?>

<?php
$siteTitle = 'ログイン';
require('head.php');
?>

  <body class="page-login page-1colum">

    <?php require('header.php'); ?>

    <!--メインコンテンツ-->
    <div id="contents" class="site-width">
     <!--main-->
     <section id="main">

       <div class="form-container">

         <form action="" method="post" class="form">
           <h2 class="title">ログイン</h2>


           <div class="area-msg">
             <?php
              if(!empty($err_msg['common'])) echo $err_msg['common'];
             ?>
           </div>


           <label class="<?php if(!empty($err_msg['email'])) echo 'err'; ?>">
            メールアドレス
             <input type="text" name="email" value="<?php if(!empty($_POST['email'])) echo $_POST['email']; ?>">
           </label>
           <div class="area-msg">
             <?php
              if(!empty($err_msg['email'])) echo $err_msg['email'];
             ?>
           </div>


            <label class="<?php if(!empty($err_msg['pass'])) echo 'err'; ?>">
            パスワード
             <input type="password" name="pass" value="<?php if(!empty($_POST['pass'])) echo $_POST['pass']; ?>">
           </label>
           <div class="area-msg">
             <?php
              if(!empty($err_msg['pass'])) echo $err_msg['pass'];
             ?>
           </div>


           <!-- <label class="">
             <input type="checkbox" name="pass_save">次回ログインを省略する
           </label> -->

           <div class="btn btn-container">
             <input type="submit" class="btn btn-mid" value="ログイン">
           </div>
           パスワードを忘れた方は<a href="passRemindSend.php">こちら</a>
         </form>

       </div>
     </section>


    </div>

     <!--footer-->
  <?php
  require('footer.php')
  ?>

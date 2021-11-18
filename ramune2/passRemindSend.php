<?php
require('function.php');
debugLogStart();

//ログイン認証ない

//画面処理
//post送信された場合
if(!empty($_POST)){
  
  //変数にユーザー情報を代入
  $email = $_POST['email'];
  
  //未入力チェック
   validRequired($email,'email');
  
  if(empty($err_msg)){
    
    //email形式チェック
    validEmail($email,'email');
    //emial最大文字数チェック
    validMaxLen($email,'email');
    
    if(empty($err_msg)){
      
      try{
        $dbh = dbConnect();
        $sql = 'SELECT count(*) FROM users WHERE email = :email AND delete_flg = 0';
        $data = array(':email' => $email);
        //クエリ実行
        $stmt = queryPost($dbh,$sql,$data);
        //クエリ結果の値を取得
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        
        //emailがDBに登録されている場合
        if($stmt && array_shift($result)){
          $_SESSION['msg_success'] = SUC03;
          
          $auth_key = makeRandKey();//認証キー生成
          
          //メール送信
          $from = '2011070@i-seifu.jp';
          $to = $email;
          $subject = '【パスワード再発行認証】｜らむねいと';
          $comment = <<<EOF
          本メールアドレス宛にパスワード再発行のご依頼がありました。
下記のURLにて認証キーをご入力頂くとパスワードが再発行されます。

パスワード再発行認証キー入力ページ：http://localhost/ramune2/passRemindRecieve.php
認証キー：{$auth_key}
※認証キーの有効期限は30分となります

認証キーを再発行されたい場合は下記ページより再度再発行をお願い致します。
http://localhost/ramune2/passRemindSend.php

EOF;
          sendMail($from, $to, $subject, $comment);
          //認証に必要なセッションへ保存
          $_SESSION['auth_key'] = $auth_key;
          $_SESSION['auth_email'] = $email;
          $_SESSION['auth_key_limit'] = time()+(60*30);//現在時刻より30分後のUNIXタイムスタンプを入れる
          
          header("Location:passRemindRecieve.php");
        }else{
          $err_msg['common'] = MSG07;
        }
      }catch (Exception $e){
        error_log('エラー発生:' . $e->getMessage());
        $err_msg['common'] = MSG07;
      }
    }
  }
}

?>

<?php
$siteTitle = 'パスワード再発行メール送信';
require('head.php');
?>

<body class="page-signup page-1colum">
  
  <!--メニュー-->
  <?php
   require('header.php');
  ?>
  
  <!--メインコンテンツ-->
  <div id="contents" class="site-width">
    <!--main-->
    <section id="main">
      <div class="form-container">
        <form action="" method="post" class="form">
          <p>ご指定のメールアドレス宛にパスワード再発行用のURLと認証キーをお送り致します。</p>
          <div class="area-msg">
            <?php
              echo geterrMsg('common');
            ?>
          </div>
          <label class="<?php if(!empty($err_msg['email'])) echo 'err'; ?>">
            Email
            <input type="text" name="email" value="<?php echo getFormData('email'); ?>">
          </label>
          <div class="area-msg">
            <?php
             echo getErrMsg('email');
            ?>
          </div>
          <div class="btn-container">
            <input type="submit" class="btn btn-mid" value="送信する">
          </div>
        </form>
      </div>
      <a href="mypage.php">&lt; マイページに戻る</a>
    </section>
  </div>
  <!-- footer -->
    <?php
    require('footer.php'); 
    ?>
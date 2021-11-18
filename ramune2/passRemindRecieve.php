<?php
require('function.php');

debugLogStart();

//ログイン認証なし
//sessionに認証キーがあるか確認、なければリダイレクト
if(empty($_SESSION['auth_key'])){
  header("Location:passRemindSend.php");
}
//画面処理
//post送信された場合
if(!empty($_POST)){
  
  //変数に認証キーを代入
  $auth_key = $_POST['token'];
  
  //未入力チェック
  validRequired($auth_key,'token');
  
  if(empty($err_msg)){
    debug('未入力チェックOKです');
    
    //固定長チェック
    validLength($auth_key,'token');
    //半角チェック
    validHalf($auth_key,'token');
    
    if(empty($err_msg)){
      debug('バリデーションOKです');
      
      if($auth_key !== $_SESSION['auth_key']){
        $err_msg['common'] = MSG15;
      }
      if(time() > $_SESSION['auth_key_limit']){
        $err_msg['common'] = MSG16;
      }
      if(empty($err_msg)){
        debug('認証OKです');
        
        $pass = makeRandKey();
        
        try{
          $dbh = dbConnect();
          $sql = 'UPDATE users SET password = :pass WHERE email = :email AND delete_flg = 0';
          $data = array(':email' => $_SESSION['auth_email'], ':pass' => password_hash($pass,PASSWORD_DEFAULT));
          $stmt = queryPost($dbh,$sql,$data);
          //クエリ成功
          if($stmt){
            debug('クエリ成功');
            
            //メール送信
            $from = '2011070@i-seifu.jp';
            $to = $_SESSION['auth_email'];
            $subject = '【パスワード再発行完了';
            $comment = <<<EOF
本メールアドレス宛にパスワードの再発行を致しました。
下記のURLにて再発行パスワードをご入力頂き、ログインください。

ログインページ：http://localhost/ramune2/login.php
再発行パスワード：{$pass}
※ログイン後、パスワードのご変更をお願い致します

EOF;
            sendMail($from,$to,$subject,$comment);
            
            //セッション削除
            session_unset();
            $_SESSION['msg_success'] = SUC03;
            
            header("Location:login.php");
          }else{
            $err_msg['common'] = MSG07;
          }
        }catch (Exception $e){
          error_log('エラー発生：'. $e->getMessage());
          $err_msg['common'] = MSG07;
        }
      }
    }
  }
}
?>

<?php
$siteTitle = 'パスワード再発行認証';
require('head.php');
?>

<body class="page-signup page-1colum">
  <style>
     .msg-slide{
      position:fixed;
      top:0;
      width:100%;
      height:30px;
      background: #43edb9;
      text-align: center;
      font-size:20px;
      line-height: 30px;
     }
    </style>
  <!--メニュー-->
  <?php
   require('header.php');
  ?>
  <p id="js-show-msg" style="display:none;" class="msg-slide">
    <?php echo getSessionFlash('msg_success'); ?>
  </p>
  
  <!--メインコンテンツ-->
  <div id="contents" class="site-width">
    
    <!--main-->
    <section id="main">
      <div class="form-container">
        <form action="" method="post" class="form">
          <p>ご指定のメールアドレスお送りした【パスワード再発行認証】メール内にある「認証キー」をご入力ください。</p>
          <div class="area-msg">
            <?php echo getErrMsg('common'); ?>
          </div>
          <label class="<?php if(!empty($err_msg['token'])) echo 'err'; ?>">
            認証キー
            <input type="text" name="token" class="<?php echo getFormData('token'); ?>">
          </label>
          <div class="area-msg">
            <?php echo getErrMsg('token'); ?>
          </div>
          <div class="btn-container">
            <input type="submit" class="btn btn-mid" value="再発行する">
          </div>
        </form>
      </div>
      <a href="passRemindRecieve.php">&lt; パスワード再発行メールを再度送信する</a>
    </section>
  </div>
    <!-- footer -->
    <?php
    require('footer.php'); 
    ?>

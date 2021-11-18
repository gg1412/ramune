<?php

require('function.php');
require('auth.php');

//画面処理
//post送信された場合
if(!empty($_POST)){
  
  try{
    $dbh = dbConnect();
    $sql1 = 'DELETE FROM users  WHERE id = :us_id';
    $sql2 = 'DELETE FROM product  WHERE user_id = :us_id';
    $sql3 = 'DELETE FROM `like`  WHERE user_id = :us_id';
    
    $data = array(':us_id' => $_SESSION['user_id']);
    
    $stmt1 = queryPost($dbh,$sql1,$data);
    $stmt2 = queryPost($dbh,$sql2,$data);
    $stmt3 = queryPost($dbh,$sql3,$data);
    
    if($stmt1){
      //セッション削除
      session_destroy();
      header("Location:index.php");
    }else{
      $err_msg['common'] = MSG07;
    }
  }catch (Exception $e){
    error_log('エラー発生：' . $e->getMessage());
    $err_msg['common'] = MSG07;
  }
}

?>

<?php 
$siteTitle = '退会';
require('head.php'); 
?>

<body class="page-withdraw page-1colum">
  <style>
    #main a{
      font-size: 20px;
      position: absolute;
      left:200px;
    }
    .form{
      position: relative;
    }
    .form .btn{
      position: absolute;
      top:60px;
      left:160px;
    }
    input[type="submit"]{
      position: absolute;
      top:70px;
      left:120px;
    }
  </style>
 
 <?php require('header.php'); ?>
  
  <script>
  function beforeSubmit() {
    if(window.confirm('この内容で送信しますがよろしいでしょうか？')) {
      return true;
    } else {
      return false;
    }
  }
</script>
<!--メインコンテンツ-->
  <div id="contents" class="site-width">
    <!--main-->
    <section id="main">
      <div class="form-container">
        <form action="" method="post" class="form" onsubmit="return beforeSubmit()">
          <h2 class="title">退会</h2>
          <div class="area-msg">
            <?php if(!empty($err_msg['common'])) echo $err_msg['common']; ?>
          </div>
          <div class="btn-container">
            <input type="submit" class="btn btn-mid" value="退会する" name="submit">
          </div>
        </form>
<script>
  function beforeSubmit() {
    if(window.confirm('本当に退会してもよろしいですか？')) {
      return true;
    } else {
      return false;
    }
  }
</script>
      </div>
      <a href="mypage.php">&lt; マイページに戻る</a>
    </section>
  </div>
  
 <!--footer-->
 <?php require('footer.php'); ?>
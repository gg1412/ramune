<?php

//ログインしている場合
if(!empty($_SESSION['login_date'])){
  
  //現在日時が最終ログイン日時＋有効期限を超えていた場合
  if(($_SESSION['login_date']) + $_SESSION['login_limit'] < time()){

    session_destroy();
    header("Location:login.php");
    
  }else{
    //最終ログイン日時を現在日時に更新
    $_SESSION['login_date'] = time();
    
    if(basename($_SERVER['PHP_SELF']) === 'login.php'){
      header("Location:mypage.php");
    }
  }
  
}else{
  if(basename($_SERVER['PHP_SELF']) !== 'login.php'){
    header("Location:login.php");
  }
}



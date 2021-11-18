<?php

require('function.php');



// postがあり、ユーザーIDがあり、ログインしている場合
if(isset($_POST['productId']) && isset($_SESSION['user_id']) && isLogin()){
  $p_id = $_POST['productId'];
  try{
    $dbh = dbConnect();
    // レコードがあるか検索
    $sql = 'SELECT * FROM `like` WHERE product_id = :p_id AND user_id = :u_id';
    $data = array(':u_id' => $_SESSION['user_id'], ':p_id' => $p_id);
    $stmt = queryPost($dbh,$sql,$data);
    $resultCount = $stmt->rowCount();
    
    //レコードが１件でもある場合
    if(!empty($resultCount)){
      //レコードを削除する
      $sql = 'DELETE FROM `like` WHERE product_id = :p_id AND user_id = :u_id';
      $data = array(':u_id' => $_SESSION['user_id'], ':p_id' => $p_id);
      $stmt = queryPost($dbh,$sql,$data);
    }else{
      //レコードを挿入する
      $sql = 'INSERT INTO `like` (product_id,user_id,create_date) VALUES (:p_id,:u_id,:date)';
      $data = array(':u_id' => $_SESSION['user_id'], ':p_id' => $p_id, ':date' => date('Y-m-d H:i:s'));
      $stmt = queryPost($dbh,$sql,$data);
    }
  }catch (Exception $e){
    error_log('エラー発生：' . $e->getMessage());
  }
}

?>
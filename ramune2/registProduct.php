<?php

require('function.php');

debugLogStart();


require('auth.php');




// GETデータを格納
$p_id = (!empty($_GET['p_id'])) ? $_GET['p_id'] : '';
//DBから商品データを取得
$dbFormData = (!empty($p_id)) ? getProduct($_SESSION['user_id'], $p_id) : '';
//新規登録画面か編集画面か判別用フラグ
$edit_flg = (empty($dbFormData)) ? false : true;
//DBからカテゴリーデータを取得
$dbCategoryData = getCategory();

//パラメータ改ざんチェック
//GETパラメータはあるが、改ざんされている（URLをいじくった）場合、正しい商品データが取れないのでマイページへ遷移させる
if(!empty($p_id) && empty($dbFormData)){
  header("Location:mypage.php");//マイページへ
}
//post送信時処理
if(!empty($_POST)){

  
  //変数にユーザー情報を代入
  $name = $_POST['name'];
  $school = $_POST['school'];
  $category = $_POST['category_id'];
  $price = (!empty($_POST['price'])) ? $_POST['price'] : 0;//0や空文字の場合は0を入れる。デフォルトのフォームには０が入っている。
  $comment = $_POST['comment'];
  //画像をアップロードし、パスを格納
  $pic1 = (!empty($_FILES['pic1']['name'])) ? uploadImg($_FILES['pic1'],'pic1') : '';
  // 画像をPOSTしてない（登録していない）が既にDBに登録されている場合、DBのパスを入れる（POSTには反映されないので）
  $pic1 = (empty($pic1) && !empty($dbFormData['pic1'])) ? $dbFormData['pic1'] : $pic1;
  $pic2 = (!empty($_FILES['pic2']['name'])) ? uploadImg($_FILES['pic2'],'pic2') : '';
  $pic2 = (empty($pic2) && !empty($dbFormData['pic2'])) ? $dbFormData['pic2'] : $pic2;
  $pic3 = ( !empty($_FILES['pic3']['name']) ) ? uploadImg($_FILES['pic3'],'pic3') : '';
  $pic3 = ( empty($pic3) && !empty($dbFormData['pic3']) ) ? $dbFormData['pic3'] : $pic3;
  
  //更新の場合はDBの情報と入力情報が異なる場合にバリデーションを行う
  if(empty($dbFormData)){
    //未入力チェック
    validRequired($name, 'name');
    //最大文字数チェック
    validMaxLen($name, 'name');
    //セレクトボックスチェック
    validSelect($category, 'category_id');
    //最大文字数チェック
    validMaxLen($comment,'comment',500);
    //未入力チェック
    validRequired($price, 'price');
    //半角数字チェック
    validNumber($price, 'price');
  }else{
    if($dbFormData['name'] !== $name){
      //未入力チェック
      validRequired($name,'name');
      //最大文字数チェック
      validMaxLen($name,'name');
    }
    if($dbFormData['category_id'] !== $category){
      //セレクトボックスチェック
      validSelect($category,'category_id');
    }
    if($dbFormData['comment'] !== $comment){
      //最大文字数チェック
      validMaxLen($comment,'comment',500);
    }
    if($dbFormData['price'] !== $price){
      //未入力チェック
      validRequired($price,'price');
      //半角数字チェック
      validNumber($price,'price');
    }
  }
  if(empty($err_msg)){
    
    try{
      $dbh = dbConnect();
      //編集画面の場合はUPDATE文、新規登録画面の場合はINSERT文を生成
      if($edit_flg){

        $sql = 'UPDATE product SET name = :name, category_id = :category, price = :price, comment = :comment, pic1 = :pic1, pic2 = :pic2, pic3 = :pic3 WHERE user_id = :u_id AND id = :p_id';
        $data = array(':name' => $name  ,':category' => $category, ':price' => $price, ':comment' => $comment, ':pic1' => $pic1, ':pic2' => $pic2, ':pic3' => $pic3, ':u_id' => $_SESSION['user_id'], ':p_id' => $p_id );
      }else{

        $sql = 'INSERT INTO product (name,  category_id, price, comment, pic1, pic2, pic3, user_id, create_date) value(:name, :category, :price, :comment, :pic1, :pic2, :pic3, :u_id, :date)';
        $data = array(':name' => $name ,  ':category' => $category, ':price' => $price, ':comment' => $comment, ':pic1' => $pic1, ':pic2' => $pic2, ':pic3' => $pic3, ':u_id' => $_SESSION['user_id'], ':date' => date('Y-m-d H:i:s'));
      }
      //クエリ実行
      $stmt = queryPost($dbh,$sql,$data);
      $rec = $stmt -> fetch(PDO::FETCH_ASSOC);
      //クエリ成功の場合
      if($stmt){
        $_SESSION['msg_success'] = SUC04;
        header("Location:mypage.php");
      }
    }catch(Exception $e){
      error_log('エラー発生：'. $e->getMessage());
      $err_msg['common'] = MSG07;
    }
  }
}
?>

<?php
$siteTitle = (!$edit_flg) ? '商品出品登録' : '商品編集';
require('head.php'); 
?>

<body class="page-profEdit page-2colum page-logined">
  
  <!--メニュー-->
  <?php
   require('header.php');
  ?>
  
  <!-- メインコンテンツ -->
    <div id="contents" class="site-width">
      <h1 class="page-title"><?php echo (!$edit_flg) ? '商品を出品する' : '商品を編集する'; ?></h1>
      <!-- Main -->
      <section id="main" >
        <div class="form-container">
          <form action="" method="post" class="form" enctype="multipart/form-data" style="width:600px;box-sizing:border-box;">
            <div class="area-msg">
              <?php 
              if(!empty($err_msg['common'])) echo $err_msg['common'];
              ?>
            </div>
            <label class="<?php if(!empty($err_msg['name'])) echo 'err'; ?>">
              商品名<span class="label-require">必須</span>
              <input type="text" name="name" value="<?php echo getFormData('name'); ?>">
            </label>
            <div class="area-msg">
              <?php 
              if(!empty($err_msg['name'])) echo $err_msg['name'];
              ?>
            </div>

            <label class="<?php if(!empty($err_msg['category_id'])) echo 'err'; ?>">
              カテゴリ<span class="label-require">必須</span>
              <select name="category_id" id="">
                <option value="0" <?php if(getFormData('category_id') == 0 ){ echo 'selected'; } ?> >選択してください</option>
                <?php
                  foreach($dbCategoryData as $key => $val){
                ?>
                  <option value="<?php echo $val['id'] ?>" <?php if(getFormData('category_id') == $val['id'] ){ echo 'selected'; } ?> >
                    <?php echo $val['name']; ?>
                  </option>
                <?php
                  }
                ?>
              </select>
            </label>
            <div class="area-msg">
              <?php 
              if(!empty($err_msg['category_id'])) echo $err_msg['category_id'];
              ?>
            </div>
            <label class="<?php if(!empty($err_msg['comment'])) echo 'err'; ?>">
              詳細
              <textarea name="comment" id="js-count" cols="30" rows="10" style="height:150px;" placeholder="素材、重さ、注意点など"><?php echo getFormData('comment'); ?></textarea>
            </label>
            <p class="counter-text"><span id="js-count-view">0</span>/500文字</p>
            <div class="area-msg">
              <?php 
              if(!empty($err_msg['comment'])) echo $err_msg['comment'];
              ?>
            </div>
            <label style="text-align:left;" class="<?php if(!empty($err_msg['price'])) echo 'err'; ?>">
              金額<span class="label-require">必須</span>
              <div class="form-group">
                <input type="text" name="price" style="width:150px" placeholder="50,000" value="<?php echo (!empty(getFormData('price'))) ? getFormData('price') : 0; ?>"><span class="option">円</span>
              </div>
            </label>
            <div class="area-msg">
              <?php 
              if(!empty($err_msg['price'])) echo $err_msg['price'];
              ?>
            </div>
            <div style="overflow:hidden;">
              <div class="imgDrop-container">
                画像1
                <label class="area-drop <?php if(!empty($err_msg['pic1'])) echo 'err'; ?>">
                  <input type="hidden" name="MAX_FILE_SIZE" value="3145728">
                  <input type="file" name="pic1" class="input-file">
                  <img src="<?php echo getFormData('pic1'); ?>" alt="" class="prev-img" style="<?php if(empty(getFormData('pic1'))) echo 'display:none;' ?>">
                    ドラッグ＆ドロップ
                </label>
                <div class="area-msg">
                  <?php 
                  if(!empty($err_msg['pic1'])) echo $err_msg['pic1'];
                  ?>
                </div>
              </div>
              <div class="imgDrop-container">
                画像２
                <label class="area-drop <?php if(!empty($err_msg['pic2'])) echo 'err'; ?>">
                  <input type="hidden" name="MAX_FILE_SIZE" value="3145728">
                  <input type="file" name="pic2" class="input-file">
                  <img src="<?php echo getFormData('pic2'); ?>" alt="" class="prev-img" style="<?php if(empty(getFormData('pic2'))) echo 'display:none;' ?>">
                    ドラッグ＆ドロップ
                </label>
                <div class="area-msg">
                  <?php 
                  if(!empty($err_msg['pic2'])) echo $err_msg['pic2'];
                  ?>
                </div>
              </div>
              <div class="imgDrop-container">
                画像３
                <label class="area-drop <?php if(!empty($err_msg['pic3'])) echo 'err'; ?>">
                  <input type="hidden" name="MAX_FILE_SIZE" value="3145728">
                  <input type="file" name="pic3" class="input-file">
                  <img src="<?php echo getFormData('pic3'); ?>" alt="" class="prev-img" style="<?php if(empty(getFormData('pic3'))) echo 'display:none;' ?>">
                    ドラッグ＆ドロップ
                </label>
                <div class="area-msg">
                  <?php 
                  if(!empty($err_msg['pic3'])) echo $err_msg['pic3'];
                  ?>
                </div>
              </div>
            </div>

            <div class="btn-container">
              <input type="submit" class="btn btn-mid" value="<?php echo (!$edit_flg) ? '出品する' : '更新する'; ?>">
            </div>
          </form>
        </div>


        <form action="productDelete.php" method="get" onsubmit="return beforeSubmit()">
            <input type="hidden" name="id" value="<?php if(isset($_GET['p_id'])) { $val = $_GET['p_id'];  echo $val;} ?>">
            <input type="submit" name="btn" value="削除する" >
        </form>
<script>
  function beforeSubmit() {
    if(window.confirm('本当に削除してもよろしいですか？')) {
      return true;
    } else {
      return false;
    }
  }
</script>
      </section>


      <?php
      require('sidebar_mypage.php');
      ?>
    </div>


    <?php
    require('footer.php'); 
    ?>
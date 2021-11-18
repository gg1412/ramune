<?php
require('function.php');

debugLogStart();

//ログイン認証
require('auth.php');

//画面表示用データ取得
$u_id = $_SESSION['user_id'];
//DBから商品データを取得
$productData = getMyProducts($u_id);
//DBから連絡掲示板データを取得
$bordData = getMyMsgsAndBord($u_id);
//DBからお気にいリデータを取得
$likeData = getMyLike($u_id);

// $msgname = getMsgname($u_id);

?>

<?php
$siteTitle = 'マイページ';
require('head.php');
?>

  <body class="page-mypage page-2colum page-logined">
   <style>
      #main{
        border: none !important;
      }
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

      <h1 class="page-title">マイページ</h1>

      <!--main-->
      <section id="main">
        <section class="list panel-list">
          <h2 class="title" style="margin-bottom:15px;">
          登録商品
          </h2>
          <?php
           if(!empty($productData)):
             foreach($productData as $key => $val):
          ?>
          <a href="registProduct.php<?php echo (!empty(appendGetParam())) ? appendGetParam().'&p_id='.$val['id'] : '?p_id='.$val['id']; ?>" class="panel">
            <div class="panel-head">
              <img src="<?php echo showImg(sanitize($val['pic1'])); ?>" alt="<?php echo sanitize($val['name']); ?>">
            </div>
            <div class="panel-body">
              <p class="panel-title"><?php echo sanitize($val['name']); ?><span class="price">¥<?php echo sanitize(number_format($val['price'])); ?></span></p>
            </div>
          </a>
          <?php
            endforeach;
          endif;
          ?>
        </section>

        <style>
          .list{
            margin-bottom: 30px;
          }
        </style>


        <section class="list list-table">
         <h2 class="title">連絡掲示板</h2>
          <table class="table">
            <thead>
              <tr>
                <th>最新送信日時</th>
                <!-- <th>取引相手</th> -->
                <th>メッセージ</th>
              </tr>
            </thead>
            <tbody>
              <?php
                if(!empty($bordData)){
                  foreach($bordData as $key => $val){
                    if(!empty($val['msg'])){
                      $msg = array_shift($val['msg']);
              ?>
                  <tr>
                    <td><?php echo sanitize(date('Y.m.d H:i',strtotime($msg['send_date']))); ?></td>
                    <!-- <td><?php echo $msg['from_user']; ?></td> -->
                    <td><a href="msg.php?m_id=<?php echo sanitize($val['id']); ?>"><?php echo mb_substr(sanitize($msg['msg']),0,40); ?>...</a></td>
                  </tr>
                <?php
                    }else{
                ?>
                   <tr>
                     <td>--</td>
                     <!-- <td>未設定</td> -->
                     <td><a href="msg.php?m_id=<?php echo sanitize($val['id']); ?>">まだメッセージはありません</a></td>
                   </tr>
                  <?php
                    }
                  }
                }
              ?>
            </tbody>
          </table>
        </section>

        <section class="list panel-list">
         <h2 class="title" style="margin-bottom:15px;">
         お気に入り商品
         </h2>
         <?php
           if(!empty($likeData)):
          foreach($likeData as $key => $val):
          ?>
           <a href="productDetail.php<?php echo (!empty(appendGetParam())) ? appendGetParam().'&p_id='.$val['id'] : '?p_id='.$val['id']; ?>" class="panel">
             <div class="panel-head">
               <img src="<?php echo showImg(sanitize($val['pic1'])); ?>" alt="<?php echo sanitize($val['name']); ?>">
             </div>
             <div class="panel-body">
               <p class="panel-title"><?php echo sanitize($val['name']); ?><span class="price">¥<?php echo sanitize(number_format($val['price'])); ?></span></p>
             </div>
           </a>
          <?php
           endforeach;
          endif;
          ?>
        </section>
      </section>

      <!--サイドバー-->
      <?php require('sidebar_mypage.php'); ?>

    </div>

  <!--footer-->
  <?php
  require('footer.php')
  ?>

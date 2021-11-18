<?php
require('function.php');

//セッションを削除(ログアウトします)
session_destroy();

//ログインページへ
header("Location:login.php");

-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2021-11-11 07:14:52
-- サーバのバージョン： 10.4.17-MariaDB
-- PHP のバージョン: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `ramune`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `bord`
--

CREATE TABLE `bord` (
  `id` int(11) NOT NULL,
  `sale_user` int(11) NOT NULL,
  `buy_user` int(11) NOT NULL,
  `delete_flg` tinyint(4) DEFAULT 0,
  `create_date` datetime NOT NULL,
  `product_id` int(11) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `bord`
--

INSERT INTO `bord` (`id`, `sale_user`, `buy_user`, `delete_flg`, `create_date`, `product_id`, `update_date`) VALUES
(118, 40, 39, 0, '2021-09-02 03:34:15', 188, '2021-09-02 01:34:15'),
(119, 40, 42, 0, '2021-09-06 03:27:35', 188, '2021-09-06 01:27:35'),
(120, 41, 39, 0, '2021-09-06 03:50:47', 191, '2021-09-06 01:50:47'),
(121, 41, 39, 0, '2021-09-06 03:51:00', 191, '2021-09-06 01:51:00'),
(122, 39, 39, 0, '2021-09-06 03:51:49', 187, '2021-09-06 01:51:49'),
(123, 39, 39, 0, '2021-09-06 07:10:52', 205, '2021-09-06 05:10:52');

-- --------------------------------------------------------

--
-- テーブルの構造 `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `delete_flg` tinyint(4) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `category`
--

INSERT INTO `category` (`id`, `name`, `delete_flg`, `create_date`, `update_date`) VALUES
(6, 'レディース', 0, '2021-09-01 11:49:05', '2021-09-01 02:49:05'),
(7, 'メンズ', 0, '2021-09-01 11:50:21', '2021-09-01 02:50:21'),
(8, 'スポーツ', 0, '2021-09-01 11:50:21', '2021-09-01 02:50:21'),
(9, '本', 0, '2021-09-01 11:50:35', '2021-09-01 02:50:35'),
(10, 'インテリア', 0, '2021-09-01 12:25:07', '2021-09-01 03:25:07'),
(11, 'ゲーム', 0, '2021-09-03 11:32:03', '2021-09-03 02:32:03');

-- --------------------------------------------------------

--
-- テーブルの構造 `like`
--

CREATE TABLE `like` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `delete_flg` tinyint(4) DEFAULT 0,
  `create_date` datetime DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `like`
--

INSERT INTO `like` (`id`, `product_id`, `user_id`, `delete_flg`, `create_date`, `update_date`) VALUES
(20, 187, 41, 0, '2021-09-01 05:10:12', '2021-09-01 03:10:12'),
(21, 201, 39, 0, '2021-09-06 03:12:53', '2021-09-06 01:12:53');

-- --------------------------------------------------------

--
-- テーブルの構造 `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `bord_id` int(11) DEFAULT NULL,
  `send_date` datetime DEFAULT NULL,
  `to_user` int(11) DEFAULT NULL,
  `from_user` int(11) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `delete_flg` tinyint(4) DEFAULT 0,
  `create_date` datetime DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `message`
--

INSERT INTO `message` (`id`, `bord_id`, `send_date`, `to_user`, `from_user`, `msg`, `delete_flg`, `create_date`, `update_date`) VALUES
(39, 118, '2021-09-02 03:35:30', 40, 39, 'お願いします', 0, '2021-09-02 03:35:30', '2021-09-02 01:35:30'),
(40, 118, '2021-09-02 03:35:59', 39, 40, 'ありがとう', 0, '2021-09-02 03:35:59', '2021-09-02 01:35:59'),
(41, 119, '2021-09-06 03:27:47', 40, 42, 'test\r\n', 0, '2021-09-06 03:27:47', '2021-09-06 01:27:47');

-- --------------------------------------------------------

--
-- テーブルの構造 `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `pic1` varchar(255) DEFAULT NULL,
  `pic2` varchar(255) DEFAULT NULL,
  `pic3` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `delete_flg` tinyint(4) DEFAULT 0,
  `create_date` datetime DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `product`
--

INSERT INTO `product` (`id`, `name`, `category_id`, `comment`, `price`, `pic1`, `pic2`, `pic3`, `user_id`, `delete_flg`, `create_date`, `update_date`) VALUES
(187, '服', 6, 'test', 1000, 'uploads/dbb1db4c1c32700b99d573b686307c0bc025a059.jpeg', '', '', 39, 0, '2021-09-01 04:27:58', '2021-09-01 02:52:48'),
(188, '服', 6, 'testです', 10000, 'uploads/dbb1db4c1c32700b99d573b686307c0bc025a059.jpeg', 'uploads/dbb1db4c1c32700b99d573b686307c0bc025a059.jpeg', 'uploads/dbb1db4c1c32700b99d573b686307c0bc025a059.jpeg', 40, 0, '2021-09-01 04:55:55', '2021-09-01 02:56:59'),
(189, '雑誌', 9, 'テストです', 2000, 'uploads/569c8aaafbd485cb1660aeb4300a2b7b21f32023.jpeg', 'uploads/569c8aaafbd485cb1660aeb4300a2b7b21f32023.jpeg', '', 40, 0, '2021-09-01 05:01:48', '2021-09-01 03:01:48'),
(190, 'マンガ', 9, 'テスト', 1000, 'uploads/569c8aaafbd485cb1660aeb4300a2b7b21f32023.jpeg', 'uploads/569c8aaafbd485cb1660aeb4300a2b7b21f32023.jpeg', 'uploads/dbb1db4c1c32700b99d573b686307c0bc025a059.jpeg', 41, 0, '2021-09-01 05:03:34', '2021-09-01 03:03:34'),
(191, '腕時計', 7, '', 50000, 'uploads/82ef66aaf478509172facbf4a106e151a6d35193.jpeg', 'uploads/82ef66aaf478509172facbf4a106e151a6d35193.jpeg', 'uploads/569c8aaafbd485cb1660aeb4300a2b7b21f32023.jpeg', 41, 0, '2021-09-01 05:09:04', '2021-09-01 03:09:04'),
(192, '腕時計2', 7, '', 30000, 'uploads/82ef66aaf478509172facbf4a106e151a6d35193.jpeg', 'uploads/82ef66aaf478509172facbf4a106e151a6d35193.jpeg', 'uploads/82ef66aaf478509172facbf4a106e151a6d35193.jpeg', 41, 0, '2021-09-01 05:14:49', '2021-09-01 03:14:49'),
(193, 'グローブとボール', 8, '', 7000, 'uploads/25f454b1851aa9b5566b5d4fa5cb9771c64967f5.jpeg', 'uploads/25f454b1851aa9b5566b5d4fa5cb9771c64967f5.jpeg', '', 42, 0, '2021-09-01 05:19:42', '2021-09-01 03:20:18'),
(194, 'グローブとボール', 8, '', 5000, 'uploads/dad9180a9e75ed8bcf5f989984ab05fbeda03671.jpeg', 'uploads/25f454b1851aa9b5566b5d4fa5cb9771c64967f5.jpeg', 'uploads/25f454b1851aa9b5566b5d4fa5cb9771c64967f5.jpeg', 42, 0, '2021-09-01 05:27:38', '2021-09-01 03:27:38'),
(195, '椅子', 10, '', 100, 'uploads/b6feb118d49966f78de8f9faf1da6d496347c157.jpeg', '', '', 43, 0, '2021-09-03 04:10:34', '2021-09-03 02:10:34'),
(196, 'クッション', 10, '', 10000, 'uploads/a2e94f782acbbb6e1aebd0077e49676c7db11ebe.jpeg', '', '', 43, 0, '2021-09-03 04:11:33', '2021-09-03 02:11:52'),
(197, 'ゴミ箱', 10, '', 500, 'uploads/e66ec4bb4c8a625096640a3e8dbc8750c4483003.jpeg', '', '', 43, 0, '2021-09-03 04:15:07', '2021-09-03 02:15:07'),
(198, 'ソファ', 10, '', 100000, 'uploads/2b1140102b028fec3e65c41869aca9bda4be1e3b.jpeg', 'uploads/b6feb118d49966f78de8f9faf1da6d496347c157.jpeg', '', 43, 0, '2021-09-03 04:21:21', '2021-09-03 02:21:33'),
(199, 'ソファ', 10, '', 20000, 'uploads/3a1557b7762fecda1cd2b76132b2684ab1a97fb8.jpeg', 'uploads/2b1140102b028fec3e65c41869aca9bda4be1e3b.jpeg', '', 44, 0, '2021-09-03 04:26:42', '2021-09-03 02:26:42'),
(200, '参考書', 9, '', 5000, 'uploads/569c8aaafbd485cb1660aeb4300a2b7b21f32023.jpeg', '', '', 44, 0, '2021-09-03 04:30:34', '2021-09-03 02:30:34'),
(202, 'ボール', 8, '', 9999999, 'uploads/b90bbd02bb14ca4d7dac1b5d5afd0a3d11758d93.jpeg', '', '', 39, 0, '2021-09-06 03:05:55', '2021-09-06 01:05:55'),
(204, 'サッカーボール', 8, '', 1000000, 'uploads/b90bbd02bb14ca4d7dac1b5d5afd0a3d11758d93.jpeg', '', '', 39, 0, '2021-09-06 03:12:43', '2021-09-06 01:12:43'),
(205, 'ゲーム機', 11, '', 10000, 'uploads/219257751df1a9f124a582b4e6e353fb840e5338.jpeg', 'uploads/82ef66aaf478509172facbf4a106e151a6d35193.jpeg', 'uploads/e66ec4bb4c8a625096640a3e8dbc8750c4483003.jpeg', 39, 0, '2021-09-06 03:13:54', '2021-09-06 01:13:54'),
(206, 'ゲーム機', 11, '新品です', 100000, 'uploads/219257751df1a9f124a582b4e6e353fb840e5338.jpeg', '', '', 39, 0, '2021-09-06 03:14:49', '2021-09-06 01:14:49'),
(207, 'ノート', 9, '', 100, 'uploads/569c8aaafbd485cb1660aeb4300a2b7b21f32023.jpeg', 'uploads/569c8aaafbd485cb1660aeb4300a2b7b21f32023.jpeg', 'uploads/569c8aaafbd485cb1660aeb4300a2b7b21f32023.jpeg', 39, 0, '2021-09-06 03:17:18', '2021-09-06 01:17:18'),
(208, '山田太郎', 6, '', 110, 'uploads/b90bbd02bb14ca4d7dac1b5d5afd0a3d11758d93.jpeg', '', '', 39, 0, '2021-11-11 07:07:53', '2021-11-11 06:07:53'),
(209, 'mmm', 7, '', 110, 'uploads/397ea61c76b514239e5b370bfd6914ffe2bc32c6.jpeg', '', '', 39, 0, '2021-11-11 07:13:10', '2021-11-11 06:13:10');

-- --------------------------------------------------------

--
-- テーブルの構造 `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `text` varchar(1024) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `question`
--

INSERT INTO `question` (`id`, `detail`, `name`, `phone`, `email`, `text`, `date`) VALUES
(1, '質問', '山田太郎', '08012345678', 'yamada@gmail.com', 'test', '2021-11-11'),
(2, '質問', '山田太郎', '08012345678', 'soumina0317@gmail.com', 'test', '2021-11-11'),
(3, '質問', '山田太郎', '08012345678', 'soumina0317@gmail.com', 'test', '2021-11-11'),
(4, '質問', '山田太郎', '08012345678', 'soumina0317@gmail.com', 'test', '2021-11-11'),
(5, '質問', '山田太郎', '08012345678', 'soumina0317@gmail.com', 'test', '2021-11-11'),
(6, '質問', '', '', '', '', '2021-11-11'),
(7, '質問', '', '', '', '', '2021-11-11'),
(8, '質問', '', '', '', '', '2021-11-11'),
(9, '質問', '', '', '', '', '2021-11-11'),
(10, '質問', '', '', '', '', '2021-11-11'),
(11, '質問', '', '', '', '', '2021-11-11'),
(12, '質問', '', '', '', '', '2021-11-11'),
(13, '質問', '', '', '', '', '2021-11-11'),
(14, '質問', '', '', '', '', '2021-11-11'),
(15, '質問', '', '', '', '', '2021-11-11'),
(16, '質問', '', '', '', '', '2021-11-11'),
(17, '質問', '', '', '', '', '2021-11-11'),
(18, '質問', '', '', '', '', '2021-11-11'),
(19, '質問', '', '', '', '', '2021-11-11'),
(20, '質問', '', '', '', '', '2021-11-11'),
(21, 'トラブルについて', '', '', '', '', '2021-11-11');

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `zip` text DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `delete_flg` tinyint(4) DEFAULT 0,
  `create_date` datetime DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `login_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `username`, `age`, `tel`, `zip`, `addr`, `email`, `password`, `pic`, `delete_flg`, `create_date`, `update_date`, `login_time`) VALUES
(39, 'テスト', 25, '08011112222', '5470014', '大阪', '2011070@g.i-seifu.jp', '$2y$10$JLI0ax/.TBK/WTfTVWHFoOLiuHHoKLXPzYmUZtvyLySKilG4dy.l.', 'uploads/b90bbd02bb14ca4d7dac1b5d5afd0a3d11758d93.jpeg', 0, '2021-07-09 09:19:22', '2021-09-06 05:10:19', '2021-07-09 09:19:22'),
(40, '山田', 20, '08014118282', '5470013', '大阪', 'yamada@gmail.com', '$2y$10$sgoKOG92RKu/v8LWGnXRqO0fXZeylvkT0.HRJcOaSCrMDAO3v5SwW', 'uploads/7113288a38fbd463fc2ab0c1f8e6ab80f5961fe8.png', 0, '2021-09-01 04:54:28', '2021-09-02 01:17:35', '2021-09-01 04:54:28'),
(41, NULL, NULL, NULL, NULL, NULL, 'saitou@gmail.com', '$2y$10$wOb3NWmsAl0zxRnlPnCEoOIfs3rBNe3BdbwXkre6G/WQejpWQBcqC', NULL, 0, '2021-09-01 05:02:45', '2021-09-01 03:02:45', '2021-09-01 05:02:45'),
(42, NULL, NULL, NULL, NULL, NULL, 'tanaka@gmail.com', '$2y$10$nyaoqdckk5Qr1vHuGH1ly..gVo8YvVSc4EAIfbreAOG6LXMWwclnm', NULL, 0, '2021-09-01 05:16:33', '2021-09-01 03:16:33', '2021-09-01 05:16:33'),
(43, NULL, NULL, NULL, NULL, NULL, 'minaki@gmail.com', '$2y$10$FeLpbOp.J.NOdfp96/ZgheodplWrnoLp0CKXYr5L.8NQYYYzT43hG', NULL, 0, '2021-09-03 04:04:25', '2021-09-03 02:04:25', '2021-09-03 04:04:25'),
(44, NULL, NULL, NULL, NULL, NULL, 'yosida@gmail.com', '$2y$10$VLStIkSchxdvwyVSSpKqAOX5CGKtXsTLcaQMoR0kNQ5/bzevbU5He', NULL, 0, '2021-09-03 04:26:08', '2021-09-03 02:26:08', '2021-09-03 04:26:08');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `bord`
--
ALTER TABLE `bord`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `like`
--
ALTER TABLE `like`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `bord`
--
ALTER TABLE `bord`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- テーブルの AUTO_INCREMENT `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- テーブルの AUTO_INCREMENT `like`
--
ALTER TABLE `like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- テーブルの AUTO_INCREMENT `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- テーブルの AUTO_INCREMENT `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- テーブルの AUTO_INCREMENT `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- テーブルの AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

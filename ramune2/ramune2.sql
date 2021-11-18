-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2021-11-15 02:07:04
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
(210, 'サンプル', 6, '', 1000, 'uploads/569c8aaafbd485cb1660aeb4300a2b7b21f32023.jpeg', 'uploads/b90bbd02bb14ca4d7dac1b5d5afd0a3d11758d93.jpeg', 'uploads/82ef66aaf478509172facbf4a106e151a6d35193.jpeg', 39, 0, '2021-11-15 01:44:03', '2021-11-15 00:44:03'),
(211, 'サンプル2', 6, '', 1000, 'uploads/569c8aaafbd485cb1660aeb4300a2b7b21f32023.jpeg', 'uploads/dad9180a9e75ed8bcf5f989984ab05fbeda03671.jpeg', 'uploads/25f454b1851aa9b5566b5d4fa5cb9771c64967f5.jpeg', 39, 0, '2021-11-15 01:44:47', '2021-11-15 00:44:58'),
(212, 'サンプル3', 6, '', 2000, 'uploads/569c8aaafbd485cb1660aeb4300a2b7b21f32023.jpeg', '', '', 39, 0, '2021-11-15 01:45:41', '2021-11-15 00:45:41'),
(213, 'サンプル4', 6, '', 2000, 'uploads/569c8aaafbd485cb1660aeb4300a2b7b21f32023.jpeg', '', '', 39, 0, '2021-11-15 01:46:19', '2021-11-15 00:46:19'),
(214, 'サンプル5', 7, '', 3000, 'uploads/569c8aaafbd485cb1660aeb4300a2b7b21f32023.jpeg', '', '', 39, 0, '2021-11-15 01:46:56', '2021-11-15 00:46:56'),
(215, 'サンプル6', 7, '', 3000, 'uploads/569c8aaafbd485cb1660aeb4300a2b7b21f32023.jpeg', 'uploads/b6feb118d49966f78de8f9faf1da6d496347c157.jpeg', '', 39, 0, '2021-11-15 01:47:35', '2021-11-15 00:47:35'),
(216, 'サンプル7', 7, '', 4000, 'uploads/569c8aaafbd485cb1660aeb4300a2b7b21f32023.jpeg', '', '', 39, 0, '2021-11-15 01:48:09', '2021-11-15 00:48:09'),
(217, 'サンプル8', 7, '', 10000, 'uploads/569c8aaafbd485cb1660aeb4300a2b7b21f32023.jpeg', '', '', 39, 0, '2021-11-15 01:48:52', '2021-11-15 00:48:52'),
(218, 'サンプル9', 6, '', 9000, 'uploads/dbb1db4c1c32700b99d573b686307c0bc025a059.jpeg', '', '', 40, 0, '2021-11-15 01:50:18', '2021-11-15 00:50:18'),
(219, 'サンプル10', 7, '', 20000, 'uploads/dbb1db4c1c32700b99d573b686307c0bc025a059.jpeg', '', '', 40, 0, '2021-11-15 01:50:51', '2021-11-15 00:50:51'),
(220, 'サンプル11', 8, '', 30000, 'uploads/dbb1db4c1c32700b99d573b686307c0bc025a059.jpeg', '', '', 40, 0, '2021-11-15 01:51:25', '2021-11-15 00:51:25'),
(221, 'サンプル12', 9, '', 7000, 'uploads/dbb1db4c1c32700b99d573b686307c0bc025a059.jpeg', '', '', 40, 0, '2021-11-15 01:52:21', '2021-11-15 00:52:21'),
(222, 'サンプル13', 10, '', 40000, 'uploads/dbb1db4c1c32700b99d573b686307c0bc025a059.jpeg', '', '', 40, 0, '2021-11-15 01:52:50', '2021-11-15 00:52:50'),
(223, 'サンプル14', 10, '', 12000, 'uploads/dbb1db4c1c32700b99d573b686307c0bc025a059.jpeg', '', '', 40, 0, '2021-11-15 01:53:17', '2021-11-15 00:53:17'),
(224, 'サンプル15', 6, '', 6000, 'uploads/dbb1db4c1c32700b99d573b686307c0bc025a059.jpeg', '', '', 40, 0, '2021-11-15 01:53:41', '2021-11-15 00:53:41'),
(225, 'サンプル16', 7, '', 1, 'uploads/dbb1db4c1c32700b99d573b686307c0bc025a059.jpeg', '', '', 40, 0, '2021-11-15 01:54:14', '2021-11-15 00:54:14'),
(226, 'サンプル17', 10, '', 5000, 'uploads/b90bbd02bb14ca4d7dac1b5d5afd0a3d11758d93.jpeg', '', '', 42, 0, '2021-11-15 01:55:39', '2021-11-15 00:55:39'),
(227, 'サンプル18', 7, '', 1000, 'uploads/b90bbd02bb14ca4d7dac1b5d5afd0a3d11758d93.jpeg', '', '', 42, 0, '2021-11-15 01:56:33', '2021-11-15 00:56:33'),
(228, 'サンプル19', 8, '', 11111, 'uploads/b90bbd02bb14ca4d7dac1b5d5afd0a3d11758d93.jpeg', '', '', 42, 0, '2021-11-15 01:56:59', '2021-11-15 00:56:59'),
(229, 'サンプル20', 9, '', 2147483647, 'uploads/b90bbd02bb14ca4d7dac1b5d5afd0a3d11758d93.jpeg', '', '', 42, 0, '2021-11-15 01:57:23', '2021-11-15 00:58:03'),
(230, 'サンプル21', 8, '', 10000, 'uploads/569c8aaafbd485cb1660aeb4300a2b7b21f32023.jpeg', '', '', 41, 0, '2021-11-15 01:59:34', '2021-11-15 00:59:34'),
(231, 'サンプル22', 6, '', 5000, 'uploads/dbb1db4c1c32700b99d573b686307c0bc025a059.jpeg', '', '', 41, 0, '2021-11-15 02:00:09', '2021-11-15 01:00:09'),
(232, 'サンプル23', 10, '', 8000, 'uploads/b90bbd02bb14ca4d7dac1b5d5afd0a3d11758d93.jpeg', '', '', 41, 0, '2021-11-15 02:00:40', '2021-11-15 01:00:40'),
(233, 'サンプル24', 11, '', 100000, 'uploads/b90bbd02bb14ca4d7dac1b5d5afd0a3d11758d93.jpeg', '', '', 41, 0, '2021-11-15 02:01:02', '2021-11-15 01:01:02'),
(236, 'サンプル25', 11, '', 9000, 'uploads/569c8aaafbd485cb1660aeb4300a2b7b21f32023.jpeg', '', '', 41, 0, '2021-11-15 02:01:49', '2021-11-15 01:01:49'),
(237, 'サンプル26', 7, '', 7000, 'uploads/b90bbd02bb14ca4d7dac1b5d5afd0a3d11758d93.jpeg', '', '', 41, 0, '2021-11-15 02:02:12', '2021-11-15 01:02:12'),
(238, 'サンプル27', 9, '', 2000, 'uploads/569c8aaafbd485cb1660aeb4300a2b7b21f32023.jpeg', '', '', 41, 0, '2021-11-15 02:02:41', '2021-11-15 01:02:41'),
(239, 'サンプル28', 7, '', 50000, 'uploads/82ef66aaf478509172facbf4a106e151a6d35193.jpeg', '', '', 41, 0, '2021-11-15 02:03:00', '2021-11-15 01:03:00'),
(240, 'サンプル29', 6, '', 11000, 'uploads/dbb1db4c1c32700b99d573b686307c0bc025a059.jpeg', '', '', 41, 0, '2021-11-15 02:03:31', '2021-11-15 01:03:31'),
(241, 'サンプル30', 8, '', 100000, 'uploads/82ef66aaf478509172facbf4a106e151a6d35193.jpeg', '', '', 44, 0, '2021-11-15 02:04:53', '2021-11-15 01:04:53'),
(242, 'サンプル31', 9, '', 30000, 'uploads/b90bbd02bb14ca4d7dac1b5d5afd0a3d11758d93.jpeg', '', '', 44, 0, '2021-11-15 02:05:23', '2021-11-15 01:05:23'),
(243, 'サンプル32', 11, '', 70000, 'uploads/569c8aaafbd485cb1660aeb4300a2b7b21f32023.jpeg', '', '', 44, 0, '2021-11-15 02:05:59', '2021-11-15 01:05:59'),
(244, 'サンプル33', 8, '', 20000, 'uploads/b90bbd02bb14ca4d7dac1b5d5afd0a3d11758d93.jpeg', '', '', 44, 0, '2021-11-15 02:06:14', '2021-11-15 01:06:14');

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
(21, 'トラブルについて', '', '', '', '', '2021-11-11'),
(22, 'トラブルについて', '', '', '', '', '2021-11-11'),
(23, 'トラブルについて', '', '', '', '', '2021-11-11'),
(24, 'トラブルについて', '', '', '', '', '2021-11-11'),
(25, 'トラブルについて', '', '', '', '', '2021-11-11'),
(26, 'トラブルについて', '', '', '', '', '2021-11-11'),
(27, 'トラブルについて', '', '', '', '', '2021-11-11'),
(28, 'トラブルについて', '', '', '', '', '2021-11-11'),
(29, '質問', '皆木颯介', '', '', 'test', '2021-11-11');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- テーブルの AUTO_INCREMENT `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- テーブルの AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

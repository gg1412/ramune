-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2021-11-26 07:40:07
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
(137, 39, 39, 0, '2021-11-25 04:08:30', 257, '2021-11-25 03:08:30'),
(138, 40, 39, 0, '2021-11-26 06:39:21', 258, '2021-11-26 05:39:21');

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
-- テーブルの構造 `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `sale_username` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `pic` varchar(255) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `history`
--

INSERT INTO `history` (`id`, `user_name`, `sale_username`, `product_name`, `price`, `user_id`, `product_id`, `pic`, `date`) VALUES
(25, 'テスト', '', '山田太郎', 0, 39, 0, 'uploads/b6feb118d49966f78de8f9faf1da6d496347c157.jpeg', '2021-11-26'),
(26, '山田', '', 'test', 0, 39, 0, 'uploads/57f5b81325cd52985d40bb91f425667f9b17f13c.jpeg', '2021-11-26');

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
  `school` varchar(255) NOT NULL,
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

INSERT INTO `product` (`id`, `name`, `school`, `category_id`, `comment`, `price`, `pic1`, `pic2`, `pic3`, `user_id`, `delete_flg`, `create_date`, `update_date`) VALUES
(257, '山田太郎', '', 7, '', 0, 'uploads/b6feb118d49966f78de8f9faf1da6d496347c157.jpeg', '', '', 39, 0, '2021-11-25 04:08:18', '2021-11-25 03:08:18'),
(258, 'test', '', 6, '', 0, 'uploads/57f5b81325cd52985d40bb91f425667f9b17f13c.jpeg', '', '', 40, 0, '2021-11-26 06:38:59', '2021-11-26 05:38:59');

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
(39, 'テスト', 30, '08011112222', '1234567', '大阪', '2011070@g.i-seifu.jp', '$2y$10$JLI0ax/.TBK/WTfTVWHFoOLiuHHoKLXPzYmUZtvyLySKilG4dy.l.', 'uploads/dad9180a9e75ed8bcf5f989984ab05fbeda03671.jpeg', 0, '2021-07-09 09:19:22', '2021-11-18 05:54:53', '2021-07-09 09:19:22'),
(40, '山田', 20, '08014118282', '5470013', '大阪', 'yamada@gmail.com', '$2y$10$sgoKOG92RKu/v8LWGnXRqO0fXZeylvkT0.HRJcOaSCrMDAO3v5SwW', 'uploads/7113288a38fbd463fc2ab0c1f8e6ab80f5961fe8.png', 0, '2021-09-01 04:54:28', '2021-09-02 01:17:35', '2021-09-01 04:54:28'),
(41, NULL, NULL, NULL, NULL, NULL, 'saitou@gmail.com', '$2y$10$wOb3NWmsAl0zxRnlPnCEoOIfs3rBNe3BdbwXkre6G/WQejpWQBcqC', NULL, 0, '2021-09-01 05:02:45', '2021-09-01 03:02:45', '2021-09-01 05:02:45'),
(42, 'tanaka', 0, '08014118282', '1234567', '', 'tanaka@gmail.com', '$2y$10$nyaoqdckk5Qr1vHuGH1ly..gVo8YvVSc4EAIfbreAOG6LXMWwclnm', '', 0, '2021-09-01 05:16:33', '2021-11-24 05:46:38', '2021-09-01 05:16:33'),
(43, NULL, NULL, NULL, NULL, NULL, 'minaki@gmail.com', '$2y$10$FeLpbOp.J.NOdfp96/ZgheodplWrnoLp0CKXYr5L.8NQYYYzT43hG', NULL, 0, '2021-09-03 04:04:25', '2021-09-03 02:04:25', '2021-09-03 04:04:25'),
(44, NULL, NULL, NULL, NULL, NULL, 'yosida@gmail.com', '$2y$10$VLStIkSchxdvwyVSSpKqAOX5CGKtXsTLcaQMoR0kNQ5/bzevbU5He', NULL, 0, '2021-09-03 04:26:08', '2021-09-03 02:26:08', '2021-09-03 04:26:08'),
(45, NULL, NULL, NULL, NULL, NULL, 'fujinami@gmail.com', '$2y$10$EdNHgnHohnbNvaTbVUekWO3lC6oSv27ZpaLZGBeQ.348voAApRPaW', NULL, 0, '2021-11-15 05:35:34', '2021-11-15 04:35:34', '2021-11-15 05:35:34'),
(46, NULL, NULL, NULL, NULL, NULL, '2011070@i-seifu.jp', '$2y$10$3NS/3A5.IGJcQLnLMUAUi.7.GxzNlkupgjtFY8tinTQAsxWiEapom', NULL, 0, '2021-11-15 07:04:51', '2021-11-15 06:04:51', '2021-11-15 07:04:51'),
(47, NULL, NULL, NULL, NULL, NULL, 'soumina0317@gmail.com', '$2y$10$5Ni6RbGw5sVT/tRPeA8h7.5w9BO.llJ.4cWIby.L2.omoNIh2GU/S', NULL, 0, '2021-11-15 07:10:25', '2021-11-15 06:10:25', '2021-11-15 07:10:25'),
(48, NULL, NULL, NULL, NULL, NULL, '2002039@i-seifu.jp', '$2y$10$q2nDuqDC7ZpM1xUUbedfuOXuvFvLQs4XX7QRwz8AWhA9IBmtNMmJu', NULL, 0, '2021-11-22 07:38:39', '2021-11-22 06:38:39', '2021-11-22 07:38:39');

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
-- テーブルのインデックス `history`
--
ALTER TABLE `history`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- テーブルの AUTO_INCREMENT `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- テーブルの AUTO_INCREMENT `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- テーブルの AUTO_INCREMENT `like`
--
ALTER TABLE `like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- テーブルの AUTO_INCREMENT `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- テーブルの AUTO_INCREMENT `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- テーブルの AUTO_INCREMENT `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- テーブルの AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

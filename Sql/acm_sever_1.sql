-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 2018-02-22 23:19:26
-- 服务器版本： 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `acm_sever_1`
--

-- --------------------------------------------------------

--
-- 表的结构 `contest_information_1`
--

DROP TABLE IF EXISTS `contest_information_1`;
CREATE TABLE IF NOT EXISTS `contest_information_1` (
  `contest_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `begin_time` datetime NOT NULL,
  `duration` int(11) NOT NULL,
  `limit_par` int(11) NOT NULL,
  `name` varchar(1000) COLLATE utf8_bin NOT NULL,
  `creator_id` int(11) NOT NULL,
  `problem_number` int(11) NOT NULL,
  PRIMARY KEY (`contest_id`),
  KEY `contest_id` (`contest_id`),
  KEY `level` (`level`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `contest_information_1`
--

INSERT INTO `contest_information_1` (`contest_id`, `level`, `type`, `begin_time`, `duration`, `limit_par`, `name`, `creator_id`, `problem_number`) VALUES
(1, 0, 1, '2018-02-13 00:00:00', 120, 1, 'First easy test', -9945157, 6);

-- --------------------------------------------------------

--
-- 表的结构 `contest_information_2`
--

DROP TABLE IF EXISTS `contest_information_2`;
CREATE TABLE IF NOT EXISTS `contest_information_2` (
  `id` int(11) NOT NULL,
  `contest_id` int(11) NOT NULL,
  `problem_id` int(11) NOT NULL,
  `order_number` int(11) NOT NULL,
  `change_problem_name` varchar(1000) COLLATE utf8_bin NOT NULL,
  `score` int(11) NOT NULL,
  `pass_number` int(11) NOT NULL,
  `test_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contest_id` (`contest_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `contest_information_2`
--

INSERT INTO `contest_information_2` (`id`, `contest_id`, `problem_id`, `order_number`, `change_problem_name`, `score`, `pass_number`, `test_number`) VALUES
(1, 1, 1011, 1, 'MOD', 500, 1, 1),
(2, 1, 1010, 2, '', 1000, 0, 0),
(3, 1, 1014, 3, '', 1500, 0, 0),
(4, 1, 1015, 4, '', 2000, 0, 0),
(5, 1, 1013, 5, '', 2500, 0, 0),
(6, 1, 1002, 6, '', 3500, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `contest_pro_submit`
--

DROP TABLE IF EXISTS `contest_pro_submit`;
CREATE TABLE IF NOT EXISTS `contest_pro_submit` (
  `id` int(11) NOT NULL,
  `contest_id` int(11) NOT NULL,
  `problem_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `competitor` int(11) NOT NULL,
  `language` int(11) NOT NULL,
  `submit_time` datetime NOT NULL,
  `result` int(11) NOT NULL,
  `u_time` int(11) NOT NULL,
  `u_memory` int(11) NOT NULL,
  `code` varchar(15000) COLLATE utf8_bin NOT NULL,
  `compile` varchar(5000) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `result` (`result`),
  KEY `contest_id` (`contest_id`),
  KEY `contest_id_2` (`contest_id`,`problem_id`,`result`),
  KEY `contest_id_3` (`contest_id`,`problem_id`,`user_id`,`result`),
  KEY `contest_id_4` (`contest_id`,`user_id`,`result`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `contest_pro_submit`
--

INSERT INTO `contest_pro_submit` (`id`, `contest_id`, `problem_id`, `user_id`, `competitor`, `language`, `submit_time`, `result`, `u_time`, `u_memory`, `code`, `compile`) VALUES
(10, 1, 1, -9945157, 0, 3, '2018-02-13 23:46:00', 11, 408, 3488, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e5+7 , mz = 1e9+7;\r\nint a[N];\r\n\r\nint main(){\r\n    a[1] = a[2] = 1;\r\n    for(int i = 3 ; i < N ; i++)    a[i] = (a[i-1]+a[i-2])%mz;\r\n    int T;\r\n    cin>>T;\r\n    while( T-- ){\r\n        int n;\r\n        cin>>n;\r\n        cout<<a[n]<<endl;\r\n    }\r\n    return 0;\r\n}\r\n', 'gcc: error: main.c: No such file or directory');

-- --------------------------------------------------------

--
-- 表的结构 `contest_ranks_information_1`
--

DROP TABLE IF EXISTS `contest_ranks_information_1`;
CREATE TABLE IF NOT EXISTS `contest_ranks_information_1` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `contest_id` int(11) NOT NULL,
  `pass_time` time NOT NULL,
  `pass_problem_id` int(11) NOT NULL,
  `add_score` int(11) NOT NULL,
  `error_record` int(11) NOT NULL,
  `lock_problem` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`contest_id`,`lock_problem`),
  KEY `user_id_2` (`user_id`,`contest_id`,`add_score`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `contest_ranks_information_1`
--

INSERT INTO `contest_ranks_information_1` (`id`, `user_id`, `contest_id`, `pass_time`, `pass_problem_id`, `add_score`, `error_record`, `lock_problem`) VALUES
(25, -9945157, 1, '23:46:00', 1, 150, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `contest_ranks_information_2`
--

DROP TABLE IF EXISTS `contest_ranks_information_2`;
CREATE TABLE IF NOT EXISTS `contest_ranks_information_2` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `contest_id` int(11) NOT NULL,
  `total_score` int(11) NOT NULL,
  `end_ranks` int(11) NOT NULL,
  `previous_ranting` int(11) NOT NULL,
  `add_rating` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contest_id` (`contest_id`),
  KEY `user_id` (`user_id`,`contest_id`),
  KEY `contest_id_2` (`contest_id`,`end_ranks`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `contest_ranks_information_2`
--

INSERT INTO `contest_ranks_information_2` (`id`, `user_id`, `contest_id`, `total_score`, `end_ranks`, `previous_ranting`, `add_rating`) VALUES
(2, -9945157, 1, 150, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `huck_submit`
--

DROP TABLE IF EXISTS `huck_submit`;
CREATE TABLE IF NOT EXISTS `huck_submit` (
  `id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `submit_user` int(11) NOT NULL,
  `huck_user` int(11) NOT NULL,
  `huck_time` datetime NOT NULL,
  `result` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `submit_user` (`submit_user`),
  KEY `huck_user` (`huck_user`),
  KEY `result` (`result`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `huck_submit`
--

INSERT INTO `huck_submit` (`id`, `status_id`, `submit_user`, `huck_user`, `huck_time`, `result`) VALUES
(5, 40, -9945157, 1, '2018-02-16 23:48:29', 1);

-- --------------------------------------------------------

--
-- 表的结构 `loading_flag`
--

DROP TABLE IF EXISTS `loading_flag`;
CREATE TABLE IF NOT EXISTS `loading_flag` (
  `loading_id` int(11) NOT NULL,
  `flag1` int(11) NOT NULL,
  `flag2` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `last_updata_times` datetime NOT NULL,
  PRIMARY KEY (`loading_id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `loading_flag`
--

INSERT INTO `loading_flag` (`loading_id`, `flag1`, `flag2`, `id`, `last_updata_times`) VALUES
(93, 31201746, 91688081, -1, '2018-02-19 18:58:56'),
(96, 74597586, 50037635, -9945157, '2018-02-22 23:15:09'),
(95, 95887812, 84426091, -9945157, '2018-02-21 14:20:47'),
(94, 32790874, 73368741, -1, '2018-02-19 18:59:53'),
(89, 72701624, 36813831, -9945157, '2018-02-19 16:40:44'),
(92, 61605190, 30234342, -1, '2018-02-19 18:55:47'),
(91, 83228161, 98153857, -1, '2018-02-19 18:54:48'),
(90, 66177231, 41205482, -1, '2018-02-19 18:54:40');

-- --------------------------------------------------------

--
-- 表的结构 `problem_information_1`
--

DROP TABLE IF EXISTS `problem_information_1`;
CREATE TABLE IF NOT EXISTS `problem_information_1` (
  `pro_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `time_limit` int(11) NOT NULL,
  `memory_limit` int(11) NOT NULL,
  `time_limit_java` int(11) NOT NULL,
  `memory_limit_java` int(11) NOT NULL,
  `input` varchar(1500) NOT NULL,
  `output` varchar(1500) NOT NULL,
  `AC` int(11) NOT NULL,
  `submit` int(11) NOT NULL,
  PRIMARY KEY (`pro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `problem_information_1`
--

INSERT INTO `problem_information_1` (`pro_id`, `title`, `time_limit`, `memory_limit`, `time_limit_java`, `memory_limit_java`, `input`, `output`, `AC`, `submit`) VALUES
(1000, 'A+B Problem', 500, 5, 1000, 10, 'Single example.\r\nTwo integer a,b (0<=a,b<=10^9)', 'Output a+b', 8, 12),
(1001, 'Maximum Gcd', 1000, 128, 2000, 128, 'There is only one test case .\r\nThe first line contains a integer n ( 2 â‰¤ n â‰¤ 10^3 )  , which is the number of integers .\r\nThe second line contains n integers a1,a2...an ( 1 â‰¤ ai â‰¤ 10^9  )  separated by a space .', 'Print 3 integers i , j , k  in a line separated by a space .\r\nIf there are multiple answers , minimize i , then minimize j .', 2, 6),
(1002, 'Count ACM', 1000, 128, 2000, 128, 'For each case, there is only one line giving a string of no more than 10^5\r\n\r\nThere are many cases.It is end with EOF\r\n\r\ncharacters containing only A, C, or M.', 'For each test case, print in one line the number of ACM\'s contained in the string. Since the result may be a huge number, you only have to output the result moded by 1000000007.', 1, 5),
(1003, 'Longest Elegant Subsequence', 3000, 128, 6000, 128, 'There are multiple test cases.\r\n\r\nThe first line of the input contains an integer T(T<=10) which indicates the number of test cases.\r\n\r\nFor each test case, the first line contains an integer n(0 < n < 10^6) indicating the length of the sequence that sister Guo have got.\r\n\r\nThe second line contains n integers a1,a2,...,an(0 <= ai <= 10^9) separated by spaces.', 'For each test case, output the length of the longest elegant subsequence.', 1, 1),
(1004, 'a x b (â… )', 2000, 64, 4000, 64, 'æœ¬é¢˜æœ‰å¤šç»„æ•°æ®\r\næ¯ç»„æ•°æ®æœ‰ä¸€è¡Œ2ä¸ªæ•´æ•°a, b(0<=a,b<=10^5), ç”±ç©ºæ ¼éš”å¼€\r\nè¯·å¤„ç†åˆ°æ–‡ä»¶æœ«å°¾', 'æ¯ç»„æµ‹è¯•æ ·ä¾‹è¾“å‡ºä¸€è¡Œä¸€ä¸ªæ•´æ•°ï¼Œè¡¨ç¤ºa x bçš„ç»“æžœ', 5, 8),
(1005, 'a x b (â…¡)', 1000, 128, 2000, 128, 'æœ¬é¢˜æœ‰å¤šç»„æ•°æ®\r\næ¯ç»„æ•°æ®æœ‰ä¸€è¡Œ2ä¸ªæ•´æ•°a, b(0<=a,b<=10^1000), ç”±ç©ºæ ¼éš”å¼€\r\nè¯·å¤„ç†åˆ°æ–‡ä»¶æœ«å°¾', 'æ¯ç»„æµ‹è¯•æ ·ä¾‹è¾“å‡ºä¸€è¡Œä¸€ä¸ªæ•´æ•°ï¼Œè¡¨ç¤ºa x bçš„ç»“æžœ', 1, 2),
(1006, 'a x b (â…¢)', 3000, 128, 6000, 128, 'æœ¬é¢˜æœ‰å¤šç»„æ•°æ®\r\næ¯ç»„æ•°æ®æœ‰ä¸€è¡Œ2ä¸ªæ•´æ•°a, b(0<=a,b<=10^100000), ç”±ç©ºæ ¼éš”å¼€\r\nè¯·å¤„ç†åˆ°æ–‡ä»¶æœ«å°¾', 'å¯¹æ¯ç»„æ•°æ®ï¼Œè¾“å‡ºä¸€è¡Œä¸€ä¸ªæ•´æ•°ï¼Œè¡¨ç¤ºa x bçš„ç»“æžœ', 1, 2),
(1007, 'äºŒç»´GCDå‰ç¼€ç§¯', 2000, 128, 3000, 128, 'å¤šç»„æ•°æ®\r\n\r\nç¬¬ä¸€è¡Œæœ‰ä¸€ä¸ªæ•´æ•°T(T<=20)ï¼Œä»£è¡¨æ•°æ®ç»„æ•°\r\n\r\nå¯¹æ¯ç»„æ•°æ®ï¼Œæœ‰ä¸¤ä¸ªç”±ç©ºæ ¼åˆ†éš”çš„æ•´æ•°nï¼Œm(1<=n, m <= 10^7)', 'å¯¹æ¯ç»„æ•°æ®ï¼Œè¾“å‡ºç­”æ¡ˆé™¤ä»¥998244353çš„ä½™æ•°', 0, 0),
(1008, 'COS12', 1000, 128, 2000, 128, 'å¤šç»„æ•°æ®\r\n\r\nç¬¬ä¸€è¡Œæœ‰ä¸€ä¸ªæ•´æ•°T(T<=20)ï¼Œä»£è¡¨æ•°æ®ç»„æ•°ã€‚\r\n\r\nå¯¹æ¯ç»„æ•°æ®ï¼Œåªæœ‰ä¸¤ä¸ªæ•´æ•°nå’Œm(0 < n, m <= 500)ï¼Œè¡¨ç¤ºCOS12æ¡Œé¢çš„å¤§å°ã€‚', 'å¯¹æ¯ç»„æ•°æ®ï¼Œè¾“å‡ºæ¡Œé¢ä¸Šæœ€å¤šèƒ½æ”¾ç½®çš„å›¾æ ‡æ•°é‡ã€‚', 0, 0),
(1009, 'mzè¯­è€ƒè¯•', 1000, 128, 2000, 128, 'å¤šç»„æ•°æ®\r\n\r\nç¬¬ä¸€è¡Œæœ‰ä¸€ä¸ªæ•´æ•°T(T<=30)ï¼Œä»£è¡¨æ•°æ®ç»„æ•°ã€‚\r\n\r\nå¯¹æ¯ç»„æ•°æ®ï¼Œç¬¬ä¸€è¡Œæœ‰ä¸¤ä¸ªæ•´æ•°Rã€C(1 <= R, C <= 50)ï¼Œè¡¨ç¤ºè€ƒåœºè§„æ¨¡ã€‚\r\n\r\næŽ¥ä¸‹æ¥Rè¡Œï¼Œæ¯è¡Œæœ‰ä¸€ä¸ªé•¿åº¦ä¸ºCçš„å­—ç¬¦ä¸²ï¼Œæè¿°è€ƒåœºå†…æ¯ä¸ªä½ç½®ã€‚\'.\'è¡¨ç¤ºè¯¥ä½ç½®å¯ç”¨ï¼Œ\'x\'åˆ™è¡¨ç¤ºå·²æŸåã€‚', 'å¯¹æ¯ç»„æ•°æ®ï¼Œè¾“å‡ºè¯¥è€ƒåœºå†…æœ€å¤šèƒ½å®‰æŽ’çš„è€ƒç”Ÿæ•°ã€‚', 0, 0),
(1010, 'è½¦ä¸Šè¿˜å‰©å‡ äºº', 500, 64, 1000, 64, 'å¤šç»„æ ·ä¾‹\r\nç¬¬ä¸€è¡Œè¾“å…¥ä¸€ä¸ªTï¼ˆT <= 20ï¼‰\r\nå¯¹äºŽæ¯ç»„æ ·ä¾‹ï¼š\r\nç¬¬ä¸€è¡Œè¾“å…¥ä¸¤ä¸ªæ•´æ•°n,mï¼Œåˆ†åˆ«è¡¨ç¤ºèµ·ç‚¹ç«™æœ‰å¤šå°‘äººå’Œæœ‰å¤šå°‘ä¸ªç«™ï¼ˆ1<=n<=10^9 , 0 <= m <= 10^6ï¼‰\r\næŽ¥ä¸‹æ¥mè¡Œæ¯è¡Œä¸¤ä¸ªæ•°ai , biè¡¨ç¤ºæ¯ä¸€ç«™ä¸Šä¸‹è½¦äººæ•° ( 1<=ai,bi<=10^9 )', 'è¾“å‡ºä¸€ä¸ªæ•´æ•°è¡¨ç¤ºç­”æ¡ˆï¼Œå¦‚æžœä¸å¯èƒ½ï¼Œåˆ™è¾“å‡ºâ€˜-1â€™', 0, 0),
(1011, 'å¯å¯å¯çš„æ–æ³¢æ‹‰å¥‘æ•°åˆ—', 1000, 128, 2000, 128, 'ç¬¬ä¸€è¡Œè¾“å…¥ä¸€ä¸ªæ­£æ•´æ•°Tè¡¨ç¤ºTç»„æ ·ä¾‹ï¼ˆT<=100ï¼‰\r\næŽ¥ä¸‹æ¥æ¯ä¸ªæ ·ä¾‹è¾“å…¥ä¸€ä¸ªæ­£æ•´æ•°Nï¼ˆN<=10^5ï¼‰', 'æ¯ç»„æ ·ä¾‹è¾“å‡ºä¸€ä¸ªæ•´æ•°è¡¨ç¤ºå¯å¯æ‰€æ±‚çš„æ–æ³¢æ‹‰å¥‘ç¬¬Né¡¹æ¨¡10^9+7', 1, 1),
(1012, 'æœ€å°ç”Ÿæˆæ ‘', 1000, 128, 2000, 256, 'ç¬¬ä¸€è¡Œè¾“å…¥ä¸€ä¸ªTè¡¨ç¤ºæœ‰Tç»„æ ·ä¾‹ï¼ˆT <= 10ï¼‰\r\næŽ¥ä¸‹æ¥æ¯ç»„æ ·ä¾‹\r\nç¬¬ä¸€è¡Œè¾“å…¥ä¸€ä¸ªN Mè¡¨ç¤ºNä¸ªç‚¹ï¼ŒMæ¡è¾¹( 2 <= N <= 10^5 , 1 <= M <= min(N*(N-1)/2),10^5)\r\næŽ¥ä¸‹æ¥Mè¡Œè¾“å…¥ui , vi, wiè¡¨ç¤ºä»Žui åˆ° vi æœ‰ä¸€æ¡æ— å‘è¾¹ï¼Œé•¿åº¦ä¸ºwiï¼Œï¼ˆ1 <= ui , vi <= N , 1 <= wi <= 10^9 ï¼‰\r\n', 'æ¯ç»„æ ·ä¾‹è¾“å‡ºå°†å›¾å…¨è”é€šæœ€å°æƒé‡åœ¨ä¸€è¡Œ', 0, 0),
(1013, 'cwwä¸Žwcw', 1000, 128, 1000, 128, 'å•ç»„æ ·ä¾‹\r\nç¬¬ä¸€è¡Œè¾“å…¥ä¸€ä¸ªNè¡¨ç¤ºå¯å¯æœ‰Næ¬¡cæˆ–è€…wæ“ä½œï¼ˆ1<=N<=100ï¼‰\r\nç¬¬äºŒè¡Œè¾“å…¥ä¸€ä¸ªé•¿åº¦ä¸ºNçš„å­—ç¬¦ä¸²ï¼Œè¡¨ç¤ºå¯å¯çš„c,wæ“ä½œé¡ºåºï¼ˆä¿è¯å­—ç¬¦ä¸²ä¸­åªå‡ºçŽ°c,wï¼‰', 'è¾“å‡ºä¸€ä¸ªæ•´æ•°è¡¨ç¤ºæœ€é«˜çš„å¹³å‡é€Ÿåº¦', 0, 4),
(1014, 'DQ4', 1000, 128, 2000, 256, 'å•ç»„æ ·ä¾‹\r\nå…±å››è¡Œ\r\næ¯è¡Œè¾“å…¥xi,yi,hpi\r\nå…¶ä¸­(1<=i<=4 , 1<=xi<=1000, 1<=yi<500 , 1<=hpi<=1500)', 'å¦‚æžœèƒ½å¤Ÿæ‰“è´¥é»‘æš—ç¥­ç¥€å°±è¾“å‡ºä¸€ä¸ªæ•°å­—è¡¨ç¤ºæœ€å°‘éœ€è¦å¤šå°‘å›žåˆ\r\nå¦åˆ™è¾“å‡º\"Go to leveling\";', 0, 0),
(1015, 'ç™¾ä¸‡è‹±é›„', 1000, 128, 1000, 128, 'å•ç»„æ ·ä¾‹\r\næ¯ç»„æ ·ä¾‹å…ˆè¾“å…¥åäºŒä¸ªæ•°è¡¨ç¤ºæŒ‰é¡ºåºå¯¹æ¯é“é¢˜çš„æŠŠæ¡ç¨‹åº¦ï¼ˆè¿™åäºŒä¸ªæ•°åªä¼šå‡ºçŽ°1,2,3ä¸­çš„ä¸€ä¸ªï¼‰\r\nç„¶åŽç»™å‡º3ä¸ªæ•°ï¼Œåˆ†åˆ«è¡¨ç¤ºä¸åŒ…æ‹¬å¯å¯åœ¨å†…çš„ç­”å¯¹ç¬¬å…­é¢˜ï¼Œç¬¬åäºŒé¢˜äººæ•°å’Œå›¢æˆ˜ç“œåˆ†çš„é˜Ÿæ•°(äººæ•°ä¿è¯å°‘äºŽ500ä¸‡ï¼Œä¸”ç¬¬åäºŒé¢˜ç­”å¯¹äººæ•°ä¸å¤šäºŽç¬¬å…­é¢˜ï¼Œé˜Ÿä¼æ•°å°‘äºŽå‘ä¸‹å–æ•´[äººæ•°/3])', 'è¾“å‡ºä¸€ä¸ªæ•°è¡¨ç¤ºå¯å¯èŽ·å¾—å¥–é‡‘çš„æ•°å­¦æœŸæœ›\r\nä¸Žæ ‡å‡†ç­”æ¡ˆè¯¯å·®å°äºŽ10^-6å³å¯', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `problem_information_2`
--

DROP TABLE IF EXISTS `problem_information_2`;
CREATE TABLE IF NOT EXISTS `problem_information_2` (
  `pro_id` int(11) NOT NULL,
  `description` varchar(9000) NOT NULL,
  `sample_input` varchar(1500) NOT NULL,
  `sample_output` varchar(1500) NOT NULL,
  PRIMARY KEY (`pro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `problem_information_2`
--

INSERT INTO `problem_information_2` (`pro_id`, `description`, `sample_input`, `sample_output`) VALUES
(1000, 'Calculate a+b', '2 3', '5'),
(1001, 'You have n positive integers a1,a2...an , and we define f( i , j ) = gcd( ai , aj )   ( i â‰  j ) \r\nNow I want you to find the index i , j that maximizes k = f( i , j )  .', '5\r\n2 6 9 15 4', '2 3 3'),
(1002, 'The string CAACAM contains two ACM\'s as subsequence. The first one is formed by the 2nd, the 4th,and the 6th characters, \r\n\r\nand the second one is formed by the 3rd, the 4th, and the 6th characters.\r\n\r\nNow given any string, you are supposed to tell the number of ACM\'s contained in the string.', 'CAACAM', '2'),
(1003, 'An integer sequence is called elegant sequence if all the integers in it are distinct.\r\n\r\nSister Guo likes elegant sequence so much. One day she gets an integer sequence. But unfortunately the sequence is not always elegant.\r\n\r\nSo she wants to find a continuous subsequence which is elegant in it. And among all the possible answers, she wants the one with the maximum length. \r\n\r\nCould you please help her?', '2\r\n3\r\n1 2 1\r\n6\r\n4 3 1 3 1 5', '2\r\n3'),
(1004, 'rt', '2 3\r\n4 5', '6\r\n20'),
(1005, 'rt', '2 3\r\n4 5', '6\r\n20'),
(1006, 'rt', '2 3\r\n4 5', '6\r\n20'),
(1007, 'è®°gcd(a,b)ä¸ºæ­£æ•´æ•°aã€bçš„æœ€å¤§å…¬å› æ•°ã€‚\r\nè®¡ç®—gcd(1,1)*gcd(1,2)*...*gcd(1,m)*gcd(2,1)*gcd(2,2)*...*gcd(2,m)*...*gcd(n,1)*gcd(n,2)*...*gcd(n,m)', '2\r\n2 2\r\n4 4', '2\r\n96'),
(1008, 'ä¸ä¹…å‰ï¼ŒccæŠŠä»–çš„æ“ä½œç³»ç»Ÿå‡çº§åˆ°äº†COS12ã€‚åœ¨COS12çš„æ¡Œé¢ç³»ç»Ÿä¸­ï¼Œæœ‰å¦‚ä¸‹ç‰¹æ€§ï¼š\r\n\r\n    æ¡Œé¢å¯ä»¥çœ‹æˆæ˜¯n*må¤§å°çš„ç½‘æ ¼\r\n\r\n    å›¾æ ‡ä¸º2x2å¤§å°çš„æ­£æ–¹å½¢\r\n\r\n    å›¾æ ‡æ”¾ç½®çš„ä½ç½®å¿…é¡»æ»¡è¶³å›¾æ ‡çš„è¾¹ç•Œæ°å¥½ä¸Žç½‘æ ¼é‡å \r\n\r\n    å›¾æ ‡ä¸Žå›¾æ ‡ä¹‹é—´å¯ä»¥ç›¸äº’è¦†ç›–ï¼ŒåŽæ”¾çš„å›¾æ ‡ä¼šè¦†ç›–å…ˆæ”¾çš„å›¾æ ‡\r\n\r\n    å›¾æ ‡å¿…é¡»è¦éœ²å‡ºè‡³å°‘ä¸€åŠçš„é¢ç§¯ï¼ˆ2æ ¼ï¼‰æ‰ç®—æœ‰æ•ˆ\r\n\r\nçŽ°åœ¨CCæƒ³çŸ¥é“æ¡Œé¢ä¸Šæœ€å¤šèƒ½æ”¾å¤šå°‘ä¸ªæœ‰æ•ˆå›¾æ ‡ã€‚', '2\r\n2 3\r\n3 3', '2\r\n3'),
(1009, 'jswfå¤ºå† åŽ\r\ncc: tql\r\ngj: tggl\r\nmzï¼štlrxml\r\nfrz: bksjs\r\nwjjj: whnzmqa\r\n......\r\njs: ??? \r\njs: nmflb\r\n\r\nâ€”â€”â€”â€”èŠ‚é€‰è‡ªæŸæ¬¡mzè¯­ç­‰çº§æµ‹è¯•\r\n\r\nmzè¯­ç­‰çº§æµ‹è¯•å³å°†åˆ°æ¥ã€‚ç„¶è€Œmzè¯­ååˆ†éš¾ï¼Œç”¨è¯çµæ´»å¤šå˜ï¼Œå¯¼è‡´ä½œå¼Šäººæ•°ä¼—å¤šã€‚è€Œé˜²æ­¢è€ƒç”Ÿä½œå¼Šçš„ä¸€ä¸ªæœ‰æ•ˆçš„é€”å¾„æ˜¯è®©è€ƒç”Ÿä¹‹é—´ä¿æŒä¸€å®šçš„è·ç¦»ã€‚\r\n\r\næŸè€ƒåœºæœ‰Rï¼ˆè¡Œï¼‰*Cï¼ˆåˆ—ï¼‰ä¸ªåº§ä½ï¼Œååœ¨(r, c)çš„è€ƒç”Ÿå¯èƒ½ä¼šçœ‹åˆ°(r,c-1)ã€(r,c+1)ã€(r-1,c-1)ã€(r-1,c+1)ï¼ˆå³å·¦ã€å³ã€å·¦å‰ã€å³å‰ï¼‰4ä¸ªä½ç½®çš„è€ƒç”Ÿçš„ç­”æ¡ˆã€‚\r\n\r\nä¸ºäº†é˜²æ­¢è¿™ç§æƒ…å†µå‘ç”Ÿï¼Œå°±è¦ä¿è¯ä¸€ä¸ªè€ƒç”Ÿå‘¨å›´çš„è¿™4ä¸ªä½ç½®ä¸­æ— å…¶ä»–è€ƒç”Ÿã€‚\r\n\r\nè€Œç”±äºŽè¿™ä¸ªè€ƒåœºå¹´ä¹…å¤±ä¿®ï¼Œæœ‰ä¸€äº›åº§ä½å·²ç»æŸåï¼Œæ˜¯æ— æ³•ä½¿ç”¨çš„ã€‚\r\n\r\nçŽ°åœ¨ï¼Œflsæƒ³çŸ¥é“ï¼Œåœ¨ä¿è¯æ— äººèƒ½çœ‹åˆ°åˆ«äººç­”æ¡ˆçš„å‰æä¸‹ï¼Œè¿™ä¸ªè€ƒåœºæœ€å¤šèƒ½å®‰æŽ’å¤šå°‘åè€ƒç”Ÿï¼Ÿ', '1\r\n2 3\r\n...\r\n.x.', '4'),
(1010, 'å¿ƒç®—å¤§å¸ˆèƒ½å¿«é€Ÿè®¡ç®—ç»™å®šä¿¡æ¯çš„å…¬äº¤è½¦è¿˜æœ‰å‡ äººçš„é—®é¢˜\r\nä½†æ˜¯å¹¶ä¸æ˜¯æ¯ä¸ªäººéƒ½æœ‰å¾ˆå¼ºå¤§çš„å¿ƒç®—èƒ½åŠ›ï¼ŒäºŽæ˜¯æœ¬å…¬å¸å†³å®šåˆ¶ä½œä¸€ä¸ªç¨‹åºæ¥å›žç­”è¿™ä¸ªé—®é¢˜\r\näºŽæ˜¯å…¬å¸å°±æŠŠè¿™ä¸ªä»»åŠ¡äº¤ç»™äº†ä½ ', '2\r\n1 1\r\n5 1\r\n1 1\r\n5 2', '5\r\n-1'),
(1011, 'å·²çŸ¥æ–æ³¢æ‹‰å¥‘æ•°åˆ—æ˜¯1,1,2,3,5,8,13,21,.....\r\nçŽ°åœ¨å¯å¯æƒ³çŸ¥é“æ–æ³¢æ‹‰å¥‘æ•°åˆ—çš„ç¬¬Né¡¹æ˜¯å¤šå°‘\r\nä½†æ˜¯å› ä¸ºNå¾ˆå¤§ï¼Œæ‰€ä»¥è®¡ç®—å‡ºæ¥çš„æ•°å­—å¾ˆå¤§ï¼Œæ‰€ä»¥åªéœ€è¦è®©å…¶æ¨¡10^9+7å³å¯\r\nè¯·é—®ä½ èƒ½å¸®åŠ©å¯å¯å—ï¼Ÿ', '5\r\n1\r\n2\r\n3\r\n20\r\n200', '1\r\n1\r\n2\r\n6765\r\n349361645'),
(1014, 'åœ¨DQ4ï¼ˆå‹‡è€…æ–—æ¶é¾™4ï¼šè¢«å¼•å¯¼çš„äººæ°‘ï¼‰ä¸­ï¼Œå®Œç¾Žç»“å±€æ˜¯å‹‡è€…ä¸Žé­”æ—ä¹‹çŽ‹è”æ‰‹å°†é­”æ—çš„é»‘æš—ç¥­ç¥€æ‰“è´¥ä»Žè€Œè½ä¸‹å¸·å¹•\r\nç›®å‰å¯å¯ä¹Ÿåœ¨çŽ©è¿™æ¬¾æ¸¸æˆï¼Œä½†æ˜¯ä»–çŽ°åœ¨åˆä¸æƒ³ç»ƒçº§ï¼ŒäºŽæ˜¯çŽ°åœ¨ä»–æƒ³çŸ¥é“ä»–è‡³å°‘è¦å¤šå°‘ä¸ªå›žåˆæ‰èƒ½æ‰“å€’å¤§BOSS\r\nä¸ºäº†ç®€åŒ–è®¡ç®—ï¼Œæˆ‘ä»¬å‡å®šï¼Œæ— æš´å‡»ï¼Œæ— é—ªé¿\r\né­”çŽ‹æ˜¯99çº§å¼ºè€…ï¼Œå…¶ç”Ÿå‘½å€¼ä¸º10000 ï¼Œ æ”»å‡»åŠ›ä¸º500 ï¼Œ é˜²å¾¡åŠ›ä¸º500\r\nç„¶åŽå¯å¯æœ‰å››ä½è‹±é›„\r\nåˆ†åˆ«æœ‰ä»¥ä¸‹å±žæ€§ï¼š\r\n1. å‹‡è€…ï¼š     æ”»å‡»åŠ›ä¸º x1 ï¼Œ é˜²å¾¡åŠ›ä¸º y1 ï¼Œ ç”Ÿå‘½å€¼ä¸ºhp1\r\n2. é­”æ—ä¹‹çŽ‹ï¼š æ”»å‡»åŠ›ä¸º x2 ,  é˜²å¾¡åŠ›ä¸º y2 ,  ç”Ÿå‘½å€¼ä¸ºhp2\r\n3. ç¥žå®˜ï¼š     æ”»å‡»åŠ›ä¸º x3 ,  é˜²å¾¡åŠ›ä¸º y3 ,  ç”Ÿå‘½å€¼ä¸ºhp3\r\n4. å¥¶å¦ˆï¼š     æ”»å‡»åŠ›ä¸º 0  ï¼Œ é˜²å¾¡åŠ›ä¸º y4 ,  ç”Ÿå‘½åŠ›ä¸ºhp4 ï¼Œç¾¤ä½“åŠ è¡€æ²¡äººå›žå¤x4çš„ç”Ÿå‘½\r\nå‡å®šå¯å¯æ¯å›žåˆçš„å‡ä¸ºä¸‰æ”»å‡»ä¸€å›žè¡€\r\nå…¶ä¸­ä¼¤å®³è®¡ç®—è§„åˆ™ä¸ºï¼š\r\né»‘æš—ç¥­ç¥€æ¯å›žåˆåŒæ—¶å¯¹å››äººé€ æˆ ï¼ˆ500 - é˜²å¾¡åŠ›ï¼‰*0.9çš„ä¼¤å®³\r\nå‹‡è€…å¯¹é»‘æš—ç¥­ç¥€é€ æˆ max((x1-500)*1.3,1)çš„ä¼¤å®³\r\né­”æ—ä¹‹çŽ‹å¯¹é»‘æš—ç¥­ç¥€é€ æˆmax(x2-500,1)çš„ä¼¤å®³ ï¼Œ å¹¶å›žå¤é€ æˆä¼¤å®³çš„25%ç‚¹ç”Ÿå‘½å€¼\r\nç¥žå®˜å¯¹é»‘æš—ç¥­ç¥€é€ æˆmax((x3*0.9-500)*1.75,1)çš„ä¼¤å®³ , å¹¶å›žå¤é€ æˆä¼¤å®³çš„25%ç‚¹ç”Ÿå‘½å€¼\r\nå¥¶å¦ˆå¯¹é»‘æš—ç¥­ç¥€é€ æˆå›ºå®šä¼¤å®³ 1 \r\né—®å¯å¯æ˜¯å¦å¯ä»¥æ‰“è´¥é»‘æš—ç¥­ç¥€ï¼Œå¦‚æžœå¯ä»¥æœ€å°‘éœ€è¦å¤šå°‘å›žåˆ\r\næ³¨æ„ï¼š\r\nä¼¤å®³å¿…é¡»ä¸ºæ•´æ•°\r\nå¦‚æžœè®¡ç®—ä¼¤å®³ä¸º1.7 ï¼Œåˆ™çœŸæ­£çš„ä¼¤å®³ä¸º1', '700 300 500\r\n700 300 500\r\n700 300 500\r\n200 450 500', '15'),
(1012, 'ç»™å®šä¸€å¼ å›¾ï¼Œæ±‚æœ€å°ç”Ÿæˆæ ‘', '1\r\n3 3\r\n1 2 3\r\n1 3 3\r\n2 3 1', '4'),
(1013, 'QQé£žè½¦ä¸­æœ‰å°å–·,åŒå–·ï¼Œcwwå–·ï¼Œwcwå–·ï¼Œæ°®æ°”,cwå–·\r\nçŽ°åœ¨æˆ‘ä»¬ç”¨wè¡¨ç¤ºå°å–·ï¼Œwwè¡¨ç¤ºåŒå–·ï¼Œcè¡¨ç¤ºæ°®æ°”\r\né‚£ä¹ˆåœ¨ä¸€å±€æ¯”èµ›ä¸­æˆ‘ä»¬æœ‰å¾ˆå¤šwä¸Žcçš„æ“ä½œï¼ŒçŽ°åœ¨å®šä¹‰c,wæ“ä½œç»„åˆï¼ˆå¦‚æžœä¸‹åˆ—æœªæ¶‰åŠåˆ™è¡¨ç¤ºæ²¡æœ‰è¿™ç§ç»„åˆï¼‰\r\nå°å–·å¯ä»¥æé«˜å¹³å‡é€Ÿåº¦100\r\nåŒå–·å¯ä»¥æé«˜å¹³å‡é€Ÿåº¦140\r\næ°®æ°”å¯ä»¥æé«˜å¹³å‡é€Ÿåº¦250\r\ncwå–·å¯ä»¥æé«˜å¹³å‡é€Ÿåº¦400\r\ncwwå–·å¯ä»¥æé«˜å¹³å‡é€Ÿåº¦550\r\nwcwå–·å¯ä»¥æé«˜å¹³å‡é€Ÿåº¦535\r\nçŽ°åœ¨å¯å¯æœ‰è¿žç»­çš„æ“ä½œï¼Œä¸ºäº†ç®€åŒ–è®¡ç®—ï¼Œè¿™é‡Œåªè®°å½•å¯å¯çš„c,wæ“ä½œ\r\nå·²çŸ¥å¯å¯å¼€é€šäº†è¶…çº§vipæƒé™,å¯ä»¥å°†èµ›é“æ”¹å˜æˆç¬¦åˆè‡ªå·±æ“ä½œï¼ˆå³åœ¨ç»™å®šæ“ä½œé¡ºåºçš„å‰æä¸‹æŒ‰æ­¤æ“ä½œé¡ºåºæ“ä½œå…¨ç¨‹æ— å¤±è¯¯ï¼‰\r\nå¯å¯æƒ³çŸ¥é“åœ¨ä¸æ”¹å˜æ“ä½œé¡ºåºçš„å‰æä¸‹ï¼Œå¦‚ä½•è¿›è¡Œc,wç»„åˆä»¥èŽ·å¾—æœ€é«˜çš„å¹³å‡é€Ÿåº¦ \r\nå·²çŸ¥å¯å¯å…¨ç¨‹æ— å–·æ— æ°®çš„å¹³å‡é€Ÿåº¦ä¸º50', '10\r\ncwwcwwwcww', '1800'),
(1015, 'å¯å¯æœ€è¿‘åœ¨å‚åŠ ç™¾ä¸‡è‹±é›„\r\nç™¾ä¸‡è‹±é›„æ¯åœºä¸€å…±åäºŒé¢˜ï¼Œç­”å¯¹åäºŒé¢˜å°†å¹³åˆ†å½“åœºæ‰€æœ‰å¥–é‡‘\r\nå…¶ä¸­ä¸ªäººå¥–é‡‘ä¸º45ä¸‡å…ƒï¼Œå›¢æˆ˜å¥–é‡‘ä¸º5ä¸‡å…ƒ\r\nå…¶ä¸­ä¸ªäººå¥–é‡‘åˆ†åˆ«åœ¨ç¬¬å…­é¢˜å’Œç¬¬åäºŒé¢˜æ‹¿åˆ°åˆ†åˆ«20ä¸‡å…ƒå’Œ25ä¸‡å…ƒçš„å¹³åˆ†\r\nçŽ°åœ¨ç»™å®šå¯å¯å¯¹æ¯é“é¢˜çš„æŠŠæ¡\r\nå…¶ä¸­\r\né€‰é¡¹æœ‰ä¸‰ä¸ª\r\n1è¡¨ç¤ºå¯å¯èƒ½å¤Ÿ100%ä½œå¯¹æœ¬é¢˜\r\n2è¡¨ç¤ºå¯å¯100%æŽ’é™¤äº†ä¸€ä¸ªé€‰é¡¹\r\n3è¡¨ç¤ºå¯å¯å¯¹æœ¬é¢˜ä¸€æ— æ‰€çŸ¥\r\nå‡å®šå¯å¯å¯¹äºŽä¸çŸ¥é“çš„é¢˜ç›®å°†å®Œå…¨éšæœºï¼Œé‚£ä¹ˆå¯å¯èƒ½å¤Ÿæ‹¿åˆ°çš„å¥–é‡‘çš„æœŸæœ›æ˜¯å¤šå°‘å‘¢ï¼Ÿ\r\nå‡å®šå¯å¯ä¸Žä¸€åæœªçŸ¥é«˜æ‰‹ç»„é˜Ÿï¼Œ100%ç“œåˆ†å›¢æˆ˜å¥–é‡‘ï¼ˆé˜Ÿä¼äººæ•°ä¸‰äººï¼‰', '1 1 1 1 1 1 1 1 1 1 1 3\r\n9999 4999 1000', '53.3333333');

-- --------------------------------------------------------

--
-- 表的结构 `problem_information_3`
--

DROP TABLE IF EXISTS `problem_information_3`;
CREATE TABLE IF NOT EXISTS `problem_information_3` (
  `pro_id` int(11) NOT NULL,
  `hint` varchar(6000) NOT NULL,
  `pro_user_id` int(11) NOT NULL,
  `begin_time` datetime NOT NULL,
  `last_update_time` datetime NOT NULL,
  `authority` int(11) NOT NULL,
  `test_number` int(11) NOT NULL,
  PRIMARY KEY (`pro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `problem_information_3`
--

INSERT INTO `problem_information_3` (`pro_id`, `hint`, `pro_user_id`, `begin_time`, `last_update_time`, `authority`, `test_number`) VALUES
(1000, '', -9945157, '2017-11-26 19:36:58', '2017-11-26 19:36:58', 0, 5),
(1001, '', -9945157, '2017-11-26 19:40:30', '2017-11-26 19:40:30', 0, 6),
(1002, '', -9945157, '2017-11-26 23:25:20', '2017-11-26 23:25:20', 0, 10),
(1003, '', -9945157, '2017-11-27 22:14:26', '2018-02-04 16:16:20', 0, 5),
(1004, 'åˆå…¥ç¨‹åºè®¾è®¡ç«žèµ›çš„æ‚¨å¯èƒ½éœ€è¦æ³¨æ„ï¼š\r\n\r\n\r\n1. Wrang Answerï¼Ÿ\r\n\r\nå¯èƒ½çˆ†intè¾£ï¼Ÿ\r\n\r\nC/C++ä»¥åŠjavaä¸­çš„intç±»åž‹ï¼ˆ32ä½æœ‰ç¬¦å·æ•´æ•°ï¼‰èƒ½è¡¨ç¤ºçš„èŒƒå›´ä¸º-2^31 ~ 2^31 - 1, 2^31çº¦ä¸º2.147x10^9\r\n\r\nunsigned intï¼ˆ32ä½æ— ç¬¦å·æ•´æ•°ï¼‰è¡¨ç¤ºçš„èŒƒå›´ä¸º0 ~ 2^32 - 1\r\n\r\næ‚¨å¯èƒ½éœ€è¦ä½¿ç”¨æ›´å¤§èŒƒå›´çš„ç±»åž‹ï¼Œ64ä½æœ‰ç¬¦å·æ•´æ•°ï¼Œèƒ½è¡¨ç¤ºåˆ°2^63 - 1, çº¦ä¸º9.233x10^18\r\n\r\nC/C++ä¸ºlong longæˆ–__int64, å¯¹åº”çš„æ ¼å¼æŽ§åˆ¶ç¬¦ä¸º%lldæˆ–%I64d(å…·ä½“ç”¨å“ªä¸ªçœ‹æµ‹è¯•å¹³å°ï¼Œæœ¬ojè¯·ä½¿ç”¨%lld)\r\n\r\njavaä¸­ä¸ºlong \r\n\r\n\r\n2. Time Limit Exceededï¼Ÿ\r\n\r\nå¯èƒ½æ‚¨å¹¶ä¸çŸ¥é“å¦‚ä½•å¤„ç†æ–‡ä»¶æœ«å°¾ï¼Ÿ\r\n\r\nCå¯ä»¥åˆ©ç”¨scanf,getsç­‰æ ‡å‡†è¾“å…¥å‡½æ•°çš„è¿”å›žå€¼å’ŒEOFå®, å¦‚while(scanf(\"%d%d\", &a, &b) != EOF) { }\r\n\r\nC++åˆ©ç”¨istreamç±»>>è¿ç®—ç¬¦çš„è¿”å›žå€¼ï¼Œå¦‚while(cin >> a >> b) { }\r\n\r\njavaå¯ä»¥åˆ©ç”¨Scannerç±»çš„hasNextæ–¹æ³•\r\n\r\n\r\n3. Presentation Errorï¼Ÿ\r\n\r\nè¯·ä¸¥æ ¼æŒ‰ç…§è¾“å‡ºæ ¼å¼è¿›è¡Œè¾“å‡ºï¼Œä¸è¦æœ‰å¤šä½™çš„æç¤ºæ€§è¯­å¥ï¼ˆå¦‚\"è¯·è¾“å…¥ä¸€ä¸ªæ•´æ•°\"ã€\"a x b =\"ç­‰ï¼‰ï¼Œè¡Œæœ«ä¸è¦æœ‰å¤šä½™çš„ç©ºæ ¼', -9945157, '2017-11-27 22:19:45', '2018-02-09 23:55:04', 0, 2),
(1005, '', -9945157, '2017-11-27 22:21:06', '2018-02-05 00:09:37', 7, 4),
(1006, '', -9945157, '2017-11-27 22:22:05', '2018-02-05 00:24:53', 7, 3),
(1007, '', -9945157, '2017-11-27 23:34:28', '2017-11-27 23:34:28', 9, 1),
(1008, '', -9945157, '2017-11-27 23:39:48', '2017-11-27 23:39:48', 9, 1),
(1009, '', -9945157, '2017-11-27 23:41:35', '2017-11-27 23:41:35', 7, 1),
(1010, '', -9945157, '2017-11-28 15:59:09', '2017-11-28 21:26:37', 9, 1),
(1011, '', -9945157, '2017-12-07 00:00:00', '2018-02-06 14:20:04', 1, 4),
(1012, '', -9945157, '2018-01-16 15:43:35', '2018-01-16 15:43:35', 0, 1),
(1013, 'å¯å¯å¯ä»¥å†³å®šcw wcw ww cww\r\næ­¤æ—¶å¹³å‡é€Ÿåº¦ä¸º50 + 400 + 535 + 140 + 550 = 1675\r\nè€Œå¦‚æžœå¯å¯å†³å®šcww cww w cww\r\nç„¶åŽæœ€ç»ˆå¹³å‡é€Ÿåº¦ä¸º50 + 550 + 550 + 100 + 550 = 1800 \r\næ˜¾ç„¶æ¯”ä¹‹å‰çš„æ–¹æ¡ˆè¦ä¼˜', -9945157, '2018-01-25 10:52:10', '2018-02-14 20:09:32', 0, 2),
(1014, 'é­”çŽ‹æ¯å›žåˆå¯¹å‹‡è€…ï¼Œé­”æ—ä¹‹çŽ‹ï¼Œç¥žå®˜é€ æˆ180ç‚¹ä¼¤å®³ï¼Œå¥¶å¦ˆé€ æˆ45ç‚¹ä¼¤å®³ï¼Œ\r\nå¥¶å¦ˆæ¯å›žåˆå¯ä»¥å›žè¡€200\r\nä¸‰æ”»å‡»ä¸€å›žè¡€è¾“å‡ºä¸º200*1.3+200+130*1.75 = 687.5 => ä¼¤å®³ä¸º687ç‚¹\r\næ‰€ä»¥æœ€å°‘å›žåˆæ˜¯ä¸º10000/687 = 14.545454..... \r\næ‰€ä»¥ç­”æ¡ˆä¸º15ä¸ªå›žåˆ', -9945157, '2018-02-07 19:30:08', '2018-02-07 19:39:08', 7, 0),
(1015, 'å¯å¯æœ¬åœºå¹³åˆ†ç¬¬å…­é¢˜çš„ 20ä¸‡ / 1ä¸‡= 20 å…ƒ ä¸Ž 5ä¸‡/ 1000 = 50å…ƒ ï¼Œåˆ†çº¢ä¸º50/3 = 16.666666...å…ƒ ï¼Œ ç„¶åŽç¬¬åäºŒé¢˜ç­”å¯¹çš„æ¦‚çŽ‡ä¸º1/3 ï¼Œ æ‰€ä»¥æœŸæœ›ä¸º1/3 * 25ä¸‡ / 5000 =16.6666666...å…ƒ\r\næ‰€ä»¥å¯å¯æœ¬åœºæœŸæœ›å¥–é‡‘ä¸º 20 + 16.66666.. + 16.6666... = 53.3333333... å…ƒ\r\næ‰€ä»¥ç­”æ¡ˆåº”ä¸º53.3333333å…ƒ\r\nè¾“å‡º53.3333333 æˆ–è€… 53.333333 ï¼Œ 53.333332éƒ½å¯¹ï¼Œåªè¦è¯¯å·®å°äºŽ10^-6å³å¯', -9945157, '2018-02-07 22:50:13', '2018-02-12 22:41:17', 7, 0);

-- --------------------------------------------------------

--
-- 表的结构 `problem_information_4`
--

DROP TABLE IF EXISTS `problem_information_4`;
CREATE TABLE IF NOT EXISTS `problem_information_4` (
  `pro_id` int(11) NOT NULL,
  `allow_huck` int(11) NOT NULL,
  `data_monitoring` text COLLATE utf8_bin NOT NULL,
  `true_code` text COLLATE utf8_bin NOT NULL,
  `huck_number` int(11) NOT NULL,
  PRIMARY KEY (`pro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `problem_information_4`
--

INSERT INTO `problem_information_4` (`pro_id`, `allow_huck`, `data_monitoring`, `true_code`, `huck_number`) VALUES
(1000, 0, '', '', 0),
(1001, 0, '', '', 0),
(1002, 0, '', '', 0),
(1003, 0, '', '', 0),
(1004, 0, '', '', 0),
(1005, 0, '', '', 0),
(1006, 0, '', '', 0),
(1007, 0, '', '', 0),
(1008, 0, '', '', 0),
(1009, 0, '', '', 0),
(1010, 0, '', '', 0),
(1011, 0, '', '', 0),
(1012, 0, '', '', 0),
(1013, 1, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n    int n;\r\n    scanf(\"%d\",&n);\r\n    if( 1 > n || n > 100 ){\r\n        return 0*puts(\"No\");\r\n    }\r\n    char s[200];\r\n    scanf(\"%s\",s);\r\n    if( strlen(s) == n ){\r\n        for(int i = 0 ; i < n ; i++){\r\n            if( s[i] == \'c\' || s[i] == \'w\' )    continue;\r\n            return 0*puts(\"no\");\r\n        }\r\n        return 0*puts(\"yes\");\r\n    }\r\n    puts(\"no\");\r\n    return 0;\r\n}', '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n    int n;\r\n    scanf(\"%d\",&n);\r\n    char s[200];\r\n    scanf(\"%s\",s + 1);\r\n    int ans = 50;\r\n    for(int i = 1 ; i <= n ; i++){\r\n        if( s[i] == \'c\' ){\r\n            if( s[i+1] == \'w\' ){\r\n                if( s[i+2] == \'w\' ){\r\n                    s[i+1] = s[i+2] = \'a\';\r\n                    ans += 550;\r\n                }else if( s[i-1] == \'w\' ){\r\n                    s[i-1] = s[i+1] = \'a\';\r\n                    ans += 535;\r\n                }else{\r\n                    s[i+1] = \'a\';\r\n                    ans += 400;\r\n                }\r\n            }else{\r\n                ans += 250;\r\n            }\r\n        }\r\n    }\r\n    for(int i = 1 ; i <= n ; i++){\r\n        if( s[i] == \'w\' ){\r\n            ans += 100;\r\n        }\r\n    }\r\n    printf(\"%d\\n\",ans);\r\n    return 0;\r\n}\r\n', 0),
(1014, 0, '', '', 0),
(1015, 0, '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `pro_submit`
--

DROP TABLE IF EXISTS `pro_submit`;
CREATE TABLE IF NOT EXISTS `pro_submit` (
  `id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `language` int(11) NOT NULL,
  `result` int(11) NOT NULL,
  `u_time` int(11) NOT NULL,
  `u_memory` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `_date` datetime NOT NULL,
  `huck` int(11) NOT NULL,
  `code` varchar(20000) NOT NULL,
  `compile` varchar(900) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pro_id` (`pro_id`),
  KEY `result` (`result`),
  KEY `user_id` (`user_id`),
  KEY `language` (`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pro_submit`
--

INSERT INTO `pro_submit` (`id`, `pro_id`, `language`, `result`, `u_time`, `u_memory`, `user_id`, `_date`, `huck`, `code`, `compile`) VALUES
(1, 1000, 2, 1, 62, 3632, -9945157, '2017-11-29 23:35:50', 0, '#include<bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n    int a,b;\r\n    cin>>a>>b;\r\n    cout<<a+b<<endl;\r\n    return 0;\r\n}\r\n', ''),
(2, 1000, 1, 1, 46, 3496, -9945157, '2017-12-18 00:50:49', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    int a,b;\r\n    scanf(\"%d%d\",&a,&b);\r\n    printf(\"%d\\n\",a+b);\r\n    return 0;\r\n}\r\n', ','),
(3, 1000, 1, 8, 0, 0, 1, '2017-12-19 00:31:18', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    int a,b;\r\n    scanf(\"%d%d\",&a,&b);\r\n    printf(\"%d\n\",a+b);\r\n    return 0;\r\n}', 'main.c: In function \'main\':\r\r\nmain.c:11:12: warning: missing terminating \" character\r\r\nmain.c:11:5: error: missing terminating \" character\r\r\nmain.c:12:1: warning: missing terminating \" character\r\r\nmain.c:12:1: error: missing terminating \" character\r\r\nmain.c:14:5: error: expected expression before \'return\'\r\r\nmain.c:16:1: error: expected \';\' before \'}\' token'),
(4, 1000, 1, 8, 0, 0, 1, '2017-12-19 00:31:58', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    int a,b;\r\n    scanf(\"%d%d\",&a,&b);\r\n    printf(\"%d\n\",a+b);\r\n    return 0;\r\n}', 'main.c: In function \'main\':\r\r\nmain.c:11:12: warning: missing terminating \" character\r\r\nmain.c:11:5: error: missing terminating \" character\r\r\nmain.c:12:1: warning: missing terminating \" character\r\r\nmain.c:12:1: error: missing terminating \" character\r\r\nmain.c:14:5: error: expected expression before \'return\'\r\r\nmain.c:16:1: error: expected \';\' before \'}\' token'),
(5, 1000, 1, 8, 0, 0, 1, '2017-12-19 00:32:34', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    int a,b;\r\n    scanf(\"%d%d\",&a,&b);\r\n    printf(\"%d\n\",a+b);\r\n    return 0;\r\n}', 'main.c: In function \'main\':\r\r\nmain.c:11:12: warning: missing terminating \" character\r\r\nmain.c:11:5: error: missing terminating \" character\r\r\nmain.c:12:1: warning: missing terminating \" character\r\r\nmain.c:12:1: error: missing terminating \" character\r\r\nmain.c:14:5: error: expected expression before \'return\'\r\r\nmain.c:16:1: error: expected \';\' before \'}\' token'),
(6, 1000, 1, 1, 109, 3276, 1, '2017-12-19 00:34:33', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    int a,b;\r\n    scanf(\"%d%d\",&a,&b);\r\n    printf(\"%d\\\n\",a+b);\r\n    return 0;\r\n}', ','),
(7, 1000, 1, 1, 62, 3632, 1, '2017-12-19 00:34:51', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    int a,b;\r\n    scanf(\"%d%d\",&a,&b);\r\n    printf(\"%d\\n\",a+b);\r\n    return 0;\r\n}', ','),
(8, 1000, 1, 1, 62, 3636, 1, '2017-12-19 13:34:01', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    int a,b;\r\n    while(~scanf(\"%d%d\",&a,&b))\r\n        printf(\"%d\\n\",a+b);\r\n    return 0;\r\n}\r\n', ','),
(9, 1000, 1, 1, 62, 3484, 1, '2017-12-19 13:34:46', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    int a,b;\r\n    while(~scanf(\"%d%d\",&a,&b))\r\n        printf(\"%d\\n\",a+b);\r\n    return 0;\r\n}\r\n', ','),
(10, 1000, 1, 0, 0, 0, 1, '2017-12-19 13:35:38', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    int a,b;\r\n    while(~scanf(\"%d%d\",&a,&b))\r\n        printf(\"%d\\n\",a+b);\r\n    return 0;\r\n}\r\n', ','),
(24, 1003, 2, 1, 1875, 3480, -9945157, '2018-02-04 16:48:38', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e6+7 , mz = 1e9+7;\r\nint a[N];\r\nmap<int,int> mp;\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int T;\r\n    scanf(\"%d\",&T);\r\n    while( T-- ){\r\n        int n;\r\n        scanf(\"%d\",&n);\r\n        mp.clear();\r\n        int di = 0 , maxn = 0;\r\n        for(int i = 1 ; i <= n ; i++)   scanf(\"%d\",a+i);\r\n        for(int i = 1 ; i <= n ; i++){\r\n            if( mp.find(a[i]) == mp.end() ){\r\n                mp[a[i]] = i;\r\n                maxn = max(maxn,i-di);\r\n            }else{\r\n                di = max(mp[a[i]],di);\r\n                maxn = max(maxn,i-di);\r\n                mp[a[i]] = i;\r\n            }\r\n        }\r\n        printf(\"%d\\n\",maxn);\r\n    }\r\n    return 0;\r\n}\r\n', ''),
(11, 1001, 2, 1, 62, 3632, -9945157, '2018-02-04 11:27:34', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e3+7;\r\nint gcd(int a,int b){return b?gcd(b,a%b):a;}\r\nint d[N];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int n;\r\n    scanf(\"%d\",&n);\r\n    for(int i = 1 ; i <= n ; i++)   scanf(\"%d\",d+i);\r\n    int ans_i = 1 , ans_j = 2 , ans = gcd(d[1],d[2]);\r\n    for(int i = 1 ; i <= n ; i++)\r\n        for(int j = i+1 ; j <= n ; j++){\r\n            int t = gcd( d[i] , d[j] );\r\n            if( t > ans ){\r\n                ans_i = i;\r\n                ans_j = j;\r\n                ans = t;\r\n            }\r\n        }\r\n    printf(\"%d %d %d\\n\",ans_i,ans_j,ans);\r\n    return 0;\r\n}\r\n', ','),
(12, 1001, 1, 8, 0, 0, -9945157, '2018-02-04 11:29:25', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e3+7;\r\nint gcd(int a,int b){return b?gcd(b,a%b):a;}\r\nint d[N];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int n;\r\n    scanf(\"%d\",&n);\r\n    for(int i = 1 ; i <= n ; i++)   scanf(\"%d\",d+i);\r\n    int ans_i = 0 , ans_j = 0 , ans = 0;\r\n    for(int i = n ; i ; i--)\r\n        for(int j = i-1 ; j ; j--){\r\n            int t = gcd( d[i] , d[j] );\r\n            if( t > ans ){\r\n                ans_i = i;\r\n                ans_j = j;\r\n                ans = t;\r\n            }\r\n        }\r\n    printf(\"%d %d %d\\n\",ans_i,ans_j,ans);\r\n    return 0;\r\n}\r\n', 'main.c:1:25: fatal error: bits/stdc++.h: No such file or directory\r\r\n #include <bits/stdc++.h>\r\r\r\n                         ^\r\r\ncompilation terminated.'),
(13, 1001, 2, 7001, 500, 3632, -9945157, '2018-02-04 11:29:58', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e3+7;\r\nint gcd(int a,int b){return b?gcd(b,a%b):a;}\r\nint d[N];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int n;\r\n    scanf(\"%d\",&n);\r\n    for(int i = 1 ; i <= n ; i++)   scanf(\"%d\",d+i);\r\n    int ans_i = 0 , ans_j = 0 , ans = 0;\r\n    for(int i = n ; i ; i--)\r\n        for(int j = i-1 ; j ; j--){\r\n            int t = gcd( d[i] , d[j] );\r\n            if( t > ans ){\r\n                ans_i = i;\r\n                ans_j = j;\r\n                ans = t;\r\n            }\r\n        }\r\n    printf(\"%d %d %d\\n\",ans_i,ans_j,ans);\r\n    return 0;\r\n}\r\n', ','),
(25, 1004, 2, 1, 1118, 3632, -9945157, '2018-02-04 23:48:15', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    long long a,b;\r\n    while( cin>>a>>b )\r\n        cout<<a*b<<endl;\r\n    return 0;\r\n}\r\n', ''),
(14, 1001, 2, 1, 62, 3600, -9945157, '2018-02-04 11:55:57', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e3+7;\r\nint gcd(int a,int b){return b?gcd(b,a%b):a;}\r\nint d[N];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int n;\r\n    scanf(\"%d\",&n);\r\n    for(int i = 1 ; i <= n ; i++)   scanf(\"%d\",d+i);\r\n    int ans_i = 0 , ans_j = 0 , ans = 0;\r\n    for(int i = 1 ; i <= n ; i++)\r\n        for(int j = i+1 ; j <= n ; j++){\r\n            int t = gcd( d[i] , d[j] );\r\n            if( t > ans ){\r\n                ans_i = i;\r\n                ans_j = j;\r\n                ans = t;\r\n            }\r\n        }\r\n    printf(\"%d %d %d\\n\",ans_i,ans_j,ans);\r\n    return 0;\r\n}\r\n', ','),
(15, 1001, 2, 6003, 1000, 3604, -9945157, '2018-02-04 11:57:08', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e3+7;\r\nint gcd(int a,int b){\r\n    for(int i = min(a,b) ; i ; i--){\r\n        if( a%i == 0 && b%i == 0 ){\r\n            return i;\r\n        }\r\n    }\r\n}\r\nint d[N];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int n;\r\n    scanf(\"%d\",&n);\r\n    for(int i = 1 ; i <= n ; i++)   scanf(\"%d\",d+i);\r\n    int ans_i = 0 , ans_j = 0 , ans = 0;\r\n    for(int i = 1 ; i <= n ; i++)\r\n        for(int j = i+1 ; j <= n ; j++){\r\n            int t = gcd( d[i] , d[j] );\r\n            if( t > ans ){\r\n                ans_i = i;\r\n                ans_j = j;\r\n                ans = t;\r\n            }\r\n        }\r\n    printf(\"%d %d %d\\n\",ans_i,ans_j,ans);\r\n    return 0;\r\n}\r\n', 'main.cpp: In function \'int gcd(int, int)\':\r\r\nmain.cpp:19:1: warning: control reaches end of non-void function [-Wreturn-type]\r\r\n     scanf(\"%d\",&n);\r\r\r\n ^'),
(16, 1001, 2, 6003, 1000, 3632, -9945157, '2018-02-04 11:58:37', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e3+7;\r\nint gcd(int a,int b){\r\n    for(int i = min(a,b) ; i ; i--){\r\n        if( a%i == 0 && b%i == 0 ){\r\n            return i;\r\n        }\r\n    }\r\n    return 1;\r\n}\r\nint d[N];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int n;\r\n    scanf(\"%d\",&n);\r\n    for(int i = 1 ; i <= n ; i++)   scanf(\"%d\",d+i);\r\n    int ans_i = 0 , ans_j = 0 , ans = 0;\r\n    for(int i = 1 ; i <= n ; i++)\r\n        for(int j = i+1 ; j <= n ; j++){\r\n            int t = gcd( d[i] , d[j] );\r\n            if( t > ans ){\r\n                ans_i = i;\r\n                ans_j = j;\r\n                ans = t;\r\n            }\r\n        }\r\n    printf(\"%d %d %d\\n\",ans_i,ans_j,ans);\r\n    return 0;\r\n}\r\n', ','),
(19, 1002, 2, 8, 0, 0, -9945157, '2018-02-04 12:31:46', 0, '#include <bits/stdc++.h> using namespace std; \r\nconst int N = 1e5+7 , mz = 1e9+7; \r\nchar s[N]; int a[N] , m[N];  \r\nint main(){ \r\n#ifdef LOCAL    \r\n //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);     \r\n //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout); \r\n#endif     \r\n    scanf(\"%s\",s+1);     \r\n    int len = strlen(s+1);     \r\n    for(int i = 1 ; i <= len ; i++) a[i] = a[i-1] + (s[i]==\'A\'?1:0);\r\n    for(int i = len ; i ; i--)  m[i] = m[i+1] + (s[i]==\'M\'?1:0);\r\n     int ans = 0;\r\n     for(int i = 1 ; i <= len ; i++)\r\n         if( s[i] == \'C\' ) \r\n            ans = (ans + a[i] * m[i] % mz)%mz;\r\n     cout<<ans<<endl; \r\n    return 0; \r\n}', 'D:/CodeBlocks/MinGW/lib\\libmingw32.a(main.o):main.c:(.text.startup+0xa7): undefined reference to `WinMain@16\'\r\r\ncollect2.exe: error: ld returned 1 exit status'),
(20, 1002, 2, 8, 0, 0, -9945157, '2018-02-04 12:34:18', 0, '#include <bits/stdc++.h>\r\n using namespace std;\r\n const int N = 1e5+7 , mz = 1e9+7;\r\n char s[N]; int a[N] , m[N];\r\n  int main(){\r\n #ifdef LOCAL     \r\n//freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);     //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n #endif\r\n     scanf(\"%s\",s+1);\r\n     int len = strlen(s+1);\r\n     for(int i = 1 ; i <= len ; i++) a[i] = a[i-1] + (s[i]==\'A\'?1:0);     \r\nfor(int i = len ; i ; i--)  m[i] = m[i+1] + (s[i]==\'M\'?1:0);\r\n     int ans = 0;\r\n     for(int i = 1 ; i <= len ; i++)\r\n         if( s[i] == \'C\' )\r\n             ans = (ans + a[i] * m[i] % mz)%mz;\r\n     cout<<ans<<endl;\r\n     return 0; \r\n}', 'D:/CodeBlocks/MinGW/lib\\libmingw32.a(main.o):main.c:(.text.startup+0xa7): undefined reference to `WinMain@16\'\r\r\ncollect2.exe: error: ld returned 1 exit status'),
(21, 1002, 2, 1, 46, 3632, -9945157, '2018-02-04 12:35:07', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e5+7 , mz = 1e9+7;\r\nchar s[N];\r\nint a[N] , m[N];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    scanf(\"%s\",s+1);\r\n    int len = strlen(s+1);\r\n    for(int i = 1 ; i <= len ; i++) a[i] = a[i-1] + (s[i]==\'A\'?1:0);\r\n    for(int i = len ; i ; i--)  m[i] = m[i+1] + (s[i]==\'M\'?1:0);\r\n    long long ans = 0;\r\n    for(int i = 1 ; i <= len ; i++)\r\n        if( s[i] == \'C\' )\r\n            ans = (ans + 1LL * a[i] * m[i] % mz)%mz;\r\n    cout<<ans<<endl;\r\n    return 0;\r\n}\r\n', ''),
(22, 1002, 2, 7010, 109, 3632, -9945157, '2018-02-04 13:55:17', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e5+7 , mz = 1e9+7;\r\nchar s[N];\r\nint a[N] , m[N];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    scanf(\"%s\",s+1);\r\n    int len = strlen(s+1);\r\n    for(int i = 1 ; i <= len ; i++) a[i] = a[i-1] + (s[i]==\'A\'?1:0);\r\n    for(int i = len ; i ; i--)  m[i] = m[i+1] + (s[i]==\'M\'?1:0);\r\n    int ans = 0;\r\n    for(int i = 1 ; i <= len ; i++)\r\n        if( s[i] == \'C\' )\r\n            ans = (ans + a[i] * m[i] % mz)%mz;\r\n    cout<<ans<<endl;\r\n    return 0;\r\n}\r\n', ''),
(23, 1002, 2, 6006, 1000, 3616, -9945157, '2018-02-04 13:58:41', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e5+7 , mz = 1e9+7;\r\nchar s[N];\r\nint a[N] , m[N];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    scanf(\"%s\",s+1);\r\n    int len = strlen(s+1);\r\n    int ans = 0;\r\n    for(int i = 0 ; i <= len ; i++){\r\n        if( s[i] == \'C\' ){\r\n            int x = 0 , y = 0;\r\n            for(int j = 0 ; j < i ; j++)    if( s[j] == \'A\' )   x++;\r\n            for(int j = i+1 ; j <= len ; j++)   if( s[j] == \'M\' )   y++;\r\n            ans = (ans + x * y % mz)%mz;\r\n        }\r\n    }\r\n    cout<<ans<<endl;\r\n    return 0;\r\n}\r\n', ''),
(26, 1004, 2, 1, 1031, 3632, -9945157, '2018-02-04 23:51:48', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    long long a,b;\r\n    while( cin>>a>>b )\r\n        cout<<a*b<<endl;\r\n    return 0;\r\n}\r\n', ''),
(27, 1004, 2, 1, 187, 3632, -9945157, '2018-02-04 23:54:12', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int a,b;\r\n    while( ~scanf(\"%d%d\",&a,&b) )\r\n        printf(\"%lld\\n\",1LL*a*b);\r\n    return 0;\r\n}\r\n', 'main.cpp: In function \'int main()\':\r\r\nmain.cpp:21:32: warning: unknown conversion type character \'l\' in format [-Wformat=]\r\r\nmain.cpp:21:32: warning: too many arguments for format [-Wformat-extra-args]'),
(28, 1004, 2, 1, 140, 3632, -9945157, '2018-02-04 23:57:14', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int a,b;\r\n    long long c = 1;\r\n    while( ~scanf(\"%d%d\",&a,&b) )\r\n        printf(\"%lld\\n\",c*a*b);\r\n    return 0;\r\n}\r\n', 'main.cpp: In function \'int main()\':\r\r\nmain.cpp:23:30: warning: unknown conversion type character \'l\' in format [-Wformat=]\r\r\nmain.cpp:23:30: warning: too many arguments for format [-Wformat-extra-args]'),
(29, 1004, 3, 1, 451, 3616, -9945157, '2018-02-04 23:59:18', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int a,b;\r\n    long long c = 1;\r\n    while( ~scanf(\"%d%d\",&a,&b) )\r\n        printf(\"%lld\\n\",c*a*b);\r\n    return 0;\r\n}\r\n', 'main.cpp: In function \'int main()\':\r\r\nmain.cpp:23:30: warning: unknown conversion type character \'l\' in format [-Wformat=]\r\r\nmain.cpp:23:30: warning: too many arguments for format [-Wformat-extra-args]'),
(30, 1004, 2, 7001, 899, 3620, -9945157, '2018-02-05 00:01:09', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int a,b;\r\n    long long c = 1;\r\n    while( ~scanf(\"%d%d\",&a,&b) )\r\n        printf(\"%l64d\\n\",c*a*b);\r\n    return 0;\r\n}\r\n', 'main.cpp: In function \'int main()\':\r\r\nmain.cpp:23:31: warning: unknown conversion type character \'6\' in format [-Wformat=]\r\r\nmain.cpp:23:31: warning: too many arguments for format [-Wformat-extra-args]'),
(31, 1004, 2, 7002, 140, 3632, -9945157, '2018-02-05 00:03:59', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int a,b;\r\n    long long c = 1;\r\n    while( ~scanf(\"%d%d\",&a,&b) )\r\n        printf(\"%d\\n\",a*b);\r\n    return 0;\r\n}\r\n', 'main.cpp: In function \'int main()\':\r\r\nmain.cpp:19:15: warning: unused variable \'c\' [-Wunused-variable]'),
(32, 1004, 2, 7002, 140, 3632, -9945157, '2018-02-05 00:04:35', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int a,b;\r\n    while( ~scanf(\"%d%d\",&a,&b) )\r\n        printf(\"%d\\n\",a*b);\r\n    return 0;\r\n}\r\n', ''),
(37, 1011, 2, 1, 62, 3632, -9945157, '2018-02-06 14:26:19', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e5+7 , mz = 1e9+7;\r\nint a[N];\r\nvoid init(){\r\n    a[1] = a[2] = 1;\r\n    for(int i = 3 ; i < N ; i++)\r\n        a[i] = (a[i-1] + a[i-2])%mz;\r\n}\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    init();\r\n    int T;\r\n    scanf(\"%d\",&T);\r\n    while( T-- ){\r\n        int n;\r\n        scanf(\"%d\",&n);\r\n        printf(\"%d\\n\",a[n]);\r\n    }\r\n    return 0;\r\n}\r\n', ''),
(33, 1005, 2, 7004, 93, 3636, -9945157, '2018-02-05 00:18:48', 0, '#include <algorithm>\r\n#include <cctype>\r\n#include <cmath>\r\n#include <cstdio>\r\n#include <cstdlib>\r\n#include <cstring>\r\n#include <ctime>\r\n#include <iomanip>\r\n#include <iostream>\r\n#include <map>\r\n#include <queue>\r\n#include <string>\r\n#include <set>\r\n#include <vector>\r\n#include <cassert>\r\nusing namespace std;\r\ntypedef long long LL;\r\nconst int N = 500 , INF = 0x3f3f3f3f , M = 1005;\r\nconst double PI = acos(0.0) * 2;\r\ntemplate<typename T1>\r\nT1 gcd(T1 a , T1 b){ return b ? gcd(b,a%b) : a;}\r\n\r\nstruct BigNum{\r\n    int a[N];\r\n    enum{MOD = 10000};\r\n    void sets(char *s){\r\n        int t,k,ind,l,i;\r\n        memset(a,0,sizeof(a));\r\n        l = strlen(s);\r\n        a[0] = l / 4;\r\n        a[0] += l % 4 != 0 ? 1 : 0;\r\n        ind = 1;\r\n        for(int i = l-1 ; i >= 0 ; i -= 4){\r\n            t = 0;\r\n            k = max(0,i-3);\r\n            for(int j = k ; j <= i ; j++)   t = t * 10 + s[j] - \'0\';\r\n            a[ind++] = t;\r\n        }\r\n    }\r\n    void print(){\r\n        printf(\"%d\",a[a[0]]);\r\n        for(int i = a[0] - 1 ; i > 0 ; i--){\r\n            if(a[i] == 0){\r\n                printf(\"0000\");\r\n                continue;\r\n            }\r\n            for(int k = 10 ; k * a[i] < MOD ; k *= 10) putchar(\'0\');\r\n            printf(\"%d\",a[i]);\r\n        }\r\n        puts(\"\");\r\n    }\r\n    int& operator[](int p){return a[p];}\r\n    const int& operator[](int p)const{return a[p];}\r\n    BigNum operator * (const BigNum& b){\r\n        BigNum c;\r\n        c.sets(\"0\");\r\n        c[0] = a[0] + b[0];\r\n        for(int i = 1 ; i <= a[0] ; i++){\r\n            for(int j = 1 ; j <= b[0] ; j++){\r\n                c[i+j-1] += a[i] * b[j];\r\n                c[i+j] += c[i+j-1] / MOD;\r\n                c[i+j-1] %= MOD;\r\n            }\r\n        }\r\n        if( c[c[0]] == 0 )  c[0]--;\r\n        return c;\r\n    }\r\n}a,b;\r\n\r\nchar s1[M],s2[M];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    while(~scanf(\"%s%s\",s1,s2)){\r\n        a.sets(s1);\r\n        b.sets(s2);\r\n        (a*b).print();\r\n    }\r\n    return 0;\r\n}\r\n', ''),
(34, 1005, 2, 1, 62, 3608, -9945157, '2018-02-05 00:23:28', 0, '#include <algorithm>\r\n#include <cctype>\r\n#include <cmath>\r\n#include <cstdio>\r\n#include <cstdlib>\r\n#include <cstring>\r\n#include <ctime>\r\n#include <iomanip>\r\n#include <iostream>\r\n#include <map>\r\n#include <queue>\r\n#include <string>\r\n#include <set>\r\n#include <vector>\r\n#include <cassert>\r\nusing namespace std;\r\ntypedef long long LL;\r\nconst int N = 507 , INF = 0x3f3f3f3f , M = 1005;\r\nconst double PI = acos(0.0) * 2;\r\ntemplate<typename T1>\r\nT1 gcd(T1 a , T1 b){ return b ? gcd(b,a%b) : a;}\r\n\r\nstruct BigNum{\r\n    int a[N];\r\n    enum{MOD = 10000};\r\n    void sets(char *s){\r\n        int t,k,ind,l,i;\r\n        memset(a,0,sizeof(a));\r\n        l = strlen(s);\r\n        a[0] = l / 4;\r\n        a[0] += l % 4 != 0 ? 1 : 0;\r\n        ind = 1;\r\n        for(int i = l-1 ; i >= 0 ; i -= 4){\r\n            t = 0;\r\n            k = max(0,i-3);\r\n            for(int j = k ; j <= i ; j++)   t = t * 10 + s[j] - \'0\';\r\n            a[ind++] = t;\r\n        }\r\n    }\r\n    void print(){\r\n        printf(\"%d\",a[a[0]]);\r\n        for(int i = a[0] - 1 ; i > 0 ; i--){\r\n            if(a[i] == 0){\r\n                printf(\"0000\");\r\n                continue;\r\n            }\r\n            for(int k = 10 ; k * a[i] < MOD ; k *= 10) putchar(\'0\');\r\n            printf(\"%d\",a[i]);\r\n        }\r\n        puts(\"\");\r\n    }\r\n    int& operator[](int p){return a[p];}\r\n    const int& operator[](int p)const{return a[p];}\r\n    BigNum operator * (const BigNum& b){\r\n        BigNum c;\r\n        c.sets(\"0\");\r\n        c[0] = a[0] + b[0];\r\n        for(int i = 1 ; i <= a[0] ; i++){\r\n            for(int j = 1 ; j <= b[0] ; j++){\r\n                c[i+j-1] += a[i] * b[j];\r\n                c[i+j] += c[i+j-1] / MOD;\r\n                c[i+j-1] %= MOD;\r\n            }\r\n        }\r\n        if( c[c[0]] == 0 )  c[0]--;\r\n        return c;\r\n    }\r\n}a,b;\r\n\r\nchar s1[M],s2[M];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    while(~scanf(\"%s%s\",s1,s2)){\r\n        a.sets(s1);\r\n        b.sets(s2);\r\n        (a*b).print();\r\n    }\r\n    return 0;\r\n}\r\n', ''),
(35, 1006, 2, 1, 421, 3468, -9945157, '2018-02-05 00:27:19', 0, '#include <algorithm>\r\n#include <cctype>\r\n#include <cmath>\r\n#include <cstdio>\r\n#include <cstdlib>\r\n#include <cstring>\r\n#include <ctime>\r\n#include <iomanip>\r\n#include <iostream>\r\n#include <map>\r\n#include <queue>\r\n#include <string>\r\n#include <set>\r\n#include <vector>\r\n#include <cassert>\r\nusing namespace std;\r\ntypedef long long LL;\r\nconst int N = 1e5+5 , INF = 0x3f3f3f3f , M = 1e5+1;\r\nconst double PI = acos(0.0) * 2;\r\ntemplate<typename T1>\r\nT1 gcd(T1 a , T1 b){ return b ? gcd(b,a%b) : a;}\r\n\r\nstruct Complex{\r\n    double re,im;\r\n    Complex(double r = 0 , double i = 0):re(r),im(i){}\r\n    Complex operator + (Complex rhs){\r\n        return Complex(re+rhs.re,im+rhs.im);\r\n    }\r\n    Complex operator * (Complex rhs){\r\n        return Complex(re*rhs.re-im*rhs.im,re*rhs.im+im*rhs.re);\r\n    }\r\n    Complex operator - (Complex rhs){\r\n        return Complex(re-rhs.re,im-rhs.im);\r\n    }\r\n}a[N<<2] , b[N<<2];\r\n\r\nchar s1[M] , s2[M];\r\nint ans[N<<2];\r\n\r\nvoid change(Complex *y , int len){\r\n    for(int i = 1 , j = len>>1 ; i+1 < len ; i++){\r\n        if( i < j ) swap(y[i],y[j]);\r\n        int k = len>>1;\r\n        while( j >= k ){\r\n            j -= k;\r\n            k >>= 1;\r\n        }\r\n        if( j < k ) j += k;\r\n    }\r\n}\r\n\r\nvoid FFT(Complex *y , int len , int on = 1){\r\n    change(y,len);\r\n    for(int i = 2 ; i <= len ; i <<= 1){\r\n        Complex wn(cos(-on*2*PI/i) , sin(-on*2*PI/i));\r\n        for(int j = 0 ; j < len ; j += i){\r\n            Complex w(1);\r\n            int o = i>>1;\r\n            for(int k = j ; k < j+o ; k++){\r\n                Complex u = y[k] , t = w * y[k+o];\r\n                y[k] = u + t;\r\n                y[k+o] = u - t;\r\n                w = w * wn;\r\n            }\r\n        }\r\n    }\r\n    if( on == -1 )\r\n        for(int i = 0 ; i < len ; i++)  y[i].re /= len;\r\n}\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    while(~scanf(\"%s%s\",s1,s2)){\r\n        int n = strlen(s1) , m = strlen(s2) , len = 1;\r\n        while(len < n+m)    len <<= 1;\r\n        for(int i = 0 ; i < n ; i++)    a[i] = Complex(s1[n-i-1] - \'0\');\r\n        for(int i = n ; i < len ; i++)  a[i] = Complex();\r\n        for(int i = 0 ; i < m ; i++)    b[i] = Complex(s2[m-i-1] - \'0\');\r\n        for(int i = m ; i < len ; i++)  b[i] = Complex();\r\n        FFT(a,len);\r\n        FFT(b,len);\r\n        for(int i = 0 ; i < len ; i++)  a[i] = a[i] * b[i];\r\n        FFT(a,len,-1);\r\n        for(int i = 0 ; i < len ; i++)  ans[i] = (int)(a[i].re+0.5);\r\n        for(int i = 0 ; i < len ; i++){\r\n            ans[i+1] += ans[i] / 10;\r\n            ans[i] %= 10;\r\n        }\r\n        int p = n+m-1;\r\n        while( ans[p] <= 0 && p > 0 )   p--;\r\n        for(int i = p ; i >= 0 ; i--)   putchar(ans[i] + \'0\');\r\n        puts(\"\");\r\n    }\r\n    return 0;\r\n}\r\n', ''),
(36, 1006, 2, 6003, 3000, 3628, -9945157, '2018-02-05 00:28:53', 0, '#include <algorithm>\r\n#include <cctype>\r\n#include <cmath>\r\n#include <cstdio>\r\n#include <cstdlib>\r\n#include <cstring>\r\n#include <ctime>\r\n#include <iomanip>\r\n#include <iostream>\r\n#include <map>\r\n#include <queue>\r\n#include <string>\r\n#include <set>\r\n#include <vector>\r\n#include <cassert>\r\nusing namespace std;\r\ntypedef long long LL;\r\nconst int N = 50007 , INF = 0x3f3f3f3f , M = 100005;\r\nconst double PI = acos(0.0) * 2;\r\ntemplate<typename T1>\r\nT1 gcd(T1 a , T1 b){ return b ? gcd(b,a%b) : a;}\r\n\r\nstruct BigNum{\r\n    int a[N];\r\n    enum{MOD = 10000};\r\n    void sets(char *s){\r\n        int t,k,ind,l,i;\r\n        memset(a,0,sizeof(a));\r\n        l = strlen(s);\r\n        a[0] = l / 4;\r\n        a[0] += l % 4 != 0 ? 1 : 0;\r\n        ind = 1;\r\n        for(int i = l-1 ; i >= 0 ; i -= 4){\r\n            t = 0;\r\n            k = max(0,i-3);\r\n            for(int j = k ; j <= i ; j++)   t = t * 10 + s[j] - \'0\';\r\n            a[ind++] = t;\r\n        }\r\n    }\r\n    void print(){\r\n        printf(\"%d\",a[a[0]]);\r\n        for(int i = a[0] - 1 ; i > 0 ; i--){\r\n            if(a[i] == 0){\r\n                printf(\"0000\");\r\n                continue;\r\n            }\r\n            for(int k = 10 ; k * a[i] < MOD ; k *= 10) putchar(\'0\');\r\n            printf(\"%d\",a[i]);\r\n        }\r\n        puts(\"\");\r\n    }\r\n    int& operator[](int p){return a[p];}\r\n    const int& operator[](int p)const{return a[p];}\r\n    BigNum operator * (const BigNum& b){\r\n        BigNum c;\r\n        c.sets(\"0\");\r\n        c[0] = a[0] + b[0];\r\n        for(int i = 1 ; i <= a[0] ; i++){\r\n            for(int j = 1 ; j <= b[0] ; j++){\r\n                c[i+j-1] += a[i] * b[j];\r\n                c[i+j] += c[i+j-1] / MOD;\r\n                c[i+j-1] %= MOD;\r\n            }\r\n        }\r\n        if( c[c[0]] == 0 )  c[0]--;\r\n        return c;\r\n    }\r\n}a,b;\r\n\r\nchar s1[M],s2[M];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    while(~scanf(\"%s%s\",s1,s2)){\r\n        a.sets(s1);\r\n        b.sets(s2);\r\n        (a*b).print();\r\n    }\r\n    return 0;\r\n}\r\n', ''),
(38, 1013, 1, 8, 0, 0, 1, '2018-02-07 00:45:32', 0, '#include <iostream>\r\nusing namespace std;\r\n\r\nint main(){\r\n    printf(\"1800\\n\");\r\n    return 0;\r\n}', 'main.c:1:20: fatal error: iostream: No such file or directory\r\r\n #include <iostream>\r\r\r\n                    ^\r\r\ncompilation terminated.'),
(39, 1013, 1, 8, 0, 0, 1, '2018-02-07 00:48:19', 0, '#include <stdio.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n    printf(\"1800\\n\");\r\n    return 0;\r\n}	', 'main.c:3:1: error: unknown type name \'using\'\r\r\n \r\r\r\n ^\r\r\nmain.c:3:17: error: expected \'=\', \',\', \';\', \'asm\' or \'__attribute__\' before \'std\'\r\r\n \r\r\r\n                 ^'),
(40, 1013, 1, -1, 161, 3464, 1, '2018-02-07 00:48:55', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    printf(\"1800\\n\");\r\n    return 0;\r\n}	', ''),
(41, 1000, 1, 1, 52, 3488, 4, '2018-02-09 22:42:21', 0, '#include<stdio.h>\r\nint main()\r\n{\r\n   int a,b;\r\n   scanf(\"%d%d\",&a,&b);\r\n   printf(\"%d\",a+b);\r\n   return 0;\r\n } ', ''),
(43, 1013, 2, 7002, 65, 3620, -9945157, '2018-02-18 21:38:33', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    printf(\"1800\\n\");\r\n    return 0;\r\n}', '');

-- --------------------------------------------------------

--
-- 表的结构 `user_information`
--

DROP TABLE IF EXISTS `user_information`;
CREATE TABLE IF NOT EXISTS `user_information` (
  `id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `nike_name` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `authority` int(11) NOT NULL,
  `register_time` datetime NOT NULL,
  `last_loading_time` datetime NOT NULL,
  `cid_allow` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `cid_allow` (`cid_allow`),
  KEY `nike_name` (`nike_name`),
  KEY `user_name_2` (`user_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user_information`
--

INSERT INTO `user_information` (`id`, `user_name`, `nike_name`, `password`, `authority`, `register_time`, `last_loading_time`, `cid_allow`) VALUES
(-9945157, 'admin', 'admin', '6540729b0ff418c25500d7372c3905cd', 9, '2017-11-22 22:44:15', '2017-11-22 22:44:15', 0),
(1, '2015210004', 'wdjs', '6540729b0ff418c25500d7372c3905cd', 7, '2017-11-22 21:47:07', '2017-11-22 21:47:07', 0),
(3, 'keke', 'kkkkk', '7a9e4b5025a8adc7d3208fd66806d685', 1, '2018-02-07 18:51:19', '2018-02-07 18:51:19', 0),
(4, 'kekekeke', 'keke', 'f4abeda033b9ba1b495861eedfc94679', 6, '2018-02-09 22:35:27', '2018-02-09 22:35:27', 0),
(5, 'hq234', 'hsxiçš„çˆ¸çˆ¸', '51077427c5d391d01a29eec649dde9aa', 7, '2018-02-13 20:59:52', '2018-02-13 20:59:52', 0);

-- --------------------------------------------------------

--
-- 表的结构 `user_information_1`
--

DROP TABLE IF EXISTS `user_information_1`;
CREATE TABLE IF NOT EXISTS `user_information_1` (
  `id` int(11) NOT NULL,
  `submit_number` int(11) NOT NULL,
  `ac` int(11) NOT NULL,
  `wa` int(11) NOT NULL,
  `pe` int(11) NOT NULL,
  `tl` int(11) NOT NULL,
  `ml` int(11) NOT NULL,
  `re` int(11) NOT NULL,
  `ce` int(11) NOT NULL,
  `pass_number` int(11) NOT NULL,
  `pass_problem` varchar(10000) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `user_information_1`
--

INSERT INTO `user_information_1` (`id`, `submit_number`, `ac`, `wa`, `pe`, `tl`, `ml`, `re`, `ce`, `pass_number`, `pass_problem`) VALUES
(-9945157, 27, 14, 6, 0, 4, 0, 0, 3, 8, '1000,1001,1002,1003,1004,1005,1006,1011'),
(1, 11, 6, 0, 0, 0, 0, 0, 5, 2, '1000,1013'),
(3, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4, 2, 1, 0, 0, 0, 0, 0, 1, 0, '1000'),
(5, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `web_number_information`
--

DROP TABLE IF EXISTS `web_number_information`;
CREATE TABLE IF NOT EXISTS `web_number_information` (
  `id` int(11) NOT NULL,
  `description` varchar(60) NOT NULL,
  `next_numbers` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `web_number_information`
--

INSERT INTO `web_number_information` (`id`, `description`, `next_numbers`) VALUES
(1, 'user_numbers', 6),
(2, 'loading_falg_nums', 97),
(3, 'new_problem_id', 1016),
(4, 'test_id', 6),
(5, 'submit_number', 44),
(6, 'huck_number', 6),
(7, 'contest_1_id', 2),
(8, 'contest_2_id', 7),
(9, 'contest_pro_submit_id', 11),
(10, 'contest_rank_information_1_id', 26),
(11, 'contest_ranks_information_2_id', 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

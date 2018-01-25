-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 2018-01-25 14:44:30
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
(35, 64137164, 40760500, -9945157, '2018-01-25 22:42:36'),
(34, 54878502, 128276, -9945157, '2018-01-25 17:54:40'),
(33, 17084772, 25236539, -1, '2018-01-25 11:13:19'),
(30, 78550187, 57630235, -1, '2018-01-25 11:08:31'),
(28, 70048447, 26549298, -1, '2018-01-25 00:00:52'),
(26, 23082419, 95814645, -1, '2018-01-24 20:10:54'),
(24, 42749837, 93623893, -1, '2018-01-22 21:44:25'),
(22, 14568108, 43904004, -1, '2018-01-22 21:42:50'),
(20, 79244751, 4870619, -9945157, '2018-01-16 15:43:49');

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
(1000, 'A+B Problem', 500, 5, 1000, 10, 'Single example.\r\nTwo integer a,b (0<=a,b<=10^9)', 'Output a+b', 0, 10),
(1001, 'Maximum Gcd', 1000, 128, 2000, 128, 'There is only one test case .\r\nThe first line contains a integer n ( 2 â‰¤ n â‰¤ 10^3 )  , which is the number of integers .\r\nThe second line contains n integers a1,a2...an ( 1 â‰¤ ai â‰¤ 10^9  )  separated by a space .', 'Print 3 integers i , j , k  in a line separated by a space .\r\nIf there are multiple answers , minimize i , then minimize j .', 0, 0),
(1002, 'Count ACM', 1000, 128, 2000, 128, 'For each case, there is only one line giving a string of no more than 10^5\r\n\r\nThere are many cases.It is end with EOF\r\n\r\ncharacters containing only A, C, or M.', 'For each test case, print in one line the number of ACM\'s contained in the string. Since the result may be a huge number, you only have to output the result moded by 1000000007.', 0, 0),
(1003, 'Longest Elegant Subsequence', 3000, 128, 6000, 128, 'There are multiple test cases.\r\n\r\nThe first line of the input contains an integer T(T<=10) which indicates the number of test cases.\r\n\r\nFor each test case, the first line contains an integer n(0 < n < 106) indicating the length of the sequence that sister Guo have got.\r\n\r\nThe second line contains n integers a1,a2,...,an(0 <= ai <= 109) separated by spaces.', 'For each test case, output the length of the longest elegant subsequence.', 0, 0),
(1004, 'a x b (â… )', 500, 64, 1, 64, 'æœ¬é¢˜æœ‰å¤šç»„æ•°æ®\r\næ¯ç»„æ•°æ®æœ‰ä¸€è¡Œ2ä¸ªæ•´æ•°a, b(0<=a,b<=105), ç”±ç©ºæ ¼éš”å¼€\r\nè¯·å¤„ç†åˆ°æ–‡ä»¶æœ«å°¾', 'æ¯ç»„æµ‹è¯•æ ·ä¾‹è¾“å‡ºä¸€è¡Œä¸€ä¸ªæ•´æ•°ï¼Œè¡¨ç¤ºa x bçš„ç»“æžœ', 0, 0),
(1005, 'a x b (â…¡)', 1000, 128, 2000, 128, 'æœ¬é¢˜æœ‰å¤šç»„æ•°æ®\r\næ¯ç»„æ•°æ®æœ‰ä¸€è¡Œ2ä¸ªæ•´æ•°a, b(0<=a,b<=101000), ç”±ç©ºæ ¼éš”å¼€\r\nè¯·å¤„ç†åˆ°æ–‡ä»¶æœ«å°¾', 'æ¯ç»„æµ‹è¯•æ ·ä¾‹è¾“å‡ºä¸€è¡Œä¸€ä¸ªæ•´æ•°ï¼Œè¡¨ç¤ºa x bçš„ç»“æžœ', 0, 0),
(1006, 'a x b (â…¢)', 3000, 128, 6000, 128, 'æœ¬é¢˜æœ‰å¤šç»„æ•°æ®\r\næ¯ç»„æ•°æ®æœ‰ä¸€è¡Œ2ä¸ªæ•´æ•°a, b(0<=a,b<=10100000), ç”±ç©ºæ ¼éš”å¼€\r\nè¯·å¤„ç†åˆ°æ–‡ä»¶æœ«å°¾', 'å¯¹æ¯ç»„æ•°æ®ï¼Œè¾“å‡ºä¸€è¡Œä¸€ä¸ªæ•´æ•°ï¼Œè¡¨ç¤ºa x bçš„ç»“æžœ', 0, 0),
(1007, 'äºŒç»´GCDå‰ç¼€ç§¯', 2000, 128, 3000, 128, 'å¤šç»„æ•°æ®\r\n\r\nç¬¬ä¸€è¡Œæœ‰ä¸€ä¸ªæ•´æ•°T(T<=20)ï¼Œä»£è¡¨æ•°æ®ç»„æ•°\r\n\r\nå¯¹æ¯ç»„æ•°æ®ï¼Œæœ‰ä¸¤ä¸ªç”±ç©ºæ ¼åˆ†éš”çš„æ•´æ•°nï¼Œm(1<=n, m <= 10^7)', 'å¯¹æ¯ç»„æ•°æ®ï¼Œè¾“å‡ºç­”æ¡ˆé™¤ä»¥998244353çš„ä½™æ•°', 0, 0),
(1008, 'COS12', 1000, 128, 2000, 128, 'å¤šç»„æ•°æ®\r\n\r\nç¬¬ä¸€è¡Œæœ‰ä¸€ä¸ªæ•´æ•°T(T<=20)ï¼Œä»£è¡¨æ•°æ®ç»„æ•°ã€‚\r\n\r\nå¯¹æ¯ç»„æ•°æ®ï¼Œåªæœ‰ä¸¤ä¸ªæ•´æ•°nå’Œm(0 < n, m <= 500)ï¼Œè¡¨ç¤ºCOS12æ¡Œé¢çš„å¤§å°ã€‚', 'å¯¹æ¯ç»„æ•°æ®ï¼Œè¾“å‡ºæ¡Œé¢ä¸Šæœ€å¤šèƒ½æ”¾ç½®çš„å›¾æ ‡æ•°é‡ã€‚', 0, 0),
(1009, 'mzè¯­è€ƒè¯•', 1000, 128, 2000, 128, 'å¤šç»„æ•°æ®\r\n\r\nç¬¬ä¸€è¡Œæœ‰ä¸€ä¸ªæ•´æ•°T(T<=30)ï¼Œä»£è¡¨æ•°æ®ç»„æ•°ã€‚\r\n\r\nå¯¹æ¯ç»„æ•°æ®ï¼Œç¬¬ä¸€è¡Œæœ‰ä¸¤ä¸ªæ•´æ•°Rã€C(1 <= R, C <= 50)ï¼Œè¡¨ç¤ºè€ƒåœºè§„æ¨¡ã€‚\r\n\r\næŽ¥ä¸‹æ¥Rè¡Œï¼Œæ¯è¡Œæœ‰ä¸€ä¸ªé•¿åº¦ä¸ºCçš„å­—ç¬¦ä¸²ï¼Œæè¿°è€ƒåœºå†…æ¯ä¸ªä½ç½®ã€‚\'.\'è¡¨ç¤ºè¯¥ä½ç½®å¯ç”¨ï¼Œ\'x\'åˆ™è¡¨ç¤ºå·²æŸåã€‚', 'å¯¹æ¯ç»„æ•°æ®ï¼Œè¾“å‡ºè¯¥è€ƒåœºå†…æœ€å¤šèƒ½å®‰æŽ’çš„è€ƒç”Ÿæ•°ã€‚', 0, 0),
(1010, 'è½¦ä¸Šè¿˜å‰©å‡ äºº', 500, 64, 1000, 64, 'å¤šç»„æ ·ä¾‹\r\nç¬¬ä¸€è¡Œè¾“å…¥ä¸€ä¸ªTï¼ˆT <= 20ï¼‰\r\nå¯¹äºŽæ¯ç»„æ ·ä¾‹ï¼š\r\nç¬¬ä¸€è¡Œè¾“å…¥ä¸¤ä¸ªæ•´æ•°n,mï¼Œåˆ†åˆ«è¡¨ç¤ºèµ·ç‚¹ç«™æœ‰å¤šå°‘äººå’Œæœ‰å¤šå°‘ä¸ªç«™ï¼ˆ1<=n<=10^9 , 0 <= m <= 10^6ï¼‰\r\næŽ¥ä¸‹æ¥mè¡Œæ¯è¡Œä¸¤ä¸ªæ•°ai , biè¡¨ç¤ºæ¯ä¸€ç«™ä¸Šä¸‹è½¦äººæ•° ( 1<=ai,bi<=10^9 )', 'è¾“å‡ºä¸€ä¸ªæ•´æ•°è¡¨ç¤ºç­”æ¡ˆï¼Œå¦‚æžœä¸å¯èƒ½ï¼Œåˆ™è¾“å‡ºâ€˜-1â€™', 0, 0),
(1011, 'å¯å¯å¯çš„æ–æ³¢æ‹‰å¥‘æ•°åˆ—', 1000, 128, 2000, 128, 'ç¬¬ä¸€è¡Œè¾“å…¥ä¸€ä¸ªæ­£æ•´æ•°Tè¡¨ç¤ºTç»„æ ·ä¾‹ï¼ˆT<=100ï¼‰\r\næŽ¥ä¸‹æ¥æ¯ä¸ªæ ·ä¾‹è¾“å…¥ä¸€ä¸ªæ­£æ•´æ•°Nï¼ˆN<=10^5ï¼‰', 'æ¯ç»„æ ·ä¾‹è¾“å‡ºä¸€ä¸ªæ•´æ•°è¡¨ç¤ºå¯å¯æ‰€æ±‚çš„åº”ç”¨æ–æ³¢æ‹‰å¥‘ç¬¬Né¡¹', 0, 0),
(1012, 'æœ€å°ç”Ÿæˆæ ‘', 1000, 128, 2000, 256, 'ç¬¬ä¸€è¡Œè¾“å…¥ä¸€ä¸ªTè¡¨ç¤ºæœ‰Tç»„æ ·ä¾‹ï¼ˆT <= 10ï¼‰\r\næŽ¥ä¸‹æ¥æ¯ç»„æ ·ä¾‹\r\nç¬¬ä¸€è¡Œè¾“å…¥ä¸€ä¸ªN Mè¡¨ç¤ºNä¸ªç‚¹ï¼ŒMæ¡è¾¹( 2 <= N <= 10^5 , 1 <= M <= min(N*(N-1)/2),10^5)\r\næŽ¥ä¸‹æ¥Mè¡Œè¾“å…¥ui , vi, wiè¡¨ç¤ºä»Žui åˆ° vi æœ‰ä¸€æ¡æ— å‘è¾¹ï¼Œé•¿åº¦ä¸ºwiï¼Œï¼ˆ1 <= ui , vi <= N , 1 <= wi <= 10^9 ï¼‰\r\n', 'æ¯ç»„æ ·ä¾‹è¾“å‡ºå°†å›¾å…¨è”é€šæœ€å°æƒé‡åœ¨ä¸€è¡Œ', 0, 0),
(1013, 'cwwä¸Žwcw', 1000, 128, 1000, 128, 'å•ç»„æ ·ä¾‹\r\nç¬¬ä¸€è¡Œè¾“å…¥ä¸€ä¸ªNè¡¨ç¤ºå¯å¯æœ‰Næ¬¡cæˆ–è€…wæ“ä½œï¼ˆ1<=N<=100ï¼‰\r\nç¬¬äºŒè¡Œè¾“å…¥ä¸€ä¸ªé•¿åº¦ä¸ºNçš„å­—ç¬¦ä¸²ï¼Œè¡¨ç¤ºå¯å¯çš„c,wæ“ä½œé¡ºåºï¼ˆä¿è¯å­—ç¬¦ä¸²ä¸­åªå‡ºçŽ°c,wï¼‰', 'è¾“å‡ºä¸€ä¸ªæ•´æ•°è¡¨ç¤ºæœ€é«˜çš„å¹³å‡é€Ÿåº¦', 0, 0);

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
(1011, 'å·²çŸ¥æ–æ³¢æ‹‰å¥‘æ•°åˆ—æ˜¯1,1,2,3,5,8,13,21,.....\r\nçŽ°åœ¨å¯å¯æƒ³çŸ¥é“æ–æ³¢æ‹‰å¥‘æ•°åˆ—çš„ç¬¬Né¡¹æ˜¯å¤šå°‘\r\nä½†æ˜¯å› ä¸ºNå¾ˆå¤§ï¼Œæ‰€ä»¥è®¡ç®—å‡ºæ¥çš„æ•°å­—å¾ˆå¤§ï¼Œå¯å¯è§£å†³ä¸äº†ï¼Œæ‰€ä»¥å¸Œæœ›ä½ èƒ½å¸®å¿™ï¼Ÿ\r\nè¯·é—®ä½ èƒ½å¸®åŠ©å¯å¯å—ï¼Ÿ', '5\r\n1\r\n2\r\n3\r\n20\r\n200', '1\r\n1\r\n2\r\n6765\r\n280571172992510140037611932413038677189525'),
(1012, 'ç»™å®šä¸€å¼ å›¾ï¼Œæ±‚æœ€å°ç”Ÿæˆæ ‘', '1\r\n3 3\r\n1 2 3\r\n1 3 3\r\n2 3 1', '4'),
(1013, 'QQé£žè½¦ä¸­æœ‰å°å–·,åŒå–·ï¼Œcwwå–·ï¼Œwcwå–·ï¼Œæ°®æ°”,cwå–·\r\nçŽ°åœ¨æˆ‘ä»¬ç”¨wè¡¨ç¤ºå°å–·ï¼Œwwè¡¨ç¤ºåŒå–·ï¼Œcè¡¨ç¤ºæ°®æ°”\r\né‚£ä¹ˆåœ¨ä¸€å±€æ¯”èµ›ä¸­æˆ‘ä»¬æœ‰å¾ˆå¤šwä¸Žcçš„æ“ä½œï¼ŒçŽ°åœ¨å®šä¹‰\r\nå°å–·å¯ä»¥æé«˜å¹³å‡é€Ÿåº¦100\r\nåŒå–·å¯ä»¥æé«˜å¹³å‡é€Ÿåº¦140\r\næ°®æ°”å¯ä»¥æé«˜å¹³å‡é€Ÿåº¦250\r\ncwå–·å¯ä»¥æé«˜å¹³å‡é€Ÿåº¦400\r\ncwwå–·å¯ä»¥æé«˜å¹³å‡é€Ÿåº¦550\r\nwcwå–·å¯ä»¥æé«˜å¹³å‡é€Ÿåº¦535\r\nçŽ°åœ¨å¯å¯æœ‰è¿žç»­çš„æ“ä½œï¼Œä¸ºäº†ç®€åŒ–è®¡ç®—ï¼Œè¿™é‡Œåªè®°å½•å¯å¯çš„c,wæ“ä½œ\r\nå¯å¯æƒ³çŸ¥é“è¿™ä¸æ”¹å˜æ“ä½œé¡ºåºçš„å‰æå…ˆå¦‚ä½•èŽ·å¾—æœ€é«˜çš„å¹³å‡é€Ÿåº¦\r\nå·²çŸ¥å¯å¯å…¨ç¨‹æ— å–·æ— æ°®çš„å¹³å‡é€Ÿåº¦ä¸º50', '11\r\ncwwcwwwcww', '1800');

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
(1001, '', -9945157, '2017-11-26 19:40:30', '2017-11-26 19:40:30', 0, 0),
(1002, '', -9945157, '2017-11-26 23:25:20', '2017-11-26 23:25:20', 0, 0),
(1003, '', -9945157, '2017-11-27 22:14:26', '2017-11-27 22:14:26', 0, 0),
(1004, 'åˆå…¥ç¨‹åºè®¾è®¡ç«žèµ›çš„æ‚¨å¯èƒ½éœ€è¦æ³¨æ„ï¼š\r\n\r\n\r\n1. Wrang Answerï¼Ÿ\r\n\r\nå¯èƒ½çˆ†intè¾£ï¼Ÿ\r\n\r\nC/C++ä»¥åŠjavaä¸­çš„intç±»åž‹ï¼ˆ32ä½æœ‰ç¬¦å·æ•´æ•°ï¼‰èƒ½è¡¨ç¤ºçš„èŒƒå›´ä¸º-2^31 ~ 2^31 - 1, 2^31çº¦ä¸º2.147x10^9\r\n\r\nunsigned intï¼ˆ32ä½æ— ç¬¦å·æ•´æ•°ï¼‰è¡¨ç¤ºçš„èŒƒå›´ä¸º0 ~ 2^32 - 1\r\n\r\næ‚¨å¯èƒ½éœ€è¦ä½¿ç”¨æ›´å¤§èŒƒå›´çš„ç±»åž‹ï¼Œ64ä½æœ‰ç¬¦å·æ•´æ•°ï¼Œèƒ½è¡¨ç¤ºåˆ°2^63 - 1, çº¦ä¸º9.233x10^18\r\n\r\nC/C++ä¸ºlong longæˆ–__int64, å¯¹åº”çš„æ ¼å¼æŽ§åˆ¶ç¬¦ä¸º%lldæˆ–%I64d(å…·ä½“ç”¨å“ªä¸ªçœ‹æµ‹è¯•å¹³å°ï¼Œæœ¬ojè¯·ä½¿ç”¨%lld)\r\n\r\njavaä¸­ä¸ºlong \r\n\r\n\r\n2. Time Limit Exceededï¼Ÿ\r\n\r\nå¯èƒ½æ‚¨å¹¶ä¸çŸ¥é“å¦‚ä½•å¤„ç†æ–‡ä»¶æœ«å°¾ï¼Ÿ\r\n\r\nCå¯ä»¥åˆ©ç”¨scanf,getsç­‰æ ‡å‡†è¾“å…¥å‡½æ•°çš„è¿”å›žå€¼å’ŒEOFå®, å¦‚while(scanf(\"%d%d\", &a, &b) != EOF) { }\r\n\r\nC++åˆ©ç”¨istreamç±»>>è¿ç®—ç¬¦çš„è¿”å›žå€¼ï¼Œå¦‚while(cin >> a >> b) { }\r\n\r\njavaå¯ä»¥åˆ©ç”¨Scannerç±»çš„hasNextæ–¹æ³•\r\n\r\n\r\n3. Presentation Errorï¼Ÿ\r\n\r\nè¯·ä¸¥æ ¼æŒ‰ç…§è¾“å‡ºæ ¼å¼è¿›è¡Œè¾“å‡ºï¼Œä¸è¦æœ‰å¤šä½™çš„æç¤ºæ€§è¯­å¥ï¼ˆå¦‚\"è¯·è¾“å…¥ä¸€ä¸ªæ•´æ•°\"ã€\"a x b =\"ç­‰ï¼‰ï¼Œè¡Œæœ«ä¸è¦æœ‰å¤šä½™çš„ç©ºæ ¼', -9945157, '2017-11-27 22:19:45', '2017-11-27 22:19:45', 0, 0),
(1005, '', -9945157, '2017-11-27 22:21:06', '2017-11-27 22:21:06', 7, 0),
(1006, '', -9945157, '2017-11-27 22:22:05', '2017-11-27 22:22:05', 7, 0),
(1007, '', -9945157, '2017-11-27 23:34:28', '2017-11-27 23:34:28', 9, 0),
(1008, '', -9945157, '2017-11-27 23:39:48', '2017-11-27 23:39:48', 9, 0),
(1009, '', -9945157, '2017-11-27 23:41:35', '2017-11-27 23:41:35', 7, 0),
(1010, '', -9945157, '2017-11-28 15:59:09', '2017-11-28 21:26:37', 9, 0),
(1011, '', -9945157, '2017-12-07 00:00:00', '2017-12-07 00:00:00', 1, 0),
(1012, '', -9945157, '2018-01-16 15:43:35', '2018-01-16 15:43:35', 0, 0),
(1013, 'å¯å¯å¯ä»¥å†³å®šcww cww w cww\r\nç„¶åŽæœ€ç»ˆå¹³å‡é€Ÿåº¦ä¸º50 + 550 + 550 + 100 + 550 = 1800 ', -9945157, '2018-01-25 10:52:10', '2018-01-25 10:52:10', 0, 0);

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pro_submit`
--

INSERT INTO `pro_submit` (`id`, `pro_id`, `language`, `result`, `u_time`, `u_memory`, `user_id`, `_date`, `huck`, `code`, `compile`) VALUES
(1, 1000, 2, 9001, 0, 0, -9945157, '2017-11-29 23:35:50', 0, '#include<bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n    int a,b;\r\n    cin>>a>>b;\r\n    cout<<a+b<<endl;\r\n    return 0;\r\n}\r\n', ''),
(2, 1000, 1, 9001, 0, 0, -9945157, '2017-12-18 00:50:49', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    int a,b;\r\n    scanf(\"%d%d\",&a,&b);\r\n    printf(\"%d\\n\",a+b);\r\n    return 0;\r\n}\r\n', ','),
(3, 1000, 1, 8, 0, 0, 1, '2017-12-19 00:31:18', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    int a,b;\r\n    scanf(\"%d%d\",&a,&b);\r\n    printf(\"%d\n\",a+b);\r\n    return 0;\r\n}', 'main.c: In function \'main\':\r\r\nmain.c:11:12: warning: missing terminating \" character\r\r\nmain.c:11:5: error: missing terminating \" character\r\r\nmain.c:12:1: warning: missing terminating \" character\r\r\nmain.c:12:1: error: missing terminating \" character\r\r\nmain.c:14:5: error: expected expression before \'return\'\r\r\nmain.c:16:1: error: expected \';\' before \'}\' token'),
(4, 1000, 1, 8, 0, 0, 1, '2017-12-19 00:31:58', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    int a,b;\r\n    scanf(\"%d%d\",&a,&b);\r\n    printf(\"%d\n\",a+b);\r\n    return 0;\r\n}', 'main.c: In function \'main\':\r\r\nmain.c:11:12: warning: missing terminating \" character\r\r\nmain.c:11:5: error: missing terminating \" character\r\r\nmain.c:12:1: warning: missing terminating \" character\r\r\nmain.c:12:1: error: missing terminating \" character\r\r\nmain.c:14:5: error: expected expression before \'return\'\r\r\nmain.c:16:1: error: expected \';\' before \'}\' token'),
(5, 1000, 1, 8, 0, 0, 1, '2017-12-19 00:32:34', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    int a,b;\r\n    scanf(\"%d%d\",&a,&b);\r\n    printf(\"%d\n\",a+b);\r\n    return 0;\r\n}', 'main.c: In function \'main\':\r\r\nmain.c:11:12: warning: missing terminating \" character\r\r\nmain.c:11:5: error: missing terminating \" character\r\r\nmain.c:12:1: warning: missing terminating \" character\r\r\nmain.c:12:1: error: missing terminating \" character\r\r\nmain.c:14:5: error: expected expression before \'return\'\r\r\nmain.c:16:1: error: expected \';\' before \'}\' token'),
(6, 1000, 1, 9001, 0, 0, 1, '2017-12-19 00:34:33', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    int a,b;\r\n    scanf(\"%d%d\",&a,&b);\r\n    printf(\"%d\\\n\",a+b);\r\n    return 0;\r\n}', ','),
(7, 1000, 1, 9001, 0, 0, 1, '2017-12-19 00:34:51', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    int a,b;\r\n    scanf(\"%d%d\",&a,&b);\r\n    printf(\"%d\\n\",a+b);\r\n    return 0;\r\n}', ','),
(8, 1000, 1, 9001, 0, 0, 1, '2017-12-19 13:34:01', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    int a,b;\r\n    while(~scanf(\"%d%d\",&a,&b))\r\n        printf(\"%d\\n\",a+b);\r\n    return 0;\r\n}\r\n', ','),
(9, 1000, 1, 9001, 0, 0, 1, '2017-12-19 13:34:46', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    int a,b;\r\n    while(~scanf(\"%d%d\",&a,&b))\r\n        printf(\"%d\\n\",a+b);\r\n    return 0;\r\n}\r\n', ','),
(10, 1000, 1, 9001, 0, 0, 1, '2017-12-19 13:35:38', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    int a,b;\r\n    while(~scanf(\"%d%d\",&a,&b))\r\n        printf(\"%d\\n\",a+b);\r\n    return 0;\r\n}\r\n', ',');

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user_information`
--

INSERT INTO `user_information` (`id`, `user_name`, `nike_name`, `password`, `authority`, `register_time`, `last_loading_time`) VALUES
(-9945157, 'admin', 'admin', '6540729b0ff418c25500d7372c3905cd', 9, '2017-11-22 22:44:15', '2017-11-22 22:44:15'),
(1, '2015210004', 'wdjs', '6540729b0ff418c25500d7372c3905cd', 7, '2017-11-22 21:47:07', '2017-11-22 21:47:07');

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
(1, 'user_numbers', 3),
(2, 'loading_falg_nums', 36),
(3, 'new_problem_id', 1014),
(4, 'test_id', 6),
(5, 'submit_number', 11);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

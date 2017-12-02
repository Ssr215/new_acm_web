-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 2017-12-02 01:51:26
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
(0, -1, -1, -1, '2017-11-21 00:00:00'),
(7, 67445170, 89905115, -9945157, '2017-11-29 23:35:50');

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
(1000, 'A+B Problem', 500, 5, 1000, 10, 'Single example.\r\nTwo integer a,b (0<=a,b<=10^9)', 'Output a+b', 0, 0),
(1001, 'Maximum Gcd', 1000, 128, 2000, 128, 'There is only one test case .\r\nThe first line contains a integer n ( 2 â‰¤ n â‰¤ 10^3 )  , which is the number of integers .\r\nThe second line contains n integers a1,a2...an ( 1 â‰¤ ai â‰¤ 10^9  )  separated by a space .', 'Print 3 integers i , j , k  in a line separated by a space .\r\nIf there are multiple answers , minimize i , then minimize j .', 0, 0),
(1002, 'Count ACM', 1000, 128, 2000, 128, 'For each case, there is only one line giving a string of no more than 10^5\r\n\r\nThere are many cases.It is end with EOF\r\n\r\ncharacters containing only A, C, or M.', 'For each test case, print in one line the number of ACM\'s contained in the string. Since the result may be a huge number, you only have to output the result moded by 1000000007.', 0, 0),
(1003, 'Longest Elegant Subsequence', 3000, 128, 6000, 128, 'There are multiple test cases.\r\n\r\nThe first line of the input contains an integer T(T<=10) which indicates the number of test cases.\r\n\r\nFor each test case, the first line contains an integer n(0 < n < 106) indicating the length of the sequence that sister Guo have got.\r\n\r\nThe second line contains n integers a1,a2,...,an(0 <= ai <= 109) separated by spaces.', 'For each test case, output the length of the longest elegant subsequence.', 0, 0),
(1004, 'a x b (â… )', 500, 64, 1, 64, 'æœ¬é¢˜æœ‰å¤šç»„æ•°æ®\r\næ¯ç»„æ•°æ®æœ‰ä¸€è¡Œ2ä¸ªæ•´æ•°a, b(0<=a,b<=105), ç”±ç©ºæ ¼éš”å¼€\r\nè¯·å¤„ç†åˆ°æ–‡ä»¶æœ«å°¾', 'æ¯ç»„æµ‹è¯•æ ·ä¾‹è¾“å‡ºä¸€è¡Œä¸€ä¸ªæ•´æ•°ï¼Œè¡¨ç¤ºa x bçš„ç»“æžœ', 0, 0),
(1005, 'a x b (â…¡)', 1000, 128, 2000, 128, 'æœ¬é¢˜æœ‰å¤šç»„æ•°æ®\r\næ¯ç»„æ•°æ®æœ‰ä¸€è¡Œ2ä¸ªæ•´æ•°a, b(0<=a,b<=101000), ç”±ç©ºæ ¼éš”å¼€\r\nè¯·å¤„ç†åˆ°æ–‡ä»¶æœ«å°¾', 'æ¯ç»„æµ‹è¯•æ ·ä¾‹è¾“å‡ºä¸€è¡Œä¸€ä¸ªæ•´æ•°ï¼Œè¡¨ç¤ºa x bçš„ç»“æžœ', 0, 0),
(1006, 'a x b (â…¢)', 3000, 128, 6000, 128, 'æœ¬é¢˜æœ‰å¤šç»„æ•°æ®\r\næ¯ç»„æ•°æ®æœ‰ä¸€è¡Œ2ä¸ªæ•´æ•°a, b(0<=a,b<=10100000), ç”±ç©ºæ ¼éš”å¼€\r\nè¯·å¤„ç†åˆ°æ–‡ä»¶æœ«å°¾', 'å¯¹æ¯ç»„æ•°æ®ï¼Œè¾“å‡ºä¸€è¡Œä¸€ä¸ªæ•´æ•°ï¼Œè¡¨ç¤ºa x bçš„ç»“æžœ', 0, 0),
(1007, 'äºŒç»´GCDå‰ç¼€ç§¯', 2000, 128, 3000, 128, 'å¤šç»„æ•°æ®\r\n\r\nç¬¬ä¸€è¡Œæœ‰ä¸€ä¸ªæ•´æ•°T(T<=20)ï¼Œä»£è¡¨æ•°æ®ç»„æ•°\r\n\r\nå¯¹æ¯ç»„æ•°æ®ï¼Œæœ‰ä¸¤ä¸ªç”±ç©ºæ ¼åˆ†éš”çš„æ•´æ•°nï¼Œm(1<=n, m <= 10^7)', 'å¯¹æ¯ç»„æ•°æ®ï¼Œè¾“å‡ºç­”æ¡ˆé™¤ä»¥998244353çš„ä½™æ•°', 0, 0),
(1008, 'COS12', 1000, 128, 2000, 128, 'å¤šç»„æ•°æ®\r\n\r\nç¬¬ä¸€è¡Œæœ‰ä¸€ä¸ªæ•´æ•°T(T<=20)ï¼Œä»£è¡¨æ•°æ®ç»„æ•°ã€‚\r\n\r\nå¯¹æ¯ç»„æ•°æ®ï¼Œåªæœ‰ä¸¤ä¸ªæ•´æ•°nå’Œm(0 < n, m <= 500)ï¼Œè¡¨ç¤ºCOS12æ¡Œé¢çš„å¤§å°ã€‚', 'å¯¹æ¯ç»„æ•°æ®ï¼Œè¾“å‡ºæ¡Œé¢ä¸Šæœ€å¤šèƒ½æ”¾ç½®çš„å›¾æ ‡æ•°é‡ã€‚', 0, 0),
(1009, 'mzè¯­è€ƒè¯•', 1000, 128, 2000, 128, 'å¤šç»„æ•°æ®\r\n\r\nç¬¬ä¸€è¡Œæœ‰ä¸€ä¸ªæ•´æ•°T(T<=30)ï¼Œä»£è¡¨æ•°æ®ç»„æ•°ã€‚\r\n\r\nå¯¹æ¯ç»„æ•°æ®ï¼Œç¬¬ä¸€è¡Œæœ‰ä¸¤ä¸ªæ•´æ•°Rã€C(1 <= R, C <= 50)ï¼Œè¡¨ç¤ºè€ƒåœºè§„æ¨¡ã€‚\r\n\r\næŽ¥ä¸‹æ¥Rè¡Œï¼Œæ¯è¡Œæœ‰ä¸€ä¸ªé•¿åº¦ä¸ºCçš„å­—ç¬¦ä¸²ï¼Œæè¿°è€ƒåœºå†…æ¯ä¸ªä½ç½®ã€‚\'.\'è¡¨ç¤ºè¯¥ä½ç½®å¯ç”¨ï¼Œ\'x\'åˆ™è¡¨ç¤ºå·²æŸåã€‚', 'å¯¹æ¯ç»„æ•°æ®ï¼Œè¾“å‡ºè¯¥è€ƒåœºå†…æœ€å¤šèƒ½å®‰æŽ’çš„è€ƒç”Ÿæ•°ã€‚', 0, 0),
(1010, 'è½¦ä¸Šè¿˜å‰©å‡ äºº', 500, 64, 1000, 64, 'å¤šç»„æ ·ä¾‹\r\nç¬¬ä¸€è¡Œè¾“å…¥ä¸€ä¸ªTï¼ˆT <= 20ï¼‰\r\nå¯¹äºŽæ¯ç»„æ ·ä¾‹ï¼š\r\nç¬¬ä¸€è¡Œè¾“å…¥ä¸¤ä¸ªæ•´æ•°n,mï¼Œåˆ†åˆ«è¡¨ç¤ºèµ·ç‚¹ç«™æœ‰å¤šå°‘äººå’Œæœ‰å¤šå°‘ä¸ªç«™ï¼ˆ1<=n<=10^9 , 0 <= m <= 10^6ï¼‰\r\næŽ¥ä¸‹æ¥mè¡Œæ¯è¡Œä¸¤ä¸ªæ•°ai , biè¡¨ç¤ºæ¯ä¸€ç«™ä¸Šä¸‹è½¦äººæ•° ( 1<=ai,bi<=10^9 )', 'è¾“å‡ºä¸€ä¸ªæ•´æ•°è¡¨ç¤ºç­”æ¡ˆï¼Œå¦‚æžœä¸å¯èƒ½ï¼Œåˆ™è¾“å‡ºâ€˜-1â€™', 0, 0);

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
(1010, 'å¿ƒç®—å¤§å¸ˆèƒ½å¿«é€Ÿè®¡ç®—ç»™å®šä¿¡æ¯çš„å…¬äº¤è½¦è¿˜æœ‰å‡ äººçš„é—®é¢˜\r\nä½†æ˜¯å¹¶ä¸æ˜¯æ¯ä¸ªäººéƒ½æœ‰å¾ˆå¼ºå¤§çš„å¿ƒç®—èƒ½åŠ›ï¼ŒäºŽæ˜¯æœ¬å…¬å¸å†³å®šåˆ¶ä½œä¸€ä¸ªç¨‹åºæ¥å›žç­”è¿™ä¸ªé—®é¢˜\r\näºŽæ˜¯å…¬å¸å°±æŠŠè¿™ä¸ªä»»åŠ¡äº¤ç»™äº†ä½ ', '2\r\n1 1\r\n5 1\r\n1 1\r\n5 2', '5\r\n-1');

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
(1000, '', -9945157, '2017-11-26 19:36:58', '2017-11-26 19:36:58', 0, 3),
(1001, '', -9945157, '2017-11-26 19:40:30', '2017-11-26 19:40:30', 0, 0),
(1002, '', -9945157, '2017-11-26 23:25:20', '2017-11-26 23:25:20', 0, 0),
(1003, '', -9945157, '2017-11-27 22:14:26', '2017-11-27 22:14:26', 0, 0),
(1004, 'åˆå…¥ç¨‹åºè®¾è®¡ç«žèµ›çš„æ‚¨å¯èƒ½éœ€è¦æ³¨æ„ï¼š\r\n\r\n\r\n1. Wrang Answerï¼Ÿ\r\n\r\nå¯èƒ½çˆ†intè¾£ï¼Ÿ\r\n\r\nC/C++ä»¥åŠjavaä¸­çš„intç±»åž‹ï¼ˆ32ä½æœ‰ç¬¦å·æ•´æ•°ï¼‰èƒ½è¡¨ç¤ºçš„èŒƒå›´ä¸º-2^31 ~ 2^31 - 1, 2^31çº¦ä¸º2.147x10^9\r\n\r\nunsigned intï¼ˆ32ä½æ— ç¬¦å·æ•´æ•°ï¼‰è¡¨ç¤ºçš„èŒƒå›´ä¸º0 ~ 2^32 - 1\r\n\r\næ‚¨å¯èƒ½éœ€è¦ä½¿ç”¨æ›´å¤§èŒƒå›´çš„ç±»åž‹ï¼Œ64ä½æœ‰ç¬¦å·æ•´æ•°ï¼Œèƒ½è¡¨ç¤ºåˆ°2^63 - 1, çº¦ä¸º9.233x10^18\r\n\r\nC/C++ä¸ºlong longæˆ–__int64, å¯¹åº”çš„æ ¼å¼æŽ§åˆ¶ç¬¦ä¸º%lldæˆ–%I64d(å…·ä½“ç”¨å“ªä¸ªçœ‹æµ‹è¯•å¹³å°ï¼Œæœ¬ojè¯·ä½¿ç”¨%lld)\r\n\r\njavaä¸­ä¸ºlong \r\n\r\n\r\n2. Time Limit Exceededï¼Ÿ\r\n\r\nå¯èƒ½æ‚¨å¹¶ä¸çŸ¥é“å¦‚ä½•å¤„ç†æ–‡ä»¶æœ«å°¾ï¼Ÿ\r\n\r\nCå¯ä»¥åˆ©ç”¨scanf,getsç­‰æ ‡å‡†è¾“å…¥å‡½æ•°çš„è¿”å›žå€¼å’ŒEOFå®, å¦‚while(scanf(\"%d%d\", &a, &b) != EOF) { }\r\n\r\nC++åˆ©ç”¨istreamç±»>>è¿ç®—ç¬¦çš„è¿”å›žå€¼ï¼Œå¦‚while(cin >> a >> b) { }\r\n\r\njavaå¯ä»¥åˆ©ç”¨Scannerç±»çš„hasNextæ–¹æ³•\r\n\r\n\r\n3. Presentation Errorï¼Ÿ\r\n\r\nè¯·ä¸¥æ ¼æŒ‰ç…§è¾“å‡ºæ ¼å¼è¿›è¡Œè¾“å‡ºï¼Œä¸è¦æœ‰å¤šä½™çš„æç¤ºæ€§è¯­å¥ï¼ˆå¦‚\"è¯·è¾“å…¥ä¸€ä¸ªæ•´æ•°\"ã€\"a x b =\"ç­‰ï¼‰ï¼Œè¡Œæœ«ä¸è¦æœ‰å¤šä½™çš„ç©ºæ ¼', -9945157, '2017-11-27 22:19:45', '2017-11-27 22:19:45', 0, 0),
(1005, '', -9945157, '2017-11-27 22:21:06', '2017-11-27 22:21:06', 7, 0),
(1006, '', -9945157, '2017-11-27 22:22:05', '2017-11-27 22:22:05', 7, 0),
(1007, '', -9945157, '2017-11-27 23:34:28', '2017-11-27 23:34:28', 9, 0),
(1008, '', -9945157, '2017-11-27 23:39:48', '2017-11-27 23:39:48', 9, 0),
(1009, '', -9945157, '2017-11-27 23:41:35', '2017-11-27 23:41:35', 7, 0),
(1010, '', -9945157, '2017-11-28 15:59:09', '2017-11-28 21:26:37', 9, 0);

-- --------------------------------------------------------

--
-- 表的结构 `problem_test`
--

DROP TABLE IF EXISTS `problem_test`;
CREATE TABLE IF NOT EXISTS `problem_test` (
  `id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `test_number` int(11) NOT NULL,
  `input` mediumblob NOT NULL,
  `output` mediumblob NOT NULL,
  `_date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `problem_test`
--

INSERT INTO `problem_test` (`id`, `pro_id`, `test_number`, `input`, `output`, `_date`, `user_id`) VALUES
(2, 1000, 2, 0x3132333435363738203837363534333231, 0x3939393939393939, '2017-11-29 20:19:43', -9945157),
(1, 1000, 1, 0x322033, 0x35, '2017-11-27 23:16:04', -9945157);

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
  `user_id` int(11) NOT NULL,
  `_date` datetime NOT NULL,
  `huck` int(11) NOT NULL,
  `code` varchar(20000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pro_submit`
--

INSERT INTO `pro_submit` (`id`, `pro_id`, `language`, `result`, `user_id`, `_date`, `huck`, `code`) VALUES
(1, 1000, 2, 0, -9945157, '2017-11-29 23:35:50', 0, '#include<bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n    int a,b;\r\n    cin>>a>>b;\r\n    cout<<a+b<<endl;\r\n    return 0;\r\n}\r\n');

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
(-9945157, 'admit', 'admit', '6540729b0ff418c25500d7372c3905cd', 9, '2017-11-22 22:44:15', '2017-11-22 22:44:15'),
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
(2, 'loading_falg_nums', 8),
(3, 'new_problem_id', 1011),
(4, 'test_id', 3),
(5, 'submit_number', 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

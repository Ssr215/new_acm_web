-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 2018-03-13 15:15:49
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
-- 表的结构 `contest_huck_submit`
--

DROP TABLE IF EXISTS `contest_huck_submit`;
CREATE TABLE IF NOT EXISTS `contest_huck_submit` (
  `id` int(11) NOT NULL,
  `contest_id` int(11) NOT NULL,
  `problem_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `submit_user` int(11) NOT NULL,
  `huck_user` int(11) NOT NULL,
  `huck_time` datetime NOT NULL,
  `result` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contest_id` (`contest_id`),
  KEY `status_id` (`status_id`),
  KEY `submit_user` (`submit_user`),
  KEY `huck_user` (`huck_user`),
  KEY `result` (`result`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `contest_huck_submit`
--

INSERT INTO `contest_huck_submit` (`id`, `contest_id`, `problem_id`, `status_id`, `submit_user`, `huck_user`, `huck_time`, `result`) VALUES
(2, 1, 4, 20, -9945157, -9945157, '2018-02-25 19:42:17', 2),
(8, 1, 2, 22, 1, -9945157, '2018-02-28 12:10:38', 1);

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
(1, 0, 1, '2018-03-12 20:00:00', 120, 1, 'First easy test', -9945157, 6),
(4, 0, 1, '2018-03-09 21:40:00', 120, 1, 'create_debug', -9945157, 3),
(9, 0, 1, '2018-03-13 15:21:00', 150, 1, 'ç¬¬ä¸€è½®æ™ºå•†å›žå¤', -9945157, 7),
(10, 0, 1, '2018-03-16 14:00:00', 180, 1, 'ç¬¬äºŒè½®æ™ºå•†å›žå¤', -9945157, 8);

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
(1, 1, 1011, 1, 'MOD', 500, 0, 7),
(2, 1, 1010, 2, '', 1000, -3, 7),
(3, 1, 1014, 3, '', 1500, 0, 7),
(4, 1, 1015, 4, '', 2000, 0, 7),
(5, 1, 1013, 5, '', 2500, 0, 7),
(6, 1, 1002, 6, '', 3000, 0, 7),
(28, 4, 1009, 3, '', 3500, 0, 0),
(27, 4, 1008, 2, '', 3500, 0, 0),
(26, 4, 1007, 1, '', 3500, 0, 0),
(29, 9, 1017, 1, '', 500, -2, 4),
(30, 9, 1019, 2, '', 500, 0, 4),
(31, 9, 1020, 3, '', 1000, -2, 4),
(32, 9, 1021, 4, '', 1500, -4, 7),
(33, 9, 1018, 5, '', 2000, -3, 4),
(34, 9, 1022, 6, '', 3000, -1, 4),
(35, 9, 1016, 7, '', 3500, 0, 3),
(36, 10, 1026, 1, '', 500, -1, 5),
(37, 10, 1029, 2, '', 500, 0, 3),
(38, 10, 1024, 3, '', 1000, 0, 4),
(39, 10, 1025, 4, '', 1000, 0, 4),
(40, 10, 1030, 5, '', 1500, -1, 3),
(41, 10, 1028, 6, '', 2000, 0, 4),
(42, 10, 1027, 7, '', 2500, 0, 4),
(43, 10, 1023, 8, '', 3500, 0, 7);

-- --------------------------------------------------------

--
-- 表的结构 `contest_information_3`
--

DROP TABLE IF EXISTS `contest_information_3`;
CREATE TABLE IF NOT EXISTS `contest_information_3` (
  `id` int(11) NOT NULL,
  `contest_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nike_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `password` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contest_id` (`contest_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `contest_information_3`
--

INSERT INTO `contest_information_3` (`id`, `contest_id`, `user_id`, `nike_name`, `password`) VALUES
(19, 1, 28, 'first_bug_2', 'mFq5LdwCjYiG'),
(18, 1, 27, 'first_bug_1', 'NGUg5Drd7oOa'),
(20, 1, 29, 'first_bug_3', 'GbQXAZ0YzPtR'),
(21, 1, 30, 'first_test_4', 'Sqwl4YoDMqGL'),
(22, 1, 31, 'first_test_5', 'hRxwOy7MTLr5'),
(23, 1, 32, 'first_test_6', 'hNkYQE4lfunc'),
(24, 1, 33, 'first_test_7', 'Lj174VQqbytx'),
(25, 9, 34, '2018_test_11', 'q0YJNYzXUFMz'),
(26, 9, 35, '2018_test_12', '3zBGPkoQ6Cpg'),
(27, 9, 36, '2018_test_13', 'VDZ2OjtFw78L'),
(28, 9, 37, '2018_test_14', 'P1uzl5GOSdFj'),
(29, 9, 38, '2018_test_15', 'X1stPdzpzwWp');

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
(10, 1, 1, -9945157, 0, 3, '2018-02-13 23:46:00', 11, 52, 444, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e5+7 , mz = 1e9+7;\r\nint a[N];\r\n\r\nint main(){\r\n    a[1] = a[2] = 1;\r\n    for(int i = 3 ; i < N ; i++)    a[i] = (a[i-1]+a[i-2])%mz;\r\n    int T;\r\n    cin>>T;\r\n    while( T-- ){\r\n        int n;\r\n        cin>>n;\r\n        cout<<a[n]<<endl;\r\n    }\r\n    return 0;\r\n}\r\n', ''),
(12, 1, 3, -9945157, 0, 3, '2018-02-23 23:00:59', 11, 46, 3488, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 110 , mz = 1e9+7;\r\nint x[5] , y[5] , hp[5] ,np[5] , s[5];\r\nint boss = 10000 , ans = 0;\r\n\r\nbool ck(){\r\n    if( (np[1] > 0 || np[2] > 0 || np[3] > 0) && boss > 0 ){\r\n        return true;\r\n    }\r\n    return false;\r\n}\r\n\r\nint main(){\r\n    for(int i = 1 ; i <= 4 ; i++)   scanf(\"%d%d%d\",x+i,y+i,hp+i) , np[i] = hp[i] , y[i] = max(int((500-y[i])*0.9),1);\r\n    x[1] = max(int((x[1]-500)*1.3),1);\r\n    x[2] = max(x[2]-500,1);\r\n    s[2] = int(x[2]*0.25);\r\n    x[3] = max(int((x[3]*0.9-500)*1.75),1);\r\n    s[3] = int(x[3]*0.25);\r\n    while( ck() ){\r\n        ans++;\r\n        if( np[1] > 0 ){\r\n            boss -= x[1];\r\n        }\r\n        if( np[2] > 0 ){\r\n            boss -= x[2];\r\n            np[2] = min( np[2] + s[2] , hp[2] );\r\n        }\r\n        if( np[3] > 0 ){\r\n            boss -= x[3];\r\n            np[3] = min( np[3] + s[3] , hp[3] );\r\n        }\r\n        if( np[4] > 0 ){\r\n            for(int i = 1 ; i <= 4 ; i++){\r\n                np[i] = min(np[i] + x[4],hp[i]);\r\n            }\r\n        }\r\n        for(int i = 1 ; i <= 4 ; i++){\r\n            np[i] -= y[i];\r\n        }\r\n    }\r\n    if( boss <= 0 && (np[1] > 0 || np[2] > 0 || np[3] > 0 || np[4] > 0 ) ){\r\n        printf(\"%d\\n\",ans);\r\n    }else{\r\n        puts(\"Go to leveling\");\r\n    }\r\n    return 0;\r\n}\r\n', 'main.cpp:24:5: error: stray \'\\\' in program\r\r\n             boss -= x[1];\r\r\r\n     ^\r\r\nmain.cpp:24:44: warning: missing terminating \" character\r\r\n             boss -= x[1];\r\r\r\n                                            ^\r\r\nmain.cpp:24:5: error: missing terminating \" character\r\r\n             boss -= x[1];\r\r\r\n     ^\r\r\nmain.cpp:82:9: error: stray \'\\\' in program\r\r\nmain.cpp:82:17: warning: missing terminating \" character\r\r\nmain.cpp:82:9: error: missing terminating \" character\r\r\nmain.cpp:86:9: error: stray \'\\\' in program\r\r\nmain.cpp:86:15: warning: missing terminating \" character\r\r\nmain.cpp:86:9: error: missing terminating \" character\r\r\nmain.cpp: In function \'int main()\':\r\r\nmain.cpp:26:38: error: expected \')\' before \';\' token\r\r\n         if( np[2] > 0 ){\r\r\r\n                                      ^\r\r\nmain.cpp:84:5: error: expected primary-expression before \'}\' token\r\r\nmain.cpp:88:5: error: expected primary-expression before \'}\' token'),
(11, 1, 2, -9945157, 0, 3, '2018-02-23 22:59:10', 11, 437, 3480, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 110 , mz = 1e9+7;\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int T;\r\n    scanf(\"%d\",&T);\r\n    while( T-- ){\r\n        long long n,m,a,b,f;\r\n        scanf(\"%lld%lld\",&n,&m);\r\n        f = 0;\r\n        while( m-- ){\r\n            scanf(\"%lld%lld\",&a,&b);\r\n            if( f ) continue;\r\n            if( b > n ){\r\n                f = 1;\r\n            }\r\n            n += a-b;\r\n        }\r\n        if( f ) puts(\"-1\");\r\n        else    printf(\"%lld\\n\",n);\r\n    }\r\n    return 0;\r\n}\r\n', 'main.cpp:8:14: warning: missing terminating \" character\r\r\n     freopen(\\\"E:\\\\\\\\c++\\\\\\\\out.txt\\\",\\\"w\\\",stdout);\r\r\n              ^\r\r\nmain.cpp:9:14: warning: missing terminating \" character\r\r\n #endif\r\r\n              ^\r\r\nmain.cpp:13:5: error: stray \'\\\' in program\r\r\n         long long n,m,a,b,f;\r\r\r\n     ^\r\r\nmain.cpp:13:12: warning: missing terminating \" character\r\r\n         long long n,m,a,b,f;\r\r\r\n            ^\r\r\nmain.cpp:13:5: error: missing terminating \" character\r\r\n         long long n,m,a,b,f;\r\r\r\n     ^\r\r\nmain.cpp:19:9: error: stray \'\\\' in program\r\r\n             if( b > n ){\r\r\r\n         ^\r\r\nmain.cpp:19:16: warning: missing terminating \" character\r\r\n             if( b > n ){\r\r\r\n                ^\r\r\nmain.cpp:19:9: error: missing terminating \" character\r\r\n             if( b > n ){\r\r\r\n         ^\r\r\nmain.cpp:25:13: error: stray \'\\\' in program\r\r\n         else    printf(\\\"%lld\\\\n\\\",n);\r\r\r\n             ^\r\r\nmain.cpp:25:20: warning: missing terminating \" character\r\r\n         else    printf(\\\"%lld\\\\n\\\",n);\r\r\r\n                    ^\r\r\nmain.cpp:25:13: error: missing terminating \" character\r\r\n         else    printf(\\\"%lld\\\\n\\\",n);\r\r\r\n             ^\r\r\nmain.cpp:39:9: error: stray \'\\\' in program\r\r\nmain.cpp:39:23: warning: missing terminating \" character\r\r\nmain.cpp:39:9: error: missing terminating \" character\r\r\nmain.cpp:41:9: error: stray \'\\\' in program\r\r\nmain.cpp:41:25: warning: missing terminating \" character\r\r\nmain.cpp:41:9: error: missing terminating \" character\r\r\nmain.cpp: In function \'int main()\':\r\r\nmain.cpp:15:5: error: expected primary-expression before \'while\'\r\r\n         f = 0;\r\r\r\n     ^\r\r\nmain.cpp:11:9: warning: unused variable \'T\' [-Wunused-variable]\r\r\n     scanf(\\\"%d\\\",&T);\r\r\r\n         ^'),
(13, 1, 4, -9945157, 0, 3, '2018-02-23 23:03:35', 11, 62, 3472, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 20 , mz = 1e9+7;\r\nint a[N];\r\ndouble p[N];\r\n\r\nint main(){\r\n    int x,y,z;\r\n    p[0] = 1.0;\r\n    for(int i = 1 ; i <= 12 ; i++){\r\n        scanf(\"%d\",a+i);\r\n        p[i] = p[i-1] / (1.0*a[i]);\r\n    }\r\n    scanf(\"%d%d%d\",&x,&y,&z);\r\n    printf(\"%.7f\\n\",200000.0/(x+1.0)*p[6] + 250000.0/(y+1.0)*p[12] + 50000.0/z/3.0);\r\n    return 0;\r\n}\r\n', 'main.cpp:16:9: error: stray \'\\\' in program\r\r\n     return 0;\r\r\n         ^\r\r\nmain.cpp:16:16: warning: missing terminating \" character\r\r\n     return 0;\r\r\n                ^\r\r\nmain.cpp:16:9: error: missing terminating \" character\r\r\n     return 0;\r\r\n         ^\r\r\nmain.cpp:22:5: error: stray \'\\\' in program\r\r\nmain.cpp:22:12: warning: missing terminating \" character\r\r\nmain.cpp:22:5: error: missing terminating \" character\r\r\nmain.cpp:24:5: error: stray \'\\\' in program\r\r\nmain.cpp:24:13: warning: missing terminating \" character\r\r\nmain.cpp:24:5: error: missing terminating \" character\r\r\nmain.cpp: In function \'int main()\':\r\r\nmain.cpp:18:35: error: expected \')\' before \';\' token\r\r\nmain.cpp:25:5: error: expected primary-expression before \'return\'\r\r\nmain.cpp:10:9: warning: unused variable \'x\' [-Wunused-variable]\r\r\n     for(int i = 1 ; i <= 12 ; i++){\r\r\r\n         ^\r\r\nmain.cpp:10:11: warning: unused variable \'y\' [-Wunused-variable]\r\r\n     for(int i = 1 ; i <= 12 ; i++){\r\r\r\n           ^\r\r\nmain.cpp:10:13: warning: unused variable \'z\' [-Wunused-variable]\r\r\n     for(int i = 1 ; i <= 12 ; i++){\r\r\r\n             ^'),
(14, 1, 5, -9945157, 0, 3, '2018-02-23 23:04:27', 7002, 51, 454, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n    int n;\r\n    scanf(\"%d\",&n);\r\n    char s[200];\r\n    scanf(\"%s\",s + 1);\r\n    int ans = 50;\r\n    for(int i = 1 ; i <= n ; i++){\r\n        if( s[i] == \'c\' ){\r\n            if( s[i+1] == \'w\' ){\r\n                if( s[i+2] == \'w\' ){\r\n                    s[i+1] = s[i+2] = \'a\';\r\n                    ans += 550;\r\n                }else if( s[i-1] == \'w\' ){\r\n                    s[i-1] = s[i+1] = \'a\';\r\n                }else{\r\n                    s[i+1] = \'a\';\r\n                    ans += 400;\r\n                }\r\n            }else{\r\n                ans += 250;\r\n            }\r\n        }\r\n    }\r\n    for(int i = 1 ; i <= n ; i++){\r\n        if( s[i] == \'w\' ){\r\n            ans += 100;\r\n        }\r\n    }\r\n    printf(\"%d\\n\",ans);\r\n    return 0;\r\n}\r\n\r\n', 'main.cpp: In function \'int main()\':\r\r\nmain.cpp:35:17: error: expected \';\' before \'}\' token\r\r\n \r\r\r\n                 ^'),
(15, 1, 6, -9945157, 0, 3, '2018-02-23 23:05:52', 11, 62, 3480, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e5+7 , mz = 1e9+7;\r\nchar s[N];\r\n\r\nint main(){\r\n    scanf(\"%s\",s);\r\n    int len = strlen(s);\r\n    int p = 0 , q = 0;\r\n    long long ans = 0;\r\n    for(int i = 0 ; i < len ; i++)\r\n        if( s[i] == \'M\' )\r\n            q++;\r\n    for(int i = 0 ; i < len ; i++)\r\n        if( s[i] == \'A\' )   p++;\r\n        else if( s[i] == \'C\' )  ans = (ans + p*q)%mz;\r\n        else    q--;\r\n    printf(\"%lld\\n\",ans);\r\n    return 0;\r\n}\r\n', 'main.cpp:8:5: error: stray \'\\\' in program\r\r\n     int len = strlen(s);\r\r\r\n     ^\r\r\nmain.cpp:8:12: warning: missing terminating \" character\r\r\n     int len = strlen(s);\r\r\r\n            ^\r\r\nmain.cpp:8:5: error: missing terminating \" character\r\r\n     int len = strlen(s);\r\r\r\n     ^\r\r\nmain.cpp:18:9: error: stray \'\\\' in program\r\r\n     printf(\\\"%lld\\\\n\\\",ans);\r\r\n         ^\r\r\nmain.cpp:18:22: warning: missing terminating \' character\r\r\n     printf(\\\"%lld\\\\n\\\",ans);\r\r\n                      ^\r\r\nmain.cpp:18:9: error: missing terminating \' character\r\r\n     printf(\\\"%lld\\\\n\\\",ans);\r\r\n         ^\r\r\nmain.cpp:24:9: error: stray \'\\\' in program\r\r\nmain.cpp:24:22: warning: missing terminating \' character\r\r\nmain.cpp:24:9: error: missing terminating \' character\r\r\nmain.cpp:26:9: error: stray \'\\\' in program\r\r\nmain.cpp:26:27: warning: missing terminating \' character\r\r\nmain.cpp:26:9: error: missing terminating \' character\r\r\nmain.cpp:30:5: error: stray \'\\\' in program\r\r\nmain.cpp:30:13: warning: missing terminating \" character\r\r\nmain.cpp:30:5: error: missing terminating \" character\r\r\nmain.cpp: In function \'int main()\':\r\r\nmain.cpp:10:5: error: expected primary-expression before \'int\'\r\r\n     long long ans = 0;\r\r\r\n     ^\r\r\nmain.cpp:16:25: error: \'len\' was not declared in this scope\r\r\n         else if( s[i] == \\\'C\\\' )  ans = (ans + p*q)%mz;\r\r\r\n                         ^\r\r\nmain.cpp:20:16: error: expected \')\' before \';\' token\r\r\n }\r\r\n                ^\r\r\nmain.cpp:22:25: error: \'len\' was not declared in this scope\r\r\nmain.cpp:26:9: error: expected primary-expression before \'else\'\r\r\nmain.cpp:26:9: error: expected \')\' before \'else\'\r\r\nmain.cpp:31:5: error: expected primary-expression before \'return\'\r\r\nmain.cpp:12:9: warning: unused variable \'p\' [-Wunused-variable]\r\r\n         if( s[i] == \\\'M\\\' )\r\r\r\n         ^\r\r\nmain.cpp:14:15: warning: unused variable \'ans\' [-Wunused-variable]\r\r\n     for(int i = 0 ; i < len ; i++)\r\r\r\n               ^'),
(16, 1, 5, -9945157, 0, 3, '2018-02-23 23:45:30', 8, 0, 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n    int n;\r\n    scanf(\\\"%d\\\",&n);\r\n    char s[200];\r\n    scanf(\\\"%s\\\",s + 1);\r\n    int ans = 50;\r\n    for(int i = 1 ; i <= n ; i++){\r\n        if( s[i] == \\\'c\\\' ){\r\n            if( s[i+1] == \\\'w\\\' ){\r\n                if( s[i+2] == \\\'w\\\' ){\r\n                    s[i+1] = s[i+2] = \\\'a\\\';\r\n                    ans += 550;\r\n                }else if( s[i-1] == \\\'w\\\' ){\r\n                    s[i-1] = s[i+1] = \\\'a\\\';\r\n                    ans += 535;\r\n                }else{\r\n                    s[i+1] = \\\'a\\\';\r\n                    ans += 400;\r\n                }\r\n            }else{\r\n                ans += 250;\r\n            }\r\n        }\r\n    }\r\n    for(int i = 1 ; i <= n ; i++){\r\n        if( s[i] == \\\'w\\\' ){\r\n            ans += 100;\r\n        }\r\n    }\r\n    printf(\\\"%d\\\\n\\\",ans);\r\n    return 0;\r\n}\r\n\n', 'main.cpp:11:5: error: stray \'\\\' in program\r\r\n         if( s[i] == \\\'c\\\' ){\r\r\r\n     ^\r\r\nmain.cpp:11:12: warning: missing terminating \" character\r\r\n         if( s[i] == \\\'c\\\' ){\r\r\r\n            ^\r\r\nmain.cpp:11:5: error: missing terminating \" character\r\r\n         if( s[i] == \\\'c\\\' ){\r\r\r\n     ^\r\r\nmain.cpp:15:5: error: stray \'\\\' in program\r\r\n                     ans += 550;\r\r\r\n     ^\r\r\nmain.cpp:15:12: warning: missing terminating \" character\r\r\n                     ans += 550;\r\r\r\n            ^\r\r\nmain.cpp:15:5: error: missing terminating \" character\r\r\n                     ans += 550;\r\r\r\n     ^\r\r\nmain.cpp:21:9: error: stray \'\\\' in program\r\r\n                     ans += 400;\r\r\r\n         ^\r\r\nmain.cpp:21:22: warning: missing terminating \' character\r\r\n                     ans += 400;\r\r\r\n                      ^\r\r\nmain.cpp:21:9: error: missing terminating \' character\r\r\n                     ans += 400;\r\r\r\n         ^\r\r\nmain.cpp:23:13: error: stray \'\\\' in program\r\r\n             }else{\r\r\r\n             ^\r\r\nmain.cpp:23:28: warning: missing terminating \' character\r\r\n             }else{\r\r\r\n                            ^\r\r\nmain.cpp:23:13: error: missing terminating \' character\r\r\n             }else{\r\r\r\n             ^\r\r\nmain.cpp:25:17: error: stray \'\\\' in program\r\r\n             }\r\r\r\n                 ^\r\r\nmain.cpp:25:32: warning: missing terminating \' character\r\r\n             }\r\r\r\n                                ^\r\r\nmain.cpp:25:17: error: missing terminating \' character\r\r\n             }\r\r\r\n                 ^\r\r\nmain.cpp:27:21: error: stray \'\\\' in program\r\r\n     }\r\r\r\n                     ^\r\r\nmain.cpp:27:40: warning: missing terminating \' character\r\r\n     }\r\r\r\n                                        ^\r\r\nmain.cpp:27:21: error: missing terminating \' character\r\r\n     }\r\r\r\n                     ^\r\r\nmain.cpp:31:17: error: stray \'\\\' in program\r\r\n         }\r\r\r\n                 ^\r\r\nmain.cpp:31:38: warning: missing terminating \' character\r\r\n         }\r\r\r\n                                      ^\r\r\nmain.cpp:31:17: error: missing terminating \' character\r\r\n         }\r\r\r\n                 ^\r\r\nmain.cpp:33:21: error: stray \'\\\' in program\r\r\n     printf(\\\"%d\\\\n\\\",ans);\r\r\r\n                     ^\r\r\nmain.cpp:33:40: warning: missing terminating \' character\r\r\n     printf(\\\"%d\\\\n\\\",ans);\r\r\r\n                                        ^\r\r\nmain.cpp:33:21: error: missing terminating \' character\r\r\n     printf(\\\"%d\\\\n\\\",ans);\r\r\r\n                     ^\r\r\nmain.cpp:39:21: error: stray \'\\\' in program\r\r\nmain.cpp:39:31: warning: missing terminating \' character\r\r\nmain.cpp:39:21: error: missing terminating \' character\r\r\nmain.cpp:57:9: error: stray \'\\\' in program\r\r\nmain.cpp:57:22: warning: missing terminating \' character\r\r\nmain.cpp:57:9: error: missing terminating \' character\r\r\nmain.cpp:65:5: error: stray \'\\\' in program\r\r\nmain.cpp:65:13: warning: missing terminating \" character\r\r\nmain.cpp:65:5: error: missing terminating \" character\r\r\nmain.cpp: In function \'int main()\':\r\r\nmain.cpp:13:5: error: expected primary-expression before \'char\'\r\r\n                 if( s[i+2] == \\\'w\\\' ){\r\r\r\n     ^\r\r\nmain.cpp:17:5: error: expected primary-expression before \'int\'\r\r\n                     s[i-1] = s[i+1] = \\\'a\\\';\r\r\r\n     ^\r\r\nmain.cpp:21:13: error: \'s\' was not declared in this scope\r\r\n                     ans += 400;\r\r\r\n             ^\r\r\nmain.cpp:23:13: error: expected primary-expression before \'if\'\r\r\n             }else{\r\r\r\n             ^\r\r\nmain.cpp:23:13: error: expected \')\' before \'if\'\r\r\nmain.cpp:31:18: error: \'else\' without a previous \'if\'\r\r\n         }\r\r\r\n                  ^\r\r\nmain.cpp:31:27: error: \'s\' was not declared in this scope\r\r\n         }\r\r\r\n                           ^\r\r\nmain.cpp:31:29: error: \'i\' was not declared in this scope\r\r\n         }\r\r\r\n                             ^\r\r\nmain.cpp:35:21: error: \'ans\' was not declared in this scope\r\r\n }\r\r\r\n                     ^\r\r\nmain.cpp:35:31: error: expected \')\' before \';\' token\r\r\n }\r\r\r\n                               ^\r\r\nmain.cpp: At global scope:\r\r\nmain.cpp:37:18: error: expected unqualified-id before \'else\'\r\r\nmain.cpp:45:13: error: expected declaration before \'}\' token'),
(17, 1, 5, -9945157, 0, 3, '2018-02-23 23:49:11', 11, 55, 435, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n    int n;\r\n    scanf(\"%d\",&n);\r\n    char s[200];\r\n    scanf(\"%s\",s + 1);\r\n    int ans = 50;\r\n    for(int i = 1 ; i <= n ; i++){\r\n        if( s[i] == \'c\' ){\r\n            if( s[i+1] == \'w\' ){\r\n                if( s[i+2] == \'w\' ){\r\n                    s[i+1] = s[i+2] = \'a\';\r\n                    ans += 550;\r\n                }else if( s[i-1] == \'w\' ){\r\n                    s[i-1] = s[i+1] = \'a\';\r\n                    ans += 535;\r\n                }else{\r\n                    s[i+1] = \'a\';\r\n                    ans += 400;\r\n                }\r\n            }else{\r\n                ans += 250;\r\n            }\r\n        }\r\n    }\r\n    for(int i = 1 ; i <= n ; i++){\r\n        if( s[i] == \'w\' ){\r\n            ans += 100;\r\n        }\r\n    }\r\n    printf(\"%d\\n\",ans);\r\n    return 0;\r\n}\r\n\n', ''),
(18, 1, 5, -9945157, 0, 3, '2018-02-23 23:51:42', 11, 47, 454, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n    int n;\r\n    scanf(\"%d\",&n);\r\n    char s[200];\r\n    scanf(\"%s\",s + 1);\r\n    int ans = 50;\r\n    for(int i = 1 ; i <= n ; i++){\r\n        if( s[i] == \'c\' ){\r\n            if( s[i+1] == \'w\' ){\r\n                if( s[i+2] == \'w\' ){\r\n                    s[i+1] = s[i+2] = \'a\';\r\n                    ans += 550;\r\n                }else if( s[i-1] == \'w\' ){\r\n                    s[i-1] = s[i+1] = \'a\';\r\n                    ans += 535;\r\n                }else{\r\n                    s[i+1] = \'a\';\r\n                    ans += 400;\r\n                }\r\n            }else{\r\n                ans += 250;\r\n            }\r\n        }\r\n    }\r\n    for(int i = 1 ; i <= n ; i++){\r\n        if( s[i] == \'w\' ){\r\n            ans += 100;\r\n        }\r\n    }\r\n    printf(\"%d\\n\",ans);\r\n    return 0;\r\n}\r\n\n', ''),
(19, 1, 5, -9945157, 0, 3, '2018-02-23 23:53:10', 11, 48, 454, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n    int n;\r\n    scanf(\"%d\",&n);\r\n    char s[200];\r\n    scanf(\"%s\",s + 1);\r\n    int ans = 50;\r\n    for(int i = 1 ; i <= n ; i++){\r\n        if( s[i] == \'c\' ){\r\n            if( s[i+1] == \'w\' ){\r\n                if( s[i+2] == \'w\' ){\r\n                    s[i+1] = s[i+2] = \'a\';\r\n                    ans += 550;\r\n                }else if( s[i-1] == \'w\' ){\r\n                    s[i-1] = s[i+1] = \'a\';\r\n                    ans += 535;\r\n                }else{\r\n                    s[i+1] = \'a\';\r\n                    ans += 400;\r\n                }\r\n            }else{\r\n                ans += 250;\r\n            }\r\n        }\r\n    }\r\n    for(int i = 1 ; i <= n ; i++){\r\n        if( s[i] == \'w\' ){\r\n            ans += 100;\r\n        }\r\n    }\r\n    printf(\"%d\\n\",ans);\r\n    return 0;\r\n}\r\n\n', ''),
(20, 1, 4, -9945157, 0, 3, '2018-02-24 14:11:02', 11, 46, 3464, '#include <bits/stdc++.h>\nusing namespace std;\nconst int N = 20 , mz = 1e9+7;\r\nint a[N];\r\ndouble p[N];\n\nint main(){\n    int x,y,z;\r\n    p[0] = 1.0;\r\n    for(int i = 1 ; i <= 12 ; i++){\r\n        scanf(\"%d\",a+i);\r\n        p[i] = p[i-1] / (1.0*a[i]);\r\n    }\r\n    scanf(\"%d%d%d\",&x,&y,&z);\r\n    printf(\"%.9f\\n\",200000.0/(x+1.0)*p[6] + 250000.0/(y+1.0)*p[12] + 50000.0/z/3.0);\n    return 0;\n}\n', ''),
(21, 1, 2, -9945157, 0, 3, '2018-02-28 11:58:55', 3001, 437, 436, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n    int T;\r\n    scanf(\"%d\",&T);\r\n    int n,m,a,b;\r\n    bool f = false;\r\n    while( T-- ){\r\n        scanf(\"%d%d\",&n,&m);\r\n        f = true;\r\n        while( m-- ){\r\n            scanf(\"%d%d\",&a,&b);\r\n            if( f ) continue;\r\n            if( b > n ) puts(\"-1\") , f = true;\r\n            n += a-b;\r\n        }\r\n        if( f ) continue;\r\n        printf(\"%d\\n\",n);\r\n    }\r\n    return 0;\r\n}\r\n', ''),
(22, 1, 2, -9945157, 0, 3, '2018-02-28 12:00:44', -1, 405, 436, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n    int T;\r\n    scanf(\"%d\",&T);\r\n    int n,m,a,b;\r\n    bool f = false;\r\n    while( T-- ){\r\n        scanf(\"%d%d\",&n,&m);\r\n        f = false;\r\n        while( m-- ){\r\n            scanf(\"%d%d\",&a,&b);\r\n            if( f ) continue;\r\n            if( b > n ) puts(\"-1\") , f = true;\r\n            n += a-b;\r\n        }\r\n        if( f ) continue;\r\n        printf(\"%d\\n\",n);\r\n    }\r\n    return 0;\r\n}\r\n', ''),
(23, 1, 2, 1, 0, 3, '2018-02-28 12:16:14', 11, 175, 436, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n    int T;\r\n    scanf(\"%d\",&T);\r\n    int n,m,a,b;\r\n    bool f = false;\r\n    while( T-- ){\r\n        scanf(\"%d%d\",&n,&m);\r\n        f = false;\r\n        while( m-- ){\r\n            scanf(\"%d%d\",&a,&b);\r\n            if( f ) continue;\r\n            if( b > n ) puts(\"-1\") , f = true;\r\n            n += a-b;\r\n        }\r\n        if( f ) continue;\r\n        printf(\"%d\\n\",n);\r\n    }\r\n    return 0;\r\n}\r\n', ''),
(24, 1, 2, -9945157, 0, 3, '2018-02-28 12:16:58', 70001, 132, 408, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n    int T;\r\n    scanf(\"%d\",&T);\r\n    int n,m,a,b;\r\n    bool f = false;\r\n    while( T-- ){\r\n        scanf(\"%d%d\",&n,&m);\r\n        f = false;\r\n        while( m-- ){\r\n            scanf(\"%d%d\",&a,&b);\r\n            if( f ) continue;\r\n            if( b > n ) puts(\"-1\") , f = true;\r\n            n += a-b;\r\n        }\r\n        if( f ) continue;\r\n        printf(\"%d\\n\",n);\r\n    }\r\n    return 0;\r\n}\r\n', 'g++: error: main.cpp: No such file or directory'),
(25, 1, 2, -9945157, 0, 3, '2018-02-28 12:54:12', 11, 182, 436, '#include <bits/stdc++.h>\nusing namespace std;\nconst int N = 110 , mz = 1e9+7;\n\nint main(){\r\n#ifdef LOCAL\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\n#endif\n    int T;\r\n    scanf(\"%d\",&T);\r\n    while( T-- ){\r\n        long long n,m,a,b,f;\r\n        scanf(\"%lld%lld\",&n,&m);\r\n        f = 0;\r\n        while( m-- ){\r\n            scanf(\"%lld%lld\",&a,&b);\r\n            if( f ) continue;\r\n            if( b > n ){\r\n                f = 1;\r\n            }\r\n            n += a-b;\r\n        }\r\n        if( f ) puts(\"-1\");\r\n        else    printf(\"%lld\\n\",n);\r\n    }\n    return 0;\n}\n', ''),
(26, 9, 1, -9945157, 0, 3, '2018-03-10 21:08:36', 11, 223, 441, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nint x1 = 1000,y1 = 1000,x2 = -1000,y2 = -1000;\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n	int x,y,cnt = 0;\r\n	while( ~scanf(\"%d%d\",&x,&y) ){\r\n		if( x == 0 && y == 0 ){\r\n			if( cnt == 0 )	break;\r\n			printf(\"%d %d %d %d\\n\",x1,y1,x2,y2);\r\n			x1 = y1 = 1000;\r\n			x2 = y2 = -1000;\r\n			cnt = 0;\r\n			continue;\r\n		}\r\n		x1 = min(x1,x);\r\n		x2 = max(x2,x);\r\n		y1 = min(y1,y);\r\n		y2 = max(y2,y);\r\n		cnt++;\r\n	}\r\n	return 0;\r\n}\r\n', ''),
(27, 9, 2, -9945157, 0, 3, '2018-03-10 21:22:50', 11, 93, 449, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nint gcd(int a,int b){return b?gcd(b,a%b):a;}\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n	int a,b;\r\n	while(cin>>a>>b)\r\n		cout<<a*b/gcd(a,b)<<endl;\r\n	return 0;\r\n}\r\n', ''),
(38, 10, 1, -9945157, 0, 3, '2018-03-12 15:24:00', 11, 2656, 449, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e4+7;\r\nset<int> s;\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n	int n,m,a;\r\n	while( ~scanf(\"%d%d\",&n,&m) ){\r\n		s.clear();\r\n		for(int i = 0 ; i < n ; i++)	scanf(\"%d\",&a),s.insert(a);\r\n		for(int i = 0 ; i < m ; i++)	scanf(\"%d\",&a),s.insert(a);\r\n		bool f = 0;\r\n		for(set<int>::iterator it = s.begin() ; it != s.end() ; it++){\r\n			if( f )	putchar(\' \');\r\n			printf(\"%d\",*it);\r\n			f = 1;\r\n		}\r\n		puts(\"\");\r\n	}\r\n	return 0;\r\n}\r\n', ''),
(28, 9, 3, -9945157, 0, 3, '2018-03-10 21:32:13', 11, 69, 449, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e4+7;\r\nchar s[N];\r\nvector<int> v[N];\r\nbool vis[N];\r\nbool f;\r\nint ans = \'m\';\r\n\r\nvoid dfs(int u){\r\n	vis[u] = 1;\r\n	if( f )	return;\r\n	for( vector<int>::iterator to = v[u].begin() ; to != v[u].end() ; to++ ){\r\n		if( *to == ans ){\r\n			f = 1;\r\n			return;\r\n		}\r\n		if( vis[*to] )	continue;\r\n		dfs(*to);\r\n	}\r\n}\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n	while( ~scanf(\"%s\",s) ){\r\n		if( s[0] == \'0\' ){\r\n			dfs(\'b\');\r\n			puts(f?\"Yes.\":\"No.\");\r\n			f = 0;\r\n			for(int i = 0 ; i < N ; i++){\r\n				v[i].clear();\r\n				vis[i] = 0;\r\n			}\r\n			continue;\r\n		}\r\n		int len = strlen(s);\r\n		v[ s[0] ].push_back( s[len-1] );\r\n	}\r\n	return 0;\r\n}\r\n', ''),
(29, 9, 4, -9945157, 0, 3, '2018-03-10 21:43:44', 11, 2306, 449, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 5e5+7;\r\nint ans[N];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n	int T,n;\r\n	scanf(\"%d\",&T);\r\n	while( T-- ){\r\n		scanf(\"%d\",&n);\r\n		if( n < 4 ){\r\n			puts(n==1?\"0\":\"1\");\r\n			continue;\r\n		}\r\n		if( ans[n] == 0 ){\r\n			int q = sqrt(n);\r\n			//printf(\"q = %d\\n\",q);\r\n			ans[n] = 1;\r\n			for(int i = 2 ; i < q; i++){\r\n				if( n % i == 0 ){\r\n					ans[n] += i + n/i;\r\n				}\r\n			}\r\n			if( q*q == n )	ans[n] += q;\r\n			else if( n%q == 0 )	ans[n] += q+n/q;\r\n		}\r\n		printf(\"%d\\n\",ans[n]);\r\n	}\r\n	return 0;\r\n}\r\n', ''),
(30, 9, 4, -9945157, 0, 3, '2018-03-10 21:46:30', 11, 2739, 448, '#include <iostream>\r\nusing namespace std;\r\n#define maxn 500005\r\nint a[maxn];\r\nint main()\r\n{\r\n    for(int i=1;i<maxn;i++)\r\n        for(int j=i+i;j<maxn;j+=i)\r\n            a[j]+=i;\r\n    int t,n;\r\n    cin>>t;\r\n    while(t--)\r\n    {\r\n        cin>>n;\r\n        cout<<a[n]<<endl;\r\n    }\r\n    return 0;\r\n}\r\n', ''),
(32, 9, 5, -9945157, 0, 3, '2018-03-11 23:33:19', 11, 290, 445, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 100;\r\nchar s1[N] , s2[N];\r\nint cot[N];\r\nint len1,len2;\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n	char ch;\r\n	while( 1 ){\r\n		len1 = len2 = 0;\r\n		memset(cot,0,sizeof(cot));\r\n		while( ch = getchar() ){\r\n			if( ch == \'\\n\' )	break;\r\n			//printf(\"len1 = %d\\n\",len1);\r\n			s1[len1++] = ch;\r\n		}\r\n		if( s1[0] == \'#\' )	break;\r\n		while( ch = getchar() ){\r\n			if( ch == \'\\n\' )	break;\r\n			//printf(\"len2 = %d\\n\",len2);\r\n			s2[len2] = ch;\r\n			for(int i = 0 ; i < len1 ; i++){\r\n				if( s1[i] == ch ){\r\n					cot[i]++;\r\n				}\r\n			}\r\n			len2++;\r\n		}\r\n		for(int i = 0 ; i < len1 ; i++){\r\n			printf(\"%c %d\\n\",s1[i],cot[i]);\r\n		}\r\n	}\r\n	return 0;\r\n}\r\n', ''),
(31, 9, 4, -9945157, 0, 3, '2018-03-10 21:52:03', 11, 1781, 450, '#include<stdio.h>\r\n__int64 a[500000+5];\r\nint main()\r\n{\r\n       int i,j,n,cas;\r\n       for(i=0;i<=500000;i++) a[i]=1;//1ÊÇËùÓÐÊýµÄÒò×Ó\r\n       a[1] = 0;\r\n       for(i=2;i<=250000;i++) //×î´óÒò×Ó²»»á³¬¹ý250000\r\n       {\r\n           for(j=i+i;j<=500000;j+=i)\r\n               a[j]+=i;\r\n       }\r\n       scanf(\"%d\",&cas);\r\n       while(cas--)\r\n       {\r\n           scanf(\"%d\",&n);\r\n           printf(\"%I64d\\n\",a[n]);\r\n       }\r\n       return 0;\r\n}\r\n', ''),
(33, 9, 7, -9945157, 0, 3, '2018-03-11 23:55:02', 7003, 46, 455, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e5+7;\r\nchar s[N];\r\n\r\nint main(){\r\n	char ch , pre;\r\n	int f = 1 , bf = 0 , cf = 0;\r\n	while( ~(ch = getchar()) ){\r\n		if( ch == \',\' ){\r\n			printf(\"£¬\");\r\n		}else if( ch == \'.\' ){\r\n			printf(\"¡£\");\r\n		}else if( ch == \'!\' ){\r\n			printf(\"£¡\");\r\n		}else if( ch == \'\"\' ){\r\n			if( f ){ printf(\"¡°\"); }\r\n			else{printf(\"¡±\");}\r\n			f ^= f;\r\n		}else if( ch == \'<\' ){\r\n			if( pre == ch && bf == 1){\r\n				printf(\"¡¶\");\r\n				bf = 0;\r\n			}else if(bf == 0){\r\n				pre = ch;\r\n				bf = 1;\r\n				continue;\r\n			}else{\r\n				putchar(pre);\r\n				putchar(ch);\r\n			}\r\n		}else if( ch == \'>\' ){\r\n			if( pre == ch && cf == 1){\r\n				printf(\"¡·\");\r\n				cf = 0;\r\n			}else if(cf == 0){\r\n				pre = ch;\r\n				cf = 1;\r\n				continue;\r\n			}else{\r\n				putchar(pre);\r\n				putchar(ch);\r\n			}\r\n		}else if( ch == \'?\' ){\r\n			printf(\"£¿\");\r\n		}else{\r\n			putchar(ch);\r\n		}\r\n		pre = ch;\r\n	}\r\n	return 0;\r\n}\r\n', ''),
(34, 9, 7, -9945157, 0, 3, '2018-03-11 23:57:34', 7003, 46, 436, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e5+7;\r\nchar s[N];\r\n\r\nint main(){\r\n	char ch , pre;\r\n	int f = 1 , bf = 0 , cf = 0;\r\n	while( ~(ch = getchar()) ){\r\n		if( ch == \',\' ){\r\n			printf(\"£¬\");\r\n		}else if( ch == \'.\' ){\r\n			printf(\"¡£\");\r\n		}else if( ch == \'!\' ){\r\n			printf(\"£¡\");\r\n		}else if( ch == \'\"\' ){\r\n			if( f ){ printf(\"¡°\"); }\r\n			else{printf(\"¡±\");}\r\n			f ^= f;\r\n		}else if( ch == \'<\' ){\r\n			if( pre == ch && bf == 1){\r\n				printf(\"¡¶\");\r\n				bf = 0;\r\n			}else if(bf == 0){\r\n				pre = ch;\r\n				bf = 1;\r\n				continue;\r\n			}else{\r\n				putchar(pre);\r\n				putchar(ch);\r\n			}\r\n		}else if( ch == \'>\' ){\r\n			if( pre == ch && cf == 1){\r\n				printf(\"¡·\");\r\n				cf = 0;\r\n			}else if(cf == 0){\r\n				pre = ch;\r\n				cf = 1;\r\n				continue;\r\n			}else{\r\n				putchar(pre);\r\n				putchar(ch);\r\n			}\r\n		}else if( ch == \'?\' ){\r\n			printf(\"£¿\");\r\n		}else{\r\n			putchar(ch);\r\n		}\r\n		pre = ch;\r\n	}\r\n	puts(\"\");\r\n	return 0;\r\n}\r\n', ''),
(35, 9, 7, -9945157, 0, 3, '2018-03-11 23:58:12', 11, 46, 449, '#include <iostream>\r\n#include <cstring>\r\n#include <cstdio>\r\nusing namespace std;\r\nchar a[201000];\r\nint main()\r\n{\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int len,i,sum;\r\n    while((gets(a))!=NULL)\r\n    {\r\n        len=strlen(a);\r\n        sum=0;\r\n        for(i=0; i<len; i++)\r\n        {\r\n            string temp=\"\";\r\n            temp=temp+a[i]+a[i+1];//ÕâÀïÂùÖØÒªµÄ£¬ÒòÎªÖÐÎÄµÄ¡°ºÍ¡±£¬²»ÊÇµ¥¸ö×Ö·û£¬¶øÊÇÊôÓÚ×Ö·û´®£¡\r\n            if(temp==\"¡°\"||temp==\"¡±\")\r\n            {\r\n                sum++;\r\n            }\r\n            if(a[i]==\'\"\')\r\n            {\r\n                if(sum%2==0)\r\n                    printf(\"¡°\");\r\n                else\r\n                    printf(\"¡±\");\r\n                sum++;\r\n            }\r\n            else if(a[i]==\',\')\r\n                printf(\"£¬\");\r\n            else if(a[i]==\'.\')\r\n                printf(\"¡£\");\r\n            else if(a[i]==\'!\')\r\n                printf(\"£¡\");\r\n            else if(a[i]==\'<\'&&a[i+1]==\'<\')\r\n            {\r\n                printf(\"¡¶\");\r\n                i++;\r\n            }\r\n            else if(a[i]==\'>\'&&a[i+1]==\'>\')\r\n            {\r\n                printf(\"¡·\");\r\n                i++;\r\n            }\r\n            else if(a[i]==\'?\')\r\n                printf(\"£¿\");\r\n            else{printf(\"%c\",a[i]);}\r\n        }\r\n        printf(\"\\n\");\r\n    }\r\n    return 0;\r\n}\r\n', ''),
(36, 9, 6, -9945157, 0, 3, '2018-03-12 14:42:49', 11, 125, 449, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n	double d,vul;\r\n	while( cin>>vul>>d ){\r\n		int t = 0 , y = 1;\r\n		while( vul > 0 ){\r\n			for(int i = 0 ; i < y && vul > 0 ; i++){\r\n				vul -= d;\r\n				t++;\r\n			}\r\n			if( vul > 0 ){\r\n				t++;\r\n				y++;\r\n			}\r\n		}\r\n		cout<<t<<endl;\r\n	}\r\n	return 0;\r\n}\r\n', ''),
(37, 9, 6, -9945157, 0, 3, '2018-03-12 14:43:49', 3004, 46, 430, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n	int d,vul;\r\n	while( cin>>vul>>d ){\r\n		int t = 0 , y = 1;\r\n		while( vul > 0 ){\r\n			for(int i = 0 ; i < y && vul > 0 ; i++){\r\n				vul -= d;\r\n				t++;\r\n			}\r\n			if( vul > 0 ){\r\n				t++;\r\n				y++;\r\n			}\r\n		}\r\n		cout<<t<<endl;\r\n	}\r\n	return 0;\r\n}\r\n', ''),
(40, 10, 3, -9945157, 0, 3, '2018-03-12 15:49:31', 11, 312, 449, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e6+7;\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n	int T,n,a;\r\n	scanf(\"%d\",&T);\r\n	while( T-- ){\r\n		scanf(\"%d\",&n);\r\n		long long sum = 0 , maxn = 0;\r\n		for(int i = 0 ; i < n ; i++)	scanf(\"%d\",&a) , sum += a , maxn = max(maxn,(long long)a);\r\n		if( n == 1 )\r\n			puts(sum == 1 ? \"Yes\" : \"No\");\r\n		else\r\n			puts(sum+1 >= maxn+maxn?\"Yes\":\"No\");\r\n	}\r\n	return 0;\r\n}\r\n', ''),
(39, 10, 2, -9945157, 0, 3, '2018-03-12 15:31:03', 11, 93, 449, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e4+7;\r\nint c[N];\r\n\r\nvoid init(){\r\n	for(int i = 1 ; i < N ; i++){\r\n		for(int j = i+i ; j < N ; j+=i)\r\n			c[j] += i;\r\n		c[i] = c[i-1] + (c[i]==i?1:0);\r\n	}\r\n}\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n	init();\r\n	int n,a,b;\r\n	scanf(\"%d\",&n);\r\n	while( n-- ){\r\n		scanf(\"%d%d\",&a,&b);\r\n		if( a > b ) swap(a,b);\r\n		printf(\"%d\\n\",c[b]-c[a-1]);\r\n	}\r\n	return 0;\r\n}\r\n', ''),
(41, 10, 4, -9945157, 0, 3, '2018-03-12 16:33:07', 11, 265, 450, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1500;\r\nchar s1[N] , op[N] , cl[N];\r\nint oph,opm,ops;\r\nint clh,clm,cls;\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n	int T;\r\n	scanf(\"%d\",&T);\r\n	while( T-- ){\r\n		int n;\r\n		scanf(\"%d\",&n);\r\n		int a,b,c,d,e,f;\r\n		oph=opm=ops=1000;\r\n		cls=clm=clh=-1000;\r\n		for(int i = 1 ; i <= n ; i++){\r\n			scanf(\"%s %d:%d:%d %d:%d:%d\",s1,&a,&b,&c,&d,&e,&f);\r\n			if( a < oph || ( a == oph && ( b < opm || ( b == opm && c < ops ) ) ) ){\r\n				oph = a;\r\n				opm = b;\r\n				ops = c;\r\n				strcpy(op,s1);\r\n			}\r\n			if( d > clh || ( d == clh && ( e > clm || ( e == clm && f > cls ) ) ) ){\r\n				clh = d;\r\n				clm = e;\r\n				cls = f;\r\n				strcpy(cl,s1);\r\n			}\r\n		}\r\n		printf(\"%s %s\\n\",op,cl);\r\n	}\r\n	return 0;\r\n}\r\n', ''),
(46, 9, 1, 34, 1, 3, '2018-03-13 15:40:15', 11, 179, 446, '#include <algorithm>\n#include <cstdio>\n#include <cstring>\n#include <iostream>\n#include <cmath>\nusing namespace std;\ntypedef long long LL;\nconst int N = 1e6+7;\nconst int MOD = 1e9+7;\nconst int INF = 0x3f3f3f3f;\nconst double PI = acos(0.0) * 2;\r\nint a,b,c,d;\r\nint x,y;\r\nint abcd() {\r\n    a = 232;\r\n    b = 232;\r\n    c = -232;\r\n    d = -232;\r\n}\nint main() {\r\n    int flag = 1;\r\n    abcd();\n    while(~scanf(\"%d%d\",&x,&y)) {\r\n        if(x == 0&&y == 0&&flag == 0) {\r\n            break;\r\n        }\r\n        else if(x == 0&&y == 0) {\r\n            printf(\"%d %d %d %d\\n\",a,b,c,d);\r\n            flag = 0;\r\n            abcd();\r\n        }\r\n        else {\r\n            a = min(a,x);\r\n            b = min(b,y);\r\n            c = max(c,x);\r\n            d = max(d,y);\r\n            flag = 1;\r\n        }\r\n    }\n    return 0;\n}\r\n', ''),
(42, 10, 5, -9945157, 0, 3, '2018-03-12 16:47:42', 11, 187, 449, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e6+7;\r\ndouble x[N] , y[N];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n	int n;\r\n	while( ~scanf(\"%d\",&n) && n ){\r\n		for(int i = 1 ; i <= n ; i++)	scanf(\"%lf%lf\",x+i,y+i);\r\n		sort(x+1,x+1+n);\r\n		sort(y+1,y+1+n);\r\n		if( n&1 ){\r\n			printf(\"%.2f %.2f\\n\",x[n/2+1],y[n/2+1]);\r\n		}else{\r\n			printf(\"%.2f %.2f\\n\",(x[n/2]+x[n/2+1])/2.0,(y[n/2]+y[n/2+1])/2.0);\r\n		}\r\n	}\r\n	return 0;\r\n}\r\n', ''),
(43, 10, 6, -9945157, 0, 3, '2018-03-12 17:09:19', 11, 328, 448, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e3+7;\r\nchar s[N];\r\nint a[N];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n	while( ~scanf(\"%s\",s) ){\r\n		int len = strlen(s);\r\n		for(int i = 0 ; i < len ; i++){\r\n			if( s[i] == \'5\' )	s[i] = \' \';\r\n			a[i] = -1;\r\n		}\r\n		int tp = 0;\r\n		for(int i = 0 ; i < len ; i++){\r\n			if( s[i] == \' \' ){\r\n				tp++;\r\n				continue;\r\n			}\r\n			if( a[tp] == -1 ){\r\n				a[tp] = s[i] - \'0\';\r\n			}else{\r\n				a[tp] = a[tp]*10 + s[i] - \'0\';\r\n			}\r\n		}\r\n		tp++;\r\n		bool f = 0;\r\n		sort(a,a+tp);\r\n		for(int i = 0 ; i < tp ; i++){\r\n			if( a[i] == -1 )	continue;\r\n			if( f )	putchar(\' \');\r\n			printf(\"%d\",a[i]);\r\n			f = 1;\r\n		}\r\n		puts(\"\");\r\n	}\r\n	return 0;\r\n}\r\n', ''),
(44, 10, 7, -9945157, 0, 3, '2018-03-12 17:20:45', 11, 124, 449, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e5+7;\r\nbool vis[1000][26];\r\nint pd[30];\r\nint ans[N];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n	for(int i = \'A\' ; i <= \'Z\' ; i++){\r\n		for(int j = \'A\' ; j <= \'Z\' ; j++){\r\n			vis[i^j][i-\'A\'] = 1;\r\n		}\r\n	}\r\n	int n,a;\r\n	while( ~scanf(\"%d\",&n) ){\r\n		memset(pd,0,sizeof(pd));\r\n		for(int i = 0 ; i < n ; i++){\r\n			scanf(\"%d\",ans+i);\r\n			for(int j = 0 ; j < 26 ; j++){\r\n				if( vis[ ans[i] ][j] )	pd[j]++;\r\n			}\r\n		}\r\n		int k = 0;\r\n		for(int i = 0 ; i < 26 ; i++)	if( pd[i] == n )	k = i;\r\n		k += \'A\';\r\n		for(int i = 0 ; i < n ; i++)	putchar(k^ans[i]);\r\n		puts(\"\");\r\n	}\r\n	return 0;\r\n}\r\n', ''),
(45, 10, 8, -9945157, 0, 3, '2018-03-12 18:21:36', 11, 46, 449, '#include <bits/stdc++.h>\nusing namespace std;\nconst int N = 1e5+7 , mz = 1e9+7;\r\nint c[N],d[N];\r\n\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\n    int n,k;\r\n    cin>>n>>k;\r\n    if( k == 0 )    cout<<1LL*n*n<<endl;\r\n    else{\r\n        long long ans = 0;\r\n        for(int i = k+1 ; i <= n ;i++){\r\n            ans += (n/i)*(i-k);\r\n            if( n%i>=k )    ans+=n%i-k+1;\r\n        }\r\n        cout<<ans<<endl;\r\n    }\n    return 0;\n}\n', ''),
(47, 9, 2, 34, 1, 3, '2018-03-13 15:58:15', 11, 94, 448, '#include <algorithm>\r\n #include <cstdio>\r\n #include <cstring>\r\n #include <iostream>\r\n #include <cmath>\r\n using namespace std; \r\ntypedef long long LL; \r\nconst int N = 1e6+7;\r\n const int MOD = 1e9+7; \r\nconst int INF = 0x3f3f3f3f; \r\nconst double PI = acos(0.0) * 2; \r\nint a,b,c,d; int sum; \r\nint main() {   \r\n  while(~scanf(\"%d%d\",&a,&b)) {  \r\n       sum = a*b;        \r\n if(a<b) {            \r\n int temp = a;       \r\n      a = b;           \r\n  b = temp;         }         while(b) {             d = a%b;             a = b;             b = d;         }         sum /= a;         printf(\"%d\\n\",sum);     }     return 0; \r\n}', ''),
(48, 9, 2, 34, 1, 3, '2018-03-13 16:01:19', 11, 64, 448, '#include <algorithm>\n#include <cstdio>\n#include <cstring>\n#include <iostream>\n#include <cmath>\nusing namespace std;\ntypedef long long LL;\nconst int N = 1e6+7;\nconst int MOD = 1e9+7;\nconst int INF = 0x3f3f3f3f;\nconst double PI = acos(0.0) * 2;\r\nint a,b,c,d;\r\nint sum;\nint main() {\n    while(~scanf(\"%d%d\",&a,&b)) {\r\n        sum = a*b;\r\n        if(a<b) {\r\n            int temp = a;\r\n            a = b;\r\n            b = temp;\r\n        }\r\n        while(b) {\r\n            d = a%b;\r\n            a = b;\r\n            b = d;\r\n        }\r\n        sum /= a;\r\n        printf(\"%d\\n\",sum);\r\n    }\n    return 0;\n}\r\n', ''),
(49, 9, 3, 34, 1, 3, '2018-03-13 16:42:46', 6001, 1000, 432, '#include <algorithm>\n#include <cstdio>\n#include <cstring>\n#include <iostream>\n#include <cmath>\nusing namespace std;\ntypedef long long LL;\nconst int N = 1e6+7;\nconst int MOD = 1e9+7;\nconst int INF = 0x3f3f3f3f;\nconst double PI = acos(0.0) * 2;\r\nint mm[30][30];\r\nint fa[30];//ÊÇ·ñµ½¹ý\r\nchar c[100];\r\nint flag;\r\nvoid hh(int e) {\r\n    if(e == 12) flag = 1;\r\n    fa[e] = 1;\r\n    for(int i = 0;i<26;i++) {\r\n        if(mm[e][i] == 1&&fa[i] == 0) {\r\n            hh(i);\r\n        }\r\n    }\r\n}\nint main() {\n    while(scanf(\"%s\",c)) {\r\n        if(strlen(c) == 1&&c[0] == \'0\') {\r\n            int e = 1;\r\n            hh(e);\r\n\r\n            if(flag) {\r\n                printf(\"Yes.\\n\");\r\n                flag = 0;\r\n            }\r\n            else {\r\n                printf(\"No.\\n\");\r\n            }\r\n            memset(mm,0,sizeof(mm));\r\n            memset(fa,0,sizeof(fa));\r\n        }\r\n        else {\r\n            int len = strlen(c);\r\n            mm[c[0]-\'a\'][c[len-1]-\'a\'] = 1;\r\n        }\r\n    }\n    return 0;\n}\r\n', ''),
(50, 9, 3, 34, 1, 3, '2018-03-13 16:50:31', 11, 64, 448, '#include <algorithm>\n#include <cstdio>\n#include <cstring>\n#include <iostream>\n#include <cmath>\nusing namespace std;\ntypedef long long LL;\nconst int N = 1e6+7;\nconst int MOD = 1e9+7;\nconst int INF = 0x3f3f3f3f;\nconst double PI = acos(0.0) * 2;\r\nint mm[30][30];\r\nint fa[30];//ÊÇ·ñµ½¹ý\r\nchar c[100];\r\nint flag;\r\nvoid hh(int e) {\r\n    if(e == 12) flag = 1;\r\n    fa[e] = 1;\r\n    for(int i = 0;i<26;i++) {\r\n        if(mm[e][i] == 1&&fa[i] == 0) {\r\n            hh(i);\r\n        }\r\n    }\r\n}\nint main() {\n    while(~scanf(\"%s\",c)) {\r\n        if(strlen(c) == 1&&c[0] == \'0\') {\r\n            int e = 1;\r\n            hh(e);\r\n\r\n            if(flag) {\r\n                printf(\"Yes.\\n\");\r\n                flag = 0;\r\n            }\r\n            else {\r\n                printf(\"No.\\n\");\r\n            }\r\n            memset(mm,0,sizeof(mm));\r\n            memset(fa,0,sizeof(fa));\r\n        }\r\n        else {\r\n            int len = strlen(c);\r\n            mm[c[0]-\'a\'][c[len-1]-\'a\'] = 1;\r\n        }\r\n    }\n    return 0;\n}\r\n', ''),
(51, 9, 4, 34, 1, 3, '2018-03-13 17:00:16', 6005, 5000, 430, '#include <algorithm>\n#include <cstdio>\n#include <cstring>\n#include <iostream>\n#include <cmath>\nusing namespace std;\ntypedef long long LL;\nconst int N = 1e6+7;\nconst int MOD = 1e9+7;\nconst int INF = 0x3f3f3f3f;\nconst double PI = acos(0.0) * 2;\r\nint t;\r\nint n;\nint main() {\n    scanf(\"%d\",&t);\r\n    while(t--) {\r\n        scanf(\"%d\",&n);\r\n        LL sum = 0;\r\n        for(int i = 1;i<=n/2;i++) {\r\n            if(n%i == 0) sum += i;\r\n        }\r\n        printf(\"%lld\\n\",sum);\r\n    }\n    return 0;\n}\r\n', ''),
(52, 9, 4, 34, 1, 3, '2018-03-13 17:38:40', 7007, 2753, 432, '#include <algorithm>\n#include <cstdio>\n#include <cstring>\n#include <iostream>\n#include <cmath>\nusing namespace std;\ntypedef long long LL;\nconst int N = 1e6+7;\nconst int MOD = 1e9+7;\nconst int INF = 0x3f3f3f3f;\nconst double PI = acos(0.0) * 2;\r\nint t;\r\nint n;\nint main() {\n    scanf(\"%d\",&t);\r\n    while(t--) {\r\n        scanf(\"%d\",&n);\r\n        LL sum = 0;\r\n        for(int i = 2;i*i<=n;i++) {\r\n            if(n%i == 0) {\r\n                sum += i;\r\n                if(n != i*i) sum += n/i;\r\n            }\r\n        }\r\n        printf(\"%lld\\n\",sum+1);\r\n    }\n    return 0;\n}\r\n', ''),
(53, 9, 4, 34, 1, 3, '2018-03-13 17:42:50', 11, 2778, 448, '#include <algorithm>\n#include <cstdio>\n#include <cstring>\n#include <iostream>\n#include <cmath>\nusing namespace std;\ntypedef long long LL;\nconst int N = 1e6+7;\nconst int MOD = 1e9+7;\nconst int INF = 0x3f3f3f3f;\nconst double PI = acos(0.0) * 2;\r\nint t;\r\nint n;\nint main() {\n    scanf(\"%d\",&t);\r\n    while(t--) {\r\n        scanf(\"%d\",&n);\r\n        if(n == 1) {\r\n            printf(\"0\\n\");\r\n            continue;\r\n        }\r\n        LL sum = 0;\r\n        for(int i = 2;i*i<=n;i++) {\r\n            if(n%i == 0) {\r\n                sum += i;\r\n                if(n != i*i) sum += n/i;\r\n            }\r\n        }\r\n        printf(\"%lld\\n\",sum+1);\r\n    }\n    return 0;\n}\r\n', ''),
(54, 9, 5, 34, 1, 3, '2018-03-13 19:09:20', 7002, 164, 449, '#include <algorithm>\n#include <cstdio>\n#include <cstring>\n#include <iostream>\n#include <cmath>\r\n#include <map>\nusing namespace std;\ntypedef long long LL;\nconst int N = 1e6+7;\nconst int MOD = 1e9+7;\nconst int INF = 0x3f3f3f3f;\nconst double PI = acos(0.0) * 2;\r\nchar a[10];\r\nchar b[105];\r\nmap <char ,int> hq;\nint main() {\n    while(1) {\r\n        gets(a);\r\n        if(a[0] == \'#\') break;\r\n        gets(b);\r\n        hq.clear();\r\n        for(int i = 0;i<strlen(a);i++) {\r\n            for(int j = 0;j<strlen(b);j++) {\r\n                if(a[i] == b[j]) hq[a[i]]++;\r\n            }\r\n        }\r\n        for(int i = 0;i<strlen(a);i++) {\r\n            printf(\"%c %d\\n\",a[i],hq[a[i]]);\r\n        }\r\n    }\n    return 0;\n}\r\n', ''),
(55, 9, 5, 34, 1, 3, '2018-03-13 19:25:46', 7002, 139, 449, '#include <algorithm>\n#include <cstdio>\n#include <cstring>\n#include <iostream>\n#include <cmath>\r\n#include <map>\nusing namespace std;\ntypedef long long LL;\nconst int N = 1e6+7;\nconst int MOD = 1e9+7;\nconst int INF = 0x3f3f3f3f;\nconst double PI = acos(0.0) * 2;\r\nchar a[10];\r\nchar b[105];\r\nmap <char ,int> hq;\r\nint fla[10];\nint main() {\n    while(1) {\r\n        gets(a);\r\n        if(a[0] == \'#\') break;\r\n        gets(b);\r\n        hq.clear();\r\n        memset(fla,0,sizeof(fla));\r\n        for(int i = 0;i<strlen(a)&&hq[a[i]] == 0;i++) {\r\n            fla[i] = 1;\r\n            for(int j = 0;j<strlen(b);j++) {\r\n                if(a[i] == b[j]) hq[a[i]]++;\r\n            }\r\n        }\r\n        for(int i = 0;i<strlen(a)&&fla[i];i++) {\r\n            printf(\"%c %d\\n\",a[i],hq[a[i]]);\r\n        }\r\n    }\n    return 0;\n}\r\n', ''),
(56, 9, 5, 34, 1, 3, '2018-03-13 19:29:45', 7002, 148, 449, '#include <algorithm>\r\n#include <cstdio>\r\n#include <cstring>\r\n#include <iostream>\r\n#include <cmath>\r\n#include <map>\r\nusing namespace std;\r\ntypedef long long LL;\r\nconst int N = 1e6+7;\r\nconst int MOD = 1e9+7;\r\nconst int INF = 0x3f3f3f3f;\r\nconst double PI = acos(0.0) * 2;\r\nchar a[10];\r\nchar b[105];\r\nmap <char ,int> hq;\r\nint fla[10];\r\nint main() {\r\n    while(1) {\r\n        gets(a);\r\n        if(a[0] == \'#\') break;\r\n        gets(b);\r\n        hq.clear();\r\n        memset(fla,0,sizeof(fla));\r\n        for(int i = 0;i<strlen(a)&&hq[a[i]] == 0;i++) {\r\n            fla[i] = 1;\r\n            for(int j = 0;j<strlen(b);j++) {\r\n                if(a[i] == b[j]) hq[a[i]]++;\r\n            }\r\n        }\r\n        for(int i = 0;i<strlen(a);i++) {\r\n            printf(\"%c %d\\n\",a[i],hq[a[i]]);\r\n        }\r\n    }\r\n    return 0;\r\n}\r\n', '');
INSERT INTO `contest_pro_submit` (`id`, `contest_id`, `problem_id`, `user_id`, `competitor`, `language`, `submit_time`, `result`, `u_time`, `u_memory`, `code`, `compile`) VALUES
(57, 9, 5, 34, 1, 3, '2018-03-13 20:12:54', 11, 340, 449, '#include <algorithm>\r\n#include <cstdio>\r\n#include <cstring>\r\n#include <iostream>\r\n#include <cmath>\r\n#include <map>\r\nusing namespace std;\r\ntypedef long long LL;\r\nconst int N = 1e6+7;\r\nconst int MOD = 1e9+7;\r\nconst int INF = 0x3f3f3f3f;\r\nconst double PI = acos(0.0) * 2;\r\nchar a[10];\r\nchar b[105];\r\nmap <char ,int> hq;\r\nint main() {\r\n    while(1) {\r\n        gets(a);\r\n        if(a[0] == \'#\') break;\r\n        gets(b);\r\n        hq.clear();\r\n        for(int i = 0;i<strlen(a);i++) {\r\n            if(hq[a[i]]) continue;\r\n            for(int j = 0;j<strlen(b);j++) {\r\n                if(a[i] == b[j]) hq[a[i]]++;\r\n            }\r\n        }\r\n        for(int i = 0;i<strlen(a);i++) {\r\n            printf(\"%c %d\\n\",a[i],hq[a[i]]);\r\n        }\r\n    }\r\n    return 0;\r\n}\r\n', ''),
(58, 9, 6, 34, 1, 3, '2018-03-13 20:34:00', 7002, 132, 448, '#include <algorithm>\n#include <cstdio>\n#include <cstring>\n#include <iostream>\n#include <cmath>\nusing namespace std;\ntypedef long long LL;\nconst int N = 1e6+7;\nconst int MOD = 1e9+7;\nconst int INF = 0x3f3f3f3f;\nconst double PI = acos(0.0) * 2;\r\nint a,b;\nint main() {\n    while(~scanf(\"%d%d\",&a,&b)) {\r\n        int t = 0;\r\n        int i = 1;\r\n        while(a>0) {\r\n            if(a > i*b)  {\r\n                t += (i+1);\r\n                a -= i++;\r\n            }\r\n            else {\r\n                if(a%b == 0) t += (a/b);\r\n                else t += (a/b+1);\r\n                a = 0;\r\n            }\r\n        }\r\n        printf(\"%d\\n\",t);\r\n    }\n    return 0;\n}\r\n', ''),
(59, 9, 6, 34, 1, 3, '2018-03-13 20:40:39', 6004, 1000, 430, '#include <algorithm>\n#include <cstdio>\n#include <cstring>\n#include <iostream>\n#include <cmath>\nusing namespace std;\ntypedef long long LL;\nconst int N = 1e6+7;\nconst int MOD = 1e9+7;\nconst int INF = 0x3f3f3f3f;\nconst double PI = acos(0.0) * 2;\r\nint a,b;\nint main() {\n    while(~scanf(\"%d%d\",&a,&b)) {\r\n        int t = 0;\r\n        int i = 1;\r\n        while(a>0) {\r\n            if(a > i*b)  {\r\n                t += (i+1);\r\n                a -= i*b;\r\n                i++;\r\n            }\r\n            else if(a%b == 0) {\r\n                t += (a/b);\r\n                a = 0;\r\n            }\r\n            else {\r\n                t += (a/b+1);\r\n                a = 0;\r\n            }\r\n        }\r\n        printf(\"%d\\n\",t);\r\n    }\n    return 0;\n}\r\n', ''),
(60, 9, 6, 34, 1, 3, '2018-03-13 20:49:22', 7002, 78, 448, '#include <algorithm>\n#include <cstdio>\n#include <cstring>\n#include <iostream>\n#include <cmath>\nusing namespace std;\ntypedef long long LL;\nconst int N = 1e6+7;\nconst int MOD = 1e9+7;\nconst int INF = 0x3f3f3f3f;\nconst double PI = acos(0.0) * 2;\r\ndouble a,b;\nint main() {\n    while(~scanf(\"%lf%lf\",&a,&b)) {\r\n        double t = 0;\r\n        int i = 1;\r\n        while(a>0) {\r\n            if(a > i*b)  {\r\n                t += (i+1);\r\n                a -= i*b;\r\n                i++;\r\n            }\r\n            else if(int(a/b) == a/b) {\r\n                t += (a/b);\r\n                a = 0;\r\n            }\r\n            else {\r\n                t += (a/b+1);\r\n                a = 0;\r\n            }\r\n        }\r\n        printf(\"%.0f\\n\",t);\r\n    }\n    return 0;\n}\r\n', ''),
(61, 9, 6, 34, 1, 3, '2018-03-13 20:58:18', 7002, 75, 448, '#include <algorithm>\n#include <cstdio>\n#include <cstring>\n#include <iostream>\n#include <cmath>\nusing namespace std;\ntypedef long long LL;\nconst int N = 1e6+7;\nconst int MOD = 1e9+7;\nconst int INF = 0x3f3f3f3f;\nconst double PI = acos(0.0) * 2;\r\ndouble a,b;\nint main() {\n    while(~scanf(\"%lf%lf\",&a,&b)) {\r\n        double t = 0;\r\n        int i = 1;\r\n        while(a>0) {\r\n            if(a > i*b)  {\r\n                t += (i+1);\r\n                a -= i*b;\r\n                i++;\r\n            }\r\n            else if(int(a/b) - a/b<0.0001) {\r\n                t += (a/b);\r\n                a = 0;\r\n            }\r\n            else {\r\n                t += (a/b+1);\r\n                a = 0;\r\n            }\r\n        }\r\n        printf(\"%.0f\\n\",t);\r\n    }\n    return 0;\n}\r\n', ''),
(62, 9, 6, 34, 1, 3, '2018-03-13 20:59:07', 7002, 78, 448, '#include <algorithm>\n#include <cstdio>\n#include <cstring>\n#include <iostream>\n#include <cmath>\nusing namespace std;\ntypedef long long LL;\nconst int N = 1e6+7;\nconst int MOD = 1e9+7;\nconst int INF = 0x3f3f3f3f;\nconst double PI = acos(0.0) * 2;\r\ndouble a,b;\nint main() {\n    while(~scanf(\"%lf%lf\",&a,&b)) {\r\n        double t = 0;\r\n        int i = 1;\r\n        while(a>0) {\r\n            if(a > i*b)  {\r\n                t += (i+1);\r\n                a -= i*b;\r\n                i++;\r\n            }\r\n            else if(a/b - int(a/b)<0.0001) {\r\n                t += (a/b);\r\n                a = 0;\r\n            }\r\n            else {\r\n                t += (a/b+1);\r\n                a = 0;\r\n            }\r\n        }\r\n        printf(\"%.0f\\n\",t);\r\n    }\n    return 0;\n}\r\n', ''),
(63, 9, 6, 34, 1, 3, '2018-03-13 21:00:32', 7001, 93, 448, '#include <algorithm>\n#include <cstdio>\n#include <cstring>\n#include <iostream>\n#include <cmath>\nusing namespace std;\ntypedef long long LL;\nconst int N = 1e6+7;\nconst int MOD = 1e9+7;\nconst int INF = 0x3f3f3f3f;\nconst double PI = acos(0.0) * 2;\r\ndouble a,b;\nint main() {\n    while(~scanf(\"%lf%lf\",&a,&b)) {\r\n        double t = 0;\r\n        int i = 1;\r\n        while(a>0) {\r\n            if(a > i*b)  {\r\n                t += (i+1);\r\n                a -= i*b;\r\n                i++;\r\n            }\r\n            else if(a/b - int(a/b)<0.0001) {\r\n                t += (a/b);\r\n                a = 0;\r\n            }\r\n            else {\r\n                t += (a/b+1);\r\n                a = 0;\r\n            }\r\n        }\r\n        printf(\"%f\\n\",t);\r\n    }\n    return 0;\n}\r\n', ''),
(64, 9, 6, 34, 1, 3, '2018-03-13 21:02:27', 7004, 81, 447, '#include <algorithm>\n#include <cstdio>\n#include <cstring>\n#include <iostream>\n#include <cmath>\nusing namespace std;\ntypedef long long LL;\nconst int N = 1e6+7;\nconst int MOD = 1e9+7;\nconst int INF = 0x3f3f3f3f;\nconst double PI = acos(0.0) * 2;\r\ndouble a,b;\nint main() {\n    while(~scanf(\"%lf%lf\",&a,&b)) {\r\n        double t = 0;\r\n        int i = 1;\r\n        while(a>0) {\r\n            if(a > i*b)  {\r\n                t += (i+1);\r\n                a -= i*b;\r\n                i++;\r\n            }\r\n            else if(a/b - int(a/b)<0.0001) {\r\n                t += (a/b);\r\n                a = 0;\r\n            }\r\n            else {\r\n                t += (int(a/b)+1);\r\n                a = 0;\r\n            }\r\n        }\r\n        printf(\"%.0f\\n\",t);\r\n    }\n    return 0;\n}\r\n', ''),
(65, 9, 6, 34, 1, 3, '2018-03-13 21:03:10', 11, 73, 448, '#include <algorithm>\n#include <cstdio>\n#include <cstring>\n#include <iostream>\n#include <cmath>\nusing namespace std;\ntypedef long long LL;\nconst int N = 1e6+7;\nconst int MOD = 1e9+7;\nconst int INF = 0x3f3f3f3f;\nconst double PI = acos(0.0) * 2;\r\ndouble a,b;\nint main() {\n    while(~scanf(\"%lf%lf\",&a,&b)) {\r\n        double t = 0;\r\n        int i = 1;\r\n        while(a>0) {\r\n            if(a > i*b)  {\r\n                t += (i+1);\r\n                a -= i*b;\r\n                i++;\r\n            }\r\n            else if(a/b == int(a/b)) {\r\n                t += (a/b);\r\n                a = 0;\r\n            }\r\n            else {\r\n                t += (int(a/b)+1);\r\n                a = 0;\r\n            }\r\n        }\r\n        printf(\"%.0f\\n\",t);\r\n    }\n    return 0;\n}\r\n', '');

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
(108, 59863591, 23021264, -1, '2018-02-28 17:48:01'),
(107, 52252510, 92543128, 8, '2018-02-28 18:58:21'),
(106, 96255918, 55839477, -9945157, '2018-02-28 12:55:45'),
(119, 12140182, 79630757, -9945157, '2018-03-10 18:04:16'),
(118, 35432705, 3178491, -9945157, '2018-03-10 13:30:06'),
(117, 10905704, 44525067, -9945157, '2018-03-10 00:09:54'),
(116, 43332860, 49634913, -9945157, '2018-03-08 17:00:38'),
(115, 24780902, 41968332, -9945157, '2018-03-07 23:25:35'),
(114, 82265044, 61381813, -9945157, '2018-03-06 19:42:38'),
(113, 13810769, 32748917, -9945157, '2018-03-05 21:10:31'),
(112, 68777019, 3150506, -9945157, '2018-03-05 16:42:06'),
(111, 14568108, 43904004, -1, '2018-03-05 16:03:25'),
(110, 75212966, 39689146, -9945157, '2018-03-05 12:15:14'),
(109, 20174531, 68808095, -9945157, '2018-03-01 16:27:35'),
(120, 15151161, 85387138, 1, '2018-03-10 18:58:02'),
(121, 44472477, 86215315, -1, '2018-03-10 20:40:44'),
(122, 98031861, 14283908, -9945157, '2018-03-10 20:40:43'),
(123, 12008424, 54258745, -9945157, '2018-03-10 19:49:42'),
(124, 842326, 25874439, -9945157, '2018-03-10 19:58:13'),
(125, 21619675, 27160985, -9945157, '2018-03-10 20:39:07'),
(126, 55469658, 1460530, -1, '2018-03-10 20:41:50'),
(127, 30996451, 36323006, -9945157, '2018-03-10 20:41:49'),
(128, 65241155, 45252389, -1, '2018-03-10 20:42:14'),
(129, 25606948, 9977644, -1, '2018-03-10 20:42:47'),
(130, 66965924, 29430767, -9945157, '2018-03-10 21:56:41'),
(131, 36942352, 98786207, -9945157, '2018-03-11 23:00:12'),
(132, 69092931, 70993160, -1, '2018-03-11 23:04:53'),
(133, 2549726, 82258844, -9945157, '2018-03-11 23:04:48'),
(134, 62176762, 80549343, -1, '2018-03-11 23:05:12'),
(135, 70588908, 12305369, -1, '2018-03-11 23:05:53'),
(136, 45477973, 86977219, -9945157, '2018-03-11 23:05:52'),
(137, 58305621, 78381636, -1, '2018-03-11 23:07:58'),
(138, 83212887, 56794747, -9945157, '2018-03-11 23:07:40'),
(139, 35106341, 47212482, -1, '2018-03-11 23:08:01'),
(140, 15476048, 48589813, -1, '2018-03-11 23:09:16'),
(141, 73561884, 11571438, -1, '2018-03-11 23:09:18'),
(142, 18785391, 11274200, -9945157, '2018-03-12 00:06:39'),
(143, 29693453, 98453452, -9945157, '2018-03-12 18:29:58'),
(144, 94374045, 89653718, -9945157, '2018-03-12 18:10:30'),
(145, 54683370, 54231013, 34, '2018-03-13 22:06:49'),
(146, 96133, 88778131, -9945157, '2018-03-13 21:12:38'),
(147, 15329167, 57102995, 34, '2018-03-13 23:12:30'),
(148, 70300850, 27412502, -1, '2018-03-13 23:15:23');

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
(1000, 'A+B Problem', 500, 5, 1000, 10, 'Single example.\r\nTwo integer a,b (0<=a,b<=10^9)', 'Output a+b', 17, 12),
(1001, 'Maximum Gcd', 1000, 128, 2000, 128, 'There is only one test case .\r\nThe first line contains a integer n ( 2 â‰¤ n â‰¤ 10^3 )  , which is the number of integers .\r\nThe second line contains n integers a1,a2...an ( 1 â‰¤ ai â‰¤ 10^9  )  separated by a space .', 'Print 3 integers i , j , k  in a line separated by a space .\r\nIf there are multiple answers , minimize i , then minimize j .', 4, 6),
(1002, 'Count ACM', 1000, 128, 2000, 128, 'For each case, there is only one line giving a string of no more than 10^5\r\n\r\nThere are many cases.It is end with EOF\r\n\r\ncharacters containing only A, C, or M.', 'For each test case, print in one line the number of ACM\'s contained in the string. Since the result may be a huge number, you only have to output the result moded by 1000000007.', 2, 5),
(1003, 'Longest Elegant Subsequence', 3000, 128, 6000, 128, 'There are multiple test cases.\r\n\r\nThe first line of the input contains an integer T(T<=10) which indicates the number of test cases.\r\n\r\nFor each test case, the first line contains an integer n(0 < n < 10^6) indicating the length of the sequence that sister Guo have got.\r\n\r\nThe second line contains n integers a1,a2,...,an(0 <= ai <= 10^9) separated by spaces.', 'For each test case, output the length of the longest elegant subsequence.', 2, 1),
(1004, 'a x b (â… )', 2000, 64, 4000, 64, 'æœ¬é¢˜æœ‰å¤šç»„æ•°æ®\r\næ¯ç»„æ•°æ®æœ‰ä¸€è¡Œ2ä¸ªæ•´æ•°a, b(0<=a,b<=10^5), ç”±ç©ºæ ¼éš”å¼€\r\nè¯·å¤„ç†åˆ°æ–‡ä»¶æœ«å°¾', 'æ¯ç»„æµ‹è¯•æ ·ä¾‹è¾“å‡ºä¸€è¡Œä¸€ä¸ªæ•´æ•°ï¼Œè¡¨ç¤ºa x bçš„ç»“æžœ', 10, 8),
(1005, 'a x b (â…¡)', 1000, 128, 2000, 128, 'æœ¬é¢˜æœ‰å¤šç»„æ•°æ®\r\næ¯ç»„æ•°æ®æœ‰ä¸€è¡Œ2ä¸ªæ•´æ•°a, b(0<=a,b<=10^1000), ç”±ç©ºæ ¼éš”å¼€\r\nè¯·å¤„ç†åˆ°æ–‡ä»¶æœ«å°¾', 'æ¯ç»„æµ‹è¯•æ ·ä¾‹è¾“å‡ºä¸€è¡Œä¸€ä¸ªæ•´æ•°ï¼Œè¡¨ç¤ºa x bçš„ç»“æžœ', 2, 2),
(1006, 'a x b (â…¢)', 3000, 128, 6000, 128, 'æœ¬é¢˜æœ‰å¤šç»„æ•°æ®\r\næ¯ç»„æ•°æ®æœ‰ä¸€è¡Œ2ä¸ªæ•´æ•°a, b(0<=a,b<=10^100000), ç”±ç©ºæ ¼éš”å¼€\r\nè¯·å¤„ç†åˆ°æ–‡ä»¶æœ«å°¾', 'å¯¹æ¯ç»„æ•°æ®ï¼Œè¾“å‡ºä¸€è¡Œä¸€ä¸ªæ•´æ•°ï¼Œè¡¨ç¤ºa x bçš„ç»“æžœ', 2, 2),
(1007, 'äºŒç»´GCDå‰ç¼€ç§¯', 2000, 128, 3000, 128, 'å¤šç»„æ•°æ®\r\n\r\nç¬¬ä¸€è¡Œæœ‰ä¸€ä¸ªæ•´æ•°T(T<=20)ï¼Œä»£è¡¨æ•°æ®ç»„æ•°\r\n\r\nå¯¹æ¯ç»„æ•°æ®ï¼Œæœ‰ä¸¤ä¸ªç”±ç©ºæ ¼åˆ†éš”çš„æ•´æ•°nï¼Œm(1<=n, m <= 10^7)', 'å¯¹æ¯ç»„æ•°æ®ï¼Œè¾“å‡ºç­”æ¡ˆé™¤ä»¥998244353çš„ä½™æ•°', 0, 0),
(1008, 'COS12', 1000, 128, 2000, 128, 'å¤šç»„æ•°æ®\r\n\r\nç¬¬ä¸€è¡Œæœ‰ä¸€ä¸ªæ•´æ•°T(T<=20)ï¼Œä»£è¡¨æ•°æ®ç»„æ•°ã€‚\r\n\r\nå¯¹æ¯ç»„æ•°æ®ï¼Œåªæœ‰ä¸¤ä¸ªæ•´æ•°nå’Œm(0 < n, m <= 500)ï¼Œè¡¨ç¤ºCOS12æ¡Œé¢çš„å¤§å°ã€‚', 'å¯¹æ¯ç»„æ•°æ®ï¼Œè¾“å‡ºæ¡Œé¢ä¸Šæœ€å¤šèƒ½æ”¾ç½®çš„å›¾æ ‡æ•°é‡ã€‚', 0, 0),
(1009, 'mzè¯­è€ƒè¯•', 1000, 128, 2000, 128, 'å¤šç»„æ•°æ®\r\n\r\nç¬¬ä¸€è¡Œæœ‰ä¸€ä¸ªæ•´æ•°T(T<=30)ï¼Œä»£è¡¨æ•°æ®ç»„æ•°ã€‚\r\n\r\nå¯¹æ¯ç»„æ•°æ®ï¼Œç¬¬ä¸€è¡Œæœ‰ä¸¤ä¸ªæ•´æ•°Rã€C(1 <= R, C <= 50)ï¼Œè¡¨ç¤ºè€ƒåœºè§„æ¨¡ã€‚\r\n\r\næŽ¥ä¸‹æ¥Rè¡Œï¼Œæ¯è¡Œæœ‰ä¸€ä¸ªé•¿åº¦ä¸ºCçš„å­—ç¬¦ä¸²ï¼Œæè¿°è€ƒåœºå†…æ¯ä¸ªä½ç½®ã€‚\'.\'è¡¨ç¤ºè¯¥ä½ç½®å¯ç”¨ï¼Œ\'x\'åˆ™è¡¨ç¤ºå·²æŸåã€‚', 'å¯¹æ¯ç»„æ•°æ®ï¼Œè¾“å‡ºè¯¥è€ƒåœºå†…æœ€å¤šèƒ½å®‰æŽ’çš„è€ƒç”Ÿæ•°ã€‚', 0, 0),
(1010, 'è½¦ä¸Šè¿˜å‰©å‡ äºº', 500, 64, 1000, 64, 'å¤šç»„æ ·ä¾‹\r\nç¬¬ä¸€è¡Œè¾“å…¥ä¸€ä¸ªTï¼ˆT <= 20ï¼‰\r\nå¯¹äºŽæ¯ç»„æ ·ä¾‹ï¼š\r\nç¬¬ä¸€è¡Œè¾“å…¥ä¸¤ä¸ªæ•´æ•°n,mï¼Œåˆ†åˆ«è¡¨ç¤ºèµ·ç‚¹ç«™æœ‰å¤šå°‘äººå’Œæœ‰å¤šå°‘ä¸ªç«™ï¼ˆ1<=n<=10^9+7 , 0 <= m <= 10^6 , ä¿è¯æ‰€æœ‰çš„mæ±‚å’Œä¸è¶…è¿‡10^6ï¼‰\r\næŽ¥ä¸‹æ¥mè¡Œæ¯è¡Œä¸¤ä¸ªæ•°ai , biè¡¨ç¤ºæ¯ä¸€ç«™ä¸Šä¸‹è½¦äººæ•° ( 1<=ai,bi<=10^9+7 )', 'è¾“å‡ºä¸€ä¸ªæ•´æ•°è¡¨ç¤ºç­”æ¡ˆï¼Œå¦‚æžœä¸å¯èƒ½ï¼Œåˆ™è¾“å‡ºâ€˜-1â€™', 0, 0),
(1011, 'å¯å¯å¯çš„æ–æ³¢æ‹‰å¥‘æ•°åˆ—', 1000, 128, 2000, 128, 'ç¬¬ä¸€è¡Œè¾“å…¥ä¸€ä¸ªæ­£æ•´æ•°Tè¡¨ç¤ºTç»„æ ·ä¾‹ï¼ˆT<=100ï¼‰\r\næŽ¥ä¸‹æ¥æ¯ä¸ªæ ·ä¾‹è¾“å…¥ä¸€ä¸ªæ­£æ•´æ•°Nï¼ˆN<=10^5ï¼‰', 'æ¯ç»„æ ·ä¾‹è¾“å‡ºä¸€ä¸ªæ•´æ•°è¡¨ç¤ºå¯å¯æ‰€æ±‚çš„æ–æ³¢æ‹‰å¥‘ç¬¬Né¡¹æ¨¡10^9+7', 2, 1),
(1012, 'æœ€å°ç”Ÿæˆæ ‘', 1000, 128, 2000, 256, 'ç¬¬ä¸€è¡Œè¾“å…¥ä¸€ä¸ªTè¡¨ç¤ºæœ‰Tç»„æ ·ä¾‹ï¼ˆT <= 10ï¼‰\r\næŽ¥ä¸‹æ¥æ¯ç»„æ ·ä¾‹\r\nç¬¬ä¸€è¡Œè¾“å…¥ä¸€ä¸ªN Mè¡¨ç¤ºNä¸ªç‚¹ï¼ŒMæ¡è¾¹( 2 <= N <= 10^5 , 1 <= M <= min(N*(N-1)/2),10^5)\r\næŽ¥ä¸‹æ¥Mè¡Œè¾“å…¥ui , vi, wiè¡¨ç¤ºä»Žui åˆ° vi æœ‰ä¸€æ¡æ— å‘è¾¹ï¼Œé•¿åº¦ä¸ºwiï¼Œï¼ˆ1 <= ui , vi <= N , 1 <= wi <= 10^9 ï¼‰\r\n', 'æ¯ç»„æ ·ä¾‹è¾“å‡ºå°†å›¾å…¨è”é€šæœ€å°æƒé‡åœ¨ä¸€è¡Œ', 0, 0),
(1013, 'cwwä¸Žwcw', 1000, 128, 1000, 128, 'å•ç»„æ ·ä¾‹\r\nç¬¬ä¸€è¡Œè¾“å…¥ä¸€ä¸ªNè¡¨ç¤ºå¯å¯æœ‰Næ¬¡cæˆ–è€…wæ“ä½œï¼ˆ1<=N<=100ï¼‰\r\nç¬¬äºŒè¡Œè¾“å…¥ä¸€ä¸ªé•¿åº¦ä¸ºNçš„å­—ç¬¦ä¸²ï¼Œè¡¨ç¤ºå¯å¯çš„c,wæ“ä½œé¡ºåºï¼ˆä¿è¯å­—ç¬¦ä¸²ä¸­åªå‡ºçŽ°c,wï¼‰', 'è¾“å‡ºä¸€ä¸ªæ•´æ•°è¡¨ç¤ºæœ€é«˜çš„å¹³å‡é€Ÿåº¦', 0, 4),
(1014, 'DQ4', 1000, 128, 2000, 256, 'å•ç»„æ ·ä¾‹\r\nå…±å››è¡Œ\r\næ¯è¡Œè¾“å…¥xi,yi,hpi\r\nå…¶ä¸­(1<=i<=4 , 1<=xi<=1000, 1<=yi<500 , 1<=hpi<=1500)', 'å¦‚æžœèƒ½å¤Ÿæ‰“è´¥é»‘æš—ç¥­ç¥€å°±è¾“å‡ºä¸€ä¸ªæ•°å­—è¡¨ç¤ºæœ€å°‘éœ€è¦å¤šå°‘å›žåˆ\r\nå¦åˆ™è¾“å‡º\"Go to leveling\";', 0, 0),
(1015, 'ç™¾ä¸‡è‹±é›„', 1000, 128, 1000, 128, 'å•ç»„æ ·ä¾‹\r\næ¯ç»„æ ·ä¾‹\r\nç¬¬ä¸€è¡Œæœ‰åäºŒä¸ªæ­£æ•´æ•°è¡¨ç¤ºæŒ‰é¡ºåºå¯¹æ¯é“é¢˜çš„äº†è§£ç¨‹åº¦ï¼ˆè¿™åäºŒä¸ªæ­£æ•´æ•°åªä¼šå‡ºçŽ°1,2,3ä¸­çš„å…¶ä¸­ä¸€ä¸ªï¼‰\r\nç¬¬äºŒè¡Œå‡º3ä¸ªæ­£æ•´æ•°x,y,z\r\nå…¶ä¸­\r\nxè¡¨ç¤ºä¸åŒ…æ‹¬å¯å¯åœ¨å†…çš„ç­”å¯¹ç¬¬å…­é¢˜\r\nyè¡¨ç¤ºä¸åŒ…æ‹¬å¯å¯åœ¨å†…ç¬¬åäºŒé¢˜äººæ•°\r\nzè¡¨ç¤ºåŒ…æ‹¬å¯å¯æ‰€åœ¨é˜Ÿä¼å›¢æˆ˜ç“œåˆ†çš„é˜Ÿæ•°\r\n0 < z <= y <= x < 5000000', 'è¾“å‡ºä¸€ä¸ªæ•°è¡¨ç¤ºå¯å¯èŽ·å¾—å¥–é‡‘çš„æ•°å­¦æœŸæœ›\r\nä¸Žæ ‡å‡†ç­”æ¡ˆè¯¯å·®å°äºŽ10^-6å³å¯', 2, 2),
(1016, 'ç¾Žè§‚åŒ–æ–‡å­—', 1000, 128, 1000, 128, 'è¾“å…¥æ–‡å­—åªæœ‰ä¸€æ®µã€‚æ–‡å­—ä¸­å¯èƒ½å«æœ‰ä¸­è‹±æ–‡ã€ç¬¦å·ä»¥åŠæŽ§åˆ¶ç¬¦ï¼ˆæ¢è¡Œã€ç©ºæ ¼ã€åˆ¶è¡¨ç¬¦ç­‰ï¼‰ã€‚', 'æŒ‰ç…§è¦æ±‚è¾“å‡ºç¾ŽåŒ–åŽçš„æ–‡å­—æ®µã€‚ä½ ä¸ç”¨ç¿»è¯‘ä»¥ä¸ŠæŒ‡å®šçš„ç¬¦å·ä¹‹å¤–çš„æ‰€æœ‰å­—ç¬¦ã€‚', 0, 0),
(1017, 'æœ€å°é•¿æ–¹å½¢', 1000, 32, 2000, 32, 'æµ‹è¯•è¾“å…¥åŒ…å«è‹¥å¹²æµ‹è¯•ç”¨ä¾‹ï¼Œæ¯ä¸ªæµ‹è¯•ç”¨ä¾‹ç”±ä¸€ç³»åˆ—åæ ‡ç»„æˆï¼Œæ¯å¯¹åæ ‡å ä¸€è¡Œï¼Œå…¶ä¸­|x|å’Œ|y|å°äºŽ 231ï¼›ä¸€å¯¹0 åæ ‡æ ‡å¿—ç€ä¸€ä¸ªæµ‹è¯•ç”¨ä¾‹çš„ç»“æŸã€‚æ³¨æ„(0, 0)ä¸ä½œä¸ºä»»ä½•ä¸€ä¸ªæµ‹è¯•ç”¨ä¾‹é‡Œé¢çš„ç‚¹ã€‚ä¸€ä¸ªæ²¡æœ‰ç‚¹çš„æµ‹è¯•ç”¨ä¾‹æ ‡å¿—ç€æ•´ä¸ªè¾“å…¥çš„ç»“æŸã€‚ ', 'å¯¹æ¯ä¸ªæµ‹è¯•ç”¨ä¾‹ï¼Œåœ¨1è¡Œå†…è¾“å‡º2å¯¹æ•´æ•°ï¼Œå…¶é—´ç”¨ä¸€ä¸ªç©ºæ ¼éš”å¼€ã€‚ç¬¬1å¯¹æ•´æ•°æ˜¯é•¿æ–¹å½¢æ¡†å·¦ä¸‹è§’çš„åæ ‡ï¼Œç¬¬2å¯¹æ•´æ•°æ˜¯é•¿æ–¹å½¢æ¡†å³ä¸Šè§’çš„åæ ‡ã€‚', 0, 0),
(1018, 'ç»Ÿè®¡å­—ç¬¦', 1000, 32, 1000, 32, 'æµ‹è¯•è¾“å…¥åŒ…å«è‹¥å¹²æµ‹è¯•ç”¨ä¾‹ï¼Œæ¯ä¸ªæµ‹è¯•ç”¨ä¾‹åŒ…å«2è¡Œï¼Œç¬¬1è¡Œä¸ºä¸€ä¸ªé•¿åº¦ä¸è¶…è¿‡5çš„å­—ç¬¦ä¸²ï¼Œç¬¬2è¡Œä¸ºä¸€ä¸ªé•¿åº¦ä¸è¶…è¿‡80çš„å­—ç¬¦ä¸²ã€‚æ³¨æ„è¿™é‡Œçš„å­—ç¬¦ä¸²åŒ…å«ç©ºæ ¼ï¼Œå³ç©ºæ ¼ä¹Ÿå¯èƒ½æ˜¯è¦æ±‚è¢«ç»Ÿè®¡çš„å­—ç¬¦ä¹‹ä¸€ã€‚å½“è¯»åˆ°\'#\'æ—¶è¾“å…¥ç»“æŸï¼Œç›¸åº”çš„ç»“æžœä¸è¦è¾“å‡ºã€‚', 'å¯¹æ¯ä¸ªæµ‹è¯•ç”¨ä¾‹ï¼Œç»Ÿè®¡ç¬¬1è¡Œä¸­å­—ç¬¦ä¸²çš„æ¯ä¸ªå­—ç¬¦åœ¨ç¬¬2è¡Œå­—ç¬¦ä¸²ä¸­å‡ºçŽ°çš„æ¬¡æ•°ï¼ŒæŒ‰å¦‚ä¸‹æ ¼å¼è¾“å‡ºï¼š\r\nc0 n0\r\nc1 n1\r\nc2 n2\r\n... \r\nå…¶ä¸­ciæ˜¯ç¬¬1è¡Œä¸­ç¬¬iä¸ªå­—ç¬¦ï¼Œniæ˜¯ciå‡ºçŽ°çš„æ¬¡æ•°ã€‚', 0, 0),
(1019, 'æœ€å°å…¬å€æ•°', 1000, 32, 2000, 64, 'è¾“å…¥åŒ…å«å¤šç»„æµ‹è¯•æ•°æ®ï¼Œæ¯ç»„åªæœ‰ä¸€è¡Œï¼ŒåŒ…æ‹¬ä¸¤ä¸ªä¸å¤§äºŽ1000çš„æ­£æ•´æ•°.\r\n', 'å¯¹äºŽæ¯ä¸ªæµ‹è¯•ç”¨ä¾‹ï¼Œç»™å‡ºè¿™ä¸¤ä¸ªæ•°çš„æœ€å°å…¬å€æ•°ï¼Œæ¯ä¸ªå®žä¾‹è¾“å‡ºä¸€è¡Œã€‚', 0, 0),
(1020, 'å˜å½¢è¯¾', 1000, 64, 2000, 128, 'æµ‹è¯•æ•°æ®æœ‰å¤šç»„ã€‚æ¯ç»„æœ‰å¤šè¡Œï¼Œæ¯è¡Œä¸€ä¸ªå•è¯,ä»…åŒ…æ‹¬å°å†™å­—æ¯,æ˜¯Harryæ‰€ä¼šçš„æ‰€æœ‰å’’è¯­.æ•°å­—0è¡¨ç¤ºä¸€ç»„è¾“å…¥ç»“æŸ.', 'å¦‚æžœHarryå¯ä»¥å®Œæˆä»–çš„ä½œä¸š,å°±è¾“å‡º\"Yes.\",å¦åˆ™å°±è¾“å‡º\"No.\"(ä¸è¦å¿½ç•¥äº†å¥å·)', 0, 0),
(1021, 'ä¸ƒå¤•èŠ‚', 5000, 32, 10000, 64, 'è¾“å…¥æ•°æ®çš„ç¬¬ä¸€è¡Œæ˜¯ä¸€ä¸ªæ•°å­—T(1<=T<=500000),å®ƒè¡¨æ˜Žæµ‹è¯•æ•°æ®çš„ç»„æ•°.ç„¶åŽæ˜¯Tç»„æµ‹è¯•æ•°æ®,æ¯ç»„æµ‹è¯•æ•°æ®åªæœ‰ä¸€ä¸ªæ•°å­—N(1<=N<=500000).', 'å¯¹äºŽæ¯ç»„æµ‹è¯•æ•°æ®,è¯·è¾“å‡ºä¸€ä¸ªä»£è¡¨è¾“å…¥æ•°æ®Nçš„å¦ä¸€åŠçš„ç¼–å·.', 0, 0),
(1022, 'ç›æ°´çš„æ•…äº‹', 1000, 32, 2000, 64, 'è¾“å…¥æ•°æ®åŒ…å«å¤šä¸ªæµ‹è¯•å®žä¾‹ï¼Œæ¯ä¸ªå®žä¾‹å ä¸€è¡Œï¼Œç”±VULå’ŒDç»„æˆï¼Œå…¶ä¸­ 0<D<VUL<5000ã€‚', 'å¯¹äºŽæ¯ç»„æµ‹è¯•æ•°æ®ï¼Œè¯·è¾“å‡ºæŒ‚å®Œç›æ°´éœ€è¦çš„æ—¶é—´ï¼Œæ¯ä¸ªå®žä¾‹çš„è¾“å‡ºå ä¸€è¡Œã€‚', 0, 0),
(1023, 'Remainder Reminder', 2000, 64, 4000, 128, '1â‰¤Nâ‰¤10^5\r\n0â‰¤Kâ‰¤Nâˆ’1\r\nAll input values are integers.\r\nInput is given from Standard Input in the following format:\r\n\r\nN K', 'Print the number of possible pairs that he may have had.', 0, 0),
(1024, 'åƒç³–æžœ', 3000, 32, 6000, 64, 'ç¬¬ä¸€è¡Œæœ‰ä¸€ä¸ªæ•´æ•°Tï¼ŒæŽ¥ä¸‹æ¥Tç»„æ•°æ®ï¼Œæ¯ç»„æ•°æ®å 2è¡Œï¼Œç¬¬ä¸€è¡Œæ˜¯ä¸€ä¸ªæ•´æ•°Nï¼ˆ0<N<=1000000)ï¼Œç¬¬äºŒè¡Œæ˜¯Nä¸ªæ•°ï¼Œè¡¨ç¤ºNç§ç³–æžœçš„æ•°ç›®Mi(0<Mi<=1000000)ã€‚ ', 'å¯¹äºŽæ¯ç»„æ•°æ®ï¼Œè¾“å‡ºä¸€è¡Œï¼ŒåŒ…å«ä¸€ä¸ª\"Yes\"æˆ–è€…\"No\"ã€‚ ', 0, 0),
(1025, 'å¼€é—¨äººå’Œå…³é—¨äºº', 1000, 32, 2000, 64, 'æµ‹è¯•è¾“å…¥çš„ç¬¬ä¸€è¡Œç»™å‡ºè®°å½•çš„æ€»å¤©æ•°N ( > 0 )ã€‚ä¸‹é¢åˆ—å‡ºäº†Nå¤©çš„è®°å½•ã€‚ \r\næ¯å¤©çš„è®°å½•åœ¨ç¬¬ä¸€è¡Œç»™å‡ºè®°å½•çš„æ¡ç›®æ•°M ( > 0 )ï¼Œä¸‹é¢æ˜¯Mè¡Œï¼Œæ¯è¡Œçš„æ ¼å¼ä¸º \r\n\r\nè¯ä»¶å·ç  ç­¾åˆ°æ—¶é—´ ç­¾ç¦»æ—¶é—´ \r\n\r\nå…¶ä¸­æ—¶é—´æŒ‰â€œå°æ—¶:åˆ†é’Ÿ:ç§’é’Ÿâ€ï¼ˆå„å 2ä½ï¼‰ç»™å‡ºï¼Œè¯ä»¶å·ç æ˜¯é•¿åº¦ä¸è¶…è¿‡15çš„å­—ç¬¦ä¸²ã€‚', 'å¯¹æ¯ä¸€å¤©çš„è®°å½•è¾“å‡º1è¡Œï¼Œå³å½“å¤©å¼€é—¨å’Œå…³é—¨äººçš„è¯ä»¶å·ç ï¼Œä¸­é—´ç”¨1ç©ºæ ¼åˆ†éš”ã€‚ \r\næ³¨æ„ï¼šåœ¨è£åˆ¤çš„æ ‡å‡†æµ‹è¯•è¾“å…¥ä¸­ï¼Œæ‰€æœ‰è®°å½•ä¿è¯å®Œæ•´ï¼Œæ¯ä¸ªäººçš„ç­¾åˆ°æ—¶é—´åœ¨ç­¾ç¦»æ—¶é—´ä¹‹å‰ï¼Œ \r\nä¸”æ²¡æœ‰å¤šäººåŒæ—¶ç­¾åˆ°æˆ–è€…ç­¾ç¦»çš„æƒ…å†µã€‚ ', 0, 0),
(1026, '{A} + {B}', 5000, 32, 10000, 64, 'æ¯ç»„è¾“å…¥æ•°æ®åˆ†ä¸ºä¸‰è¡Œ,ç¬¬ä¸€è¡Œæœ‰ä¸¤ä¸ªæ•°å­—n,m(0<n,m<=10000),åˆ†åˆ«è¡¨ç¤ºé›†åˆAå’Œé›†åˆBçš„å…ƒç´ ä¸ªæ•°.åŽä¸¤è¡Œåˆ†åˆ«è¡¨ç¤ºé›†åˆAå’Œé›†åˆB.æ¯ä¸ªå…ƒç´ ä¸ºä¸è¶…å‡ºintèŒƒå›´çš„æ•´æ•°,æ¯ä¸ªå…ƒç´ ä¹‹é—´æœ‰ä¸€ä¸ªç©ºæ ¼éš”å¼€.', 'é’ˆå¯¹æ¯ç»„æ•°æ®è¾“å‡ºä¸€è¡Œæ•°æ®,è¡¨ç¤ºåˆå¹¶åŽçš„é›†åˆ,è¦æ±‚ä»Žå°åˆ°å¤§è¾“å‡º,æ¯ä¸ªå…ƒç´ ä¹‹é—´æœ‰ä¸€ä¸ªç©ºæ ¼éš”å¼€.', 0, 0),
(1027, 'ç ´è¯‘å¯†ç ', 1000, 32, 2000, 64, 'æœ‰è‹¥å¹²ç»„ï¼Œæ¯ç»„è¾“å…¥æœ‰2è¡Œï¼Œç¬¬ä¸€è¡Œæ•´æ•°Nè¡¨ç¤ºæœ‰Nä¸ªå¯†æ–‡ï¼ŒæŽ¥ç€ä¸€è¡Œæœ‰Nä¸ªæ•´æ•°åˆ†åˆ«è¡¨ç¤ºNä¸ªå¯†æ–‡ã€‚', 'è¾“å‡ºä»…æœ‰å¤§å†™å­—æ¯ç»„æˆçš„åŽŸæ–‡ã€‚', 0, 0),
(1028, 'æŽ’åº', 1000, 32, 2000, 64, 'è¾“å…¥åŒ…å«å¤šç»„æµ‹è¯•ç”¨ä¾‹ï¼Œæ¯ç»„è¾“å…¥æ•°æ®åªæœ‰ä¸€è¡Œæ•°å­—ï¼ˆæ•°å­—ä¹‹é—´æ²¡æœ‰ç©ºæ ¼ï¼‰ï¼Œè¿™è¡Œæ•°å­—çš„é•¿åº¦ä¸å¤§äºŽ1000ã€‚  \r\n\r\nè¾“å…¥æ•°æ®ä¿è¯ï¼šåˆ†å‰²å¾—åˆ°çš„éžè´Ÿæ•´æ•°ä¸ä¼šå¤§äºŽ100000000ï¼›è¾“å…¥æ•°æ®ä¸å¯èƒ½å…¨ç”±â€˜5â€™ç»„æˆã€‚', 'å¯¹äºŽæ¯ä¸ªæµ‹è¯•ç”¨ä¾‹ï¼Œè¾“å‡ºåˆ†å‰²å¾—åˆ°çš„æ•´æ•°æŽ’åºçš„ç»“æžœï¼Œç›¸é‚»çš„ä¸¤ä¸ªæ•´æ•°ä¹‹é—´ç”¨ä¸€ä¸ªç©ºæ ¼åˆ†å¼€ï¼Œæ¯ç»„è¾“å‡ºå ä¸€è¡Œã€‚', 0, 0),
(1029, 'å®Œæ•°', 1000, 32, 2000, 64, 'è¾“å…¥æ•°æ®åŒ…å«å¤šè¡Œï¼Œç¬¬ä¸€è¡Œæ˜¯ä¸€ä¸ªæ­£æ•´æ•°nï¼Œè¡¨ç¤ºæµ‹è¯•å®žä¾‹çš„ä¸ªæ•°ï¼Œç„¶åŽå°±æ˜¯nä¸ªæµ‹è¯•å®žä¾‹ï¼Œæ¯ä¸ªå®žä¾‹å ä¸€è¡Œï¼Œç”±ä¸¤ä¸ªæ­£æ•´æ•°num1å’Œnum2ç»„æˆ,(1<num1,num2<10000) ã€‚', 'å¯¹äºŽæ¯ç»„æµ‹è¯•æ•°æ®ï¼Œè¯·è¾“å‡ºnum1å’Œnum2ä¹‹é—´ï¼ˆåŒ…æ‹¬num1å’Œnum2ï¼‰å­˜åœ¨çš„å®Œæ•°ä¸ªæ•°ã€‚', 0, 0),
(1030, 'é‡‡çŸ¿', 5000, 32, 10000, 64, 'è¾“å…¥æ•°æ®æœ‰å¤šç»„ã€‚æ¯ç»„æ•°æ®çš„ç¬¬ä¸€è¡Œæ˜¯ä¸€ä¸ªæ­£æ•´æ•°n(0<n<1000000),è¡¨ç¤ºå°å²›ä¸Šæœ‰nä¸ªé‡‘çŸ¿ã€‚åœ¨æŽ¥ä¸‹æ¥çš„nè¡Œä¸­ï¼Œæ¯è¡Œæœ‰ä¸¤ä¸ªå®žæ•°x,yï¼Œè¡¨ç¤ºå…¶ä¸­ä¸€ä¸ªé‡‘çŸ¿çš„åæ ‡ã€‚n=0è¡¨ç¤ºè¾“å…¥æ•°æ®ç»“æŸã€‚', 'æ¯ä¸€ç»„è¾“å…¥æ•°æ®å¯¹åº”ä¸€è¡Œè¾“å‡ºï¼Œè¾“å‡ºä¸¤ä¸ªå®žæ•°xï¼Œyï¼ˆä¿ç•™å°æ•°ç‚¹åŽä¸¤ä½ï¼‰ï¼Œä¹Ÿå°±æ˜¯ä½ æ‰¾åˆ°çš„å»ºé€ åŸºåœ°çš„ä½ç½®åæ ‡ã€‚å¦‚æžœåæ ‡ä¸å”¯ä¸€ï¼Œå¯ä»¥ä»»é€‰ä¸€ä¸ªè¾“å‡ºã€‚', 0, 0);

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
(1014, 'åœ¨DQ4ï¼ˆå‹‡è€…æ–—æ¶é¾™4ï¼šè¢«å¼•å¯¼çš„äººæ°‘ï¼‰ä¸­ï¼Œå®Œç¾Žç»“å±€æ˜¯å‹‡è€…ä¸Žé­”æ—ä¹‹çŽ‹è”æ‰‹å°†é­”æ—çš„é»‘æš—ç¥­ç¥€æ‰“è´¥ä»Žè€Œè½ä¸‹å¸·å¹•\r\nç›®å‰å¯å¯ä¹Ÿåœ¨çŽ©è¿™æ¬¾æ¸¸æˆï¼Œä½†æ˜¯ä»–çŽ°åœ¨åˆä¸æƒ³ç»ƒçº§ï¼ŒäºŽæ˜¯çŽ°åœ¨ä»–æƒ³çŸ¥é“ä»–è‡³å°‘è¦å¤šå°‘ä¸ªå›žåˆæ‰èƒ½æ‰“å€’å¤§BOSS\r\nä¸ºäº†ç®€åŒ–è®¡ç®—ï¼Œæˆ‘ä»¬å‡å®šï¼Œæ— æš´å‡»ï¼Œæ— é—ªé¿\r\né­”çŽ‹æ˜¯99çº§å¼ºè€…ï¼Œå…¶ç”Ÿå‘½å€¼ä¸º10000 ï¼Œ æ”»å‡»åŠ›ä¸º500 ï¼Œ é˜²å¾¡åŠ›ä¸º500\r\nç„¶åŽå¯å¯æœ‰å››ä½è‹±é›„\r\nåˆ†åˆ«æœ‰ä»¥ä¸‹å±žæ€§ï¼š\r\n1. å‹‡è€…ï¼š     æ”»å‡»åŠ›ä¸º x1 ï¼Œ é˜²å¾¡åŠ›ä¸º y1 ï¼Œ ç”Ÿå‘½å€¼ä¸ºhp1\r\n2. é­”æ—ä¹‹çŽ‹ï¼š æ”»å‡»åŠ›ä¸º x2 ,  é˜²å¾¡åŠ›ä¸º y2 ,  ç”Ÿå‘½å€¼ä¸ºhp2\r\n3. ç¥žå®˜ï¼š     æ”»å‡»åŠ›ä¸º x3 ,  é˜²å¾¡åŠ›ä¸º y3 ,  ç”Ÿå‘½å€¼ä¸ºhp3\r\n4. å¥¶å¦ˆï¼š     æ”»å‡»åŠ›ä¸º 0  ï¼Œ é˜²å¾¡åŠ›ä¸º y4 ,  ç”Ÿå‘½åŠ›ä¸ºhp4 ï¼Œç¾¤ä½“åŠ è¡€æ²¡äººå›žå¤x4çš„ç”Ÿå‘½\r\nå‡å®šå¯å¯æ¯å›žåˆçš„å‡ä¸ºä¸‰æ”»å‡»ä¸€å›žè¡€\r\nå…¶ä¸­ä¼¤å®³è®¡ç®—è§„åˆ™ä¸ºï¼š\r\né»‘æš—ç¥­ç¥€æ¯å›žåˆåŒæ—¶å¯¹å››äººé€ æˆ ï¼ˆ500 - é˜²å¾¡åŠ›ï¼‰*0.9çš„ä¼¤å®³\r\nå‹‡è€…å¯¹é»‘æš—ç¥­ç¥€é€ æˆ max((x1-500)*1.3,1)çš„ä¼¤å®³\r\né­”æ—ä¹‹çŽ‹å¯¹é»‘æš—ç¥­ç¥€é€ æˆmax(x2-500,1)çš„ä¼¤å®³ ï¼Œ å¹¶å›žå¤é€ æˆä¼¤å®³çš„25%ç‚¹ç”Ÿå‘½å€¼\r\nç¥žå®˜å¯¹é»‘æš—ç¥­ç¥€é€ æˆmax((x3*0.9-500)*1.75,1)çš„ä¼¤å®³ , å¹¶å›žå¤é€ æˆä¼¤å®³çš„25%ç‚¹ç”Ÿå‘½å€¼\r\nå¥¶å¦ˆä¸ä¼šæ”»å‡»ï¼Œåªä¼šç¾¤ä½“åŠ è¡€\r\nçŽ©å®¶å…ˆæ‰‹ï¼Œç„¶åŽåˆ°BOSSæ”»å‡»ï¼Œå›žåˆäº¤æ›¿ï¼Œç”Ÿå‘½å€¼ä¸èƒ½æº¢å‡ºåŽŸæœ¬çš„ä¸Šé™ï¼\r\né—®å¯å¯æ˜¯å¦å¯ä»¥æ‰“è´¥é»‘æš—ç¥­ç¥€ï¼Œå¦‚æžœå¯ä»¥æœ€å°‘éœ€è¦å¤šå°‘å›žåˆ\r\næ³¨æ„ï¼š\r\nä¼¤å®³å¿…é¡»ä¸ºæ•´æ•°\r\nå¦‚æžœè®¡ç®—ä¼¤å®³ä¸º1.7 ï¼Œåˆ™çœŸæ­£çš„ä¼¤å®³ä¸º1', '700 300 500\r\n700 300 500\r\n700 300 500\r\n200 450 500', '15'),
(1012, 'ç»™å®šä¸€å¼ å›¾ï¼Œæ±‚æœ€å°ç”Ÿæˆæ ‘', '1\r\n3 3\r\n1 2 3\r\n1 3 3\r\n2 3 1', '4'),
(1013, 'QQé£žè½¦ä¸­æœ‰å°å–·,åŒå–·ï¼Œcwwå–·ï¼Œwcwå–·ï¼Œæ°®æ°”,cwå–·\r\nçŽ°åœ¨æˆ‘ä»¬ç”¨wè¡¨ç¤ºå°å–·ï¼Œwwè¡¨ç¤ºåŒå–·ï¼Œcè¡¨ç¤ºæ°®æ°”\r\né‚£ä¹ˆåœ¨ä¸€å±€æ¯”èµ›ä¸­æˆ‘ä»¬æœ‰å¾ˆå¤šwä¸Žcçš„æ“ä½œï¼ŒçŽ°åœ¨å®šä¹‰c,wæ“ä½œç»„åˆï¼ˆå¦‚æžœä¸‹åˆ—æœªæ¶‰åŠåˆ™è¡¨ç¤ºæ²¡æœ‰è¿™ç§ç»„åˆï¼‰\r\nå°å–·å¯ä»¥æé«˜å¹³å‡é€Ÿåº¦100\r\nåŒå–·å¯ä»¥æé«˜å¹³å‡é€Ÿåº¦140\r\næ°®æ°”å¯ä»¥æé«˜å¹³å‡é€Ÿåº¦250\r\ncwå–·å¯ä»¥æé«˜å¹³å‡é€Ÿåº¦400\r\ncwwå–·å¯ä»¥æé«˜å¹³å‡é€Ÿåº¦550\r\nwcwå–·å¯ä»¥æé«˜å¹³å‡é€Ÿåº¦535\r\nçŽ°åœ¨å¯å¯æœ‰è¿žç»­çš„æ“ä½œï¼Œä¸ºäº†ç®€åŒ–è®¡ç®—ï¼Œè¿™é‡Œåªè®°å½•å¯å¯çš„c,wæ“ä½œ\r\nå·²çŸ¥å¯å¯å¼€é€šäº†è¶…çº§vipæƒé™,å¯ä»¥å°†èµ›é“æ”¹å˜æˆç¬¦åˆè‡ªå·±æ“ä½œï¼ˆå³åœ¨ç»™å®šæ“ä½œé¡ºåºçš„å‰æä¸‹æŒ‰æ­¤æ“ä½œé¡ºåºæ“ä½œå…¨ç¨‹æ— å¤±è¯¯ï¼‰\r\nå¯å¯æƒ³çŸ¥é“åœ¨ä¸æ”¹å˜æ“ä½œé¡ºåºçš„å‰æä¸‹ï¼Œå¦‚ä½•è¿›è¡Œc,wç»„åˆä»¥èŽ·å¾—æœ€é«˜çš„å¹³å‡é€Ÿåº¦ \r\nå·²çŸ¥å¯å¯å…¨ç¨‹æ— å–·æ— æ°®çš„å¹³å‡é€Ÿåº¦ä¸º50', '10\r\ncwwcwwwcww', '1800'),
(1015, 'å¯å¯æœ€è¿‘åœ¨å‚åŠ ç™¾ä¸‡è‹±é›„\r\nç™¾ä¸‡è‹±é›„æ¯åœºä¸€å…±åäºŒé¢˜ï¼Œç­”å¯¹åäºŒé¢˜å°†å¹³åˆ†å½“åœºæ‰€æœ‰å¥–é‡‘\r\nå…¶ä¸­ä¸ªäººå¥–é‡‘ä¸º45ä¸‡å…ƒï¼Œå›¢æˆ˜å¥–é‡‘ä¸º5ä¸‡å…ƒ\r\nå…¶ä¸­ä¸ªäººå¥–é‡‘åˆ†åˆ«åœ¨ç¬¬å…­é¢˜å’Œç¬¬åäºŒé¢˜æ‹¿åˆ°åˆ†åˆ«20ä¸‡å…ƒå’Œ25ä¸‡å…ƒçš„å¹³åˆ†\r\nçŽ°åœ¨ç»™å®šå¯å¯å¯¹æ¯é“é¢˜çš„æŠŠæ¡\r\nå…¶ä¸­\r\næ¯é“é¢˜çš„é€‰é¡¹æœ‰ä¸‰ä¸ª\r\nå…¶ä¸­å¯å¯å¯¹æ¯é“é¢˜çš„äº†è§£ç¨‹åº¦æœ‰ä¸‰ç§æƒ…å†µ\r\n1è¡¨ç¤ºå¯å¯èƒ½å¤Ÿ100%ä½œå¯¹æœ¬é¢˜\r\n2è¡¨ç¤ºå¯å¯100%æŽ’é™¤äº†ä¸€ä¸ªé”™è¯¯çš„é€‰é¡¹\r\n3è¡¨ç¤ºå¯å¯å¯¹æœ¬é¢˜ä¸€æ— æ‰€çŸ¥\r\nå‡å®šå¯å¯å¯¹äºŽä¸çŸ¥é“çš„é¢˜ç›®å°†å®Œå…¨éšæœºï¼Œé‚£ä¹ˆå¯å¯èƒ½å¤Ÿæ‹¿åˆ°çš„å¥–é‡‘çš„æ•°å­¦æœŸæœ›æ˜¯å¤šå°‘å‘¢ï¼Ÿ\r\nå‡å®šå¯å¯ä¸Žä¸€åæœªçŸ¥é«˜æ‰‹ç»„é˜Ÿï¼Œ100%ç“œåˆ†å›¢æˆ˜å¥–é‡‘ï¼ˆé˜Ÿä¼äººæ•°ä¸‰äººï¼‰', '1 1 1 1 1 1 1 1 1 1 1 3\r\n9999 4999 1000', '53.3333333'),
(1016, 'è¯·çœ‹ä¸‹é¢ä¸¤æ®µæ–‡å­—ï¼š\r\n\r\nKennyå–Šé“ï¼š\"æˆ‘æ¥äº†!\"\r\n\r\nKennyå–Šé“ï¼šâ€œæˆ‘æ¥äº†ï¼â€\r\n\r\nå‰é¢ä¸€æ®µæ–‡å­—ä¸­ç”±äºŽåœ¨ä¸­æ–‡ä¸­ä½¿ç”¨äº†è‹±æ–‡æ ‡ç‚¹ï¼Œæ˜¾å¾—ä¸å¤ªç¾Žè§‚ã€‚æœ¬é¢˜ä¸­ä½ çš„ä»»åŠ¡æ˜¯è®©ä»»æ„ä¸€æ®µæ–‡å­—ç¾Žè§‚åŒ–ã€‚ç¾Žè§‚åŒ–å…·ä½“è¦æ±‚ä¸ºå°†ä»¥ä¸‹å­—ç¬¦ï¼ˆä¸²ï¼‰è½¬æ¢ä¸ºå¯¹åº”çš„ä¸­æ–‡å­—ç¬¦ï¼š\r\n\r\n\r\nè‹±æ–‡ ä¸­æ–‡\r\n ,    ï¼Œ\r\n .    ã€‚\r\n !    ï¼\r\n \"    â€œæˆ–â€ \r\n<<    ã€Š\r\n>>     ã€‹\r\n ?    ï¼Ÿ', 'Kennyå–Šé“ï¼š\"æˆ‘æ¥äº†!\"', 'Kennyå–Šé“ï¼šâ€œæˆ‘æ¥äº†ï¼â€'),
(1017, 'ç»™å®šä¸€ç³»åˆ—2ç»´å¹³é¢ç‚¹çš„åæ ‡(x, y)ï¼Œå…¶ä¸­xå’Œyå‡ä¸ºæ•´æ•°ï¼Œè¦æ±‚ç”¨ä¸€ä¸ªæœ€å°çš„é•¿æ–¹å½¢æ¡†å°†æ‰€æœ‰ç‚¹æ¡†åœ¨å†…ã€‚é•¿æ–¹å½¢æ¡†çš„è¾¹åˆ†åˆ«å¹³è¡ŒäºŽxå’Œyåæ ‡è½´ï¼Œç‚¹è½åœ¨è¾¹ä¸Šä¹Ÿç®—æ˜¯è¢«æ¡†åœ¨å†…ã€‚', '12 56\r\n23 56\r\n13 10\r\n0 0\r\n12 34\r\n0 0\r\n0 0', '12 10 23 56\r\n12 34 12 34'),
(1018, 'ç»Ÿè®¡ä¸€ä¸ªç»™å®šå­—ç¬¦ä¸²ä¸­æŒ‡å®šçš„å­—ç¬¦å‡ºçŽ°çš„æ¬¡æ•°', 'I\r\nTHIS IS A TEST\r\ni ng\r\nthis is a long test string\r\n#', 'I 2\r\ni 3\r\n  5\r\nn 2\r\ng 2 \r\næ³¨ï¼šç¬¬2ä¸ªæµ‹è¯•ç”¨ä¾‹ä¸­ï¼Œç©ºæ ¼ä¹Ÿæ˜¯è¢«ç»Ÿè®¡çš„å­—ç¬¦ä¹‹ä¸€ã€‚ '),
(1019, 'ç»™å®šä¸¤ä¸ªæ­£æ•´æ•°ï¼Œè®¡ç®—è¿™ä¸¤ä¸ªæ•°çš„æœ€å°å…¬å€æ•°ã€‚', '10 14', '70'),
(1020, 'å‘ƒ......å˜å½¢è¯¾ä¸ŠHarryç¢°åˆ°äº†ä¸€ç‚¹å°éº»çƒ¦,å› ä¸ºä»–å¹¶ä¸åƒHermioneé‚£æ ·èƒ½å¤Ÿè®°ä½æ‰€æœ‰çš„å’’è¯­è€Œéšæ„çš„å°†ä¸€ä¸ªæ£’çƒå˜æˆåˆºçŒ¬ä»€ä¹ˆçš„,ä½†æ˜¯ä»–å‘çŽ°äº†å˜å½¢å’’è¯­çš„ä¸€ä¸ªç»Ÿä¸€è§„å¾‹:å¦‚æžœå’’è¯­æ˜¯ä»¥aå¼€å¤´bç»“å°¾çš„ä¸€ä¸ªå•è¯,é‚£ä¹ˆå®ƒçš„ä½œç”¨å°±æ°å¥½æ˜¯ä½¿Aç‰©ä½“å˜æˆBç‰©ä½“. \r\nHarryå·²ç»å°†ä»–æ‰€ä¼šçš„æ‰€æœ‰å’’è¯­éƒ½åˆ—æˆäº†ä¸€ä¸ªè¡¨,ä»–æƒ³è®©ä½ å¸®å¿™è®¡ç®—ä¸€ä¸‹ä»–æ˜¯å¦èƒ½å®Œæˆè€å¸ˆçš„ä½œä¸š,å°†ä¸€ä¸ªB(ball)å˜æˆä¸€ä¸ªM(Mouse),ä½ çŸ¥é“,å¦‚æžœä»–è‡ªå·±ä¸èƒ½å®Œæˆçš„è¯,ä»–å°±åªå¥½å‘Hermioneè¯·æ•™,å¹¶ä¸”è¢«è¿«å¬ä¸€å¤§å †å¥½å¥½å­¦ä¹ çš„é“ç†.', 'so\r\nsoon\r\nriver\r\ngoes\r\nthem\r\ngot\r\nmoon\r\nbegin\r\nbig\r\n0', 'Yes.'),
(1021, 'ä¸ƒå¤•èŠ‚é‚£å¤©,æœˆè€æ¥åˆ°æ•°å­—çŽ‹å›½,ä»–åœ¨åŸŽé—¨ä¸Šè´´äº†ä¸€å¼ å‘Šç¤º,å¹¶ä¸”å’Œæ•°å­—çŽ‹å›½çš„äººä»¬è¯´:\"ä½ ä»¬æƒ³çŸ¥é“ä½ ä»¬çš„å¦ä¸€åŠæ˜¯è°å—?é‚£å°±æŒ‰ç…§å‘Šç¤ºä¸Šçš„æ–¹æ³•åŽ»æ‰¾å§!\"\r\näººä»¬çº·çº·æ¥åˆ°å‘Šç¤ºå‰,éƒ½æƒ³çŸ¥é“è°æ‰æ˜¯è‡ªå·±çš„å¦ä¸€åŠ.å‘Šç¤ºå¦‚ä¸‹:\r\n\r\n-----------------------------------------------------\r\nå› ä¸ºæ²¡æœ‰å›¾ç‰‡ï¼Œæ‰€ä»¥æ‰‹å†™\r\nå‘Šç¤ºï¼š\r\næ­£å€¼ä¸ƒå¤•ä½³èŠ‚æ¥ä¸´ä¹‹é™…ï¼Œä¸ºæ„Ÿè°¢å¹¿å¤§ç¾¤ä¼—å¯¹æˆ‘æœˆè€çš„çƒ­çˆ±ï¼Œç‰¹å°†å¤§å®¶çš„å¦ä¸€åŠçš„å¯»æ‰¾æ–¹æ³•å…¬å¸ƒå¦‚ä¸‹ï¼š\r\nå°†ä½ çš„ç¼–å·ï¼ˆæ•°å­—çŽ‹å›½çš„æ¯ä¸ªäººéƒ½æœ‰ä¸€ä¸ªå”¯ä¸€çš„ç¼–å·ï¼‰çš„æ‰€æœ‰å› å­åŠ èµ·æ¥å¾—åˆ°ä¸€ä¸ªç¼–å·ï¼Œè¿™ä¸ªç¼–å·çš„ä¸»äººå°±æ˜¯ä½ çš„å¦ä¸€åŠ\r\nç¥å¤§å®¶éƒ½èƒ½æ‰¾åˆ°å¦ä¸€åŠ\r\næœˆè€\r\n-----------------------------------------------------\r\n\r\næ•°å­—Nçš„å› å­å°±æ˜¯æ‰€æœ‰æ¯”Nå°åˆèƒ½è¢«Næ•´é™¤çš„æ‰€æœ‰æ­£æ•´æ•°,å¦‚12çš„å› å­æœ‰1,2,3,4,6.\r\nä½ æƒ³çŸ¥é“ä½ çš„å¦ä¸€åŠå—?\r\n', '3\r\n2\r\n10\r\n20\r\n', '1\r\n8\r\n22\r\n'),
(1022, 'æŒ‚ç›æ°´çš„æ—¶å€™ï¼Œå¦‚æžœæ»´èµ·æ¥æœ‰è§„å¾‹ï¼Œå…ˆæ˜¯æ»´ä¸€æ»´ï¼Œåœä¸€ä¸‹ï¼›ç„¶åŽæ»´äºŒæ»´ï¼Œåœä¸€ä¸‹ï¼›å†æ»´ä¸‰æ»´ï¼Œåœä¸€ä¸‹...ï¼ŒçŽ°åœ¨æœ‰ä¸€ä¸ªé—®é¢˜ï¼šè¿™ç“¶ç›æ°´ä¸€å…±æœ‰VULæ¯«å‡ï¼Œæ¯ä¸€æ»´æ˜¯Dæ¯«å‡ï¼Œæ¯ä¸€æ»´çš„é€Ÿåº¦æ˜¯ä¸€ç§’ï¼ˆå‡è®¾æœ€åŽä¸€æ»´ä¸åˆ°Dæ¯«å‡ï¼Œåˆ™èŠ±è´¹çš„æ—¶é—´ä¹Ÿç®—ä¸€ç§’ï¼‰ï¼Œåœä¸€ä¸‹çš„æ—¶é—´ä¹Ÿæ˜¯ä¸€ç§’è¿™ç“¶æ°´ä»€ä¹ˆæ—¶å€™èƒ½æŒ‚å®Œå‘¢ï¼Ÿ', '10 1', '13'),
(1023, 'Takahashi had a pair of two positive integers not exceeding N, (a,b), which he has forgotten. He remembers that the remainder of a divided by b was greater than or equal to K. Find the number of possible pairs that he may have had.', '5 2', '7'),
(1024, 'HOHOï¼Œç»ˆäºŽä»ŽSpeaklessæ‰‹ä¸Šèµ¢èµ°äº†æ‰€æœ‰çš„ç³–æžœï¼Œæ˜¯Gardonåƒç³–æžœæ—¶æœ‰ä¸ªç‰¹æ®Šçš„ç™–å¥½ï¼Œå°±æ˜¯ä¸å–œæ¬¢å°†ä¸€æ ·çš„ç³–æžœæ”¾åœ¨ä¸€èµ·åƒï¼Œå–œæ¬¢å…ˆåƒä¸€ç§ï¼Œä¸‹ä¸€æ¬¡åƒå¦ä¸€ç§ï¼Œè¿™æ ·ï¼›å¯æ˜¯Gardonä¸çŸ¥é“æ˜¯å¦å­˜åœ¨ä¸€ç§åƒç³–æžœçš„é¡ºåºä½¿å¾—ä»–èƒ½æŠŠæ‰€æœ‰ç³–æžœéƒ½åƒå®Œï¼Ÿè¯·ä½ å†™ä¸ªç¨‹åºå¸®å¿™è®¡ç®—ä¸€ä¸‹ã€‚', '2\r\n3\r\n4 1 1\r\n5\r\n5 4 3 2 1', 'No\r\nYes'),
(1025, 'æ¯å¤©ç¬¬ä¸€ä¸ªåˆ°æœºæˆ¿çš„äººè¦æŠŠé—¨æ‰“å¼€ï¼Œæœ€åŽä¸€ä¸ªç¦»å¼€çš„äººè¦æŠŠé—¨å…³å¥½ã€‚çŽ°æœ‰ä¸€å †æ‚ä¹±çš„æœºæˆ¿ç­¾ \r\nåˆ°ã€ç­¾ç¦»è®°å½•ï¼Œè¯·æ ¹æ®è®°å½•æ‰¾å‡ºå½“å¤©å¼€é—¨å’Œå…³é—¨çš„äººã€‚ ', '3\r\n1\r\nME3021112225321 00:00:00 23:59:59\r\n2\r\nEE301218 08:05:35 20:56:35\r\nMA301134 12:35:45 21:40:42\r\n3\r\nCS301111 15:30:28 17:00:10\r\nSC3021234 08:00:00 11:25:25\r\nCS301133 21:45:00 21:58:40', 'ME3021112225321 ME3021112225321\r\nEE301218 MA301134\r\nSC3021234 CS301133'),
(1026, 'ç»™ä½ ä¸¤ä¸ªé›†åˆï¼Œè¦æ±‚{A} + {B}.\r\næ³¨:åŒä¸€ä¸ªé›†åˆä¸­ä¸ä¼šæœ‰ä¸¤ä¸ªç›¸åŒçš„å…ƒç´ .', '1 2\r\n1\r\n2 3\r\n1 2\r\n1\r\n1 2', '1 2 3\r\n1 2'),
(1027, 'æœ‰ä¸ªå«â€œçŒªå¤´å¸®â€çš„å›½å®¶ï¼Œé‡‡ç”¨ä¸€ç§ç®€å•çš„æ–‡æ³•åŠ å¯†ï¼Œä»–ä»¬æ‰€ç”¨çš„è¯­è¨€é‡Œé¢åªæœ‰å¤§å†™å­—æ¯ï¼Œæ²¡æœ‰å…¶ä»–ä»»ä½•å­—ç¬¦ï¼›çŽ°åœ¨è¿˜çŸ¥é“ä»–ä»¬åŠ å¯†çš„æ–¹æ³•æ˜¯ï¼šåªç”¨ä¸€ä¸ªå¤§å†™å­—æ¯å’ŒåŽŸæ–‡è¿›è¡Œå¼‚æˆ–è¿ç®—ç”Ÿæˆå¯†æ–‡ã€‚è¯·ä½ å¸®å¿™è§£å¼€ã€‚', '30\r\n17 6 9 8 3 0 1 6 7 4 5 10 11 8 9 14 15 12 13 18 19 16 17 22 23 20 21 26 27 24', 'SDKJABCDEFGHIJKLMNOPQRSTUVWXYZ'),
(1028, 'è¾“å…¥ä¸€è¡Œæ•°å­—ï¼Œå¦‚æžœæˆ‘ä»¬æŠŠè¿™è¡Œæ•°å­—ä¸­çš„â€˜5â€™éƒ½çœ‹æˆç©ºæ ¼ï¼Œé‚£ä¹ˆå°±å¾—åˆ°ä¸€è¡Œç”¨ç©ºæ ¼åˆ†å‰²çš„è‹¥å¹²éžè´Ÿæ•´æ•°ï¼ˆå¯èƒ½æœ‰äº›æ•´æ•°ä»¥â€˜0â€™å¼€å¤´ï¼Œè¿™äº›å¤´éƒ¨çš„â€˜0â€™åº”è¯¥è¢«å¿½ç•¥æŽ‰ï¼Œé™¤éžè¿™ä¸ªæ•´æ•°å°±æ˜¯ç”±è‹¥å¹²ä¸ªâ€˜0â€™ç»„æˆçš„ï¼Œè¿™æ—¶è¿™ä¸ªæ•´æ•°å°±æ˜¯0ï¼‰ã€‚\r\n\r\nä½ çš„ä»»åŠ¡æ˜¯ï¼šå¯¹è¿™äº›åˆ†å‰²å¾—åˆ°çš„æ•´æ•°ï¼Œä¾ä»Žå°åˆ°å¤§çš„é¡ºåºæŽ’åºè¾“å‡º', '0051231232050775', '0 77 12312320'),
(1029, 'å®Œæ•°çš„å®šä¹‰ï¼šå¦‚æžœä¸€ä¸ªå¤§äºŽ1çš„æ­£æ•´æ•°çš„æ‰€æœ‰å› å­ä¹‹å’Œç­‰äºŽå®ƒçš„æœ¬èº«ï¼Œåˆ™ç§°è¿™ä¸ªæ•°æ˜¯å®Œæ•°ï¼Œæ¯”å¦‚6ï¼Œ28éƒ½æ˜¯å®Œæ•°ï¼š6=1+2+3ï¼›28=1+2+4+7+14ã€‚\r\n\r\næœ¬é¢˜çš„ä»»åŠ¡æ˜¯åˆ¤æ–­ä¸¤ä¸ªæ­£æ•´æ•°ä¹‹é—´å®Œæ•°çš„ä¸ªæ•°ã€‚', '2\r\n2 5\r\n5 7', '0\r\n1'),
(1030, 'æŸå¤©gameboyçŽ©é­”å…½RPGã€‚æœ‰ä¸€ä¸ªä»»åŠ¡æ˜¯åœ¨ä¸€ä¸ªå¯Œå«é‡‘çŸ¿çš„åœ†å½¢å°å²›ä¸Šå»ºä¸€ä¸ªåŸºåœ°ï¼Œä»¥æœ€å¿«çš„é€Ÿåº¦é‡‡é›†å®Œè¿™ä¸ªå°å²›ä¸Šçš„æ‰€æœ‰é‡‘çŸ¿ã€‚è¿™ä¸ªå°å²›ä¸Šæœ‰n(0<n<1000000)ä¸ªé‡‘çŸ¿ï¼Œæ¯ä¸ªé‡‘çŸ¿çš„çŸ¿è—é‡æ˜¯ç›¸ç­‰çš„ã€‚è€Œä¸”è¿™ä¸ªå°å²›çš„åœ°åŠ¿éžå¸¸å¹³å¦ï¼Œæ‰€ä»¥åŸºåœ°å¯ä»¥å»ºåœ¨å°å²›çš„ä»»ä½•ä½ç½®ï¼Œæ¯ä¸ªé‡‘çŸ¿çš„é‡‡çŸ¿é€Ÿåº¦åªè·ŸçŸ¿è—åˆ°åŸºåœ°çš„è·¯ç¨‹é•¿åº¦æœ‰å…³ã€‚ä¸ºäº†ä¸è®©è¿™ä¸ªä»»åŠ¡å¤ªæ— èŠï¼Œæ¸¸æˆè®¾è®¡è€…å¯¹è¿™ä¸ªå°å²›æ–½äº†ä¸ªâ€œé­”æ³•â€ï¼Œè§„å®šçŸ¿å·¥åœ¨å°å²›ä¸Šåªèƒ½æ­£å—æ­£åŒ—æ­£è¥¿æ­£ä¸œèµ°ã€‚ä¹Ÿå°±æ˜¯è¯´çŸ¿å·¥ä¸èƒ½æ–œç€åœ¨å²›ä¸Šèµ°ã€‚\r\n\r\nè¿™ä¸ªå°å²›åœ¨ä¸€ä¸ªäºŒç»´ç›´è§’åæ ‡ç³»ä¸­æè¿°ã€‚\r\n\r\nä½ çš„ä»»åŠ¡å°±æ˜¯å¸®gameboyæ‰¾ä¸€ä¸ªå»ºé€ åŸºåœ°çš„ä½ç½®ï¼Œä½¿çŸ¿å·¥èƒ½ä»¥æœ€å¿«çš„é€Ÿåº¦é‡‡å®Œæ‰€æœ‰çŸ¿ã€‚', '4\r\n1.0 1.0\r\n3.0 1.0\r\n3.0 3.0\r\n1.0 3.0\r\n0', '2.00 2.00\r\n');

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
(1010, '', -9945157, '2017-11-28 15:59:09', '2018-02-24 17:25:12', 9, 3),
(1011, '', -9945157, '2017-12-07 00:00:00', '2018-02-06 14:20:04', 1, 4),
(1012, '', -9945157, '2018-01-16 15:43:35', '2018-01-16 15:43:35', 0, 1),
(1013, 'å¯å¯å¯ä»¥å†³å®šcw wcw ww cww\r\næ­¤æ—¶å¹³å‡é€Ÿåº¦ä¸º50 + 400 + 535 + 140 + 550 = 1675\r\nè€Œå¦‚æžœå¯å¯å†³å®šcww cww w cww\r\nç„¶åŽæœ€ç»ˆå¹³å‡é€Ÿåº¦ä¸º50 + 550 + 550 + 100 + 550 = 1800 \r\næ˜¾ç„¶æ¯”ä¹‹å‰çš„æ–¹æ¡ˆè¦ä¼˜', -9945157, '2018-01-25 10:52:10', '2018-02-14 20:09:32', 0, 3),
(1014, 'é­”çŽ‹æ¯å›žåˆå¯¹å‹‡è€…ï¼Œé­”æ—ä¹‹çŽ‹ï¼Œç¥žå®˜é€ æˆ180ç‚¹ä¼¤å®³ï¼Œå¥¶å¦ˆé€ æˆ45ç‚¹ä¼¤å®³ï¼Œ\r\nå¥¶å¦ˆæ¯å›žåˆå¯ä»¥å›žè¡€200\r\nä¸‰æ”»å‡»ä¸€å›žè¡€è¾“å‡ºä¸º200*1.3+200+130*1.75 = 687.5 => ä¼¤å®³ä¸º687ç‚¹\r\næ‰€ä»¥æœ€å°‘å›žåˆæ˜¯ä¸º10000/687 = 14.545454..... \r\næ‰€ä»¥ç­”æ¡ˆä¸º15ä¸ªå›žåˆ', -9945157, '2018-02-07 19:30:08', '2018-02-23 19:24:52', 7, 7),
(1015, 'ç”±äºŽå¯å¯å¯¹å‰åä¸€é¢˜å‡æœ‰æŠŠæ¡ï¼Œå› æ­¤æ‹¿åˆ°ç¬¬å…­é¢˜çš„å¥–é‡‘è€Œæ‹¿ä¸åˆ°ç¬¬åäºŒé¢˜å¥–é‡‘çš„æ¦‚çŽ‡ä¸º 2/3 ï¼Œå¥–é‡‘ä¸º 20ä¸‡ / 1ä¸‡ = 20 å…ƒ  + å›¢æˆ˜å¥–é‡‘çš„åˆ†çº¢ 5ä¸‡ / 1000 / 3 = 16.66666...å…ƒ  = 36.66666....å…ƒ\r\nè€Œå¯å¯èƒ½ç­”å¯¹åäºŒé¢˜æ‹¿åˆ°ç¬¬åäºŒé¢˜å¥–é‡‘çš„æ¦‚çŽ‡ä¸º 1/3 , å¥–é‡‘ä¸º 20ä¸‡ / 1ä¸‡ = 20 å…ƒ  + å›¢æˆ˜å¥–é‡‘çš„åˆ†çº¢ 5ä¸‡ / 1000 / 3 = 16.66666...å…ƒ + ç¬¬åäºŒé¢˜å¥–é‡‘ 25ä¸‡ / 5000 = 50å…ƒ = 86.66666....å…ƒ\r\næ‰€ä»¥æ•°å­¦æœŸæœ›å°±æ˜¯  2/3 * 36.66666666... + 1/3 * 86.66666666666.... = 53.333333333.....', -9945157, '2018-02-07 22:50:13', '2018-02-24 15:43:49', 7, 7),
(1016, 'ä½ å¯ä»¥è®¤ä¸ºæ‰€æœ‰ä¸­æ–‡å­—ç¬¦ç”±ä¸¤ä¸ªå­—èŠ‚ç»„æˆï¼Œé¦–å­—èŠ‚çš„ASCIIå€¼éƒ½å¤§äºŽ127ï¼ˆä¹Ÿå¯ä»¥ç†è§£ä¸ºsigned charåž‹å°äºŽ0ï¼‰', -9945157, '2018-03-10 19:04:25', '2018-03-10 19:11:41', 9, 0),
(1017, 'æµ™å¤§è®¡ç®—æœºç ”ç©¶ç”Ÿå¤è¯•ä¸Šæœºè€ƒè¯•-2007å¹´\r\n', -9945157, '2018-03-10 19:53:30', '2018-03-10 21:15:40', 0, 0),
(1018, 'æµ™å¤§è®¡ç®—æœºç ”ç©¶ç”Ÿå¤è¯•ä¸Šæœºè€ƒè¯•-2007å¹´', -9945157, '2018-03-10 19:56:42', '2018-03-10 20:05:52', 0, 0),
(1019, '', -9945157, '2018-03-10 19:58:07', '2018-03-10 20:20:35', 0, 0),
(1020, 'Harry å¯ä»¥å¿µè¿™ä¸ªå’’è¯­:\"big-got-them\".', -9945157, '2018-03-10 20:22:32', '2018-03-10 20:22:32', 0, 0),
(1021, '', -9945157, '2018-03-10 20:29:27', '2018-03-13 17:03:31', 0, 0),
(1022, '', -9945157, '2018-03-10 20:33:31', '2018-03-10 20:33:31', 0, 0),
(1023, 'There are seven possible pairs: (2,3),(5,3),(2,4),(3,4),(2,5),(3,5) and (4,5).', -9945157, '2018-03-12 14:28:33', '2018-03-12 14:33:16', 0, 0),
(1024, 'Please use function scanf', -9945157, '2018-03-12 14:48:58', '2018-03-12 14:48:58', 0, 0),
(1025, 'æµ™å¤§è®¡ç®—æœºç ”ç©¶ç”Ÿå¤è¯•ä¸Šæœºè€ƒè¯•-2005å¹´', -9945157, '2018-03-12 14:57:40', '2018-03-12 14:57:40', 0, 0),
(1026, '', -9945157, '2018-03-12 14:59:56', '2018-03-12 14:59:56', 0, 0),
(1027, '', -9945157, '2018-03-12 15:02:03', '2018-03-12 15:02:03', 0, 0),
(1028, '', -9945157, '2018-03-12 15:03:41', '2018-03-12 15:03:41', 0, 0),
(1029, '', -9945157, '2018-03-12 15:04:54', '2018-03-12 15:04:54', 0, 0),
(1030, '', -9945157, '2018-03-12 15:09:11', '2018-03-12 15:09:11', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `problem_information_4`
--

DROP TABLE IF EXISTS `problem_information_4`;
CREATE TABLE IF NOT EXISTS `problem_information_4` (
  `pro_id` int(11) NOT NULL,
  `s_judgment` int(11) NOT NULL,
  `s_judgment_code` text COLLATE utf8_bin NOT NULL,
  `allow_huck` int(11) NOT NULL,
  `data_monitoring` text COLLATE utf8_bin NOT NULL,
  `true_code` text COLLATE utf8_bin NOT NULL,
  `huck_number` int(11) NOT NULL,
  PRIMARY KEY (`pro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `problem_information_4`
--

INSERT INTO `problem_information_4` (`pro_id`, `s_judgment`, `s_judgment_code`, `allow_huck`, `data_monitoring`, `true_code`, `huck_number`) VALUES
(1000, 0, '', 0, '', '', 0),
(1001, 0, '', 0, '', '', 0),
(1002, 0, '', 1, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 2e5+7 , mz = 1e5;\r\nchar s[N];\r\n\r\nint main(){\r\n    scanf(\"%s\",s);\r\n    int len = strlen(s);\r\n    if( len > mz || len <= 0 )  return 0*puts(\"-1\");\r\n    for(int i = 1 ; i <= len ; i++){\r\n        if( s[i] != \'C\' && s[i] != \'A\' && s[i] != \'M\' ){\r\n            return 0*puts(\"-2\");\r\n        }\r\n    }\r\n    puts(\"yes\");\r\n    return 0;\r\n}\r\n', '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e5+7 , mz = 1e9+7;\r\nchar s[N];\r\n\r\nint main(){\r\n    scanf(\"%s\",s);\r\n    int len = strlen(s);\r\n    int p = 0 , q = 0;\r\n    long long ans = 0;\r\n    for(int i = 0 ; i < len ; i++)\r\n        if( s[i] == \'M\' )\r\n            q++;\r\n    for(int i = 0 ; i < len ; i++)\r\n        if( s[i] == \'A\' )   p++;\r\n        else if( s[i] == \'C\' )  ans = (ans + p*q)%mz;\r\n        else    q--;\r\n    printf(\"%lld\\n\",ans);\r\n    return 0;\r\n}\r\n', 0),
(1003, 0, '', 0, '', '', 0),
(1004, 0, '', 0, '', '', 0),
(1005, 0, '', 0, '', '', 0),
(1006, 0, '', 0, '', '', 0),
(1007, 0, '', 0, '', '', 0),
(1008, 0, '', 0, '', '', 0),
(1009, 0, '', 0, '', '', 0),
(1010, 0, '', 1, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 110 , mz = 1e9+7 , M = 1e6;\r\n\r\nint main(){\r\n    int T;\r\n    int sum = 0;\r\n    scanf(\"%d\",&T);\r\n    if( T > 20 || T <= 0 ){\r\n        return 0*puts(\"No\");\r\n    }\r\n    while( T-- ){\r\n        int n,m,a,b;\r\n        scanf(\"%d%d\",&n,&m);\r\n        if( n <= 0 || n > mz || m < 0 || m > M )\r\n            return 0*puts(\"No\");\r\n        while( m-- ){\r\n            scanf(\"%d%d\",&a,&b);\r\n            if( a <= 0 || a > mz|| b <= 0 || b > mz )\r\n                return 0*puts(\"No\");\r\n            a = b = -1;\r\n        }\r\n        n = m = -1;\r\n    }\r\n    puts(\"yes\");\r\n    return 0;\r\n}\r\n', '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 110 , mz = 1e9+7;\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int T;\r\n    scanf(\"%d\",&T);\r\n    while( T-- ){\r\n        long long n,m,a,b,f;\r\n        scanf(\"%lld%lld\",&n,&m);\r\n        f = 0;\r\n        while( m-- ){\r\n            scanf(\"%lld%lld\",&a,&b);\r\n            if( f ) continue;\r\n            if( b > n ){\r\n                f = 1;\r\n            }\r\n            n += a-b;\r\n        }\r\n        if( f ) puts(\"-1\");\r\n        else    printf(\"%lld\\n\",n);\r\n    }\r\n    return 0;\r\n}\r\n', 0),
(1011, 0, '', 1, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 110 , mz = 1e5;\r\n\r\nint main(){\r\n    int T = -1,n = -1;\r\n    scanf(\"%d\",&T);\r\n    if( T <= 0 || T > 100 ) return 0*puts(\"-1\");\r\n    while( T-- ){\r\n        scanf(\"%d\",&n);\r\n        if( n <= 0 || n > mz )  return 0*puts(\"-2\");\r\n        n = -1;\r\n    }\r\n    puts(\"yes\");\r\n    return 0;\r\n}\r\n', '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e5+7 , mz = 1e9+7;\r\nint a[N];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    a[1] = 1;\r\n    for(int i = 2 ; i < N ; i++)    a[i] = (a[i-1] + a[i-2]) % mz;\r\n    int T,n;\r\n    scanf(\"%d\",&T);\r\n    while( T-- )\r\n        scanf(\"%d\",&n),printf(\"%d\\n\",a[n]);\r\n    return 0;\r\n}\r\n', 0),
(1012, 0, '', 0, '', '', 0),
(1013, 0, '', 1, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n    int n;\r\n    scanf(\"%d\",&n);\r\n    if( 1 > n || n > 100 ){\r\n        return 0*puts(\"No\");\r\n    }\r\n    char s[200];\r\n    scanf(\"%s\",s);\r\n    if( strlen(s) == n ){\r\n        for(int i = 0 ; i < n ; i++){\r\n            if( s[i] == \'c\' || s[i] == \'w\' )    continue;\r\n            return 0*puts(\"no\");\r\n        }\r\n        return 0*puts(\"yes\");\r\n    }\r\n    puts(\"no\");\r\n    return 0;\r\n}', '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n    int n;\r\n    scanf(\"%d\",&n);\r\n    char s[200];\r\n    scanf(\"%s\",s + 1);\r\n    int ans = 50;\r\n    for(int i = 1 ; i <= n ; i++){\r\n        if( s[i] == \'c\' ){\r\n            if( s[i+1] == \'w\' ){\r\n                if( s[i+2] == \'w\' ){\r\n                    s[i+1] = s[i+2] = \'a\';\r\n                    ans += 550;\r\n                }else if( s[i-1] == \'w\' ){\r\n                    s[i-1] = s[i+1] = \'a\';\r\n                    ans += 535;\r\n                }else{\r\n                    s[i+1] = \'a\';\r\n                    ans += 400;\r\n                }\r\n            }else{\r\n                ans += 250;\r\n            }\r\n        }\r\n    }\r\n    for(int i = 1 ; i <= n ; i++){\r\n        if( s[i] == \'w\' ){\r\n            ans += 100;\r\n        }\r\n    }\r\n    printf(\"%d\\n\",ans);\r\n    return 0;\r\n}\r\n', 0),
(1014, 0, '', 1, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 110 , mz = 1e9+7;\r\n\r\nint main(){\r\n    int a = -1 ,b = -1 ,c = -1 , p = 0;\r\n    while( ~scanf(\"%d%d%d\",&a,&b,&c) ){\r\n        p++;\r\n        if( a <= 0 || b <= 0 || c <= 0 || a > 1000 || b >= 500 || c > 1500 )\r\n            return 0*puts(\"No\");\r\n        a = b = c = -1;\r\n    }\r\n    if( p == 4 )    puts(\"yes\");\r\n    else    puts(\"No\");\r\n    return 0;\r\n}\r\n', '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 110 , mz = 1e9+7;\r\nint x[5] , y[5] , hp[5] ,np[5] , s[5];\r\nint boss = 10000 , ans = 0;\r\n\r\nbool ck(){\r\n    if( (np[1] > 0 || np[2] > 0 || np[3] > 0) && boss > 0 ){\r\n        return true;\r\n    }\r\n    return false;\r\n}\r\n\r\nint main(){\r\n    for(int i = 1 ; i <= 4 ; i++)   scanf(\"%d%d%d\",x+i,y+i,hp+i) , np[i] = hp[i] , y[i] = max(int((500-y[i])*0.9),1);\r\n    x[1] = max(int((x[1]-500)*1.3),1);\r\n    x[2] = max(x[2]-500,1);\r\n    s[2] = int(x[2]*0.25);\r\n    x[3] = max(int((x[3]*0.9-500)*1.75),1);\r\n    s[3] = int(x[3]*0.25);\r\n    while( ck() ){\r\n        ans++;\r\n        if( np[1] > 0 ){\r\n            boss -= x[1];\r\n        }\r\n        if( np[2] > 0 ){\r\n            boss -= x[2];\r\n            np[2] = min( np[2] + s[2] , hp[2] );\r\n        }\r\n        if( np[3] > 0 ){\r\n            boss -= x[3];\r\n            np[3] = min( np[3] + s[3] , hp[3] );\r\n        }\r\n        if( np[4] > 0 ){\r\n            for(int i = 1 ; i <= 4 ; i++){\r\n                np[i] = min(np[i] + x[4],hp[i]);\r\n            }\r\n        }\r\n        for(int i = 1 ; i <= 4 ; i++){\r\n            np[i] -= y[i];\r\n        }\r\n    }\r\n    if( boss <= 0 && (np[1] > 0 || np[2] > 0 || np[3] > 0 || np[4] > 0 ) ){\r\n        printf(\"%d\\n\",ans);\r\n    }else{\r\n        puts(\"Go to leveling\");\r\n    }\r\n    return 0;\r\n}\r\n', 0),
(1015, 1, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 110 , mz = 1e9+7;\r\nchar s1[N] , s2[N] , s3[N];\r\ndouble r_ans , u_ans;\r\n\r\nint main(){\r\n    scanf(\"%s\",s1);\r\n    scanf(\"%s\",s2);\r\n    scanf(\"%s\",s3);\r\n    freopen(s2,\"r\",stdin);\r\n    cin>>r_ans;\r\n    freopen(s3,\"r\",stdin);\r\n    cin>>u_ans;\r\n    if( abs(r_ans-u_ans) < 1e-6 )   puts(\"yes\");\r\n    else puts(\"No\");\r\n    return 0;\r\n}\r\n\r\n', 1, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 110 , mz = 1e9+7;\r\n\r\nint main(){\r\n    int a,i = 0;\r\n    int x,y,z;\r\n    bool f = 1;\r\n    while( ~scanf(\"%d\",&a) ){\r\n        if( ++i <= 12 ){\r\n            if( a >= 1 && a <= 3 )  continue;\r\n            return 0*puts(\"No\");\r\n        }else if( i == 13 ){\r\n            if( a < 5000000 && a >= 1 )\r\n            x = a;\r\n        }else if( i == 14 ){\r\n            if( x < a ) return 0*puts(\"No\");\r\n            y = a;\r\n        }else if( i == 15 ){\r\n            if( y < a ) return 0*puts(\"No\");\r\n            z = a;\r\n        }else{\r\n            return 0*puts(\"No\");\r\n        }\r\n    }\r\n    puts(\"yes\");\r\n    return 0;\r\n}\r\n', '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 20 , mz = 1e9+7;\r\nint a[N];\r\ndouble p[N];\r\n\r\nint main(){\r\n    int x,y,z;\r\n    p[0] = 1.0;\r\n    for(int i = 1 ; i <= 12 ; i++){\r\n        scanf(\"%d\",a+i);\r\n        p[i] = p[i-1] / (1.0*a[i]);\r\n    }\r\n    scanf(\"%d%d%d\",&x,&y,&z);\r\n    printf(\"%.7f\\n\",200000.0/(x+1.0)*p[6] + 250000.0/(y+1.0)*p[12] + 50000.0/z/3.0);\r\n    return 0;\r\n}\r\n', 0),
(1016, 0, '', 0, '', '', 0),
(1019, 0, '     ', 0, '', '', 0),
(1018, 0, '  ', 0, '', '', 0),
(1017, 0, '      ', 0, '', '', 0),
(1020, 0, '   ', 0, '', '', 0),
(1021, 0, '           ', 0, '', '', 0),
(1022, 0, '   ', 0, '', '', 0),
(1023, 0, '     ', 0, '', '', 0),
(1024, 0, '   ', 0, '', '', 0),
(1025, 0, '   ', 0, '', '', 0),
(1026, 0, '   ', 0, '', '', 0),
(1027, 0, '   ', 0, '', '', 0),
(1028, 0, '   ', 0, '', '', 0),
(1029, 0, '   ', 0, '', '', 0),
(1030, 0, '   ', 0, '', '', 0);

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
(1, 1000, 2, 1, 46, 449, -9945157, '2017-11-29 23:35:50', 0, '#include<bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n    int a,b;\r\n    cin>>a>>b;\r\n    cout<<a+b<<endl;\r\n    return 0;\r\n}\r\n', ''),
(2, 1000, 1, 1, 46, 448, -9945157, '2017-12-18 00:50:49', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    int a,b;\r\n    scanf(\"%d%d\",&a,&b);\r\n    printf(\"%d\\n\",a+b);\r\n    return 0;\r\n}\r\n', ','),
(3, 1000, 1, 8, 0, 0, 1, '2017-12-19 00:31:18', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    int a,b;\r\n    scanf(\"%d%d\",&a,&b);\r\n    printf(\"%d\n\",a+b);\r\n    return 0;\r\n}', 'main.c: In function \'main\':\r\r\nmain.c:11:12: warning: missing terminating \" character\r\r\nmain.c:11:5: error: missing terminating \" character\r\r\nmain.c:12:1: warning: missing terminating \" character\r\r\nmain.c:12:1: error: missing terminating \" character\r\r\nmain.c:14:5: error: expected expression before \'return\'\r\r\nmain.c:16:1: error: expected \';\' before \'}\' token'),
(4, 1000, 1, 8, 0, 0, 1, '2017-12-19 00:31:58', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    int a,b;\r\n    scanf(\"%d%d\",&a,&b);\r\n    printf(\"%d\n\",a+b);\r\n    return 0;\r\n}', 'main.c: In function \'main\':\r\r\nmain.c:11:12: warning: missing terminating \" character\r\r\nmain.c:11:5: error: missing terminating \" character\r\r\nmain.c:12:1: warning: missing terminating \" character\r\r\nmain.c:12:1: error: missing terminating \" character\r\r\nmain.c:14:5: error: expected expression before \'return\'\r\r\nmain.c:16:1: error: expected \';\' before \'}\' token'),
(5, 1000, 1, 8, 0, 0, 1, '2017-12-19 00:32:34', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    int a,b;\r\n    scanf(\"%d%d\",&a,&b);\r\n    printf(\"%d\n\",a+b);\r\n    return 0;\r\n}', 'main.c: In function \'main\':\r\r\nmain.c:11:12: warning: missing terminating \" character\r\r\nmain.c:11:5: error: missing terminating \" character\r\r\nmain.c:12:1: warning: missing terminating \" character\r\r\nmain.c:12:1: error: missing terminating \" character\r\r\nmain.c:14:5: error: expected expression before \'return\'\r\r\nmain.c:16:1: error: expected \';\' before \'}\' token'),
(6, 1000, 1, 1, 93, 449, 1, '2017-12-19 00:34:33', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    int a,b;\r\n    scanf(\"%d%d\",&a,&b);\r\n    printf(\"%d\\\n\",a+b);\r\n    return 0;\r\n}', ','),
(7, 1000, 1, 1, 56, 432, 1, '2017-12-19 00:34:51', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    int a,b;\r\n    scanf(\"%d%d\",&a,&b);\r\n    printf(\"%d\\n\",a+b);\r\n    return 0;\r\n}', ','),
(8, 1000, 1, 1, 31, 451, 1, '2017-12-19 13:34:01', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    int a,b;\r\n    while(~scanf(\"%d%d\",&a,&b))\r\n        printf(\"%d\\n\",a+b);\r\n    return 0;\r\n}\r\n', ','),
(9, 1000, 1, 1, 46, 448, 1, '2017-12-19 13:34:46', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    int a,b;\r\n    while(~scanf(\"%d%d\",&a,&b))\r\n        printf(\"%d\\n\",a+b);\r\n    return 0;\r\n}\r\n', ','),
(10, 1000, 1, 1, 46, 451, 1, '2017-12-19 13:35:38', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    int a,b;\r\n    while(~scanf(\"%d%d\",&a,&b))\r\n        printf(\"%d\\n\",a+b);\r\n    return 0;\r\n}\r\n', ','),
(24, 1003, 2, 1, 1542, 449, -9945157, '2018-02-04 16:48:38', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e6+7 , mz = 1e9+7;\r\nint a[N];\r\nmap<int,int> mp;\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int T;\r\n    scanf(\"%d\",&T);\r\n    while( T-- ){\r\n        int n;\r\n        scanf(\"%d\",&n);\r\n        mp.clear();\r\n        int di = 0 , maxn = 0;\r\n        for(int i = 1 ; i <= n ; i++)   scanf(\"%d\",a+i);\r\n        for(int i = 1 ; i <= n ; i++){\r\n            if( mp.find(a[i]) == mp.end() ){\r\n                mp[a[i]] = i;\r\n                maxn = max(maxn,i-di);\r\n            }else{\r\n                di = max(mp[a[i]],di);\r\n                maxn = max(maxn,i-di);\r\n                mp[a[i]] = i;\r\n            }\r\n        }\r\n        printf(\"%d\\n\",maxn);\r\n    }\r\n    return 0;\r\n}\r\n', ''),
(11, 1001, 2, 1, 46, 451, -9945157, '2018-02-04 11:27:34', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e3+7;\r\nint gcd(int a,int b){return b?gcd(b,a%b):a;}\r\nint d[N];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int n;\r\n    scanf(\"%d\",&n);\r\n    for(int i = 1 ; i <= n ; i++)   scanf(\"%d\",d+i);\r\n    int ans_i = 1 , ans_j = 2 , ans = gcd(d[1],d[2]);\r\n    for(int i = 1 ; i <= n ; i++)\r\n        for(int j = i+1 ; j <= n ; j++){\r\n            int t = gcd( d[i] , d[j] );\r\n            if( t > ans ){\r\n                ans_i = i;\r\n                ans_j = j;\r\n                ans = t;\r\n            }\r\n        }\r\n    printf(\"%d %d %d\\n\",ans_i,ans_j,ans);\r\n    return 0;\r\n}\r\n', ','),
(12, 1001, 1, 8, 0, 0, -9945157, '2018-02-04 11:29:25', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e3+7;\r\nint gcd(int a,int b){return b?gcd(b,a%b):a;}\r\nint d[N];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int n;\r\n    scanf(\"%d\",&n);\r\n    for(int i = 1 ; i <= n ; i++)   scanf(\"%d\",d+i);\r\n    int ans_i = 0 , ans_j = 0 , ans = 0;\r\n    for(int i = n ; i ; i--)\r\n        for(int j = i-1 ; j ; j--){\r\n            int t = gcd( d[i] , d[j] );\r\n            if( t > ans ){\r\n                ans_i = i;\r\n                ans_j = j;\r\n                ans = t;\r\n            }\r\n        }\r\n    printf(\"%d %d %d\\n\",ans_i,ans_j,ans);\r\n    return 0;\r\n}\r\n', 'main.c:1:25: fatal error: bits/stdc++.h: No such file or directory\r\r\n #include <bits/stdc++.h>\r\r\r\n                         ^\r\r\ncompilation terminated.'),
(13, 1001, 2, 7001, 484, 449, -9945157, '2018-02-04 11:29:58', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e3+7;\r\nint gcd(int a,int b){return b?gcd(b,a%b):a;}\r\nint d[N];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int n;\r\n    scanf(\"%d\",&n);\r\n    for(int i = 1 ; i <= n ; i++)   scanf(\"%d\",d+i);\r\n    int ans_i = 0 , ans_j = 0 , ans = 0;\r\n    for(int i = n ; i ; i--)\r\n        for(int j = i-1 ; j ; j--){\r\n            int t = gcd( d[i] , d[j] );\r\n            if( t > ans ){\r\n                ans_i = i;\r\n                ans_j = j;\r\n                ans = t;\r\n            }\r\n        }\r\n    printf(\"%d %d %d\\n\",ans_i,ans_j,ans);\r\n    return 0;\r\n}\r\n', ','),
(25, 1004, 2, 1, 984, 451, -9945157, '2018-02-04 23:48:15', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    long long a,b;\r\n    while( cin>>a>>b )\r\n        cout<<a*b<<endl;\r\n    return 0;\r\n}\r\n', ''),
(14, 1001, 2, 1, 96, 451, -9945157, '2018-02-04 11:55:57', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e3+7;\r\nint gcd(int a,int b){return b?gcd(b,a%b):a;}\r\nint d[N];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int n;\r\n    scanf(\"%d\",&n);\r\n    for(int i = 1 ; i <= n ; i++)   scanf(\"%d\",d+i);\r\n    int ans_i = 0 , ans_j = 0 , ans = 0;\r\n    for(int i = 1 ; i <= n ; i++)\r\n        for(int j = i+1 ; j <= n ; j++){\r\n            int t = gcd( d[i] , d[j] );\r\n            if( t > ans ){\r\n                ans_i = i;\r\n                ans_j = j;\r\n                ans = t;\r\n            }\r\n        }\r\n    printf(\"%d %d %d\\n\",ans_i,ans_j,ans);\r\n    return 0;\r\n}\r\n', ','),
(15, 1001, 2, 6003, 1000, 451, -9945157, '2018-02-04 11:57:08', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e3+7;\r\nint gcd(int a,int b){\r\n    for(int i = min(a,b) ; i ; i--){\r\n        if( a%i == 0 && b%i == 0 ){\r\n            return i;\r\n        }\r\n    }\r\n}\r\nint d[N];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int n;\r\n    scanf(\"%d\",&n);\r\n    for(int i = 1 ; i <= n ; i++)   scanf(\"%d\",d+i);\r\n    int ans_i = 0 , ans_j = 0 , ans = 0;\r\n    for(int i = 1 ; i <= n ; i++)\r\n        for(int j = i+1 ; j <= n ; j++){\r\n            int t = gcd( d[i] , d[j] );\r\n            if( t > ans ){\r\n                ans_i = i;\r\n                ans_j = j;\r\n                ans = t;\r\n            }\r\n        }\r\n    printf(\"%d %d %d\\n\",ans_i,ans_j,ans);\r\n    return 0;\r\n}\r\n', 'main.cpp: In function \'int gcd(int, int)\':\r\r\nmain.cpp:19:1: warning: control reaches end of non-void function [-Wreturn-type]\r\r\n     scanf(\"%d\",&n);\r\r\r\n ^'),
(16, 1001, 2, 6003, 1008, 451, -9945157, '2018-02-04 11:58:37', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e3+7;\r\nint gcd(int a,int b){\r\n    for(int i = min(a,b) ; i ; i--){\r\n        if( a%i == 0 && b%i == 0 ){\r\n            return i;\r\n        }\r\n    }\r\n    return 1;\r\n}\r\nint d[N];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int n;\r\n    scanf(\"%d\",&n);\r\n    for(int i = 1 ; i <= n ; i++)   scanf(\"%d\",d+i);\r\n    int ans_i = 0 , ans_j = 0 , ans = 0;\r\n    for(int i = 1 ; i <= n ; i++)\r\n        for(int j = i+1 ; j <= n ; j++){\r\n            int t = gcd( d[i] , d[j] );\r\n            if( t > ans ){\r\n                ans_i = i;\r\n                ans_j = j;\r\n                ans = t;\r\n            }\r\n        }\r\n    printf(\"%d %d %d\\n\",ans_i,ans_j,ans);\r\n    return 0;\r\n}\r\n', ','),
(19, 1002, 2, 7010, 51, 450, -9945157, '2018-02-04 12:31:46', 0, '#include <bits/stdc++.h> \r\nusing namespace std; \r\nconst int N = 1e5+7 , mz = 1e9+7; \r\nchar s[N]; int a[N] , m[N];  \r\nint main(){ \r\n#ifdef LOCAL    \r\n //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);     \r\n //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout); \r\n#endif     \r\n    scanf(\"%s\",s+1);     \r\n    int len = strlen(s+1);     \r\n    for(int i = 1 ; i <= len ; i++) a[i] = a[i-1] + (s[i]==\'A\'?1:0);\r\n    for(int i = len ; i ; i--)  m[i] = m[i+1] + (s[i]==\'M\'?1:0);\r\n     int ans = 0;\r\n     for(int i = 1 ; i <= len ; i++)\r\n         if( s[i] == \'C\' ) \r\n            ans = (ans + a[i] * m[i] % mz)%mz;\r\n     cout<<ans<<endl; \r\n    return 0; \r\n}', 'D:/CodeBlocks/MinGW/lib\\libmingw32.a(main.o):main.c:(.text.startup+0xa7): undefined reference to `WinMain@16\'\r\r\ncollect2.exe: error: ld returned 1 exit status'),
(20, 1002, 2, 7010, 42, 449, -9945157, '2018-02-04 12:34:18', 0, '#include <bits/stdc++.h>\r\n using namespace std;\r\n const int N = 1e5+7 , mz = 1e9+7;\r\n char s[N]; int a[N] , m[N];\r\n  int main(){\r\n #ifdef LOCAL     \r\n//freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);     //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n #endif\r\n     scanf(\"%s\",s+1);\r\n     int len = strlen(s+1);\r\n     for(int i = 1 ; i <= len ; i++) a[i] = a[i-1] + (s[i]==\'A\'?1:0);     \r\nfor(int i = len ; i ; i--)  m[i] = m[i+1] + (s[i]==\'M\'?1:0);\r\n     int ans = 0;\r\n     for(int i = 1 ; i <= len ; i++)\r\n         if( s[i] == \'C\' )\r\n             ans = (ans + a[i] * m[i] % mz)%mz;\r\n     cout<<ans<<endl;\r\n     return 0; \r\n}', 'D:/CodeBlocks/MinGW/lib\\libmingw32.a(main.o):main.c:(.text.startup+0xa7): undefined reference to `WinMain@16\'\r\r\ncollect2.exe: error: ld returned 1 exit status'),
(21, 1002, 2, 1, 52, 449, -9945157, '2018-02-04 12:35:07', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e5+7 , mz = 1e9+7;\r\nchar s[N];\r\nint a[N] , m[N];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    scanf(\"%s\",s+1);\r\n    int len = strlen(s+1);\r\n    for(int i = 1 ; i <= len ; i++) a[i] = a[i-1] + (s[i]==\'A\'?1:0);\r\n    for(int i = len ; i ; i--)  m[i] = m[i+1] + (s[i]==\'M\'?1:0);\r\n    long long ans = 0;\r\n    for(int i = 1 ; i <= len ; i++)\r\n        if( s[i] == \'C\' )\r\n            ans = (ans + 1LL * a[i] * m[i] % mz)%mz;\r\n    cout<<ans<<endl;\r\n    return 0;\r\n}\r\n', ''),
(22, 1002, 2, 7010, 61, 451, -9945157, '2018-02-04 13:55:17', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e5+7 , mz = 1e9+7;\r\nchar s[N];\r\nint a[N] , m[N];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    scanf(\"%s\",s+1);\r\n    int len = strlen(s+1);\r\n    for(int i = 1 ; i <= len ; i++) a[i] = a[i-1] + (s[i]==\'A\'?1:0);\r\n    for(int i = len ; i ; i--)  m[i] = m[i+1] + (s[i]==\'M\'?1:0);\r\n    int ans = 0;\r\n    for(int i = 1 ; i <= len ; i++)\r\n        if( s[i] == \'C\' )\r\n            ans = (ans + a[i] * m[i] % mz)%mz;\r\n    cout<<ans<<endl;\r\n    return 0;\r\n}\r\n', ''),
(23, 1002, 2, 6006, 1008, 451, -9945157, '2018-02-04 13:58:41', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e5+7 , mz = 1e9+7;\r\nchar s[N];\r\nint a[N] , m[N];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    scanf(\"%s\",s+1);\r\n    int len = strlen(s+1);\r\n    int ans = 0;\r\n    for(int i = 0 ; i <= len ; i++){\r\n        if( s[i] == \'C\' ){\r\n            int x = 0 , y = 0;\r\n            for(int j = 0 ; j < i ; j++)    if( s[j] == \'A\' )   x++;\r\n            for(int j = i+1 ; j <= len ; j++)   if( s[j] == \'M\' )   y++;\r\n            ans = (ans + x * y % mz)%mz;\r\n        }\r\n    }\r\n    cout<<ans<<endl;\r\n    return 0;\r\n}\r\n', ''),
(26, 1004, 2, 1, 906, 451, -9945157, '2018-02-04 23:51:48', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    long long a,b;\r\n    while( cin>>a>>b )\r\n        cout<<a*b<<endl;\r\n    return 0;\r\n}\r\n', ''),
(27, 1004, 2, 1, 115, 448, -9945157, '2018-02-04 23:54:12', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int a,b;\r\n    while( ~scanf(\"%d%d\",&a,&b) )\r\n        printf(\"%lld\\n\",1LL*a*b);\r\n    return 0;\r\n}\r\n', 'main.cpp: In function \'int main()\':\r\r\nmain.cpp:21:32: warning: unknown conversion type character \'l\' in format [-Wformat=]\r\r\nmain.cpp:21:32: warning: too many arguments for format [-Wformat-extra-args]'),
(28, 1004, 2, 1, 124, 450, -9945157, '2018-02-04 23:57:14', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int a,b;\r\n    long long c = 1;\r\n    while( ~scanf(\"%d%d\",&a,&b) )\r\n        printf(\"%lld\\n\",c*a*b);\r\n    return 0;\r\n}\r\n', 'main.cpp: In function \'int main()\':\r\r\nmain.cpp:23:30: warning: unknown conversion type character \'l\' in format [-Wformat=]\r\r\nmain.cpp:23:30: warning: too many arguments for format [-Wformat-extra-args]'),
(29, 1004, 3, 1, 492, 451, -9945157, '2018-02-04 23:59:18', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int a,b;\r\n    long long c = 1;\r\n    while( ~scanf(\"%d%d\",&a,&b) )\r\n        printf(\"%lld\\n\",c*a*b);\r\n    return 0;\r\n}\r\n', 'main.cpp: In function \'int main()\':\r\r\nmain.cpp:23:30: warning: unknown conversion type character \'l\' in format [-Wformat=]\r\r\nmain.cpp:23:30: warning: too many arguments for format [-Wformat-extra-args]'),
(30, 1004, 2, 7001, 421, 449, -9945157, '2018-02-05 00:01:09', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int a,b;\r\n    long long c = 1;\r\n    while( ~scanf(\"%d%d\",&a,&b) )\r\n        printf(\"%l64d\\n\",c*a*b);\r\n    return 0;\r\n}\r\n', 'main.cpp: In function \'int main()\':\r\r\nmain.cpp:23:31: warning: unknown conversion type character \'6\' in format [-Wformat=]\r\r\nmain.cpp:23:31: warning: too many arguments for format [-Wformat-extra-args]'),
(31, 1004, 2, 7002, 148, 432, -9945157, '2018-02-05 00:03:59', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int a,b;\r\n    long long c = 1;\r\n    while( ~scanf(\"%d%d\",&a,&b) )\r\n        printf(\"%d\\n\",a*b);\r\n    return 0;\r\n}\r\n', 'main.cpp: In function \'int main()\':\r\r\nmain.cpp:19:15: warning: unused variable \'c\' [-Wunused-variable]'),
(32, 1004, 2, 7002, 139, 449, -9945157, '2018-02-05 00:04:35', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    //freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    //freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    int a,b;\r\n    while( ~scanf(\"%d%d\",&a,&b) )\r\n        printf(\"%d\\n\",a*b);\r\n    return 0;\r\n}\r\n', ''),
(37, 1011, 2, 1, 83, 451, -9945157, '2018-02-06 14:26:19', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 1e5+7 , mz = 1e9+7;\r\nint a[N];\r\nvoid init(){\r\n    a[1] = a[2] = 1;\r\n    for(int i = 3 ; i < N ; i++)\r\n        a[i] = (a[i-1] + a[i-2])%mz;\r\n}\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    init();\r\n    int T;\r\n    scanf(\"%d\",&T);\r\n    while( T-- ){\r\n        int n;\r\n        scanf(\"%d\",&n);\r\n        printf(\"%d\\n\",a[n]);\r\n    }\r\n    return 0;\r\n}\r\n', ''),
(33, 1005, 2, 7004, 234, 432, -9945157, '2018-02-05 00:18:48', 0, '#include <algorithm>\r\n#include <cctype>\r\n#include <cmath>\r\n#include <cstdio>\r\n#include <cstdlib>\r\n#include <cstring>\r\n#include <ctime>\r\n#include <iomanip>\r\n#include <iostream>\r\n#include <map>\r\n#include <queue>\r\n#include <string>\r\n#include <set>\r\n#include <vector>\r\n#include <cassert>\r\nusing namespace std;\r\ntypedef long long LL;\r\nconst int N = 500 , INF = 0x3f3f3f3f , M = 1005;\r\nconst double PI = acos(0.0) * 2;\r\ntemplate<typename T1>\r\nT1 gcd(T1 a , T1 b){ return b ? gcd(b,a%b) : a;}\r\n\r\nstruct BigNum{\r\n    int a[N];\r\n    enum{MOD = 10000};\r\n    void sets(char *s){\r\n        int t,k,ind,l,i;\r\n        memset(a,0,sizeof(a));\r\n        l = strlen(s);\r\n        a[0] = l / 4;\r\n        a[0] += l % 4 != 0 ? 1 : 0;\r\n        ind = 1;\r\n        for(int i = l-1 ; i >= 0 ; i -= 4){\r\n            t = 0;\r\n            k = max(0,i-3);\r\n            for(int j = k ; j <= i ; j++)   t = t * 10 + s[j] - \'0\';\r\n            a[ind++] = t;\r\n        }\r\n    }\r\n    void print(){\r\n        printf(\"%d\",a[a[0]]);\r\n        for(int i = a[0] - 1 ; i > 0 ; i--){\r\n            if(a[i] == 0){\r\n                printf(\"0000\");\r\n                continue;\r\n            }\r\n            for(int k = 10 ; k * a[i] < MOD ; k *= 10) putchar(\'0\');\r\n            printf(\"%d\",a[i]);\r\n        }\r\n        puts(\"\");\r\n    }\r\n    int& operator[](int p){return a[p];}\r\n    const int& operator[](int p)const{return a[p];}\r\n    BigNum operator * (const BigNum& b){\r\n        BigNum c;\r\n        c.sets(\"0\");\r\n        c[0] = a[0] + b[0];\r\n        for(int i = 1 ; i <= a[0] ; i++){\r\n            for(int j = 1 ; j <= b[0] ; j++){\r\n                c[i+j-1] += a[i] * b[j];\r\n                c[i+j] += c[i+j-1] / MOD;\r\n                c[i+j-1] %= MOD;\r\n            }\r\n        }\r\n        if( c[c[0]] == 0 )  c[0]--;\r\n        return c;\r\n    }\r\n}a,b;\r\n\r\nchar s1[M],s2[M];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    while(~scanf(\"%s%s\",s1,s2)){\r\n        a.sets(s1);\r\n        b.sets(s2);\r\n        (a*b).print();\r\n    }\r\n    return 0;\r\n}\r\n', ''),
(34, 1005, 2, 1, 61, 432, -9945157, '2018-02-05 00:23:28', 0, '#include <algorithm>\r\n#include <cctype>\r\n#include <cmath>\r\n#include <cstdio>\r\n#include <cstdlib>\r\n#include <cstring>\r\n#include <ctime>\r\n#include <iomanip>\r\n#include <iostream>\r\n#include <map>\r\n#include <queue>\r\n#include <string>\r\n#include <set>\r\n#include <vector>\r\n#include <cassert>\r\nusing namespace std;\r\ntypedef long long LL;\r\nconst int N = 507 , INF = 0x3f3f3f3f , M = 1005;\r\nconst double PI = acos(0.0) * 2;\r\ntemplate<typename T1>\r\nT1 gcd(T1 a , T1 b){ return b ? gcd(b,a%b) : a;}\r\n\r\nstruct BigNum{\r\n    int a[N];\r\n    enum{MOD = 10000};\r\n    void sets(char *s){\r\n        int t,k,ind,l,i;\r\n        memset(a,0,sizeof(a));\r\n        l = strlen(s);\r\n        a[0] = l / 4;\r\n        a[0] += l % 4 != 0 ? 1 : 0;\r\n        ind = 1;\r\n        for(int i = l-1 ; i >= 0 ; i -= 4){\r\n            t = 0;\r\n            k = max(0,i-3);\r\n            for(int j = k ; j <= i ; j++)   t = t * 10 + s[j] - \'0\';\r\n            a[ind++] = t;\r\n        }\r\n    }\r\n    void print(){\r\n        printf(\"%d\",a[a[0]]);\r\n        for(int i = a[0] - 1 ; i > 0 ; i--){\r\n            if(a[i] == 0){\r\n                printf(\"0000\");\r\n                continue;\r\n            }\r\n            for(int k = 10 ; k * a[i] < MOD ; k *= 10) putchar(\'0\');\r\n            printf(\"%d\",a[i]);\r\n        }\r\n        puts(\"\");\r\n    }\r\n    int& operator[](int p){return a[p];}\r\n    const int& operator[](int p)const{return a[p];}\r\n    BigNum operator * (const BigNum& b){\r\n        BigNum c;\r\n        c.sets(\"0\");\r\n        c[0] = a[0] + b[0];\r\n        for(int i = 1 ; i <= a[0] ; i++){\r\n            for(int j = 1 ; j <= b[0] ; j++){\r\n                c[i+j-1] += a[i] * b[j];\r\n                c[i+j] += c[i+j-1] / MOD;\r\n                c[i+j-1] %= MOD;\r\n            }\r\n        }\r\n        if( c[c[0]] == 0 )  c[0]--;\r\n        return c;\r\n    }\r\n}a,b;\r\n\r\nchar s1[M],s2[M];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    while(~scanf(\"%s%s\",s1,s2)){\r\n        a.sets(s1);\r\n        b.sets(s2);\r\n        (a*b).print();\r\n    }\r\n    return 0;\r\n}\r\n', ''),
(35, 1006, 2, 1, 661, 451, -9945157, '2018-02-05 00:27:19', 0, '#include <algorithm>\r\n#include <cctype>\r\n#include <cmath>\r\n#include <cstdio>\r\n#include <cstdlib>\r\n#include <cstring>\r\n#include <ctime>\r\n#include <iomanip>\r\n#include <iostream>\r\n#include <map>\r\n#include <queue>\r\n#include <string>\r\n#include <set>\r\n#include <vector>\r\n#include <cassert>\r\nusing namespace std;\r\ntypedef long long LL;\r\nconst int N = 1e5+5 , INF = 0x3f3f3f3f , M = 1e5+1;\r\nconst double PI = acos(0.0) * 2;\r\ntemplate<typename T1>\r\nT1 gcd(T1 a , T1 b){ return b ? gcd(b,a%b) : a;}\r\n\r\nstruct Complex{\r\n    double re,im;\r\n    Complex(double r = 0 , double i = 0):re(r),im(i){}\r\n    Complex operator + (Complex rhs){\r\n        return Complex(re+rhs.re,im+rhs.im);\r\n    }\r\n    Complex operator * (Complex rhs){\r\n        return Complex(re*rhs.re-im*rhs.im,re*rhs.im+im*rhs.re);\r\n    }\r\n    Complex operator - (Complex rhs){\r\n        return Complex(re-rhs.re,im-rhs.im);\r\n    }\r\n}a[N<<2] , b[N<<2];\r\n\r\nchar s1[M] , s2[M];\r\nint ans[N<<2];\r\n\r\nvoid change(Complex *y , int len){\r\n    for(int i = 1 , j = len>>1 ; i+1 < len ; i++){\r\n        if( i < j ) swap(y[i],y[j]);\r\n        int k = len>>1;\r\n        while( j >= k ){\r\n            j -= k;\r\n            k >>= 1;\r\n        }\r\n        if( j < k ) j += k;\r\n    }\r\n}\r\n\r\nvoid FFT(Complex *y , int len , int on = 1){\r\n    change(y,len);\r\n    for(int i = 2 ; i <= len ; i <<= 1){\r\n        Complex wn(cos(-on*2*PI/i) , sin(-on*2*PI/i));\r\n        for(int j = 0 ; j < len ; j += i){\r\n            Complex w(1);\r\n            int o = i>>1;\r\n            for(int k = j ; k < j+o ; k++){\r\n                Complex u = y[k] , t = w * y[k+o];\r\n                y[k] = u + t;\r\n                y[k+o] = u - t;\r\n                w = w * wn;\r\n            }\r\n        }\r\n    }\r\n    if( on == -1 )\r\n        for(int i = 0 ; i < len ; i++)  y[i].re /= len;\r\n}\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    while(~scanf(\"%s%s\",s1,s2)){\r\n        int n = strlen(s1) , m = strlen(s2) , len = 1;\r\n        while(len < n+m)    len <<= 1;\r\n        for(int i = 0 ; i < n ; i++)    a[i] = Complex(s1[n-i-1] - \'0\');\r\n        for(int i = n ; i < len ; i++)  a[i] = Complex();\r\n        for(int i = 0 ; i < m ; i++)    b[i] = Complex(s2[m-i-1] - \'0\');\r\n        for(int i = m ; i < len ; i++)  b[i] = Complex();\r\n        FFT(a,len);\r\n        FFT(b,len);\r\n        for(int i = 0 ; i < len ; i++)  a[i] = a[i] * b[i];\r\n        FFT(a,len,-1);\r\n        for(int i = 0 ; i < len ; i++)  ans[i] = (int)(a[i].re+0.5);\r\n        for(int i = 0 ; i < len ; i++){\r\n            ans[i+1] += ans[i] / 10;\r\n            ans[i] %= 10;\r\n        }\r\n        int p = n+m-1;\r\n        while( ans[p] <= 0 && p > 0 )   p--;\r\n        for(int i = p ; i >= 0 ; i--)   putchar(ans[i] + \'0\');\r\n        puts(\"\");\r\n    }\r\n    return 0;\r\n}\r\n', ''),
(36, 1006, 2, 6003, 3000, 450, -9945157, '2018-02-05 00:28:53', 0, '#include <algorithm>\r\n#include <cctype>\r\n#include <cmath>\r\n#include <cstdio>\r\n#include <cstdlib>\r\n#include <cstring>\r\n#include <ctime>\r\n#include <iomanip>\r\n#include <iostream>\r\n#include <map>\r\n#include <queue>\r\n#include <string>\r\n#include <set>\r\n#include <vector>\r\n#include <cassert>\r\nusing namespace std;\r\ntypedef long long LL;\r\nconst int N = 50007 , INF = 0x3f3f3f3f , M = 100005;\r\nconst double PI = acos(0.0) * 2;\r\ntemplate<typename T1>\r\nT1 gcd(T1 a , T1 b){ return b ? gcd(b,a%b) : a;}\r\n\r\nstruct BigNum{\r\n    int a[N];\r\n    enum{MOD = 10000};\r\n    void sets(char *s){\r\n        int t,k,ind,l,i;\r\n        memset(a,0,sizeof(a));\r\n        l = strlen(s);\r\n        a[0] = l / 4;\r\n        a[0] += l % 4 != 0 ? 1 : 0;\r\n        ind = 1;\r\n        for(int i = l-1 ; i >= 0 ; i -= 4){\r\n            t = 0;\r\n            k = max(0,i-3);\r\n            for(int j = k ; j <= i ; j++)   t = t * 10 + s[j] - \'0\';\r\n            a[ind++] = t;\r\n        }\r\n    }\r\n    void print(){\r\n        printf(\"%d\",a[a[0]]);\r\n        for(int i = a[0] - 1 ; i > 0 ; i--){\r\n            if(a[i] == 0){\r\n                printf(\"0000\");\r\n                continue;\r\n            }\r\n            for(int k = 10 ; k * a[i] < MOD ; k *= 10) putchar(\'0\');\r\n            printf(\"%d\",a[i]);\r\n        }\r\n        puts(\"\");\r\n    }\r\n    int& operator[](int p){return a[p];}\r\n    const int& operator[](int p)const{return a[p];}\r\n    BigNum operator * (const BigNum& b){\r\n        BigNum c;\r\n        c.sets(\"0\");\r\n        c[0] = a[0] + b[0];\r\n        for(int i = 1 ; i <= a[0] ; i++){\r\n            for(int j = 1 ; j <= b[0] ; j++){\r\n                c[i+j-1] += a[i] * b[j];\r\n                c[i+j] += c[i+j-1] / MOD;\r\n                c[i+j-1] %= MOD;\r\n            }\r\n        }\r\n        if( c[c[0]] == 0 )  c[0]--;\r\n        return c;\r\n    }\r\n}a,b;\r\n\r\nchar s1[M],s2[M];\r\n\r\nint main(){\r\n#ifdef LOCAL\r\n    freopen(\"E:\\\\c++\\\\in.txt\", \"r\", stdin);\r\n    freopen(\"E:\\\\c++\\\\out.txt\",\"w\",stdout);\r\n#endif\r\n    while(~scanf(\"%s%s\",s1,s2)){\r\n        a.sets(s1);\r\n        b.sets(s2);\r\n        (a*b).print();\r\n    }\r\n    return 0;\r\n}\r\n', ''),
(38, 1013, 1, 8, 0, 0, 1, '2018-02-07 00:45:32', 0, '#include <iostream>\r\nusing namespace std;\r\n\r\nint main(){\r\n    printf(\"1800\\n\");\r\n    return 0;\r\n}', 'main.c:1:20: fatal error: iostream: No such file or directory\r\r\n #include <iostream>\r\r\r\n                    ^\r\r\ncompilation terminated.'),
(39, 1013, 1, 8, 0, 0, 1, '2018-02-07 00:48:19', 0, '#include <stdio.h>\r\nusing namespace std;\r\n\r\nint main(){\r\n    printf(\"1800\\n\");\r\n    return 0;\r\n}	', 'main.c:3:1: error: unknown type name \'using\'\r\r\n \r\r\r\n ^\r\r\nmain.c:3:17: error: expected \'=\', \',\', \';\', \'asm\' or \'__attribute__\' before \'std\'\r\r\n \r\r\r\n                 ^'),
(40, 1013, 1, -1, 128, 454, 1, '2018-02-07 00:48:55', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    printf(\"1800\\n\");\r\n    return 0;\r\n}	', ''),
(41, 1000, 1, 1, 36, 451, 4, '2018-02-09 22:42:21', 0, '#include<stdio.h>\r\nint main()\r\n{\r\n   int a,b;\r\n   scanf(\"%d%d\",&a,&b);\r\n   printf(\"%d\",a+b);\r\n   return 0;\r\n } ', ''),
(43, 1013, 2, 7002, 52, 450, -9945157, '2018-02-18 21:38:33', 0, '#include <stdio.h>\r\n\r\nint main(){\r\n    printf(\"1800\\n\");\r\n    return 0;\r\n}', ''),
(44, 1015, 1, 8, 0, 0, -9945157, '2018-02-24 15:56:16', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 20 , mz = 1e9+7;\r\nint a[N];\r\ndouble p[N];\r\n\r\nint main(){\r\n    int x,y,z;\r\n    p[0] = 1.0;\r\n    for(int i = 1 ; i <= 12 ; i++){\r\n        scanf(\"%d\",a+i);\r\n        p[i] = p[i-1] / (1.0*a[i]);\r\n    }\r\n    scanf(\"%d%d%d\",&x,&y,&z);\r\n    printf(\"%.9f\\n\",200000.0/(x+1.0)*p[6] + 250000.0/(y+1.0)*p[12] + 50000.0/z/3.0);\r\n    return 0;\r\n}\r\n', 'main.c:1:25: fatal error: bits/stdc++.h: No such file or directory\r\r\n #include <bits/stdc++.h>\r\r\r\n                         ^\r\r\ncompilation terminated.'),
(45, 1015, 3, 1, 91, 435, -9945157, '2018-02-24 15:57:25', 0, '#include <bits/stdc++.h>\r\nusing namespace std;\r\nconst int N = 20 , mz = 1e9+7;\r\nint a[N];\r\ndouble p[N];\r\n\r\nint main(){\r\n    int x,y,z;\r\n    p[0] = 1.0;\r\n    for(int i = 1 ; i <= 12 ; i++){\r\n        scanf(\"%d\",a+i);\r\n        p[i] = p[i-1] / (1.0*a[i]);\r\n    }\r\n    scanf(\"%d%d%d\",&x,&y,&z);\r\n    printf(\"%.9f\\n\",200000.0/(x+1.0)*p[6] + 250000.0/(y+1.0)*p[12] + 50000.0/z/3.0);\r\n    return 0;\r\n}\r\n', 'cc1plus.exe: fatal error: main.cpp: No such file or directory\r\r\ncompilation terminated.');

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
(5, 'hq234', 'hsxiçš„çˆ¸çˆ¸', '51077427c5d391d01a29eec649dde9aa', 7, '2018-02-13 20:59:52', '2018-02-13 20:59:52', 0),
(6, 'first_test_1', 'first_test_1', '83fb01ef1de9b3da6e25c6aec5e682dd', 1, '2018-02-28 17:41:05', '2018-02-28 17:41:05', 1),
(7, 'first_test_2', 'first_test_2', '966af25bfeea7d61e95de9a6bd4f2463', 1, '2018-02-28 17:41:35', '2018-02-28 17:41:35', 1),
(8, 'first_test_3', 'first_test_3', '6deabb2db1ed225005486a9301f402ab', 1, '2018-02-28 17:42:02', '2018-02-28 17:42:02', 1),
(9, 'lalala', 'lalala', '96725ba7fc4a049bf0e5c2550634058a', 1, '2018-02-28 18:21:59', '2018-02-28 18:21:59', 0),
(29, 'first_bug_3', 'first_bug_3', 'e8548df0140a846db9db19c3bfe2de11', 1, '2018-03-10 00:00:53', '2018-03-10 00:00:53', 1),
(28, 'first_bug_2', 'first_bug_2', 'f7e55e123553442875b6823bc292ebd4', 1, '2018-03-10 00:00:53', '2018-03-10 00:00:53', 1),
(27, 'first_bug_1', 'first_bug_1', '72e89750dbcc0a182cecd80e77256544', 1, '2018-03-10 00:00:53', '2018-03-10 00:00:53', 1),
(30, 'first_test_4', 'first_test_4', '431db43786da453a9c98dc8e2a08e8ba', 1, '2018-03-10 00:05:33', '2018-03-10 00:05:33', 1),
(31, 'first_test_5', 'first_test_5', '12fe569347c42d2e8e4972afb13e84f4', 1, '2018-03-10 00:05:33', '2018-03-10 00:05:33', 1),
(32, 'first_test_6', 'first_test_6', 'dcc7cfc75aac7c1ddbae89bbf4714ec0', 1, '2018-03-10 00:05:33', '2018-03-10 00:05:33', 1),
(33, 'first_test_7', 'first_test_7', 'ac1e99ad9606ef19628f58ab1f06c8df', 1, '2018-03-10 00:06:38', '2018-03-10 00:06:38', 1),
(34, '2018_test_11', '2018_test_11', '663fa5ad1efbffc3226fa3a069c396bc', 1, '2018-03-12 14:45:22', '2018-03-12 14:45:22', 9),
(35, '2018_test_12', '2018_test_12', '5c74d03dd3ca528e2bf4291480d6d253', 1, '2018-03-12 14:45:22', '2018-03-12 14:45:22', 9),
(36, '2018_test_13', '2018_test_13', '551337c28fd9fb904ac7a5e04819bbd2', 1, '2018-03-12 14:45:22', '2018-03-12 14:45:22', 9),
(37, '2018_test_14', '2018_test_14', '7118db1323de2c0c98a555968dfd2de3', 1, '2018-03-12 14:45:22', '2018-03-12 14:45:22', 9),
(38, '2018_test_15', '2018_test_15', '80ccc69390a8a28e4191714711b38fd2', 1, '2018-03-12 14:45:22', '2018-03-12 14:45:22', 9);

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
(5, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(6, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(7, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(8, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(9, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

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
(1, 'user_numbers', 39),
(2, 'loading_falg_nums', 149),
(3, 'new_problem_id', 1031),
(4, 'test_id', 6),
(5, 'submit_number', 46),
(6, 'huck_number', 6),
(7, 'contest_1_id', 11),
(8, 'contest_2_id', 44),
(9, 'contest_pro_submit_id', 66),
(10, 'contest_rank_information_1_id', 31),
(11, 'contest_ranks_information_2_id', 3),
(12, 'contets_huck_submit_id', 9),
(13, 'contest_3_id', 30);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

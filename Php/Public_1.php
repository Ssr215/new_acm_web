<?php
	$severname = "localhost";
	$username = "sever1";
	$password = "hsxi134719";
	$dbname = "acm_sever_1";

	// 连接服务器
	$conn = new mysqli($severname,$username,$password,$dbname);
	// 如果服务器连接失败
	if ($conn->connect_error) {
		die("连接服务器失败: ".$conn->connect_error);
	}

	// 随机产生一个个位数的随机数
	function get_signed(){
		$x = 10005;
		while ($x >= 10000) {
			$x = rand();
		}
		return $x%10;
	}

	// 优化产生[min,max]的随机函数
	function have_rand($min_limit,$max_limit){
		if ($max_limit <= $min_limit) {
			return $min_limit;
		}
		$mid = get_signed()%2;
		$count = 8;
		while ($count != 0) {
			$count --;
			$mid = $mid*10+get_signed();
		}
		return $min_limit + ($mid%($max_limit-$min_limit));
	}

	//创建本地登陆标识全局变量符
	$GLOBALS['loading_username'] = "no";
	$GLOBALS['loading_user_flag'] = false;

	// 创建本机在服务器的映射标志
	if( !isset($_COOKIE['user_loading_flag1']) || !isset($_COOKIE['user_loading_flag2']) ){
		setcookie("user_loading_flag1",have_rand(1,100000000));
		setcookie("user_loading_flag2",have_rand(1,100000000));
	}

	// 创建本机在服务器的映射
	// creat_flag_in_computer($conn,$user_loading_flag1,$user_loading_flag2);
	function creat_flag_in_computer($conn,$user_loading_flag1,$user_loading_flag2){
		$sql = "SELECT * FROM loading_flag";
		$result = mysqli_query($conn,$sql);
		$flag_of_flag_have = true;
		date_default_timezone_set("Asia/Shanghai");
		$time_now = date("Y-m-d H:i:s");
		$time_now = strtotime($time_now);


		while ($row = mysqli_fetch_array($result)) {
			if( $row['flag1'] == $user_loading_flag1 && $row['flag2'] == $user_loading_flag2 ){
				$time_pre = strtotime($row['last_updata_times']);
				$difference_of_time = $time_now - $time_pre;
				if( $difference_of_time >= 7200 ){
					mysqli_query($conn,"UPDATE loading_flag SET id='-1' WHERE flag1='$user_loading_flag1' AND flag2='user_loading_flag2");
				}else{
					if( $row['id'] != -1 ){
						$GLOBALS['loading_flag'] = true;
						// 查询存在id对应的用户名（未完成）
					}
				}
				mysqli_query($conn,"UPDATE loading_flag SET last_updata_times='{$time_now}' WHERE flag1='$user_loading_flag1' AND flag2='user_loading_flag2");
				break;
			}
		}
	}
 ?>
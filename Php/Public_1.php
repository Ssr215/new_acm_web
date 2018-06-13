<?php
	//$severname = "172.18.92.146";
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
	$refresh_flag = false;

	// 创建本机在服务器的映射标志
	//解决首次访问cookie出现undefined的问题
	if( !isset($_COOKIE['user_loading_flag1']) || !isset($_COOKIE['user_loading_flag2']) ){
		$va1 = have_rand(1,100000000);
		$va2 = have_rand(1,100000000);
		setcookie("user_loading_flag1",$va1);
		setcookie("user_loading_flag2",$va2);
		creat_flag_in_computer($conn,$va1,$va2);
		//$refresh_flag = true;
	}else{
		creat_flag_in_computer($conn,$_COOKIE['user_loading_flag1'],$_COOKIE['user_loading_flag2']);
	}

	// 创建本机在服务器的映射
	function creat_flag_in_computer($conn,$user_loading_flag1,$user_loading_flag2){
		$sql = "SELECT * FROM loading_flag";
		$result = mysqli_query($conn,$sql);
		$flag_of_flag_have = true;
		date_default_timezone_set("Asia/Shanghai");
		$time_now = date("Y-m-d H:i:s");
		// $time_now = strtotime($time_now);


		while ($row = mysqli_fetch_array($result)) {
			if( $row['flag1'] == $user_loading_flag1 && $row['flag2'] == $user_loading_flag2 ){
				$flag_of_flag_have = false;
				// $time_pre = strtotime($row['last_updata_times']);
				$time_pre = $row['last_updata_times'];
				$difference_of_time = $time_now - $time_pre;
				// echo $difference_of_time;
				if( $difference_of_time >= 7200 ){
					mysqli_query($conn,"UPDATE loading_flag SET id='-1' WHERE flag1='$user_loading_flag1' AND flag2='user_loading_flag2");
				}else{
					// echo $row['id'];
					if( $row['id'] != -1 ){
						$GLOBALS['loading_user_flag'] = true;
						// 查询存在id对应的用户名（未完成)
						$dfs_id = $row['id'];
						$dfs_sql = "SELECT * FROM user_information WHERE id = '$dfs_id'";
						$dfs_result = mysqli_query($conn,$dfs_sql);
						while ($dfs_row = mysqli_fetch_array($dfs_result)) {
							$GLOBALS['loading_username'] = $dfs_row['user_name'];
						}
					}
				}
				if(!mysqli_query($conn,"UPDATE loading_flag SET last_updata_times='{$time_now}' WHERE flag1='$user_loading_flag1' AND flag2='$user_loading_flag2'")){
					echo "Error: " . $sql . "<br>" . $conn->error;;
				}
				break;
			}
		}

		if( $flag_of_flag_have ){
			$lo_id = get_and_update_of_web_number_information($conn,2);
			$sql = "INSERT INTO loading_flag (loading_id,flag1,flag2,id,last_updata_times) VALUES ('$lo_id','$user_loading_flag1','$user_loading_flag2','-1','$time_now')";
			if(!mysqli_query($conn,$sql)){
				echo "Error: " . $sql . "<br>" . $conn->error;
			}
		}
	}

	// 登出标志及处理
	if( isset($_GET["out"]) ){
		date_default_timezone_set("Asia/Shanghai");
		$time_now = date("Y-m-d H:i:s");
		$user_loading_flag1 = $_COOKIE['user_loading_flag1'];
		$user_loading_flag2 = $_COOKIE['user_loading_flag2'];
		$sql = "UPDATE loading_flag SET id='-1' WHERE flag1='$user_loading_flag1' AND flag2='$user_loading_flag2'";
		if(!mysqli_query($conn,$sql)){
			echo "Error: " . $sql . "<br>" . $conn->error;
		}else{
			$refresh_flag = true;
		}
	}

	// 字符串在md5前的预加密
	function get_encryption($pass_word){
		return strrev($pass_word);
	}

	// 获取服务器中web_number_information的某一个id的参数并更新
	function get_and_update_of_web_number_information($conn,$uid){
		$next_number_return = -9456487;
		$sql = "SELECT * FROM web_number_information WHERE id = '$uid'";
		$result = mysqli_query($conn,$sql);
		while ($row = mysqli_fetch_array($result)) {
			$next_number_return = $row['next_numbers'];
		}
		if( $next_number_return != -9456487 ){
			$next_number_return++;
			$sql = "UPDATE web_number_information SET next_numbers = '$next_number_return' WHERE id = '$uid'";
			if( !mysqli_query($conn,$sql) ){
				echo "Error: " . $sql . "<br>" . $conn->error;
				$next_number_return = -9456487;
			}else{
				$next_number_return--;
			}
		}
		return $next_number_return;
	}
	// 获取服务器中web_number_information的某一个id的参数
	function get_of_web_number_information($conn,$uid){
		$next_number_return = -9456487;
		$sql = "SELECT * FROM web_number_information WHERE id = '$uid'";
		$result = mysqli_query($conn,$sql);
		while ($row = mysqli_fetch_array($result)) {
			$next_number_return = $row['next_numbers'];
		}
		return $next_number_return;
	}

	// 获取当前用户的登录权限
	function get_uesr_authority($conn,$u_name){
		if( $u_name == "no" ){
			return 1;
		}
		$sql = "SELECT * FROM user_information WHERE user_name = '$u_name'";
		$use_authority = 1;
		$result = mysqli_query($conn,$sql);
		while ($row = mysqli_fetch_array($result)) {
			$use_authority = $row['authority'];
		}
		if( $use_authority > 9 )	$use_authority = 1;
		return $use_authority;
	}
 ?>
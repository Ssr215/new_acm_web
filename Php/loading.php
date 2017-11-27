<?php
	// 登录预留标志 , '1'表示登录成功，‘2’表示用户名或者密码错误，‘3’表示连接或者服务器问题，0表示未有输入响应
	$loading_success_flag = 0;
	$user_name_l = "";
	// 检查是否存在登录提交并处理
	if ( isset($_POST['user_name1']) ) {
		$user_name_l = $_POST['user_name1'];
		$pass_word_l = $_POST['pass_word1'];

		$sql = "SELECT * FROM user_information WHERE user_name = '$user_name_l'";
		$result = mysqli_query($conn,$sql);
		//echo "Error: " . $sql . "<br>" . $conn->error;
		while ($row = mysqli_fetch_array($result)) {
			if( $row['password'] == md5(md5(md5(get_encryption($pass_word_l)))) ){
				$loading_success_flag = 1;
				$GLOBALS['loading_user_flag'] = true;
				$GLOBALS['loading_username'] = $row['user_name'];
				$dfs_id = $row['id'];
				$dfs_f1 = $_COOKIE['user_loading_flag1'];
				$dfs_f2 = $_COOKIE['user_loading_flag2'];
				$dfs_sql = "UPDATE loading_flag SET id = '$dfs_id' WHERE flag1 = '$dfs_f1' AND flag2 = '$dfs_f2'";
				if( !mysqli_query($conn,$dfs_sql) ){
					// echo "here you are";
					$loading_success_flag = 3;
					echo "Error: " . $sql . "<br>" . $conn->error;
				}
			}else{
				$loading_success_flag = 2;
			}
		}
		if( 0 == $loading_success_flag ){
			// echo "what you say!";
			$loading_success_flag = 3;
		}
	}
?>
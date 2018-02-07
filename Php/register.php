<?php
	// 注册成功标志，‘1’表示成功，‘2’表示失败，'3'表示插入操作失败，‘0’表示没有注册操作
	$register_success_flag = 0;

	// 判断是否存在注册提交 , 此处不防止sql注入，应有前端用JavaScript检查
	if( isset($_POST['user_name2']) ){
		$user_name_r = $_POST['user_name2'];
		$nike_name_r = $_POST['nike_name2'];
		$pass_word_r = md5(md5(md5(get_encryption($_POST['pass_word2']))));

		$sql = "SELECT * FROM user_information WHERE user_name = '$user_name_r'";
		$result = mysqli_query($conn,$sql);
		$register_id = -1;
		while ( $row = mysqli_fetch_array($result) ) {
			$register_id = $row['id'];
		}
		// echo $register_id;
		if( $register_id != -1 ){
			$register_success_flag = 2;
		}else{
			$register_success_flag = 1;
			$register_id = get_next_register_id($conn);
			$now_time = date("Y-m-d H:i:s");
			// $now_time = strtotime($now_time);
			$sql = "INSERT INTO user_information (id,user_name,nike_name,password,authority,register_time,last_loading_time) VALUES ('$register_id','$user_name_r','$nike_name_r','$pass_word_r','1','$now_time','$now_time')";
			if(!mysqli_query($conn,$sql)){
				$register_success_flag = 3;
				echo "Error: " . $sql . "<br>" . $conn->error;
			}else{
				$sql = "INSERT INTO user_information_1 (id,submit_number,ac,wa,pe,tl,ml,re,ce,pass_number,pass_problem) VALUES ('$register_id','0','0','0','0','0','0','0','0','0','')";
				if( !mysqli_query($conn,$sql) ){
					$register_success_flag = 4;
					echo "Error: " . $sql . "<br>" . $conn->error;
				}
			}
		}

	}

	// 查询注册用户应授予的id号码,并更新服务器的下一个id
	function get_next_register_id($conn){
		$nums = -1;
		$sql1 = "SELECT * FROM web_number_information";
		// $result1 = $conn->query($sql1);
		$result1 = mysqli_query($conn,$sql1);
		while ($row1 = mysqli_fetch_array($result1)) {
			$nums = $row1['next_numbers'];
			break;
		}
		// if( $result->num_rows > 0 ){
		// 	while ($row = $result->fetch_assoc()) {
		// 		$nums = $row['next_numbers'];
		// 	}
		// }
		$next_nums = $nums + 1;
		$sql = "UPDATE web_number_information SET next_numbers = '$next_nums' WHERE id='1'";
		mysqli_query($conn,$sql);
		return $nums;
	}

?>
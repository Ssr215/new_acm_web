<?php
	// 获取新建题目的Id
	function get_next_new_pro_id($conn){
		$next_number_return = -9456487;
		$sql = "SELECT * FROM web_number_information WHERE id = 3";
		$result = mysqli_query($conn,$sql);
		while ($row = mysqli_fetch_array($result)) {
			$next_number_return = $row['next_numbers'];
		}
		// if( $next_number_return != -9456487 ){
		// 	$next_number_return++;
		// 	$sql = "UPDATE web_number_information SET next_numbers = '$next_number_return' WHERE id = '$uid'";
		// 	if( !mysqli_query($conn,$sql) ){
		// 		echo "Error: " . $sql . "<br>" . $conn->error;
		// 		$next_number_return = -9456487;
		// 	}else{
		// 		$next_number_return--;
		// 	}
		// }
		return $next_number_return;
	}

	// 是否存在新建题目的标志，1表示创建成功，2-5表示创建失败,其中有对应编号，0表示无新建题目
	$problem_insert_flag = 0;

	// 处理新建题目
	if( isset($_POST['pro_id']) ){
		$pro_id = $_POST['pro_id'];
		$pro_title = $_POST['pro_title'];
		$time_limit = $_POST['time_lim'];
		$memory_limit = $_POST['memory_mit'];
		$time_limit_java = $_POST['time_lim_j'];
		$memory_limit_java = $_POST['memory_mit_j'];
		$pro_description = $_POST['description'];
		$pro_input = $_POST['_input'];
		$pro_output = $_POST['_output'];
		$pro_sample_input = $_POST['sampleinput'];
		$pro_sample_output = $_POST['sampleoutput'];
		$pro_hint = $_POST['hint'];
		date_default_timezone_set("Asia/Shanghai");
		$time_now = date("Y-m-d H:i:s");
		$pro_user_id = get_user_id($conn,$GLOBALS['loading_username']);
		$pro_description = str_replace("'", "\'", $pro_description);
		$pro_input = str_replace("'", "\'", $pro_input);
		$pro_output = str_replace("'", "\'", $pro_output);
		$pro_sample_input = str_replace("'", "\'", $pro_sample_input);
		$pro_sample_output = str_replace("'", "\'", $pro_sample_output);
		$pro_hint = str_replace("'", "\'", $pro_hint);
		$pro_title = str_replace("'", "\'", $pro_title);

		$sql = "INSERT INTO problem_information_1 (pro_id,title,time_limit,memory_limit,time_limit_java,memory_limit_java,input,output,AC,submit) VALUES ('$pro_id','$pro_title','$time_limit','$memory_limit','$time_limit_java','$memory_limit_java','$pro_input','$pro_output','0','0')";
		if( !mysqli_query($conn,$sql) ){
			echo "Error: " . $sql . "<br>" . $conn->error;
			$problem_insert_flag = 2;
		}else{
			$sql = "INSERT INTO problem_information_2 (pro_id,description,sample_input,sample_output) VALUES ('$pro_id','$pro_description','$pro_sample_input','$pro_sample_output')";
			if( !mysqli_query($conn,$sql) ){
				echo "Error: " . $sql . "<br>" . $conn->error;
				$problem_insert_flag = 3;
			}else{
				$sql = "INSERT INTO problem_information_3 (pro_id,hint,pro_user_id,begin_time,last_update_time) VALUES ('$pro_id','$pro_hint','$pro_user_id','$time_now','$time_now')";
				if( !mysqli_query($conn,$sql) ){
					echo "Error: " . $sql . "<br>" . $conn->error;
					$problem_insert_flag = 4;
				}else{
					$pro_id++;
					$sql = "UPDATE web_number_information SET next_numbers = '$pro_id' WHERE id = 3";
					if( !mysqli_query($conn,$sql) ){
						echo "Error: " . $sql . "<br>" . $conn->error;
						$problem_insert_flag = 5;
					}else{
						$problem_insert_flag = 1;
					}
				}
			}
		}
	}

	// 获取当前用户的id
	function get_user_id($conn,$u_name){
		$u_id = -1;
		$sql = "SELECT * FROM user_information WHERE user_name = '$u_name'";
		$result = mysqli_query($conn,$sql);
		while ($row = mysqli_fetch_array($result)) {
			$u_id = $row['id'];
		}
		return $u_id;
	}
?>
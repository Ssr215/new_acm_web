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

	// 是否存在新建题目的标志，1表示创建成功，2-6表示创建失败,其中有对应编号，0表示无新建题目
	$problem_insert_flag = 0;

	// 处理新建题目
	if( isset($_POST['pro_id']) ){
		$pro_id = $_POST['pro_id'];
		$pro_title = $_POST['pro_title'];
		$time_limit = $_POST['time_lim'];
		if( $time_limit < 100 )	$time_limit *= 1000;
		$memory_limit = $_POST['memory_mit'];
		if( $memory_limit < 100 )	$memory_limit * 1000;
		$time_limit_java = $_POST['time_lim_j'];
		if( $time_limit_java < 100 )	$time_limit_java *= 1000;
		$memory_limit_java = $_POST['memory_mit_j'];
		if( $memory_limit_java < 100 )	$memory_limit_java * 1000;
		$pro_description = $_POST['description'];
		$pro_input = $_POST['_input'];
		$pro_output = $_POST['_output'];
		$pro_sample_input = $_POST['sampleinput'];
		$pro_sample_output = $_POST['sampleoutput'];
		$pro_hint = $_POST['hint'];
		$pro_authority = $_POST['authority'];
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
		$pro_authority = min($pro_authority,get_uesr_authority($conn,$GLOBALS['loading_username']));

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
				$sql = "INSERT INTO problem_information_3 (pro_id,hint,pro_user_id,begin_time,last_update_time,authority,test_number) VALUES ('$pro_id','$pro_hint','$pro_user_id','$time_now','$time_now','$pro_authority','0')";
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
						$file_path = "D:/test_data/".($pro_id-1);
						if (!file_exists($file_path)) {
							mkdir($file_path);
							echo "create folder success";
							$pro_id = $pro_id-1;
							$S_judgment = $_POST['S_judgment'];
							$S_judgment_code = $_POST['S_judgment_code'];
							$sql = "INSERT INTO problem_information_4 (pro_id,s_judgment,s_judgment_code,allow_huck,data_monitoring,true_code,huck_number) VALUES ('$pro_id','$S_judgment',?,'0','','','0')";
							$sth = $conn->prepare($sql);
							$sth->bind_param('s',$s_judgment_code);
							if ($sth->execute()) {
								$problem_insert_flag = 1;
							}else{
								?>
									<script type="text/javascript">
										alert(<?php echo $sth->error; ?>);
									</script>
								<?php
								$problem_insert_flag = 6;
							}
						}
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

	// 更新题目状态 updata_sueecss_flag = 0 未处理 1 成功 2+失败
	$updata_success_flag = 0;
	if( isset($_POST['u_pro_id']) ){
		$pro_id = $_POST['u_pro_id'];
		$pro_title = $_POST['u_pro_title'];
		$time_limit = $_POST['u_time_lim'];
		if( $time_limit < 100 )	$time_limit *= 1000;
		$memory_limit = $_POST['u_memory_mit'];
		if( $memory_limit < 100 )	$memory_limit * 1000;
		$time_limit_java = $_POST['u_time_lim_j'];
		if( $time_limit_java < 100 )	$time_limit_java *= 1000;
		$memory_limit_java = $_POST['u_memory_mit_j'];
		if( $memory_limit_java < 100 )	$memory_limit_java * 1000;
		$pro_description = $_POST['u_description'];
		$pro_input = $_POST['u_input'];
		$pro_output = $_POST['u_output'];
		$pro_sample_input = $_POST['u_sampleinput'];
		$pro_sample_output = $_POST['u_sampleoutput'];
		$pro_hint = $_POST['u_hint'];
		$pro_authority = $_POST['u_authority'];
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
		$pro_authority = min($pro_authority,get_uesr_authority($conn,$GLOBALS['loading_username']));
		$sql = "UPDATE problem_information_1 SET title='$pro_title',time_limit='$time_limit',memory_limit='$memory_limit',time_limit_java='$time_limit_java',memory_limit_java='$memory_limit_java',input='$pro_input',output='$pro_output' WHERE pro_id='$pro_id'";
		if( !mysqli_query($conn,$sql) ){
			echo "Error: " . $sql . "<br>" . $conn->error;
			$updata_success_flag = 2;
		}else{
			$sql="UPDATE problem_information_2 SET description='$pro_description',sample_input='$pro_sample_input',sample_output='$pro_sample_output' WHERE pro_id='$pro_id'";
			if( !mysqli_query($conn,$sql) ){
				echo "Error: " . $sql . "<br>" . $conn->error;
				$updata_success_flag = 3;
			}else{
				$sql = "UPDATE problem_information_3 SET hint='$pro_hint',last_update_time='$time_now',authority='$pro_authority' WHERE pro_id='$pro_id'";
				if( !mysqli_query($conn,$sql) ){
					echo "Error: " . $sql . "<br>" . $conn->error;
					$updata_success_flag = 4;
				}else{
					$s_judgment = $_POST['S_judgment'];
					$s_judgment_code = $_POST['S_judgment_code'];
					$sql = "UPDATE problem_information_4 SET s_judgment='$s_judgment',s_judgment_code=? WHERE pro_id='$pro_id'";
					$sth = $conn->prepare($sql);
					$sth->bind_param('s',$s_judgment_code);
					if ($sth->execute()) {
						$updata_success_flag = 1;
					}else{
						?>
							<script type="text/javascript">
								alert(<?php echo $sth->error; ?>);
							</script>
								<?php
						$updata_success_flag = 5;
					}
					
				}
			}
		}
	}

	// 获取当前题目的test数并更新
	function get_problem_test_id($conn,$pro_id){
		$sql = "SELECT pro_id,test_number FROM problem_information_3 WHERE pro_id='$pro_id'";
		$number = 0;
		$result = mysqli_query($conn,$sql);
		if( !$result ){
			echo "Error: " . $sql . "<br>" . $conn->error;
		}else{
			while ($row = mysqli_fetch_array($result)) {
				$number = $row['test_number'];
			}
		}
		$number++;
		$sql = "UPDATE problem_information_3 SET test_number='$number' WHERE pro_id='$pro_id'";
		if( !mysqli_query($conn,$sql) ){
			echo "Error: " . $sql . "<br>" . $conn->error;
			$number = 0;
		}
		$number--;
		return $number;
	}


	// 处理新建的样例
	if( isset($_POST['add_test_pro_id']) ){
		$pro_id = $_POST['add_test_pro_id'];
		// echo $pro_id."<br>";
		$add_test_input = $_POST['add_test_input'];
		$file_path_1 = "D:\\test_data\\".$pro_id."\\";
		$tesd_id = get_problem_test_id($conn,$pro_id);
		if (""==$add_test_input) {
			if ($_FILES["add_input_file"]["error"] > 0) {
				echo $_FILES["add_input_file"]["error"];
			}else{
				//$add_test_input = $_FILES["add_input_file"]["tmp_name"];
				//$add_test_input = addslashes(fread(fopen($add_test_input, "r"),filesize($add_test_input)));
				//echo $add_test_input."<br>";
				if (move_uploaded_file($_FILES["add_input_file"]["tmp_name"],$file_path_1.$tesd_id.".in")) {
					echo "add input file success!<br>";
				}else{
					echo "can't add input file success!<br>";
				}
			}
			
		}else{
			$myfile = fopen($file_path_1.$tesd_id.".in", "w") or die("Unable to open file!");
			fwrite($myfile, $add_test_input);
			fclose($myfile);
		}
		$add_test_output = $_POST['add_test_output'];
		if (""==$add_test_output) {
			if ($_FILES["add_output_file"]["error"] > 0) {
				echo $_FILES["add_output_file"]["error"];
			}else{
				//$add_test_output = $_FILES["add_output_file"]["tmp_name"];
				//$add_test_output = addslashes(fread(fopen($add_test_output, "r"), filesize($add_test_output)));
				//echo $add_test_output."<br>";
				if (move_uploaded_file($_FILES["add_output_file"]["tmp_name"],$file_path_1.$tesd_id.".out")) {
					echo "add output file success!<br>";
				}else{
					echo "can't add output file success!<br>";
				}
			}
		}else{
			$myfile = fopen($file_path_1.$tesd_id.".out", "w") or die("Unable to open file!");
			fwrite($myfile, $add_test_output);
			fclose($myfile);
		}
		// $id = get_and_update_of_web_number_information($conn,4);
		// date_default_timezone_set("Asia/Shanghai");
		// $time_now = date("Y-m-d H:i:s");
		// $test_number = get_problem_test_id ($conn,$pro_id);
		// $use_id = get_user_id($conn,$GLOBALS['loading_username']);
		// $sql = "INSERT INTO problem_test (id,pro_id,test_number,input,output,_date,user_id) VALUES ('$id','$pro_id','$test_number','$add_test_input','$add_test_output','$time_now','$use_id')";
		// if( !mysqli_query($conn,$sql) ){
		// 	echo "Error: " . $sql . "<br>" . $conn->error;
		// }
	}
?>
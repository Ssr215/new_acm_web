<?php
	$cid = 1;
	if ( isset($_GET['cid']) ) {
		$cid = $_GET['cid'];
	}
	$flag = 1;
	if ( is_numeric($cid) ) {
		$flag = 0;
		$cid = (int)$cid;
		if ( $cid <= 0 ) {
			$cid = 1;
		}
	}
	if ( $flag == 1 ) {
		?>
			<script type="text/javascript">
					alert("No Access!");
			</script>
			<meta http-equiv="refresh" content="0;index.php">
		<?php
		exit();
	}
	$sql = "SELECT level,type,begin_time,duration,name,problem_number FROM contest_information_1 WHERE contest_id='$cid'";
	$result = mysqli_query($conn,$sql);
	$name = "nothing";
	$level = 0;
	$type = 0;
	$begin_time = time();
	$duration = 120;
	$problem_number = 0;
	while ( $row = mysqli_fetch_array($result) ) {
		$level = $row['level'];
		$type = $row['type'];
		$begin_time = $row['begin_time'];
		$duration = $row['duration'];
		$name = $row['name'];
		$problem_number = $row['problem_number'];
	}

	function get_problem_name($conn,$pro_id){
		$sql = "SELECT title FROM problem_information_1 WHERE pro_id = '$pro_id'";
		$result = mysqli_query($conn,$sql);
		while ( $row = mysqli_fetch_array($result) ) {
			return $row['title'];
		}
		return "error in get problem name";
	}

	//检查是否可以参加contest_id的比赛，可以返回false，否则返回true
	function ck_is_allow_participate($conn,$u_name,$cid){
		$sql = "SELECT limit_par FROM contest_information_1 WHERE contest_id = '$cid'";
		$result = mysqli_query($conn,$sql);
		$a = 1;
		while ( $row = mysqli_fetch_array($result) ) {
			$a = $row['limit_par'];
		}
		if ( $a == 0 ) {
			return false;
		}
		$sql = "SELECT cid_allow FROM user_information WHERE user_name='$u_name'";
		$result = mysqli_query($conn,$sql);
		while ( $row = mysqli_fetch_array($result) ) {
			if ( $row['cid_allow'] == $cid ) {
				return false;
			}
		}
		return true;
	}
?>
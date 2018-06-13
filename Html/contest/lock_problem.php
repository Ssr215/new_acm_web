<?php
	include "../../Php/Public_1.php";
	include '../../Php/contest.php';
	$pid = $_GET['pid'];
	$flag = 1;
	if ( is_numeric($pid) ) {
		$flag = 0;
		$pid = (int)$pid;
		if ( $pid <= 0 || $pid > $problem_number ) {
			$pid = 1;
		}
	}
	$u_id = get_user_id($conn,$GLOBALS['loading_username']);
	if( $flag == 1 || !ck_pass_problem_and_can_lock_problem($conn,$u_id,$cid,$pid) ){
		?>
			<script type="text/javascript">
				alert("No Access!");
			</script>
			<meta http-equiv="refresh" content="0;index.php?cid=<?php echo $cid ?>">
		<?php
		exit();
	}

	$sql = "UPDATE contest_ranks_information_1 SET lock_problem = 1 WHERE user_id = '$u_id' AND contest_id = '$cid' AND pass_problem_id = '$pid'";
	mysqli_query($conn,$sql);
?>
<meta http-equiv="refresh" content="0;status.php?cid=<?php echo($cid) ?>">
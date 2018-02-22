<?php
	include "../Php/Public_1.php";

	$pid = $_GET['pid'];
	$sid = $_GET['sid'];
	$result_y = $_GET['result'];

	if( get_uesr_authority($conn,$GLOBALS['loading_username']) < 7 ){
		?>
			<script type="text/javascript">
				alert("No Access!");
			</script>
			<meta http-equiv="refresh" content="0;index.php">
		<?php
	}

	include '../Php/contest.php';

	if( $result_y == 1 OR $result_y == 11 ){
		$sql = "UPDATE contest_information_2 SET pass_number = pass_number - 1 WHERE contest_id = '$cid' AND order_number = '$pid'";
		mysqli_query($conn,$sql);
	}
	$sql = "UPDATE contest_pro_submit SET result = 0,u_time = 0,u_memory=0 WHERE id='$sid'";
	mysqli_query($conn,$sql);
?>
<meta http-equiv="refresh" content="0;contest_status.php?cid=<?php echo($cid) ?>">
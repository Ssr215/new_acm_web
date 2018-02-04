<?php
	include "../Php/Public_1.php";

	$pro_id = $_GET['pro_id'];
	$sid = $_GET['sid'];
	$result = $_GET['result'];

	if( get_uesr_authority($conn,$GLOBALS['loading_username']) < 7 ){
		?>
			<script type="text/javascript">
				alert("No Access!");
			</script>
			<meta http-equiv="refresh" content="0;index.php">
		<?php
	}

	if( $result == 1 ){
		$sql = "UPDATE problem_information_1 SET AC = AC - 1 WHERE pro_id = '$pro_id'";
		mysqli_query($conn,$sql);
	}
	$sql = "UPDATE pro_submit SET result = 0,u_time = 0,u_memory=0 WHERE id='$sid'";
	mysqli_query($conn,$sql);
?>
<meta http-equiv="refresh" content="0;Status.php">
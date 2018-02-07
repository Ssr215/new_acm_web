<?php
	include "../Php/Public_1.php";

	$sid = $_GET['sid'];
	if ($GLOBALS['loading_user_flag'] == false) {
		?>
			<script type="text/javascript">
				alert("please log in first");
			</script>
			<meta http-equiv="refresh" content="0;url=loading.php">
		<?php
	}

	
?>

<meta http-equiv="refresh" content="0;Status.php">
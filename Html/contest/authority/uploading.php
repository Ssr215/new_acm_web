<?php
	include "../../../Php/Public_1.php";
	include "../../../Php/contest.php";

	if( get_administrator_is_it_a_competitor($conn,$GLOBALS['loading_username'],$cid) ){
		?>
			<script type="text/javascript">
				alert("No Access!");
			</script>
			<meta http-equiv="refresh" content="0;../index.php">
		<?php
		exit();
	}
	$file_path = $_GET['fpath'];
	$file_name = $_GET['fname'];
	$file_path .= $file_name;
	$file=fopen($file_path,"r");
	header("Content-Type: application/octet-stream");
	header("Accept-Ranges: bytes");
	header("Accept-Length: ".filesize($file_path));
	header("Content-Disposition: attachment; filename=".$file_name);
	echo fread($file,filesize($file_path));
	fclose($file);
?>
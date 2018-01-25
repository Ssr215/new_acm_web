<?php
	include "../Php/Public_1.php";

	$pro_id = $_GET['pro_id'];

	function get_pro_id_authority($conn,$pro_id){
		$sql = "SELECT authority FROM problem_information_3 WHERE pro_id='$pro_id'";
		$result = mysqli_query($conn,$sql);
		$numbers = 9;
		while ($row = mysqli_fetch_array($result)) {
			$numbers = $row['authority'];
		}
		return $numbers;
	}

	if( get_uesr_authority($conn,$GLOBALS['loading_username']) < get_pro_id_authority($conn,$pro_id) ){
		?>
			<script type="text/javascript">
				alert("No Access!");
			</script>
			<meta http-equiv="refresh" content="0;index.php">
		<?php
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
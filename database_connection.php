<?php
	$server = "localhost";
	$user = "root";
	$password = "";
	$database = "aplikasi_y";
	$conn = "";

	$conn = mysqli_connect($server, $user, $password, $database);


	//Menampilkan di console
	if($conn){
		echo "<script>console.log('Berhasil menghubungkan database');</script>";
	}else{
		echo "<script>console.log('Tidak berhasil menghubungkan database');</script>";
	}


?>
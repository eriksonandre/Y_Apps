<?php
	include("database_connection.php");

	session_start();

	//Jika req method post dan tombol diset atau ada atau diklik
	if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['logout'])){
		//Hapus semua data sesi
		session_unset();
		//Hancurkan sesi
		session_destroy();
		//Arahkan pengguna ke halaman login
		header("Location: login.php");
		exit();
	}

?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Y - Home</title>
</head>
<body>
	<h1>Data Pengguna</h1> <br>
	<form action="home.php" method="POST">
		<h2>Nama pengguna: <?php echo $_SESSION['username'] ?></h2>
		<h2>Gender pengguna: <?php echo $_SESSION['gender'] ?></h2>
		<h2>Tanggal terdaftar pengguna: <?php echo $_SESSION['registered_date'] ?></h2>
		<input type="submit" name="logout" value="Logout">
	</form>

	

</body>
</html>
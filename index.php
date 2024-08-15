<?php
	include("database_connection.php");

	if($_SERVER["REQUEST_METHOD"] == "POST"){

		//Mengambil data dari form
		$username = $_POST['username'];
		$password = md5($_POST['password']);
		$gender = $_POST['gender'];

		//Validasi agar input tidak kosong
		if(empty($username) || empty($password) || empty($gender)){
			//Mencatat di log
			echo "<script>console.log('Tidak boleh kosong');</script>";
			//Menampilkan alert agar pengguna tau
			echo"<script>alert('Tidak boleh ada yang kosong');</script>";
		}else{
			$sql = "INSERT INTO user(username, password, gender)
					VALUES('$username', '$password', '$gender')";
			$done = mysqli_query($conn, $sql);
			if($done){
				echo "<script>console.log('Berhasil register');</script>";
				echo "<script>alert('Berhasil registrasi.');</script>";
			}

			mysqli_close($conn);
		}
	}
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Y - Register</title>
</head>
<body>
	<h2>Register</h2>
	<form action="index.php" method="POST">
		<label for="usm">Username:</label>
		<input type="text" id="usm" name="username" > <br><br>
		<label for="pw">Password:</label>
		<input type="password" id="pw" name="password" > <br><br>
		<fieldset>
			<legend>Gender</legend>
			<input type="radio" id="M" name="gender" value="Male" >
			<label for="M">Male</label>
			<input type="radio" id="F" name="gender" value="Female">
			<label for="F">Female</label> <br><br>
		</fieldset>
		<br>
		


		<input type="submit" value="Register">
	</form>

	<h2> Sudah punya akun? </h2>
	<input type="button" name="login" value="Login" onclick="redirectToPage()">

	<!-- JAVASCRIPT untuk tombol login -->
	<script>
		function redirectToPage(){
			window.location.href = 'login.php';
		}
	</script>

</body>
</html>
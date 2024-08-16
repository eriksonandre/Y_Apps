<?php
	include("database_connection.php");
	include("static_session.php");

	if($_SERVER["REQUEST_METHOD"] == "POST"){

		$username = $_POST['username'];
		$password = $_POST['password'];

		if(empty($username) || empty($password)){
			echo "<script>console.log('Username atau Password kosong');</script>";
			echo "<script>alert('Username atau Password tidak boleh kosong');</script>";
		}else{
			$sql = "SELECT * FROM user where username = '$username'";
			$result = mysqli_query($conn, $sql);

			//Cek apakah ada hasilnya
			if(mysqli_num_rows($result) > 0){
				//Pisahkan hasil sesuai kolom
				$row = mysqli_fetch_assoc($result);	
				
				if($row['password'] == md5($password)){
					echo "<script> console.log('Berhasil login');</script>";
					
					//Simpan data pengguna ke session
					$_SESSION['username'] = $row['username'];
					$_SESSION['password'] = $row['password'];
					$_SESSION['gender'] = $row['gender'];
					$_SESSION['registered_date'] = $row['registered_date'];

					echo "<script> alert('Berhasil login');</script>";

					header("Location: home.php");
					exit();
				}else{
					echo "<script> console.log('Tidak berhasil login');</script>";
					//echo $row['username'] . " " . $row['password'];
					echo "<script> alert('Tidak berhasil login');</script>";
				}
			}else{
				echo "<script> console.log('Tidak ada data user');</script>";
				echo "<script> alert('Akun tidak ada');</script>";
			}


			
		}

	}

?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Y - Login</title>
</head>
<body>
	<h1>Login</h1>
	<form action="login.php" method="POST">
		<label for="usm">Username:</label>
		<input type="text" id="usm" name="username"><br><br>
		<label for="usm">Password:</label>
		<input type="password" id="pw" name="password"> <br><br>
		<input type="submit" name="login" value="Login">
	</form>
</body>
</html>
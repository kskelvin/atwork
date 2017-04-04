<?php

include('include/db.php');
?>

<?php
	
	if(isset($_POST['submit']))
	{
		$user = $_POST['user'];
		$pass = $_POST['pass'];
		

		$sql="SELECT * FROM user WHERE username = :user and password = :pass";
		
		$stmt =$db->prepare($sql);
		$stmt->execute(['user' => $user ,'pass' => $pass]);

		//untuk mengambil data dari databse
		$row =$stmt->fetch();

		if($stmt->rowcount() == 0)
		{
			echo "<script>alert('Please check your username or password!'); window.location='../login.php'</script>";
		}
		else if($stmt->rowcount() > 0){
			session_start();
			$_SESSION['login'] = 1;
			$_SESSION['id_admin']=$row['id'];
			$_SESSION['role']=$row['role'];
			header('location:../index.php');
		}


	}


?>
<!--File :user_edit_process.php -->
<?php
session_start();
include_once("../admin/include/db.php");

// URL DATA
$id = $_GET['id'];

// Form Data
$username	= $_POST['username'];
$pass		= $_POST['password'];
$role		= 1;


if($pass==NULL){
	$password= $_POST['passwordlama'];
}else{
	$password = $pass;
}

$sql = "UPDATE user SET username=:username, password=:password, role=:role WHERE id=:id";
$stmt = $db->prepare($sql);
$stmt->execute(['username' => $username, 'password' => $password, 'role' => $role, 'id' => $id]);

$_SESSION['pesan']="Data user berhasil diupdate.";
$_SESSION['jenis_pesan'] ="info";
header('Location: ../index.php?page=user');
?>
<!-- #file:profile_edit_process.php -->

<?php

session_start();
include_once("../admin/include/db.php");
// URL DATA
$id1 = $_GET['id'];
$sql1="SELECT * FROM user where id=:id";
$stmt1 = $db->prepare($sql1);
$stmt1->execute(['id' => $id1]);
$row=$stmt1->fetch(PDO::FETCH_ASSOC);
$foto1='../profile/'.$row['pic'];


if(isset($_POST['simpan']))
{
// URL DATA
$id = $_GET['id'];
// Form Data
$username=$_POST['username'];
$pass=$_POST['password'];
$role=$_SESSION['role'];
$foto=$_POST['gambar1'];

//untuk cek pass apakah dia mau update pass / gunakan pass lama
if($pass==NULL)
{
	$password=$_POST['passwordlama'];
}
else
{
	$password=$pass;
}

//untuk cek apakah dia mau update foto atau gunain goto lama
	if($_FILES['gambar']['error'] != 0)
{
	$sql2 = "UPDATE user SET username=:username, password=:password, role=:role, pic=:pic WHERE id=:id";
	$stmt2 = $db->prepare($sql2);
	$stmt2->execute(['username' => $username, 'password' => $password, 'role' => $role, 'pic' =>$foto, 'id' => $id]);
	echo "<script>alert('Profile Berhasil Diperbaharui!'); window.location='../index.php?page=dashboard'</script>";
}
	else{

$imgfile= $_FILES['gambar']['name'];//untuk membaca file
$tmp_dir= $_FILES['gambar']['tmp_name'];//untuk membaca tmp gile
$imgsize= $_FILES['gambar']['size'];//untuk membaca  ukuran file

$ext =strtolower(pathinfo($imgfile,PATHINFO_EXTENSION)); //dapatkan ekstensinya

  $valid=array("jpeg","jpg","png","gif"); //valid ekstension

  $sizeboleh=2*1024*1024; //2mb
  

//Periksa apakah file valid (extensi dan ukuran memenuhi syarat)
if(in_array($ext, $valid) && $imgsize <= $sizeboleh){
  
  $final_path = '../profile/'. $username . ".". $ext;
  unlink($foto1);
  //untuk ubah nama filenya
  move_uploaded_file($tmp_dir,$final_path);
  //untuk pindah ke folder terkait

	$sql1 = "UPDATE user SET username=:username, password=:password, role=:role, pic=:pic WHERE id=:id";
	$stmt1 = $db->prepare($sql1);
	$stmt1->execute(['username' => $username, 'password' => $password, 'role' => $role, 'pic' =>$final_path, 'id' => $id]);
	echo "<script>alert('Profile Berhasil Diperbaharui!'); window.location='../index.php?page=dashboard'</script>";
    

}else{
	echo "<script>alert('Maaf,terjadi kesalahan Profile Tidak Berhasil Diperbaharui!'); window.location='../index.php?page=dashboard'</script>";
	}
}

}
?>
<!--File :user_add_process.php -->

<?php

session_start();
include_once("../admin/include/db.php");

if(isset($_POST['simpan']))
{
$user=$_POST['username'];
$pass=$_POST['password'];
$role=1;

$imgfile= $_FILES['gambar']['name'];//untuk membaca file
$tmp_dir= $_FILES['gambar']['tmp_name'];//untuk membaca tmp gile
$imgsize= $_FILES['gambar']['size'];//untuk membaca  ukuran file

$ext =strtolower(pathinfo($imgfile,PATHINFO_EXTENSION));

  $valid=array("jpeg","jpg","png","gif"); //valid ekstension

  $sizeboleh=2*1024*1024; //2mb
  

//Periksa apakah file valid (extensi dan ukuran memenuhi syarat)
if(in_array($ext, $valid) && $imgsize <= $sizeboleh){
  
  $final_path = '../profile/'. $user . ".". $ext;
  move_uploaded_file($tmp_dir,$final_path);
  //untuk pindah ke folder terkait


      $sql = "INSERT INTO user (username, password, role, pic) VALUES (:username, :password, :role, :pic)";
      $stmt = $db->prepare($sql);
      $stmt->execute(['username' => $user, 'password' => $pass, 'role' => $role, 'pic' => $final_path]);
      // Redirect ke halaman user
        $_SESSION['pesan'] = "User baru berhasil ditambahkan.";
        $_SESSION['jenis_pesan'] = "info";
        header('Location: ../index.php?page=user');
    

  }else{
  $_SESSION['pesan'] = "File foto user tidak valid";
  $_SESSION['jenis_pesan'] = "danger";
  header('Location: ../index.php?page=user');
}
}

?>
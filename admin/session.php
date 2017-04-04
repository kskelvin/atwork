<?php
include("include/db.php");
session_start();

$id=$_SESSION['id_admin'];

$sql="SELECT * FROM user WHERE id = :id_admin";

$stmt=$db->prepare($sql);
//untuk mengirimkan query 

$stmt->execute(['id_admin' => $id]);
//jalankan query
$row=$stmt->fetch(PDO::FETCH_ASSOC);

$user=$row['username'];
$pic=$row['pic'];



?>
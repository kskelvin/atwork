<!--File :user_delete_process.php -->
<?php
include_once("../admin/include/db.php");

//mendapatkan url data
$id=$_GET['id'];

$sql1="SELECT * FROM user where id=:id";
$stmt1 = $db->prepare($sql1);
$stmt1->execute(['id' => $id]);
$row=$stmt1->fetch(PDO::FETCH_ASSOC);
$foto='../profile/'.$row['pic'];
unlink($foto);
//untuk hapus foto dari folder

$sql = "DELETE FROM user WHERE id=:id";
$stmt = $db->prepare($sql);
$stmt->execute(['id'=>$id]);

header('Location: ../index.php?page=user');

?>
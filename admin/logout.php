<?php
// logout
session_start();
$_SESSION['login'] = null;
$_SESSION['id_admin'] = null;
$_SESSION['role'] = null;

header('location:../login.php');
?>
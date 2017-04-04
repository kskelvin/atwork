<?php

try{
	$con= 'mysql:host=localhost;dbname=db-atwork-update';
	$db= new PDO($con,'root','');

}catch(PDOException $e){
	echo $e->getMessage();
	die();
}

?>
<!--file :profile.php -->

<?php

// GET URL DATA
$id = $_GET['id'];

$sql = "SELECT * FROM user WHERE id=:id";
$stmt = $db->prepare($sql);
$stmt->execute(['id'=>$id]);
$row = $stmt->fetch();

?>

<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Dashboard
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="index.php?page=dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>

    <section class="content">
    <?php
    if($_SESSION['role']==0){ 
    ?>
		<h1 class="page-header"><b>Update Profile Staff HRD</b></h1>
	<?php
	}	else if($_SESSION['role']==1){
	?>
		<h1 class="page-header"><b>Update Profile User</b></h1>
	<?php
	}
	?>


	<form class="form-horizontal" role="form" method="post" action="process/profile_edit_process.php?id=<?php echo $row['id'];?>" enctype="multipart/form-data">
			<div class="form-group">
			 			<label for="username" class="col-sm-2 control-label">Username</label>
			 			<div class="col-sm-10">
			 				<input type="text" class="form-control" name="username"  value="<?php echo $row['username']; ?>" />
			 			</div>
			 </div>


			<div class="form-group">
			 			<label for="password" class="col-sm-2 control-label">Password</label>
			 			<div class="col-sm-10">
			 				<input type="password" class="form-control" name="password" value=""/>
			 				<input type="hidden" class="form-control" name="passwordlama" value="<?php echo $row['password']; ?>"/>
			 				
			 			</div>
	 		</div>

	 		<div class="form-group">
	 					<label for="profile" class="col-sm-2 control-label">Profile pic</label>
	 					<div class="col-sm-10">
	 							<p> <img src="profile/<?php echo $row['pic']; ?>" height="150" width="150" /></p>
	 							<input type="file" class="form-control" name="gambar" accept="image/*" value="" />
	 							<input type="hidden" name="gambar1" value="<?php echo $row['pic']; ?>"/>
	 					</div>

	 		</div>

	 		<div class="form-group">
	 			<div class="col-sm-offset-2 col-sm-10">
		 			<!-- col-sm-offset-2 untuk kosongan 2 span pada layar dekstop -->
		 			<button type="submit" name="simpan" class="btn btn-primary">
		 			<span class="glyphicon glyphicon-save "></span>&nbsp; Update
		 			</button>
		 			<a class="btn btn-primary" href="index.php?page=dashboard">
		 			<span class="glyphicon glyphicon-backward"></span>&nbsp; Cancel </a>
		 			
	 		</div>



	</form>


	</section>
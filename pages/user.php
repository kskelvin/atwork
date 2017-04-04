 <!-- file:user.php -->
<?php
$pesan ="";
if(isset($_SESSION['pesan']) && isset($_SESSION['jenis_pesan'])){
  $pesan="<div class='alert alert-$_SESSION[jenis_pesan]'>$_SESSION[pesan]</div>";
  $_SESSION['pesan']=null;
  $_SESSION['jenis_pesan']=null;
}

$sql="SELECT * FROM user WHERE role= 1 ORDER BY username ASC";
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
     
      <h1 class="page-header"><b>User</b></h1>
      <?php echo $pesan; ?>
      <div class="row">

            <div class="col-sm-3 col-md-6 col-lg-10"></div>
            <!-- untuk tombol dengan ikon  -->
            <div class="col-sm-9 col-md-6 col-lg-2">
              <a href="index.php?page=user-add" class="btn btn-info btn-lg">
                 <i class="fa fa-user-plus" aria-hidden="true"></i> Tambah User
              </a>
            </div>

      </div>

      <div class="table-responsive">
          <table class="table table-striped">
              <caption>Data User</caption>
                <thead>
                  <tr>
                      <th>No</th>
                      <th>Username</th>
                      <th>Password</th>
                      <th>Action</th>
                      
                  </tr>
                </thead>
                  <tbody>
                  <?php
                  $i=1;
                  foreach($db->query($sql) as $row){
                  ?>
                    <tr>
                        <td><b><?php echo $i; ?></b></td>
                        <td><b><?php echo $row['username']; ?> </b></td>
                        <td><b>
                        <?php 
                          $password=$row['password'];
                          $password=str_repeat("*", strlen($password));
                          /*fungsi str_repeat("string yang akan diulang",angka pengulangan string) */
                          echo $password;
                         ?> 

                        </b></td>
                        <td>
                        <a href="index.php?page=user-edit&id=<?php echo $row['id']; ?>" class="btn btn-warning btn-xs"><i class="fa fa-edit"></i>&nbsp;Edit</a>
                        <a href="process/user_delete_process.php?id=<?php echo $row['id']; ?>" class="btn btn-danger btn-xs" onclick="return confirm('Are you sure delete this user?');"><i class="fa fa-trash"></i>&nbsp;Delete</a>
                        </td>
                    </tr>
                      <?php
                      $i++;
                      }
                      ?>
                  </tbody>
          </table>

      </div>

  </section>

   
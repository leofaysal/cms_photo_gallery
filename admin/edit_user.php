<?php include("includes/header.php"); ?>
<?php include("includes/photo_library_modal.php"); ?>

<?php if(!$session->is_signed_in()){ redirect("login.php");}?>
<?php
if(empty($_GET['id'])){

  redirect("users.php");
}

 $user = User::find_by_id($_GET['id']);
 if(isset($_POST['update'])){

   if($user) {

    $user->username= $_POST['username'];
    $user->first_name=$_POST['first_name'];
    $user->last_name= $_POST['last_name'];
    $user->password= $_POST['password'];

    if(empty($_FILES['user_image'])) {

      $user->save();
      redirect("users.php");
      $session->message("The user has been updated");
    } else {

      $user->set_file($_FILES['user_image']);
      $user->upload_photo();
      $user->save();


    //  redirect("edit_user.php?id={$user->id}");
    redirect("users.php");
    }


   }

 }

?>

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->


            <?php include("includes/top_nav.php") ?>

            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->

        <?php include("includes/side_nav.php")?>

            <!-- /.navbar-collapse -->

        </nav>

        <div id="page-wrapper">

          <div class="container-fluid">

              <!-- Page Heading -->
              <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                       Change User Profile
                        <small>Subheading</small>
                    </h1>

                    <div class="col-md-6 user_image_box">
                      <a href="#" data-toggle="modal" data-target="#photo-library">
                     <img class="img-responsive" src="<?php echo $user->image_path_placeholder()?>" alt="">
                      </a>


                    </div>

                    <form action="" method="post" enctype="multipart/form-data">

                    <div class="col-md-6">

                      <div class="form-group">

                      <input type="file" name="user_image" >

                      </div>

                      <div class="form-group">

                      <label for="username">Username</label>

                      <input type="text" name="username" class="form-control" value="<?php echo $user->username?>">

                      </div>


                      <div class="form-group">

                      <label for="first_name">First Name</label>

                      <input type="text" name="first_name" class="form-control" value="<?php echo $user->first_name?>">

                      </div>

                      <div class="form-group">

                      <label for="last_name">Last Name</label>

                      <input type="text" name="last_name" class="form-control" value="<?php echo $user->last_name?>">

                      </div>

                      <div class="form-group">

                      <label for="password">Password</label>

                      <input type="password" name="password" class="form-control" value="<?php echo $user->password?>">

                      </div>

                      <a id="user-id" href="delete_user.php?id=<?php echo $user->id?>" class = "btn btn-danger">Delete</a>

                      <input type="submit" name="update" value="Update" class="btn btn-primary pull-right">

                   </div>

                    </form>

                    </div>

                </div>

              <!-- /.row -->

          </div>
          <!-- /.container-fluid -->

        </div>

        <!-- /#page-wrapper -->

  <?php include("includes/footer.php"); ?>

<script type="text/javascript">

jQuery(document).ready(function($){

  var user_href;
  var user_href_splitted;
  var user_id;
  var image_href;
  var image_href_splitted;
  var image_name;
  var photo_id;


$('.modal_thumbnails').click(function() {

$('#set_user_image').prop('disabled', false);

  user_href = $("#user-id").prop('href');
  user_href_splitted = user_href.split("=");
  user_id=user_href_splitted[user_href_splitted.length -1];

 image_src = $(this).prop("src");
 image_href_splitted = image_src.split("/");
 image_name=image_href_splitted[image_href_splitted.length -1];

 photo_id = $(this).attr("data");

 $.ajax({
   url: "includes/ajax_code.php",
   data:{photo_id: photo_id},
   type:"POST",
   success:function(data){
     if(!data.error){
       $("#modal_sidebar").html(data);
     }
   }
 })

});

$('#set_user_image').click(function() {

  $.ajax({

   url: "includes/ajax_code.php",
   data:{image_name: image_name, user_id: user_id},
   type: "POST",
   success:function(data){
     if(!data.error){

      $(".user_image_box a img").prop('src', data);

    }

   }


  }); //end of ajax function


}); // end of modal_thumbnails

}); // end of document ready


</script>

<?php
session_start();
include('db_conn.php');

$menu ="";

$show = "";
$info="";
if (isset($_GET['add'])) {
  $info="";
  if (isset($_SESSION['cart']) && !empty($_SESSION['cart'])) {
    $items = $_SESSION['cart'];
    $cart_items = explode(",",$items);
    if (in_array($_GET['add'],$cart_items)) {
      $info = '<div class="alert alert-danger" role="alert"> Le produit existe déjà !</div>';
    }else{
      $items .= ",".$_GET['add'];
      $_SESSION['cart'] = $items;
      $info = '<div class="alert alert-success" role="alert"> Le produit a été ajouté au panier avec succès !</div>';   
    }  
  }else{
    $item = $_GET['add'];
    $_SESSION['cart'] = $item;
    $info = '<div class="alert alert-success" role="alert"> Le produit a été ajouté au panier avec succès !</div>';
  }
}
if (isset($_GET['id'])) {
  
  $show ="";
  $id =$_GET['id'];
  $sql = "SELECT * FROM `products` WHERE `idProduct`='$id'";
  $stmt = $pdo->query($sql);
  $row = $stmt->fetch();
  if (!empty($row['idProduct'])) {
    $show .= ' <div class="row mx-auto">
    <div class="col-md-5"> 
      <img class="detail-img" src="images/'.$row['photo'].'" alt="">
    </div>
    <div class="col-md-7">
      <h3 class="mb-3 mt-2">'.$row['name'].'</h3>
      <h4 class="price mb-3">€'.$row['price'].'</h4>
      <h5>Marque: <span  class="text-secondary">'.$row['brand'].'</span></h5>
      <h5>Catégorie: <span  class="text-secondary">'.$row['category'].'</span></h5>
      <p>'.$row['description'].'</p>
      <a href="products_detail.php?id='.$row['idProduct'].'&add='.$row['idProduct'].'" class="btn btn-primary">Ajouter au panier</a>
    </div>

  </div>';
  }else{
    $show = '<div class="alert alert-danger" role="alert">
    No Product Present!</div>';
  }
}
?>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/style.css">
    <title>SneakStore</title>
  </head>
  <body>
  <header>
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
          <a class="navbar-brand d-flex align-items-center mx-auto order-2" href="index.php">
          <img src="images/logo.png" alt="" height="70" class="d-inline-block me-2 align-text-top">
        </a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse ms-auto order-3 flex-grow-0" id="navbarText">
            <?php include('navbar.php'); ?>
        </div>
        
    <form class="d-flex me-auto order-1" action="search.php" method="GET">
      <input class="form-control me-2" type="search" name="q" placeholder="Rechercher" aria-label="Search">
      <button class="btn btn-danger" type="submit">Rechercher</button>
    </form>
        </div>
      </nav>
  </header>
    <div class="wrapper">
    <div class="container">
    <div class="section-title">
      <div class="heading my-3">
      <h2>Détails sur le produit</h2>
      <?php echo $info;
      ?>
      </div>
      <?php echo $show;
      ?>
    </div>
  </div>
    </div>
 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <footer class="py-4 mt-4 footer-dark bg-dark">
      
      <p class="text-center text-muted mb-0">© 2021 SneakStore</p>
    </footer>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="assets/js/main.js"></script>
  </body>
</html>
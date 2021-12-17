<?php
session_start();
include('db_conn.php');

$menu = $checkout = "";

if (isset($_SESSION['email'])) {
  
}else{
  header("location:index.php");
  die();
}
$show = $info = "";
  if (isset($_REQUEST['idOrder'])) {
    $idOrder = $_REQUEST['idOrder'];
  $sql = "SELECT * FROM `orderlines` WHERE `idOrder` = '$idOrder'";
  $stmt = $pdo->query($sql);
  $row = $stmt->fetch();
  $show ="";
  $total = 0;
      if (!empty($row)) {
        do {
          $idProduct = $row['idProduct'];
          $sql1 = "SELECT * FROM `products` WHERE `idProduct` = :id";
          $stmt1 = $pdo->prepare($sql1);
          $stmt1->execute(
            array(":id" => $idProduct)
        );
          $row1 = $stmt1->fetch();
          $total += $row['quantity'] * $row1['price'];
            $show .= '
            <tr>
                <td>'.$row1['name'].'</td>
                <td>€ '.$row1['price'].'</td>
                <td>'.$row['quantity'].'</td>
                <th>€ '.$row1['price'] * $row['quantity'].'</th>
            </tr>';
        } while ($row = $stmt->fetch());
        $show .= '
        <tr>
            <th colspan="3" class="text-center"><h4>Total général</h4></th>
            <th><h4>€ '.$total.'</h4></th>
        </tr>';
      }
  } 
?>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
        <div class="heading my-3">
          <h2>Détails de commande</h2>
          </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Nom du produit</th>
                        <th>Prix</th>
                        <th>Quantité</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <?php echo $show; ?>
                </tbody>
            </table>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <footer class="py-4 mt-4 footer-dark bg-dark">
      
      <p class="text-center text-muted mb-0">© 2021 SneakStore </p>
    </footer>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="assets/js/main.js"></script>
  </body>
  </html>
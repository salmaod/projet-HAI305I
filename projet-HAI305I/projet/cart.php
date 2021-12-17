<?php
session_start();
include('db_conn.php');

$menu = $checkout = "";
if (isset($_REQUEST['checkout'])) {
  $email = $_REQUEST['email'];
  $products = $_REQUEST['idProduct'];
  $prices = $_REQUEST['price'];
  $quantity = $_REQUEST['qty'];
  $date = date('Y-m-d');
  $sql = "INSERT INTO `orders` (`email`,`date`,`status`) VALUES (?,?,?)";
  $insert = $pdo->prepare($sql); 
  $insert->execute([$email,$date,0]); 
  $idOrder =$pdo->lastInsertId();
  $i = 0;
  foreach ($products as $value) {
    $qty = $quantity[$i];
    $price = $prices[$i];
    $sql1 = "INSERT INTO `orderlines` (`idOrder`,`idProduct`,`quantity`,`amount`) VALUES (?,?,?,?)";
    $insert1 = $pdo->prepare($sql1); 
    $insert1->execute([$idOrder,$value,$qty,$price]); 
    $i++;
  }
  if ($insert1) {
    $checkout = '<div class="alert alert-success" role="alert">La commande est créée !</div>';
  } else {
    $checkout = '<div class="alert alert-danger" role="alert">Une erreur est survenue !</div>';
  }
  unset($_SESSION['cart']);
}

if (isset($_SESSION['email'])) {
  
}else{
  header("location:index.php");
  die();
}
$show = $info ="";
$info1="";
if (isset($_GET['del_item'])) {
  $del_id = $_GET['del_item'];
  if (isset($_SESSION['cart']) && !empty($_SESSION['cart'])) {
    $cart_items =explode("," ,$_SESSION['cart']) ;
    if ($key= array_search($del_id,$cart_items)!== false) {
      unset($cart_items[$key]);
    }
    $cart_id = implode(",",$cart_items);
    $_SESSION['cart'] = $cart_id;
    $info1 = '<div class="alert alert-success" role="alert">Article retiré avec succès !</div>';
  }
}
if (isset($_GET['empty_cart'])) {
  unset($_SESSION['cart']);
  $info = '<div class="alert alert-success" role="alert">Le panier a été vidé avec succès !</div>';
}


$show = "";
if (isset($_SESSION['cart']) && !empty($_SESSION['cart'])) {
  $cart_items =explode("," ,$_SESSION['cart']) ;
  
$i = 1;
foreach ($cart_items as $item) {
  $sql = "SELECT * FROM `products` WHERE `idProduct`='$item'";
  $stmt = $pdo->query($sql);
  $row = $stmt->fetch();
$quantity = 1;
$show .= '<tr>
<input type="hidden" name="price[]" value="'.$row['price'].'">
<input type="hidden" name="idProduct[]" value="'.$row['idProduct'].'">
<input type="hidden" name="email" value="'.$_SESSION['email'].'">
<td><img src="images/'.$row['photo'].'" alt="img" height="120px"></td>
<td class="mt-5">'.$row['name'].'</td>
<td><input type="text" value="'.$row['price'].'" disabled id="price'.$i.'" ></td>
<td><input type="number" value="'.$quantity.'" mini-value="1" id="qty'.$i.'" onchange="func_total('.$i.')" name="qty[]"></td>
<td colspan="2">€<span id="total'.$i.'" class="total">'.$quantity*$row['price'].'</span></td>
<td><a class="btn btn-danger" href="cart.php?del_item='.$row['idProduct'].'">Retirer</a></td>
</tr>';

$i++;
}
}else{
  $show = '<div class="alert alert-danger" role="alert">Le panier est vide !</div>';
    
}
?>
<!doctype html>
<html lang="en">
  <head>
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
        <div class="section-title">
            <div class="heading my-3">
            <h2>Panier</h2>
            </div>
            </div>
        <form action="cart.php" class="cart-form" method="POST">
          <?php
          echo $info1; 
          echo $info;
          echo $checkout;
          ?>
            <table class="w-100 table">
                    <thead>
                    <tr class="table-dark">
                        <th></th>
                        <th>Nom</th>
                        <th>Prix</th>
                        <th>Qté</th>
                        <th>Total</th>
                        <th colspan ="2">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php echo $show; ?>
                    <tr class="g-total">
                        <td colspan="4" class="text-center">
                           <b> Total général</b>
                        </td>
                        <td colspan="3" ><b>€<span id="g_total">50</span></b></td>
                    </tr>
                    </tbody>
                    <tfoot>
                        <tr class="btn-cart">
                            <td colspan="4" class="text-center"><a href="cart.php?empty_cart" class="btn btn-danger">Vider le panier</a></td>
                            <td colspan="3" class="text-center"><button class="btn btn-success" type="submit" name="checkout">Commander</button></td>
                        </tr>
                    </tfoot>
            </table>
        </form>
          
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
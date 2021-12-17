<?php
session_start();
include('db_conn.php');

$menu ="";
if (isset($_REQUEST['q'])) {
    $q = $_REQUEST['q'];
    $sql = "SELECT * FROM `products` WHERE `name` LIKE '%".$q."%' OR `category` LIKE '%".$q."%' OR `brand` LIKE '%".$q."%' OR `description` LIKE '%".$q."%' OR `price` LIKE '%".$q."%' ORDER BY `idProduct`";
    $stmt = $pdo->query($sql);
    $row = $stmt->fetch();
    $show ="";
    if (!empty($row['idProduct'])) {
        do {
            $show .= ' <div class="col-md-4">
            <div class="card shadow">
            <div class="text-center">
            <a href="products_detail.php?id='.$row['idProduct'].'"><img src="images/'.$row['photo'].'" alt="image" width="100%"></a>
            </div>
            <div class="card-body">
                <a href="products_detail.php?id='.$row['idProduct'].'"><h5 class=" text-dark card-title">'.$row['name'].'</h5></a>
                <p class="card-text">€'.$row['price'].'</p>
            </div>
            </div>
        </div>   ';
        } while ($row = $stmt->fetch());
    }else{
    $info = '<div class="alert alert-danger" role="alert">
    Aucun produit présent !!</div>';
    }
}else{
    header('location:index.php');
}
?>
<!doctype html>
<html lang="en">
  <head>
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
  <div class="container d-flex primo py-4 justify-content-center" data-aos="fade-up">
    <div class="section-title">
      <div class="heading my-3">
        <h2>Résultats pour '<?php echo $q; ?>'</h2>
      </div>
    </div>
</div>
   <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-3">
        <?php 
          echo $show;
        ?>
      </div>
      
   </div>
  </div>
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <footer class="py-4 mt-4 footer-dark bg-dark">
      
      <p class="text-center text-muted mb-0">© 2021 SneakStore, Inc</p>
    </footer> 
  </body>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="assets/js/main.js"></script>
  </html>
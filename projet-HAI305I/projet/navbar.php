<?php

if (isset($_SESSION['email'])) {
    $menu = '<li class="nav-item">
    <a class="nav-link" href="orders.php">Historique</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="logout.php">Déconnexion</a>
  </li>';
  }else{
      $menu = '<li class="nav-item">
      <a class="nav-link" href="signin.php">Se connecter</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="signup.php">Sinscrire</a>
    </li>';
    }
?>

<ul class="navbar-nav mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link"href="index.php">Acceuil</a>
              </li>
                        <li class="nav-item">
                <a class="nav-link" href="cart.php">Panier</a>
              </li>
<?php echo $menu ?>
            </ul>
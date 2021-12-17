-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 17, 2021 at 11:50 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `email` varchar(230) NOT NULL,
  `pass` varchar(230) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`email`, `pass`, `name`, `surname`, `city`, `address`, `telephone`) VALUES
('test@gmail.com', 'test', 'test', 'test', 'france', '67 huq', '0798716567');

-- --------------------------------------------------------

--
-- Table structure for table `orderlines`
--

CREATE TABLE `orderlines` (
  `idOrderLine` int(11) NOT NULL,
  `idOrder` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderlines`
--

INSERT INTO `orderlines` (`idOrderLine`, `idOrder`, `idProduct`, `quantity`, `amount`) VALUES
(1, 1, 2, 1, 300),
(2, 2, 2, 1, 300),
(3, 2, 3, 1, 580),
(4, 3, 1, 1, 450),
(5, 3, 3, 1, 580),
(6, 4, 6, 1, 350),
(7, 5, 6, 1, 350),
(8, 5, 5, 1, 600);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `idOrder` int(11) NOT NULL,
  `date` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`idOrder`, `date`, `email`, `status`) VALUES
(1, '2021-12-14', 'test@gmail.com', 0),
(2, '2021-12-14', 'test@gmail.com', 0),
(3, '2021-12-15', 'test@gmail.com', 0),
(4, '2021-12-17', 'test@gmail.com', 0),
(5, '2021-12-17', 'test@gmail.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `idProduct` int(11) NOT NULL,
  `name` text NOT NULL,
  `brand` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `photo` varchar(230) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`idProduct`, `name`, `brand`, `category`, `description`, `photo`, `price`, `stock`) VALUES
(1, ' Air Jordan 1 Milan ', 'Jordan', 'High', 'Reprenant l\'héritage emblématique du b-ball, cette Air Jordan Air 1 Zoom Comfort pour femme arrive dans un nouveau coloris « Pearl White/Lemon Twist ». Ces J présentent une tige rose pâle en cuir suédé pleine fleur pour un look haut de gamme, avec des détails jaune citron acidulés sur la semelle, le Swoosh et le col. Avec une doublure confortable pour un amorti réactif, cette sneaker classique a une sensation de rodage et une doublure en microfibre pour un confort ultime. La semelle intermédiaire en mousse est douce et flexible, tandis que l\'amorti Zoom Air au talon est chargé par le haut pour une sensation de réactivité. Celles-ci sont dotées d\'une fermeture à lacets et d\'un col mis à jour pour une sensation de sécurité, avec une semelle extérieure en caoutchouc pour une bande de roulement adhérente.', 'product1.png', 100, 50),
(2, 'Nike SB Dunk Red Black', 'Nike', 'Low', 'Un look emblématique revient avec ces baskets Nike Dunk.\r\n\r\n- Dans un coloris Noble Green et Pollen White avec des détails noirs, ces chaussures à profil bas ont une tige en cuir de qualité supérieure conservant les lignes de conception OG des années 80.\r\n\r\n- Elles sont dotées de perforations respirantes et d\'une fermeture à lacets sécurisée.\r\n\r\n- Avec un col bas rembourré, ces baskets reposent sur une semelle intermédiaire légère avec une unité Air-sole pour un amorti de qualité supérieure.\r\n\r\n- Elles ont une bande de roulement en caoutchouc adhérente et sont finies avec le légendaire logo Wings au talon,Jumpman sur la languette et un Swoosh sur les flancs. Attention : cet article est limité à 2 par personne. ', 'product2.png', 300, 50),
(3, 'Nike SB Dunk Multicolors', 'Nike', 'Low', 'Adoptez un look audacieux avec les Dunk Low Disrupt. Cette paire de baskets affiche une semelle oversize dotée d’une outsole en caoutchouc, pour une durabilité optimale. Sa tige en cuir affiche un coloris blanc, rehaussé par des empiècements kaki très modernes.', 'product3.png', 700, 50),
(4, 'Nike SB Dunk Blue Black', 'Nike', 'Low', 'Donne une nouvelle dimension à ta garde-robe en enfilant ces baskets pour enfants Dunk Low de Nike.\r\n- Conçues à l\'origine dans les années 80, ces baskets emblématiques sont disponibles en noir, chrome et gris fer.\r\n- Elles sont taillées dans un cuir véritable et synthétique sur la tige pour un look et une sensation de qualité supérieure et reposent sur une semelle intermédiaire spongieuse pour un confort amorti lorsque tu arpentes les rues.\r\n- Sous le pied, elles sont dotées d\'une semelle en caoutchouc adhérente pour une traction qui te permet de te déplacer avec détermination.', 'product4.png', 450, 50),
(5, 'Air Jordan 1 MidLight Smoke', 'Jordan', 'High', 'Enfilez vous dans un style de cerceau classique des années 80 avec ces baskets. Dans un coloris rose mousse et blanc avec des accents de betterave, ces baskets basses ont une tige en cuir et synthétique pour une tenue durable et luxueuse. Ils comportent des lacets ton sur ton et un col de cheville rembourré pour un ajustement confortable, ainsi que des perforations à l\'avant-pied pour une sensation de respirabilité. Sous le pied, une semelle intermédiaire lisse offre un amorti léger à chaque pas, tandis qu\'une semelle extérieure en caoutchouc adhérente offre une traction essentielle sur le terrain et un look OG. Fini avec la marque Jordan, y compris les légendaires logos Swoosh sur les flancs. ', 'product5.png', 600, 50),
(6, 'Air Jordan 1  Travis Scott', 'Jordan', 'High', 'Cette nouvelle Jordan 1 se compose d’une base en cuir blanc et d’empiècements en suede bleu “universitaire”. Des brandings noirs viennent finir sa silhouette, à l’image du Swoosh et du logo Wings. Coloris inspiré de la carrière universitaire de Michael Jordan à l’Université en Caroline du Nord. Entre 1981 et 1984, M.J fera ses preuves aux côtés des Tar Heels avec qui il remportera en 1982 le titre national.\r\n', 'product6.png', 350, 50),
(7, 'Jordan 1 Retro HighTie Dye', 'Jordan ', 'High', 'Cette sneakers se présente avec une base en cuir blanc, agrémentée par des superpositions en cuir verni noir à la finition carbone. On perçoit un logo Wings blanc ainsi qu’un nouveau branding sur la languette, une semelle blanche combinée à une outsole noire perfectionne le design de Peter Moore.', 'product7.png', 150, 50),
(8, 'Nike Dunk Low Purple Pulse', 'Nike', 'Low ', 'Le géant du sportwear Nike présente sa dernière sortie, une Nike Dunk Low Purple Pulse au look attrayant et très attendue des sneakers Addict. Une version « Lemon » idéale pour passer l’été.  \r\n\r\nElle paraît dans une structure classique en cuir avec un coloris blanc cassé et qui est parsemée d’empiècements en nubuck blanc. Une touche de mauve vient parfaire le swoosh central, lui même est brodé sur le renfort du talon. \r\n\r\nLa silhouette est travaillée à l’aide d’une semelle translucide qui contraste parfaitement avec le rappel de blanc présent sur la semelle intermédiaire. ', 'product8.png', 250, 50),
(9, 'Nike Dunk Dead Bears Yellow', 'Nike', 'Low', 'Développée en collaboration avec l\'iconique groupe de jam de San Francisco, le Grateful Dead x Nike Dunk Low SB \"Yellow Bear\" présente un design unique inspiré de la couverture arrière de \"History of the Grateful Dead, Volume One (Bear\'s Choice)\", un album live sorti à l\'origine en 1973.\r\n\r\nUne finition jaune vif est appliquée sur la partie supérieure en fourrure, renforcée par des couches de suède ton sur ton et montée sur une semelle intermédiaire en mousse jaune assortie.\r\n\r\nDes touches bleues contrastées apparaissent sur le Swoosh déchiqueté, la semelle extérieure en caoutchouc et la langue, cette dernière étant munie d\'une pochette de rangement cachée.', 'product9.png', 850, 50),
(10, 'Air Jordan 1  Blue Black', 'Jordan', 'High', 'Une future paire incontournable sortira d’ici le printemps 2021, la AJordan 1 Retro High White University Blue Black avec une déclinaison de couleurs modernes. \r\n\r\nEn parallèle du coloris University Blue, Air Jordan nous présente une couleur Hyper Royal pour l’arrivée du printemps.  \r\n\r\nLa paire apparaît dans une coupe montante empreinte d’un branding fidèle à celui qu’à imaginé Peter Moore dans les années 1980. L’aspect de cette paire  est doté d’une tige en cuir blanc, de multiples détails en cuir gris notamment le swoosh et des superpositions bleu ciel. L’outsole de cette Air Jordan 1 est grise, associée à une semelle blanche, histoire de parfaire son look. ', 'product10.png', 420, 50),
(11, 'Nike Dunk Retro White Black', 'Nike', 'Low', 'Une sortie qui devrait ravir les sneakers Addict, la Nike Dunk Retro White Black\r\n\r\nL\'empeigne est fabriquée en cuir lisse avec le design iconique des panneaux. Le coloris noir et blanc crée ici un look monochrome simple et sans effort. Le marquage Nike se présente sous la forme de logos Swoosh sur les côtés latéraux et médians, ainsi que d\'autres marques sur la languette et le talon.\r\n\r\nUne semelle intermédiaire classique en caoutchouc blanc est présente sous les pieds, enveloppant la technologie Nike Air qui rend ces chaussures très agréables à porter, même pendant de longues périodes. ', 'product11.png', 220, 50),
(12, ' Air Jordan 1 x Dior ', 'Jordan x Dior', 'High', 'Réduisant encore le gap entre le monde du streetwear et celui du luxe, la Air Jordan 1 High x Dior est issue d\'une large capsule couvrant une variété de conceptions à l’instar de vêtements, accessoires et bien évidemment de sneakers, se retrouvant pour leur part au sein d’un design bas pour la Air Jordan 1 x Dior et d’une version haute pour la Air Jordan 1 x Dior “High”. Le designer Kim Jones s\'est en effet inspiré du modèle emblématique de la marque au Jumpman pour créer une œuvre contemporaine, chic et épurée.\r\n\r\nCette dernière se compose d’une tige blanche et grise en cuir italien agrémenté de légers détails noirs peints à la main. Les deux maisons populaires dans leur secteurs respectifs ont su créer contre toute attente un ovni né d’une recherche travaillée. On retrouve ainsi une languette tissée sur laquelle on peut apercevoir l’inscription Dior, un Swoosh en jacquard Dior Oblique : matière mythique de la maison de luxe et une semelle glacée translucide révélant le logo Dior arborant des ailes noires : emblème phare de chez Jordan.', 'product12.png', 8000, 50);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `orderlines`
--
ALTER TABLE `orderlines`
  ADD PRIMARY KEY (`idOrderLine`),
  ADD KEY `idOrder` (`idOrder`),
  ADD KEY `idProduct` (`idProduct`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`idOrder`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`idProduct`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orderlines`
--
ALTER TABLE `orderlines`
  MODIFY `idOrderLine` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `idOrder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `idProduct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderlines`
--
ALTER TABLE `orderlines`
  ADD CONSTRAINT `orderlines_ibfk_1` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`idOrder`),
  ADD CONSTRAINT `orderlines_ibfk_2` FOREIGN KEY (`idProduct`) REFERENCES `products` (`idProduct`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`email`) REFERENCES `customers` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

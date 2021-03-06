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
(1, ' Air Jordan 1 Milan ', 'Jordan', 'High', 'Reprenant l\'h??ritage embl??matique du b-ball, cette Air Jordan Air 1 Zoom Comfort pour femme arrive dans un nouveau coloris ?? Pearl White/Lemon Twist ??. Ces J pr??sentent une tige rose p??le en cuir su??d?? pleine fleur pour un look haut de gamme, avec des d??tails jaune citron acidul??s sur la semelle, le Swoosh et le col. Avec une doublure confortable pour un amorti r??actif, cette sneaker classique a une sensation de rodage et une doublure en microfibre pour un confort ultime. La semelle interm??diaire en mousse est douce et flexible, tandis que l\'amorti Zoom Air au talon est charg?? par le haut pour une sensation de r??activit??. Celles-ci sont dot??es d\'une fermeture ?? lacets et d\'un col mis ?? jour pour une sensation de s??curit??, avec une semelle ext??rieure en caoutchouc pour une bande de roulement adh??rente.', 'product1.png', 100, 50),
(2, 'Nike SB Dunk Red Black', 'Nike', 'Low', 'Un look embl??matique revient avec ces baskets Nike Dunk.\r\n\r\n- Dans un coloris Noble Green et Pollen White avec des d??tails noirs, ces chaussures ?? profil bas ont une tige en cuir de qualit?? sup??rieure conservant les lignes de conception OG des ann??es 80.\r\n\r\n- Elles sont dot??es de perforations respirantes et d\'une fermeture ?? lacets s??curis??e.\r\n\r\n- Avec un col bas rembourr??, ces baskets reposent sur une semelle interm??diaire l??g??re avec une unit?? Air-sole pour un amorti de qualit?? sup??rieure.\r\n\r\n- Elles ont une bande de roulement en caoutchouc adh??rente et sont finies avec le l??gendaire logo Wings au talon,Jumpman sur la languette et un Swoosh sur les flancs. Attention : cet article est limit?? ?? 2 par personne. ', 'product2.png', 300, 50),
(3, 'Nike SB Dunk Multicolors', 'Nike', 'Low', 'Adoptez un look audacieux avec les Dunk Low Disrupt. Cette paire de baskets affiche une semelle oversize dot??e d???une outsole en caoutchouc, pour une durabilit?? optimale. Sa tige en cuir affiche un coloris blanc, rehauss?? par des empi??cements kaki tr??s modernes.', 'product3.png', 700, 50),
(4, 'Nike SB Dunk Blue Black', 'Nike', 'Low', 'Donne une nouvelle dimension ?? ta garde-robe en enfilant ces baskets pour enfants Dunk Low de Nike.\r\n- Con??ues ?? l\'origine dans les ann??es 80, ces baskets embl??matiques sont disponibles en noir, chrome et gris fer.\r\n- Elles sont taill??es dans un cuir v??ritable et synth??tique sur la tige pour un look et une sensation de qualit?? sup??rieure et reposent sur une semelle interm??diaire spongieuse pour un confort amorti lorsque tu arpentes les rues.\r\n- Sous le pied, elles sont dot??es d\'une semelle en caoutchouc adh??rente pour une traction qui te permet de te d??placer avec d??termination.', 'product4.png', 450, 50),
(5, 'Air Jordan 1 MidLight Smoke', 'Jordan', 'High', 'Enfilez vous dans un style de cerceau classique des ann??es 80 avec ces baskets. Dans un coloris rose mousse et blanc avec des accents de betterave, ces baskets basses ont une tige en cuir et synth??tique pour une tenue durable et luxueuse. Ils comportent des lacets ton sur ton et un col de cheville rembourr?? pour un ajustement confortable, ainsi que des perforations ?? l\'avant-pied pour une sensation de respirabilit??. Sous le pied, une semelle interm??diaire lisse offre un amorti l??ger ?? chaque pas, tandis qu\'une semelle ext??rieure en caoutchouc adh??rente offre une traction essentielle sur le terrain et un look OG. Fini avec la marque Jordan, y compris les l??gendaires logos Swoosh sur les flancs. ', 'product5.png', 600, 50),
(6, 'Air Jordan 1  Travis Scott', 'Jordan', 'High', 'Cette nouvelle Jordan 1 se compose d???une base en cuir blanc et d???empi??cements en suede bleu ???universitaire???. Des brandings noirs viennent finir sa silhouette, ?? l???image du Swoosh et du logo Wings. Coloris inspir?? de la carri??re universitaire de Michael Jordan ?? l???Universit?? en Caroline du Nord. Entre 1981 et 1984, M.J fera ses preuves aux c??t??s des Tar Heels avec qui il remportera en 1982 le titre national.\r\n', 'product6.png', 350, 50),
(7, 'Jordan 1 Retro HighTie Dye', 'Jordan ', 'High', 'Cette sneakers se pr??sente avec une base en cuir blanc, agr??ment??e par des superpositions en cuir verni noir ?? la finition carbone. On per??oit un logo Wings blanc ainsi qu???un nouveau branding sur la languette, une semelle blanche combin??e ?? une outsole noire perfectionne le design de Peter Moore.', 'product7.png', 150, 50),
(8, 'Nike Dunk Low Purple Pulse', 'Nike', 'Low ', 'Le g??ant du sportwear Nike pr??sente sa derni??re sortie, une Nike Dunk Low Purple Pulse au look attrayant et tr??s attendue des sneakers Addict. Une version ?? Lemon ?? id??ale pour passer l?????t??.  \r\n\r\nElle para??t dans une structure classique en cuir avec un coloris blanc cass?? et qui est parsem??e d???empi??cements en nubuck blanc. Une touche de mauve vient parfaire le swoosh central, lui m??me est brod?? sur le renfort du talon. \r\n\r\nLa silhouette est travaill??e ?? l???aide d???une semelle translucide qui contraste parfaitement avec le rappel de blanc pr??sent sur la semelle interm??diaire. ', 'product8.png', 250, 50),
(9, 'Nike Dunk Dead Bears Yellow', 'Nike', 'Low', 'D??velopp??e en collaboration avec l\'iconique groupe de jam de San Francisco, le Grateful Dead x Nike Dunk Low SB \"Yellow Bear\" pr??sente un design unique inspir?? de la couverture arri??re de \"History of the Grateful Dead, Volume One (Bear\'s Choice)\", un album live sorti ?? l\'origine en 1973.\r\n\r\nUne finition jaune vif est appliqu??e sur la partie sup??rieure en fourrure, renforc??e par des couches de su??de ton sur ton et mont??e sur une semelle interm??diaire en mousse jaune assortie.\r\n\r\nDes touches bleues contrast??es apparaissent sur le Swoosh d??chiquet??, la semelle ext??rieure en caoutchouc et la langue, cette derni??re ??tant munie d\'une pochette de rangement cach??e.', 'product9.png', 850, 50),
(10, 'Air Jordan 1  Blue Black', 'Jordan', 'High', 'Une future paire incontournable sortira d???ici le printemps 2021, la AJordan 1 Retro High White University Blue Black avec une d??clinaison de couleurs modernes. \r\n\r\nEn parall??le du coloris University Blue, Air Jordan nous pr??sente une couleur Hyper Royal pour l???arriv??e du printemps.  \r\n\r\nLa paire appara??t dans une coupe montante empreinte d???un branding fid??le ?? celui qu????? imagin?? Peter Moore dans les ann??es 1980. L???aspect de cette paire  est dot?? d???une tige en cuir blanc, de multiples d??tails en cuir gris notamment le swoosh et des superpositions bleu ciel. L???outsole de cette Air Jordan 1 est grise, associ??e ?? une semelle blanche, histoire de parfaire son look. ', 'product10.png', 420, 50),
(11, 'Nike Dunk Retro White Black', 'Nike', 'Low', 'Une sortie qui devrait ravir les sneakers Addict, la Nike Dunk Retro White Black\r\n\r\nL\'empeigne est fabriqu??e en cuir lisse avec le design iconique des panneaux. Le coloris noir et blanc cr??e ici un look monochrome simple et sans effort. Le marquage Nike se pr??sente sous la forme de logos Swoosh sur les c??t??s lat??raux et m??dians, ainsi que d\'autres marques sur la languette et le talon.\r\n\r\nUne semelle interm??diaire classique en caoutchouc blanc est pr??sente sous les pieds, enveloppant la technologie Nike Air qui rend ces chaussures tr??s agr??ables ?? porter, m??me pendant de longues p??riodes. ', 'product11.png', 220, 50),
(12, ' Air Jordan 1 x Dior ', 'Jordan x Dior', 'High', 'R??duisant encore le gap entre le monde du streetwear et celui du luxe, la Air Jordan 1 High x Dior est issue d\'une large capsule couvrant une vari??t?? de conceptions ?? l???instar de v??tements, accessoires et bien ??videmment de sneakers, se retrouvant pour leur part au sein d???un design bas pour la Air Jordan 1 x Dior et d???une version haute pour la Air Jordan 1 x Dior ???High???. Le designer Kim Jones s\'est en effet inspir?? du mod??le embl??matique de la marque au Jumpman pour cr??er une ??uvre contemporaine, chic et ??pur??e.\r\n\r\nCette derni??re se compose d???une tige blanche et grise en cuir italien agr??ment?? de l??gers d??tails noirs peints ?? la main. Les deux maisons populaires dans leur secteurs respectifs ont su cr??er contre toute attente un ovni n?? d???une recherche travaill??e. On retrouve ainsi une languette tiss??e sur laquelle on peut apercevoir l???inscription Dior, un Swoosh en jacquard Dior Oblique : mati??re mythique de la maison de luxe et une semelle glac??e translucide r??v??lant le logo Dior arborant des ailes noires : embl??me phare de chez Jordan.', 'product12.png', 8000, 50);

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

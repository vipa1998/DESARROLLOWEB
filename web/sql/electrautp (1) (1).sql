-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-02-2021 a las 05:04:02
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `electrautp`
--

--
-- Procedimientos
--
DELIMITER @@
DROP PROCEDURE CAMBIA @@
CREATE PROCEDURE electrautp.CAMBIA
(IN `codc` VARCHAR(20), IN `nomc` VARCHAR(20), IN `foto` VARCHAR(50))
UPDATE categorias SET nom_cat=nomc,imagen=foto WHERE id_cat=codc @@ 
DELIMITER ; 

DELIMITER @@
DROP PROCEDURE CAMBIAART @@
CREATE PROCEDURE electrautp.CAMBIAART
(IN `coda` VARCHAR(20), IN `cat` VARCHAR(20), IN `des` VARCHAR(100), IN `pre` DOUBLE(20,2), IN `mar` VARCHAR(15), IN `stk` INT(4), IN `foto` CHAR(50))
UPDATE electrodomesticos SET id_cat=cat,imagen=foto,descrip=des,pre_producto=pre,marca=mar,stk=stk WHERE id_producto=coda @@ 
DELIMITER ; 

DELIMITER @@
DROP PROCEDURE CAMBIAT @@
CREATE PROCEDURE electrautp.CAMBIAT
(IN `codtienda` VARCHAR(10), IN `nomtienda` VARCHAR(20), IN `dirtienda` VARCHAR(30), IN `foto` VARCHAR(60), IN `tel` VARCHAR(10))
UPDATE tienda SET nom_tienda=nomtienda,dir_tienda=dirtienda,imagen=foto,telf=tel WHERE id_tienda=codtienda @@ 
DELIMITER ; 

DELIMITER @@
DROP PROCEDURE SPFACTURA @@
CREATE PROCEDURE electrautp.SPFACTURA
(in codc char(10),in tot numeric(8,1))
BEGIN
declare nro int;
declare fac char(10);
select IFNULL(RIGHT(max(id_factura),4),0)+1  from fac_cabe into nro;
set fac = concat("F",lpad(nro,4,"0"));
insert into fac_cabe values (fac,current_date(),codc,tot);
select fac;
END @@ 
DELIMITER ; 

DELIMITER @@
DROP PROCEDURE SPdetalle @@
CREATE PROCEDURE electrautp.SPdetalle
(IN `fac` CHAR(10), IN `coda` CHAR(10), IN `can` INT(10))
BEGIN
insert into fac_deta values (fac,coda, can);
update electrodomesticos set stk=stk-can where id_producto=coda;
END @@ 
DELIMITER ;

DELIMITER @@
DROP PROCEDURE spAdicion @@
CREATE PROCEDURE electrautp.spAdicion
(IN `nom` CHAR(20), IN `foto` CHAR(50))
begin declare codc char(20);
declare nro int;
select IFNULL(RIGHT(max(id_cat),2),0)+1 into NRO from categorias order by id_cat;
SET codc=CONCAT("C",LPAD(NRO,2,"0"));
insert into categorias values(codc,nom,foto);
select codc;
end @@ 
DELIMITER ; 

DELIMITER @@
DROP PROCEDURE spAdicionTienda @@
CREATE PROCEDURE electrautp.spAdicionTienda
(nom char(20),direccion char(30),foto char(30),tel varchar(10))
begin declare codtienda char(10);
declare nro int;
select IFNULL(RIGHT(max(id_tienda),4),0)+1 into NRO from tienda order by id_tienda;
SET codtienda=CONCAT("T",LPAD(NRO,4,"0"));
insert into tienda values(codtienda,nom,direccion,foto,tel);
select codtienda;
end @@ 
DELIMITER ; 

DELIMITER @@
DROP PROCEDURE spanula @@
CREATE PROCEDURE electrautp.spanula
(IN `CODA` VARCHAR(20))
BEGIN
DECLARE codc CHAR(20);
SELECT id_cat INTO CODc FROM electrodomesticos WHERE id_producto=CODA;
DELETE FROM electrodomesticos WHERE id_producto=CODA;
END @@ 
DELIMITER ; 

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id_admi` varchar(10) NOT NULL,
  `nom_admi` varchar(20) NOT NULL,
  `id_tienda` varchar(10) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `contrasena` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id_admi`, `nom_admi`, `id_tienda`, `usuario`, `contrasena`) VALUES
('A0001', 'Andre Perez', 'T0001', 'andre1@gmail.com', '1234'),
('A0002', 'Pedro Vasquez', 'T0002', 'pedro2@gmail.com', '1234'),
('A0003', 'Luis Benitez', 'T0003', 'luis3@gmail.com', '1234'),
('A0004', 'Carla Montalvo', 'T0004', 'carla4@gmail.com', '1234'),
('A0005', 'Adriana Jimenez', 'T0005', 'adriana5@gmail.com', '1234'),
('A0006', 'Andrea Gonzales', 'T0006', 'andrea6@gmail.com', '1234'),
('A0007', 'Evelyn Martinez', 'T0007', 'evelyn7@gmail.com', '1234'),
('A0008', 'Jorge Vilchez', 'T0008', 'jorge8@gmail.com', '1234'),
('A0009', 'Leonardo Carrion', 'T0009', 'leonardo9@gmail.com', '1234'),
('A0010', 'Ricardo Martinez', 'T0010', 'ricardo10@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_cat` varchar(20) NOT NULL,
  `nom_cat` varchar(20) NOT NULL,
  `imagen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_cat`, `nom_cat`, `imagen`) VALUES
('C01', 'Televisores', 't.png'),
('C02', 'Refrigeradora', 'r.png'),
('C03', 'Blu-Ray', 'b.png'),
('C04', 'Lavadoras', 'l.png'),
('C05', 'Laptops', 'la.png'),
('C06', 'Microondas', 'm.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` varchar(10) NOT NULL,
  `nom_cliente` varchar(20) NOT NULL,
  `dir_cliente` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nom_cliente`, `dir_cliente`) VALUES
('C0001', 'Anthony Acosta', 'Solitario de Sayán 605, San Miguel 15087'),
('C0002', 'Carlos Almeda', 'Urb Mayorazgo de Naranjal II San Martin '),
('C0003', 'Rodrigo Alvarez', 'San Rafael SJL Gobierno Regional de Lima'),
('C0004', 'Jose Angeles', 'Av. Javier Prado Este 3371, San Borja 15'),
('C0005', 'Joaquin Araico', '178, altura de la cuadra 99 de, Avenida '),
('C0006', 'Ana Arteaga', 'Av. Túpac Amaru 5, Carabayllo 15320'),
('C0007', 'Maria Avila', 'Diagonal, Miraflores 15074'),
('C0008', 'Norma Velez', 'Alameda de los Descalzos, Rímac 15093'),
('C0009', 'Lilian Castillo', 'Av. Los Virreyes 2857, Cercado de Lima 1'),
('C0010', 'Melissa Contreras', 'C.C La Rambla, Jiron Centenario 1561, Br');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `electrodomesticos`
--

CREATE TABLE `electrodomesticos` (
  `id_producto` varchar(10) NOT NULL,
  `id_cat` varchar(20) NOT NULL,
  `descrip` varchar(60) NOT NULL,
  `pre_producto` double(20,2) NOT NULL,
  `marca` varchar(15) NOT NULL,
  `stk` int(4) NOT NULL,
  `imagen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `electrodomesticos`
--

INSERT INTO `electrodomesticos` (`id_producto`, `id_cat`, `descrip`, `pre_producto`, `marca`, `stk`, `imagen`) VALUES
('E0001', 'C01', 'TV de 43\" 4K Full UHD', 1700.00, 'LG', 29, 't1.jpg'),
('E0002', 'C01', 'TV de 45\" 4K Full UHD', 2300.00, 'Miray', 24, 't2.jpg'),
('E0003', 'C01', 'TV de 55\" 4K Full UHD', 3700.00, 'Panasonic', 40, 't3.jpg'),
('E0004', 'C01', 'TV de 48\" 4K Full UHD', 4300.00, 'Samsumg', 10, 't4.jpg'),
('E0005', 'C02', 'Refrigeradora con capacidad de 154 Litros', 1000.00, 'Samsumg', 12, 'r1.jpg'),
('E0006', 'C02', 'Refrigeradora con capacidad de 215 Litros', 1500.00, 'Mabe', 5, 'r2.jpg'),
('E0007', 'C03', 'BLU-Ray 4K Ultra HD', 252.00, 'Sony', 10, 'b1.jpg'),
('E0008', 'C03', 'BLU-Ray Region Free Smart WiFi UHD 4K', 450.00, 'Panasonic', 13, 'b2.jpg'),
('E0009', 'C04', 'Lavadora de 10Kg con sistema Aqua Jet', 900.00, 'Mabe', 15, 'l1.jpg'),
('E0010', 'C04', 'Lavadora de 9.5Kg con tina de acero inoxidable', 860.00, 'Samsumg', 21, 'l2,jpg'),
('E0011', 'C06', 'Microondas con capacidad de 28L y potencia de 800W', 355.00, 'Miray', 18, 'm1.jpg'),
('E0012', 'C06', 'Microondas con capacidad de 30L', 399.00, 'Oster', 12, 'm2.jpg'),
('E0013', 'C02', 'Refrigeradora con capacidad de 200 Litros', 1300.00, 'LG', 11, 'r3.jpg'),
('E0014', 'C02', 'Refrigeradora con capacidad de 145 Litros', 990.00, 'Mabe', 6, 'r4.jpg'),
('E0015', 'C06', 'Microondas con capacidad de 25L', 300.00, 'Miray', 20, 'm3.jpg'),
('E0016', 'C06', 'Microondas con capacidad de 29L', 350.00, 'Oster', 15, 'm4.jpg'),
('E0017', 'C05', 'Laptop MateBook 15.6\" 512GB SSD 8GB RAM', 2890.00, 'Huawei', 15, 'la1.jpg'),
('E0018', 'C05', 'Laptop Probook 14\" Intel Core i5-10210U 1TB 8GB RAM', 3599.00, 'HP', 9, 'la2.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fac_cabe`
--

CREATE TABLE `fac_cabe` (
  `id_factura` varchar(10) NOT NULL,
  `fecha` date NOT NULL,
  `id_cliente` varchar(10) NOT NULL,
  `id_tienda` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fac_cabe`
--

INSERT INTO `fac_cabe` (`id_factura`, `fecha`, `id_cliente`, `id_tienda`) VALUES
('F0001', '2021-02-02', 'C0001', 'T0001'),
('F0002', '2021-02-19', 'C0002', 'T0002'),
('F0003', '2021-02-16', 'C0003', 'T0003'),
('F0004', '2021-02-26', 'C0004', 'T0004'),
('F0005', '2021-02-03', 'C0005', 'T0005'),
('F0006', '2021-02-13', 'C0006', 'T0006'),
('F0007', '2021-02-21', 'C0007', 'T0007'),
('F0008', '2021-02-16', 'C0008', 'T0008'),
('F0009', '2021-02-19', 'C0009', 'T0009'),
('F0010', '2021-02-23', 'C0010', 'T0010'),
('F0011', '2021-02-03', 'C0005', 'T0005'),
('F0012', '2021-02-19', 'C0003', 'T0003');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fac_deta`
--

CREATE TABLE `fac_deta` (
  `id_factura` varchar(10) NOT NULL,
  `id_producto` varchar(10) NOT NULL,
  `can_producto` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fac_deta`
--

INSERT INTO `fac_deta` (`id_factura`, `id_producto`, `can_producto`) VALUES
('F0001', 'E0001', 2),
('F0001', 'E0005', 1),
('F0002', 'E0010', 1),
('F0002', 'E0009', 1),
('F0002', 'E0001', 2),
('F0003', 'E0003', 2),
('F0004', 'E0004', 1),
('F0004', 'E0005', 1),
('F0005', 'E0008', 2),
('F0005', 'E0015', 2),
('F0006', 'E0017', 1),
('F0007', 'E0017', 1),
('F0007', 'E0008', 1),
('F0008', 'E0018', 1),
('F0008', 'E0014', 1),
('F0009', 'E0018', 1),
('F0010', 'E0002', 2),
('F0011', 'E0005', 1),
('F0011', 'E0009', 1),
('F0012', 'E0013', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

CREATE TABLE `tienda` (
  `id_tienda` varchar(10) NOT NULL,
  `nom_tienda` varchar(20) NOT NULL,
  `dir_tienda` varchar(30) NOT NULL,
  `imagen_tienda` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tienda`
--

INSERT INTO `tienda` (`id_tienda`, `nom_tienda`, `dir_tienda`, `imagen_tienda`) VALUES
('T0002', 'ElectraUTPSMP', 'San Martin de Porres', '2.jpg'),
('T0003', 'ElectraUTPLUR', 'Lurigancho', '3.jpg'),
('T0004', 'ElectraUTPSBO', 'San Borja', '4.jpg'),
('T0005', 'ElectraUTPCOM', 'Comas', '5.jfif'),
('T0006', 'ElectraUTPCAR', 'Carabayllo', '6.jpg'),
('T0007', 'ElectraUTPMIR', 'Miraflores', '7.jpg'),
('T0008', 'ElectraUTPRIC', 'Rimac', '8.jpg'),
('T0009', 'Hola', '', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_cat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

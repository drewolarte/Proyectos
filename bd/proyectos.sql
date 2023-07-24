-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2022 at 07:14 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proyectos`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrador`
--

CREATE TABLE `administrador` (
  `id_administrador` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre_administrador` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido_administrador` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `contrasena_administrador` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `roles_id_administrador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `administrador`
--

INSERT INTO `administrador` (`id_administrador`, `nombre_administrador`, `apellido_administrador`, `contrasena_administrador`, `roles_id_administrador`) VALUES
('1098727947', 'Sergio Andres', 'Soto Olarte', 'SerSot1098', 1);

-- --------------------------------------------------------

--
-- Table structure for table `coordinador`
--

CREATE TABLE `coordinador` (
  `id_coordinador` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre_coordinador` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido_coordinador` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `contrasena_coordinador` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `roles_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `coordinador`
--

INSERT INTO `coordinador` (`id_coordinador`, `nombre_coordinador`, `apellido_coordinador`, `contrasena_coordinador`, `roles_id`) VALUES
('28427236', 'Abigail', 'Tello', 'AbiTel2842', 2);

-- --------------------------------------------------------

--
-- Table structure for table `docente`
--

CREATE TABLE `docente` (
  `id_docente` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre_docente` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido_docente` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `contrasena_docente` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `roles_id` int(11) NOT NULL,
  `roles_id_evaluador` int(11) DEFAULT NULL,
  `roles_id_director` int(11) DEFAULT NULL,
  `investigacion_id_estudiante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `docente`
--

INSERT INTO `docente` (`id_docente`, `nombre_docente`, `apellido_docente`, `contrasena_docente`, `roles_id`, `roles_id_evaluador`, `roles_id_director`, `investigacion_id_estudiante`) VALUES
('1098247698', 'Ernesto', 'Solano Hernandez', 'ErnSol1098', 6, NULL, NULL, 6),
('1098254785', 'Julian Barney', 'Jaimes Rincon', 'JulJai1098', 6, NULL, 3, 4),
('1098305249', 'Nancy', 'Tavera Castillo', 'NanTav1098', 6, NULL, NULL, 2),
('1098325986', 'Leidy Dayhana', 'Guarin Manrique', 'LeiGua1098', 6, NULL, NULL, 3),
('1098727947', 'Roberto', 'Carvajal Salamanca', 'RobCar1098', 6, 4, NULL, 1),
('1098741852', 'Sergio', 'Suarez Barajas', 'SerSua1098', 6, 4, NULL, 3),
('1098790077', 'Alba', 'Rossi Arocha', 'AlbRos1098', 6, NULL, NULL, 2),
('1098954124', 'Leydi Johana', 'Polo Amador', 'LeyPol1098', 6, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `estudiante`
--

CREATE TABLE `estudiante` (
  `id_estudiante` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre_estudiante` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido_estudiante` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `contrasena_estudiante` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `roles_id` int(11) NOT NULL,
  `semestre_estudiante` int(11) NOT NULL,
  `pago_estudiante` varchar(360) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `estado_idea_anteproyecto_estudiante` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `radicado_idea_anteproyecto_estudiante` varchar(360) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `docente_id_docentedirector` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `anteproyecto_estudiante` varchar(360) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `aprobacion_director_anteproyecto_estudiante` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `estado_anteproyecto_estudiante` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `radicado_anteproyecto_estudiante` varchar(360) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `docente_id_docenteevaluador_anteproyecto` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `aprobacion_evaluador_anteproyecto_estudiante` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `estado_comite_anteproyecto_estudiante` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `radicado_comite_anteproyecto_estudiante` varchar(120) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `proyecto_estudiante` varchar(120) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `aprobacion_director_proyecto_estudiante` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `estado_proyecto_estudiante` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `radicado_proyecto_estudiante` varchar(120) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `docente_id_docenteevaulador_proyecto` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `aprobacion_evaluador_proyecto_estudiante` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `estado_comite_proyecto_estudiante` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `radicado_comite_proyecto_estudiante` varchar(120) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `acta_comite_proyecto_estudiante` varchar(120) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `estudiante`
--

INSERT INTO `estudiante` (`id_estudiante`, `nombre_estudiante`, `apellido_estudiante`, `contrasena_estudiante`, `roles_id`, `semestre_estudiante`, `pago_estudiante`, `estado_idea_anteproyecto_estudiante`, `radicado_idea_anteproyecto_estudiante`, `docente_id_docentedirector`, `anteproyecto_estudiante`, `aprobacion_director_anteproyecto_estudiante`, `estado_anteproyecto_estudiante`, `radicado_anteproyecto_estudiante`, `docente_id_docenteevaluador_anteproyecto`, `aprobacion_evaluador_anteproyecto_estudiante`, `estado_comite_anteproyecto_estudiante`, `radicado_comite_anteproyecto_estudiante`, `proyecto_estudiante`, `aprobacion_director_proyecto_estudiante`, `estado_proyecto_estudiante`, `radicado_proyecto_estudiante`, `docente_id_docenteevaulador_proyecto`, `aprobacion_evaluador_proyecto_estudiante`, `estado_comite_proyecto_estudiante`, `radicado_comite_proyecto_estudiante`, `acta_comite_proyecto_estudiante`) VALUES
('1098727947', 'Sergio', 'Soto', 'SerSot', 5, 9, 'Aprobado', 'Aprobado', 'https://drive.google.com/file/d/1fgt9sb6Li6NESdLRypN20-uEucM_EjBv/view?usp=sharing', '1098254785', 'https://docs.google.com/document/d/1CdX2NEYYFj0rpYGN-ICDAMQoR9DPw6Ws/edit?usp=sharing&ouid=103794221903645411716&rtpof=true&sd=true', 'Aprobado', 'Aprobado', 'https://drive.google.com/file/d/1AdcYbu5uYZHt0akwQmuttQd9-ybj7mmY/view?usp=sharing', '1098727947', 'Aprobado', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('1098790077', 'Jhon Diego', 'Lopez Morales', 'JhoLop1098', 5, 6, 'Aprobado', 'Aprobado', 'https://drive.google.com/file/d/1fgt9sb6Li6NESdLRypN20-uEucM_EjBv/view?usp=sharing', '1098254785', 'https://docs.google.com/document/d/1CdX2NEYYFj0rpYGN-ICDAMQoR9DPw6Ws/edit?usp=sharing&ouid=103794221903645411716&rtpof=true&sd=true', 'Aprobado', 'Aprobado', 'https://drive.google.com/file/d/1AdcYbu5uYZHt0akwQmuttQd9-ybj7mmY/view?usp=sharing', '1098741852', 'Aprobado', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `investigacion`
--

CREATE TABLE `investigacion` (
  `id_investigacion` int(11) NOT NULL,
  `descripcion_investigacion` varchar(60) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `investigacion`
--

INSERT INTO `investigacion` (`id_investigacion`, `descripcion_investigacion`) VALUES
(1, 'Arquitectura y Diseno de Software'),
(2, 'Desarrollo de Software Orientado a la Web'),
(6, 'Industria 4.0'),
(4, 'Mineria de Datos'),
(3, 'Tecnicas Avanzadas para el Desarrollo de Software');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id_roles` int(11) NOT NULL,
  `descripcion_roles` varchar(45) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id_roles`, `descripcion_roles`) VALUES
(1, 'Administrador'),
(2, 'Coordinador'),
(3, 'Director'),
(6, 'Docente'),
(5, 'Estudiante'),
(4, 'Evaluador');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_administrador`),
  ADD KEY `fk_administrador_roles1_idx` (`roles_id_administrador`);

--
-- Indexes for table `coordinador`
--
ALTER TABLE `coordinador`
  ADD PRIMARY KEY (`id_coordinador`),
  ADD KEY `fk_coordinador_roles1_idx` (`roles_id`);

--
-- Indexes for table `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`id_docente`),
  ADD KEY `fk_docente_roles1_idx` (`roles_id_evaluador`),
  ADD KEY `fk_docente_investigacion1_idx` (`investigacion_id_estudiante`),
  ADD KEY `fk_docente_roles2_idx` (`roles_id_director`),
  ADD KEY `fk_docente_roles3_idx` (`roles_id`) USING BTREE;

--
-- Indexes for table `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id_estudiante`),
  ADD KEY `fk_estudiante_roles1_idx` (`roles_id`),
  ADD KEY `fk_estudiante_docente1_idx` (`docente_id_docentedirector`),
  ADD KEY `fk_estudiante_docente2_idx` (`docente_id_docenteevaluador_anteproyecto`),
  ADD KEY `fk_estudiante_docente3_idx` (`docente_id_docenteevaulador_proyecto`);

--
-- Indexes for table `investigacion`
--
ALTER TABLE `investigacion`
  ADD PRIMARY KEY (`id_investigacion`),
  ADD UNIQUE KEY `descripcion_investigacion_UNIQUE` (`descripcion_investigacion`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_roles`),
  ADD UNIQUE KEY `descripcion_roles_UNIQUE` (`descripcion_roles`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `investigacion`
--
ALTER TABLE `investigacion`
  MODIFY `id_investigacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id_roles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `fk_administrador_roles1` FOREIGN KEY (`roles_id_administrador`) REFERENCES `roles` (`id_roles`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `coordinador`
--
ALTER TABLE `coordinador`
  ADD CONSTRAINT `fk_coordinador_roles1` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id_roles`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `docente`
--
ALTER TABLE `docente`
  ADD CONSTRAINT `fk_docente_investigacion1` FOREIGN KEY (`investigacion_id_estudiante`) REFERENCES `investigacion` (`id_investigacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_docente_roles1` FOREIGN KEY (`roles_id_evaluador`) REFERENCES `roles` (`id_roles`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_docente_roles2` FOREIGN KEY (`roles_id_director`) REFERENCES `roles` (`id_roles`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_docente_roles3` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id_roles`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `fk_estudiante_docente1` FOREIGN KEY (`docente_id_docentedirector`) REFERENCES `docente` (`id_docente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estudiante_docente2` FOREIGN KEY (`docente_id_docenteevaluador_anteproyecto`) REFERENCES `docente` (`id_docente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estudiante_docente3` FOREIGN KEY (`docente_id_docenteevaulador_proyecto`) REFERENCES `docente` (`id_docente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estudiante_roles1` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id_roles`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

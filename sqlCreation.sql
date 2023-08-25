-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Gen 30, 2023 alle 01:05
-- Versione del server: 10.4.24-MariaDB
-- Versione PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `astra`
--
CREATE SCHEMA IF NOT EXISTS `astra` DEFAULT CHARACTER SET utf8; 
USE astra ;
-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazione`
--

CREATE TABLE `prenotazione` (
  `idPrenotazione` int(11) NOT NULL,
  `dataInizioPrenotazione` date NOT NULL,
  `dataFinePrenotazione` date NOT NULL,
  `idUtente` int(11) NOT NULL,
  `idStanza` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dump dei dati per la tabella `prenotazione`
--

INSERT INTO `prenotazione` (`idPrenotazione`, `dataInizioPrenotazione`, `dataFinePrenotazione`, `idUtente`, `idStanza`) VALUES
(9, '2023-01-09', '2023-01-19', 6, 6),
(13, '2023-01-22', '2023-01-26', 5, 2),
(16, '2023-01-30', '2023-01-31', 3, 4),
(18, '2023-02-02', '2023-02-18', 7, 14),
(19, '2023-01-30', '2023-02-01', 7, 13),
(20, '2023-02-04', '2023-02-07', 8, 6),
(21, '2023-04-07', '2023-04-12', 8, 8),
(23, '2023-02-04', '2023-02-24', 7, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `recensione`
--

CREATE TABLE `recensione` (
  `idRecensione` int(11) NOT NULL,
  `dataRecensione` date NOT NULL,
  `idUtente` int(11) NOT NULL,
  `votoPulizia` enum('5stellina.png','4stellina.png','3stellina.png','2stellina.png','1stellina.png') COLLATE latin1_general_ci NOT NULL,
  `votoRistorazione` enum('5stellina.png','4stellina.png','3stellina.png','2stellina.png','1stellina.png') COLLATE latin1_general_ci NOT NULL,
  `votoAccoglienza` enum('5stellina.png','4stellina.png','3stellina.png','2stellina.png','1stellina.png') COLLATE latin1_general_ci NOT NULL,
  `rispostaRecensione` varchar(522) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dump dei dati per la tabella `recensione`
--

INSERT INTO `recensione` (`idRecensione`, `dataRecensione`, `idUtente`, `votoPulizia`, `votoRistorazione`, `votoAccoglienza`, `rispostaRecensione`) VALUES
(1, '2023-01-17', 3, '3stellina.png', '4stellina.png', '5stellina.png', 'grazie mille per il suo feedback,\n cercheremo di migliorare la pulizia '),
(18, '2023-01-29', 8, '3stellina.png', '4stellina.png', '4stellina.png', 'spero che torni a ritrovarci'),
(19, '2023-01-30', 7, '4stellina.png', '1stellina.png', '5stellina.png', 'miglioreremo il ristorante');

-- --------------------------------------------------------

--
-- Struttura della tabella `stanza`
--

CREATE TABLE `stanza` (
  `idStanza` int(11) NOT NULL,
  `prezzoAnotte` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `imgStanza` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tagliaStanza` enum('singola','doppia','tripla','quadrupla') COLLATE latin1_general_ci NOT NULL,
  `tipologiaStanza` enum('matrimoniale','suite','vistaMare') COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dump dei dati per la tabella `stanza`
--

INSERT INTO `stanza` (`idStanza`, `prezzoAnotte`, `imgStanza`, `tagliaStanza`, `tipologiaStanza`) VALUES
(2, '85€', 'Bedroom3.png', 'doppia', 'matrimoniale'),
(4, '28€', 'Bedroom7.png', 'quadrupla', 'suite'),
(6, '36€', 'Bedroom4.png', 'doppia', 'suite'),
(8, '36€', 'Bedroom8.png', 'quadrupla', 'matrimoniale'),
(9, '56€', 'Bedroom2.png', 'singola', 'suite'),
(10, '43€', 'Bedroom5.jpg', 'doppia', 'matrimoniale'),
(13, '52€', 'Bedroom.png', 'singola', 'vistaMare'),
(14, '63€', 'Bedroom6.jpg', 'tripla', 'vistaMare');

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `idUtente` int(11) NOT NULL,
  `imgProfilo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `nome` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `cognome` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `dataNascita` date NOT NULL,
  `email` varchar(155) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(512) COLLATE latin1_general_ci NOT NULL,
  `ruolo` enum('gestore','cliente') COLLATE latin1_general_ci NOT NULL DEFAULT 'cliente'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`idUtente`, `imgProfilo`, `nome`, `cognome`, `dataNascita`, `email`, `password`, `ruolo`) VALUES
(3, 'profile-2.jpg', 'Cliente', 'Uno', '2023-01-05', 'cliente@uno', '$2b$10$I6ik4Bu5CQy/a6uNhq6HaORkRzOTYv7du3hCpE3eUqtzmBkmOZYSG', 'cliente'),
(5, 'profile-1.jpg', 'Marawan', 'Emad', '2002-04-09', 'marawan@emad', '$2b$10$ap2rHUSFHyCXfLCMHeWL2egF/CAI8mcHKvQNb4bHioOOZEhspbUda', 'gestore'),
(6, 'profile-3.jpg', 'Brayan', 'Vaccaro', '2000-05-28', 'brayan@vaccaro', '$2b$10$j0b6QDj5tm/owQCSoqzlCuMMooNjwse9/yWboxlFn0.iHjvP6pRp.', 'gestore'),
(7, 'profile-4.jpg', 'Cliente', 'Due', '2022-06-09', 'cliente@due', '$2b$10$k/rMMZwfce5LrYua21c5G.KhIu8O.UMao7CVeAOqOggxNs1VjBPUu', 'cliente'),
(8, 'profile-5.jpg', 'Cliente ', 'Tre', '2016-06-15', 'cliente@tre', '$2b$10$r8nahCePJ8wNX2IriO.Kx.EdXBx/c5oRHag.lT7Ru3OyeRoLWpsa6', 'cliente');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `prenotazione`
--
ALTER TABLE `prenotazione`
  ADD PRIMARY KEY (`idPrenotazione`),
  ADD UNIQUE KEY `dataInizioPrenotazione` (`dataInizioPrenotazione`,`idUtente`) USING BTREE,
  ADD KEY `idStanza` (`idStanza`),
  ADD KEY `idUtente` (`idUtente`);

--
-- Indici per le tabelle `recensione`
--
ALTER TABLE `recensione`
  ADD PRIMARY KEY (`idRecensione`),
  ADD UNIQUE KEY `dataRecensione` (`dataRecensione`,`idUtente`),
  ADD KEY `nUtente` (`idUtente`);

--
-- Indici per le tabelle `stanza`
--
ALTER TABLE `stanza`
  ADD PRIMARY KEY (`idStanza`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`idUtente`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `prenotazione`
--
ALTER TABLE `prenotazione`
  MODIFY `idPrenotazione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT per la tabella `recensione`
--
ALTER TABLE `recensione`
  MODIFY `idRecensione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT per la tabella `stanza`
--
ALTER TABLE `stanza`
  MODIFY `idStanza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `idUtente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `prenotazione`
--
ALTER TABLE `prenotazione`
  ADD CONSTRAINT `idStanza` FOREIGN KEY (`idStanza`) REFERENCES `stanza` (`idStanza`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idUtente` FOREIGN KEY (`idUtente`) REFERENCES `utenti` (`idUtente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `recensione`
--
ALTER TABLE `recensione`
  ADD CONSTRAINT `nUtente` FOREIGN KEY (`idUtente`) REFERENCES `utenti` (`idUtente`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

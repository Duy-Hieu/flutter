SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flutterappaa`
--

-- --------------------------------------------------------

--
-- Table structure for table `userapp`
--
drop table if exists `userapp`;
CREATE TABLE `userapp` (
  `id` int(11) NOT NULL,
  `nameuser` text NOT NULL,
  `passuser` text NOT NUll,
  `gmailuser` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `userapp` (`id`, `nameuser`,`passuser`,`gmailuser`) VALUES
(1, 'adminuser', 'adminuser', 'adminuser@gmail.com');
ALTER TABLE `userapp`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `userapp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
  

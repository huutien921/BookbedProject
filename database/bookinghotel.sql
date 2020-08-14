-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2020 at 06:05 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookinghotel`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `remove_accents` (`str` VARCHAR(250) CHARSET utf8mb4) RETURNS VARCHAR(250) CHARSET latin1 NO SQL
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
	SET str = REPLACE(str,'À','A');
    SET str = REPLACE(str,'Á','A');
    SET str = REPLACE(str,'Â','A');
    SET str = REPLACE(str,'Ã','A');
    SET str = REPLACE(str,'È','E');
    SET str = REPLACE(str,'É','E');
    SET str = REPLACE(str,'Ê','E');
    SET str = REPLACE(str,'Ì','I');
    SET str = REPLACE(str,'Í','I');
    SET str = REPLACE(str,'Ò','O');
    SET str = REPLACE(str,'Ó','O');
    SET str = REPLACE(str,'Ô','O');
    SET str = REPLACE(str,'Õ','O');
    SET str = REPLACE(str,'Ù','U');
    SET str = REPLACE(str,'Ú','U');
    SET str = REPLACE(str,'Ý','Y');
    SET str = REPLACE(str,'à','a');
    SET str = REPLACE(str,'á','a');
    SET str = REPLACE(str,'â','a');
    SET str = REPLACE(str,'ã','a');
    SET str = REPLACE(str,'è','e');
    SET str = REPLACE(str,'é','e');
    SET str = REPLACE(str,'ê','e');
    SET str = REPLACE(str,'ì','i');
    SET str = REPLACE(str,'í','i');
    SET str = REPLACE(str,'ò','o');
    SET str = REPLACE(str,'ó','o');
    SET str = REPLACE(str,'ô','o');
    SET str = REPLACE(str,'õ','o');
    SET str = REPLACE(str,'ù','u');
    SET str = REPLACE(str,'ú','u');
    SET str = REPLACE(str,'ý','y');
    SET str = REPLACE(str,'Ă','A');
    SET str = REPLACE(str,'ă','a');
    SET str = REPLACE(str,'Đ','D');
    SET str = REPLACE(str,'đ','d');
    SET str = REPLACE(str,'Ĩ','I');
    SET str = REPLACE(str,'ĩ','i');
    SET str = REPLACE(str,'Ũ','U');
    SET str = REPLACE(str,'ũ','u');
    SET str = REPLACE(str,'Ơ','O');
    SET str = REPLACE(str,'ơ','o');
    SET str = REPLACE(str,'Ư','U');
    SET str = REPLACE(str,'ư','u');
    SET str = REPLACE(str,'Ạ','A');
    SET str = REPLACE(str,'ạ','a');
    SET str = REPLACE(str,'Ả','A');
    SET str = REPLACE(str,'ả','a');
    SET str = REPLACE(str,'Ấ','A');
    SET str = REPLACE(str,'ấ','a');
    SET str = REPLACE(str,'Ầ','A');
    SET str = REPLACE(str,'ầ','a');
    SET str = REPLACE(str,'Ẩ','A');
    SET str = REPLACE(str,'Ẩ','A');
    SET str = REPLACE(str,'Ẫ','A');
    SET str = REPLACE(str,'ẫ','a');
    SET str = REPLACE(str,'Ậ','A');
    SET str = REPLACE(str,'ậ','a');
    SET str = REPLACE(str,'Ắ','A');
    SET str = REPLACE(str,'ắ','a');
    SET str = REPLACE(str,'Ằ','A');
    SET str = REPLACE(str,'ằ','a');
    SET str = REPLACE(str,'Ẳ','A');
    SET str = REPLACE(str,'ẳ','a');
    SET str = REPLACE(str,'Ẵ','A');
    SET str = REPLACE(str,'ẵ','a');
    SET str = REPLACE(str,'Ặ','A');
    SET str = REPLACE(str,'ặ','a');
    SET str = REPLACE(str,'Ẹ','E');
    SET str = REPLACE(str,'ẹ','e');
    SET str = REPLACE(str,'Ẻ','E');
    SET str = REPLACE(str,'ẻ','e');
    SET str = REPLACE(str,'Ẽ','E');
    SET str = REPLACE(str,'ẽ','e');
    SET str = REPLACE(str,'Ế','E');
    SET str = REPLACE(str,'ế','e');
    SET str = REPLACE(str,'Ề','E');
    SET str = REPLACE(str,'ề','e');
    SET str = REPLACE(str,'Ể','E');
    SET str = REPLACE(str,'ể','e');
    SET str = REPLACE(str,'Ễ','E');
    SET str = REPLACE(str,'ễ','e');
	SET str = REPLACE(str,'Ệ','E');
	SET str = REPLACE(str,'ệ','e');
	SET str = REPLACE(str,'Ỉ','I');
	SET str = REPLACE(str,'ỉ','i');
	SET str = REPLACE(str,'Ị','I');
	SET str = REPLACE(str,'ị','i');
	SET str = REPLACE(str,'Ọ','O');
	SET str = REPLACE(str,'ọ','o');
	SET str = REPLACE(str,'Ỏ','O');
	SET str = REPLACE(str,'ỏ','o');
	SET str = REPLACE(str,'Ố','O');
	SET str = REPLACE(str,'ố','o');
	SET str = REPLACE(str,'Ồ','O');
	SET str = REPLACE(str,'ồ','o');
	SET str = REPLACE(str,'Ổ','O');
	SET str = REPLACE(str,'ổ','o');
	SET str = REPLACE(str,'Ỗ','O');
	SET str = REPLACE(str,'ỗ','o');
	SET str = REPLACE(str,'Ộ','O');
	SET str = REPLACE(str,'ộ','o');
	SET str = REPLACE(str,'Ớ','O');
	SET str = REPLACE(str,'ớ','o');
	SET str = REPLACE(str,'Ờ','O');
	SET str = REPLACE(str,'ờ','o');
	SET str = REPLACE(str,'Ở','O');
	SET str = REPLACE(str,'ở','o');
	SET str = REPLACE(str,'Ỡ','O');
	SET str = REPLACE(str,'ỡ','o');
	SET str = REPLACE(str,'Ợ','O');
	SET str = REPLACE(str,'ợ','o');
	SET str = REPLACE(str,'Ụ','U');
	SET str = REPLACE(str,'ụ','u');
	SET str = REPLACE(str,'Ủ','U');
	SET str = REPLACE(str,'ủ','u');
	SET str = REPLACE(str,'Ứ','U');
	SET str = REPLACE(str,'ứ','u');
	SET str = REPLACE(str,'Ừ','U');
	SET str = REPLACE(str,'ừ','u');
	SET str = REPLACE(str,'Ử','U');
	SET str = REPLACE(str,'ử','u');
	SET str = REPLACE(str,'Ữ','U');
	SET str = REPLACE(str,'ữ','u');
	SET str = REPLACE(str,'Ự','U');
	SET str = REPLACE(str,'ự','u');
	


    RETURN str;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE `about` (
  `id` int(11) NOT NULL,
  `address` varchar(250) NOT NULL,
  `country` varchar(250) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `facebook` varchar(75) DEFAULT NULL,
  `youtube` varchar(75) DEFAULT NULL,
  `instagram` varchar(75) DEFAULT NULL,
  `twitter` varchar(75) DEFAULT NULL,
  `android` varchar(75) DEFAULT NULL,
  `ios` varchar(75) DEFAULT NULL,
  `image` varchar(40) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`id`, `address`, `country`, `email`, `phone`, `name`, `facebook`, `youtube`, `instagram`, `twitter`, `android`, `ios`, `image`, `status`) VALUES
(1, 'Nguyen Kiem , Phu Nhuan , Tp HCM', 'Viet Nam', 'bookbed@gmail.com', '0947443148', 'BookBed Online', 'https://www.facebook.com/huutien2020/', 'https://www.facebook.com/huutien2020/', 'https://www.facebook.com/huutien2020/', 'https://www.facebook.com/huutien2020/', 'https://www.facebook.com/huutien2020/', 'https://www.facebook.com/huutien2020/', 'footer-bg.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `fullname` varchar(250) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `type` varchar(250) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `avatar` varchar(250) DEFAULT NULL,
  `identitycard` varchar(25) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `updated` date DEFAULT NULL,
  `point` double DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `username`, `password`, `fullname`, `birthday`, `email`, `address`, `type`, `gender`, `avatar`, `identitycard`, `score`, `status`, `created`, `updated`, `point`) VALUES
(2, 'superadmin', '$2a$10$uCamWdBo2me8pwRARwQhtO9uwYzj75vjp.Gm7q0vR/FijwgcedHHa', 'Super Admin', '1998-01-01', 'superadmin@gmail.com', 'Ha Noi', NULL, 'Male', 'avatar1.PNG', '123456987963', 0, 1, NULL, NULL, 0),
(3, 'tien_user', '$2a$10$kBp/FVGfZK5jXupJ80owl.S7gmA0UYEvQjA37/eZE/czfrrBKXmxe', 'Thanh truc v444', '1998-01-15', 'huutien922@gmail.com', 'Ca mau', NULL, 'male', '15072020155919IMG_1500.JPG', '12345633322', 0, 1, NULL, NULL, 0),
(4, 'thuan_super', '$2a$10$uCamWdBo2me8pwRARwQhtO9uwYzj75vjp.Gm7q0vR/FijwgcedHHa', 'Nguyen Thuan', '1998-01-01', 'huutien92@gmail.com', 'Vinh tau', NULL, 'Male', 'avatar1.PNG', '381839139', 0, 1, NULL, NULL, 0),
(5, 'lam_employee', '$2a$10$i4Ci8SApa5tglJQ4jog9cuCeSri0MA3SRBDMkimxIQus.8Oo49yaC', 'Nguyen Thuan', '2020-07-12', 'huutien9@gmail.com', 'Vinh tau', '', 'Female', '10122019233714', '381839139', 0, 1, NULL, NULL, 0),
(6, 'Huutien', '$2a$10$Z8UL0O4y1eQnHYZDK7W.JeQwR6t/4qf0BNc21kqhqxUPrIN6m.gmS', 'Tien', '2021-04-12', 'huutien922@gmail.com', 'ca mau', '', 'Female', 'avatar1.PNG', '7414585205252', NULL, 1, '2019-12-08', NULL, 0),
(7, 'lam', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'hoang lam', '2019-10-12', 'lam@gmail.com', 'hochiminh city', '', 'Female', 'avatar1.PNG', '', 123, 1, '2019-12-08', NULL, 0),
(8, 'nguyenhoang', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'nguyenlam', '2000-12-11', 'nguyenlam@gmail.com', 'XTT, HM, HCM, VN', NULL, 'Male', 'default.png', '5464563463456', 100, 1, '2019-12-08', NULL, 0),
(9, 'khongcoten', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'khong co ten', '1999-09-20', 'khongcoten@gmail.com', 'Da Lat, Lam Dong', NULL, 'Male', 'default.png', '12314784456', 4534, 1, '2019-12-07', NULL, 0),
(10, 'skyboyno1', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'boy vip no 1', '1997-07-13', 'skyboyno1@gmail.com', 'Quan1, HCM', NULL, 'Male', 'default.png', '123123654', 3221, 1, '2019-11-07', NULL, 0),
(11, 'sktfaker', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'skt faker', '1997-07-13', 'sktfaker@gmail.com', 'Seoul, Korea', NULL, 'Male', 'default.png', '1423543523', 345345, 1, '2019-02-20', NULL, 0),
(12, 'sktlam', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'skt lam', '1997-07-13', 'skt lam@gmail.com', 'HM HCM', NULL, 'Male', 'default.png', '76746433', 234, 1, '2019-06-08', NULL, 0),
(13, 'sontungmtp', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'son tung mtp', '1997-07-13', 'sontungmtp@gmail.com', 'hai phong', NULL, 'Male', 'default.png', '731355235', 234231, 1, '2019-05-01', NULL, 0),
(14, 'snopdogg', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'snop dogg', '1997-07-05', 'snopdogg@gmail.com', 'A me ri ca', NULL, 'Male', 'default.png', '5634623424', 345235, 1, '2019-11-01', NULL, 0),
(15, 'padorupadoru', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'padoru padoru', '1997-07-05', 'padorupadoru@gmail.com', 'tokyo japan', NULL, 'Female', 'default.png', '236547567567', 23451, 1, '2019-12-02', NULL, 0),
(16, 'Atoria', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'Atoria', '1997-07-05', 'Atoria@gmail.com', 'kyoto japan', NULL, 'Female', 'default.png', '54646342142457', 867, 1, '2019-10-15', NULL, 0),
(17, 'noname', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'noname', '1997-07-05', 'noname@gmail.com', 'canada', NULL, 'Male', 'default.png', '67856896', 5675, 1, '2019-09-15', NULL, 0),
(18, 'padoru', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'padoru', '1997-07-05', 'padoru@gmail.com', 'japan', NULL, 'Female', 'default.png', '97869679678968', 653, 1, '2019-08-15', NULL, 0),
(19, 'jack', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'jack', '1997-07-05', 'jack@gmail.com', 'HCM VN', NULL, 'Male', 'default.png', '644567654643', 45623, 1, '2019-07-05', NULL, 0),
(20, 'megumin', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'megumin', '1997-07-05', 'megumin@gmail.com', 'konoshubarashi', NULL, 'Female', 'default.png', '967979', 678, 1, '2019-06-01', NULL, 0),
(21, 'winner62zz', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'tre trau', '1997-07-05', 'winer62@gmail.com', 'HM HCM VN', NULL, 'Male', 'default.png', '967979324', 125, 1, '2019-05-11', NULL, 0),
(22, 'thebestvung', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'trum truong', '1994-07-02', 'trumtruong@gmail.com', 'TayNinh, VN', NULL, 'Male', 'default.png', '96797932443', 12532, 1, '2019-04-13', NULL, 0),
(23, 'cutibestjizz', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'best fizz', '1994-07-02', 'cutithai@gmail.com', 'TVM, VN', NULL, 'Male', 'default.png', '96797932443', 129, 1, '2019-03-13', NULL, 0),
(24, 'tambestdarius', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'best darius', '1994-07-02', 'tamdarius@gmail.com', 'TVM, VN', NULL, 'Male', 'default.png', '96797932442', 532, 1, '2019-02-13', NULL, 0),
(25, 'mid24', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'hide on bust', '1994-07-02', 'faker@gmail.com', 'korea', NULL, 'Male', 'default.png', '96797932442', 532231, 0, '2019-01-13', NULL, 0),
(26, 'donanchum', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'do nan chum', '1994-07-02', 'donanchum@gmail.com', 'A me ri ca', NULL, 'Male', 'default.png', '967979324422', 532231342, 1, '2019-12-24', NULL, 0),
(27, 'CoThamKoVe', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'Co tham ko ve', '1994-07-02', 'cotham@gmail.com', 'ko ve nen ko biet dang o dau', NULL, 'Female', 'default.png', '111345352432', 123, 1, '2019-12-04', NULL, 0),
(28, 'BacPhan', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'bac phan', '1994-07-02', 'bacphan@gmail.com', 'VN', NULL, 'Male', 'default.png', '96797932442', 234, 1, '2019-12-13', NULL, 0),
(29, 'HongNhan', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'Hong Nhan', '1994-07-02', 'HongNhan@gmail.com', 'VN', NULL, 'Male', 'default.png', '96797932442', 234, 1, '2019-12-13', NULL, 0),
(30, 'SongGio', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'Song Gio', '1994-07-02', 'SongGio@gmail.com', 'VN', NULL, 'Male', 'default.png', '96797932442', 234, 1, '2019-12-13', NULL, 0),
(31, 'NoiNayCoAnh', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'Noi Nay Co Anh', '1994-07-02', 'NoiNayCoAnh@gmail.com', 'VN', NULL, 'Male', 'default.png', '9679793212', 2342, 1, '2019-12-13', NULL, 0),
(32, 'Lac Troi', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'Lac Troi', '1994-07-02', 'Lac Troi@gmail.com', 'VN', NULL, 'Male', 'default.png', '96797932122', 234212, 1, '2019-12-13', NULL, 0),
(33, 'ChayNgayDi', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'Chay Nga yDi', '1994-07-02', 'ChayNgayDi@gmail.com', 'VN', NULL, 'Male', 'default.png', '96745332', 232, 1, '2019-12-13', NULL, 0),
(34, 'SheNevarKnow', '$2a$10$yC9y/KuNGtMvMrKT/qk0muvMvIgUJAPLsTugi8vf53cbngdju.z1i', 'SheNevarKnow', '1994-07-02', 'SheNevarKnow@gmail.com', 'VN', NULL, 'Female', 'default.png', '967453322', 232231, 1, '2019-12-13', NULL, 0),
(35, 'emp', '$2a$10$t14SrXDL..XvZNC4KjIZr.sgaByMWDcLFakQ9M4yvnwYOnmcrGt6K', 'emp', '2020-08-12', 'empppppppppppppppppppppppppppppp@gmail.com', 'address', '', 'Male', 'default.png', '32523514354234234', NULL, 1, '2019-12-10', NULL, 0),
(36, 'emp2', '$2a$10$j6GsE03YWBFq/scdIaD6/.C794PCc9w2izBdzUuKdJltJeutRSrC6', '123', '2020-08-12', '123@gmail.com', '123', '123', 'Male', '10122019233511', '32523514354234234', NULL, 0, '2019-12-10', NULL, 0),
(37, 'daoko', '$2a$10$5edLzKwv9P3ZlA60wdMDNOi0UHtBJsuK8x8o4AQa5f58BG2pbIwDq', 'daoko', NULL, 'daoko123@gmail.com', NULL, NULL, 'Female', 'default.png', NULL, NULL, 1, '2019-10-11', NULL, 0),
(38, 'daoko2', '$2a$10$23ZdpCFBuU/5Geimb99b1.B1C5Kv7vqpTOrCDw8PG/epSVCVTGEVi', '123', NULL, '12321321313', NULL, NULL, 'Male', 'default.png', NULL, NULL, 1, '2019-09-11', NULL, 0),
(40, 'test', '$2a$10$l3P9bOXEp4nqnlZcImPp3OPrGnmQKvD/9yqrW3atdJwWgmJX0KLJK', 'testtttt', NULL, 'test@gmail.com', NULL, NULL, 'Male', 'default.png', NULL, NULL, 1, '2019-08-12', NULL, 0),
(41, 'tt', '$2a$10$YIwYGdMLbLNnenguZ6QmjeYdRCzfTc1S3ghaH7QkEx8ejpG/wGirq', 'tt', NULL, 'tt', NULL, NULL, 'Male', 'default.png', NULL, NULL, 1, '2019-12-14', NULL, 0),
(42, 'tien_user2', '$2a$10$SoIuKpTfsQfh13aMI6a4z.yq9jld4zMGJRTzzj5zRNEptUVS30gVG', '123', NULL, '33', NULL, NULL, 'Male', 'default.png', NULL, NULL, 1, '2019-07-15', NULL, 0),
(43, 'ttt', '$2a$10$Z85GdJ70kO8crso5kKepEOJYQYMCNAqJ2cW0XhZ2all7hFvOKU5Yi', 'ttt', NULL, 'ttt', NULL, NULL, 'Male', 'default.png', NULL, NULL, 1, '2019-06-17', NULL, 0),
(44, 'user1111', '$2a$10$94u19MALKRM5NIY92HPt3u3yuv2dm4YshEDtpe0eNi9HubpXFC.ye', '123', NULL, '12343534525235@gmail.com', '', NULL, 'Male', '20122019132542photo-1477959858617-67f85cf4f1df.jpg', '', NULL, 1, '2019-05-20', NULL, 0),
(45, 'user2222', '$2a$10$viWzBGMoSRTgTWt6n7XIPuUHN1ZTGt36YURE3WSrZlB5wzYAngDEO', 'user2222', NULL, 'erwgdfgddfgsdgfgsdg@gmail.com', NULL, NULL, 'Male', 'default.png', NULL, NULL, 1, '2019-04-20', NULL, 0),
(46, 'Khachhang1', '$2a$10$14G0gOAPponR1O/FETkQV.T/R8BxU84bSI16yitHtFgrVLjKe/mKm', 'Khachhang1', NULL, 'khach1@gmail.com', NULL, NULL, 'Male', 'default.png', NULL, NULL, 1, '2019-03-21', NULL, 0),
(47, 'Khachhang2', '$2a$10$ZVUkX2pfrBaqWt98DTBl4.LxRUVx0.yx4MY5XkcvgGHL96iakvVyS', 'Khach2', NULL, 'khach2@gmail.com', NULL, NULL, 'Female', 'default.png', NULL, NULL, 1, '2019-02-21', NULL, 0),
(48, 'Khachhang3', '$2a$10$o6MAZ.yYGXFbnvPNGOu3JejPvgpy1xfvokkNh4CuBw2967rzVpVIa', 'Khach3', NULL, 'khach3@gmail.com', NULL, NULL, 'Male', 'default.png', NULL, NULL, 1, '2019-07-21', NULL, 0),
(49, 'Khachhang4', '$2a$10$PABY8hkh9q2/ii2pi1z0EuBO0vvSuoLw8joQvb2TD7ssOFtpnMczq', 'Khachhang4', NULL, 'khach4@gmail.com', NULL, NULL, 'Female', 'default.png', NULL, NULL, 1, '2019-05-21', NULL, 0),
(50, 'Khachhang5', '$2a$10$qvA0XIpDGeWk3A4nIfb/EeQE9qARE74kpXa/pxE4n69XMBcd7ovpu', 'Khachhang5', NULL, 'khach5@gmail.com', NULL, NULL, 'Male', 'default.png', NULL, NULL, 1, '2019-12-21', NULL, 0),
(51, 'Khachhang6', '$2a$10$g2uBoi12wXHJa0QMQdRFl.jjLVkC3JcktFZ2lncPSa8u4SoxR5yfO', 'Khachhang6', NULL, 'khach6@gmail.com', NULL, NULL, 'Male', 'default.png', NULL, NULL, 1, '2019-05-21', NULL, 0),
(52, 'Khachhang7', '$2a$10$B4oRlnpoySUZujm/kDN6TOZuFMTovhE3XUMsaBseg9.onylfd5Yam', 'Nguyen Thuant22adf', NULL, 'khach7@gmail.com', NULL, NULL, 'Male', 'default.png', NULL, NULL, 1, '2019-02-21', NULL, 0),
(53, 'tttttt', '$2a$10$CKmVdnHJ/VsrkxOJJGqa1etvgokLYE9et7tBZPyR2oMNi2iATRRKe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 'tttttt4', '$2a$10$.R4tI.BcEui1bcuNe7IYx.vI/GHyrLr5fD8OAWrRfBjxZHc8QHiBm', NULL, NULL, 'huutien924@gmail.com', NULL, NULL, NULL, 'default.png', NULL, NULL, NULL, '2020-08-02', NULL, 0),
(59, 'tttttt5', '$2a$10$URLdJgZxL6u9ArA79mWFDO8ltdUBPNkJwS9ZesMD0.k6xVm2USoiy', NULL, NULL, 'huutien92pgmail.com', NULL, NULL, NULL, 'default.png', NULL, NULL, 1, '2020-08-02', NULL, 0),
(60, 'tttttt6', '$2a$10$DApqceKIa/KowPzPnjJmH.Ud/Tsd6.J4H3InFdsyLlb/9QK035rzy', NULL, NULL, 'huutien92gmail.com', NULL, NULL, NULL, 'default.png', NULL, NULL, NULL, '2020-08-02', NULL, 0),
(61, 'tttttt7', '$2a$10$h3VQvhGXeti2eyfEHgMvVus.kDzM4AgBna.x3T2qHlHipP6///mCC', NULL, NULL, 'huutien921@gma', NULL, NULL, NULL, 'default.png', NULL, NULL, 1, '2020-08-02', NULL, 0),
(62, 'tttttt8', '$2a$10$vtdc9RJZX/L6KmWtb5XdE.x8sbs2y1PhZlgvlzp7qrqSbIl80SQKe', NULL, NULL, 'huutien92@gmail.com', NULL, NULL, NULL, 'default.png', NULL, NULL, 1, '2020-08-02', NULL, 0),
(63, 'tttttt9', '$2a$10$qO8YuYaOi6FA2LkHMt0iieKmLC1RSkm60zzZqUDNsaOOlMXdycoe2', NULL, NULL, 'huutien921@g', NULL, NULL, NULL, 'default.png', NULL, NULL, 1, '2020-08-02', NULL, 0),
(64, 'tttttt0', '$2a$10$SRO.1Lp5nGTyWoN5aZ6cReZYntmMk0O.lnp2Kkfr7mkc9kUXZ4/d6', NULL, NULL, 'huutien92@gmail.com', NULL, NULL, NULL, 'default.png', NULL, NULL, 1, '2020-08-02', NULL, 0),
(65, 'tttttt66', '$2a$10$xyh.8Gpflrk1D2WIQOiklucWs9aAptrw05kVpRHYG8RbXBq2/vZY.', NULL, NULL, 'huutien@gmail.com', NULL, NULL, NULL, 'default.png', NULL, NULL, NULL, '2020-08-02', NULL, 0),
(66, 'hhhhhhh', '$2a$10$nmQ.ucV/nSugVmTx0a8koejVOtJ0u1Bl.rEvSEaRdGtaUzr6lH.3a', NULL, NULL, 'huutien92@gmail.com', NULL, NULL, NULL, 'default.png', NULL, NULL, 1, '2020-08-03', NULL, 0),
(67, 'jjjj', '$2a$10$PT5yOdK6vX9ziB76LnQPo.QkW2fjswa.kBwm.IUEeD9IxThTEMu4O', NULL, NULL, 'huutien92\\@gmail.com', NULL, NULL, NULL, 'default.png', NULL, NULL, NULL, '2020-08-03', NULL, 0),
(68, 'nguyen', '$2a$10$CB8eei.RADfxfX59wHrWy.COYN564My9MyWo9eoU0KliHiPSJ12.S', NULL, NULL, 'huutien92gmail.com', NULL, NULL, NULL, 'default.png', NULL, NULL, NULL, '2020-08-03', NULL, 0),
(69, 'iiiiii', '$2a$10$.ENhLJpqEey/g1g4AEv1Bud9HOfk.zI8ISZc9xVUm0qUWuxV9/uWK', NULL, NULL, 'huutien921@gmai', NULL, NULL, NULL, 'default.png', NULL, NULL, NULL, '2020-08-03', NULL, 0),
(70, 'tttttttt', '$2a$10$twyukxbeuJzzz72K1IHLHeqqFml4FzIn9Q02C5Bq1j7Q/cX5z8WGy', NULL, NULL, 'huutien9\\', NULL, NULL, NULL, 'default.png', NULL, NULL, NULL, '2020-08-03', NULL, 0),
(71, 'iuiui', '$2a$10$V4C1MmeadsJt63ZcfLlvpeD6ZBFddgrhH8N5I4mPJa.QcJPWCn6eq', NULL, NULL, 'huutien921@gmail.', NULL, NULL, NULL, 'default.png', NULL, NULL, NULL, '2020-08-03', NULL, 0),
(72, 'kljklj', '$2a$10$2WtRbB.N8n9MXC5B0gMytu8t.Xk5FRvKsgEkFJ1nxfwzdAtgaGUX6', NULL, NULL, 'huutien921@gmail.com', NULL, NULL, NULL, 'default.png', NULL, NULL, NULL, '2020-08-03', NULL, 0),
(73, 'ssss', '$2a$10$mf6zOlcZWzuxJqyWutekSeefiNgwP83w43Ji6tsLlce0bLgY7C3nW', NULL, NULL, 'huutien921s@gmail.com', NULL, NULL, NULL, 'default.png', NULL, NULL, NULL, '2020-08-03', NULL, 0),
(74, 'ddd', '$2a$10$e1l0ysDvwNb/4f.aiC0yeuUToDKsP1POb6//0yR5cJRL7PN/akVTy', NULL, NULL, 'huutien921dddds@gmail.com', NULL, NULL, NULL, 'default.png', NULL, NULL, NULL, '2020-08-03', NULL, 0),
(75, 'ddddd', '$2a$10$3x0vHxN0b4PtRNw70ad8M.vHXA/Zwl4XSk.qgCeY0JaZApZHS5pL.', NULL, NULL, 'huutien92f1s@gmail.com', NULL, NULL, NULL, 'default.png', NULL, NULL, NULL, '2020-08-03', NULL, 0),
(76, 'huuti', '$2a$10$ED6v.U3cR.b2Qib1.9D.yulsBZLvjHr5wrixyCTSow6GiW9.LpNfG', NULL, NULL, 'huutien921sd@gmail.comd', NULL, NULL, NULL, 'default.png', NULL, NULL, NULL, '2020-08-03', NULL, 0),
(77, 'dsfsdfs', '$2a$10$6Fb9nUR79hgb6qiNOWnhROsKLWTvPfVOq9k/xbT1gV9p7DfEJ0Mry', NULL, NULL, 'huutien921ds@gmail.com', NULL, NULL, NULL, 'default.png', NULL, NULL, NULL, '2020-08-03', NULL, 0),
(78, 'dgfery', '$2a$10$MzHQEhghjl5Cd98QrsMhHevOYaz717Fm81VEK/FjtESONwavkUBUm', NULL, NULL, 'huutien921ddds@gmail.com', NULL, NULL, NULL, 'default.png', NULL, NULL, NULL, '2020-08-03', NULL, 0),
(79, 'fghf', '$2a$10$pYuFNV9oDz.CVRd/euYkI.UQML5F9lLqtzEVtWfQeMGRO4.ziQ1W.', NULL, NULL, 'huutien92ddd1s@gmail.com', NULL, NULL, NULL, 'default.png', NULL, NULL, NULL, '2020-08-03', NULL, 0),
(80, 'tien9', '$2a$10$IGNlD6Db7G0BeIZ94ZvmE.BJuqqkexG58GHH08GS39ODDHyMsTWKK', NULL, NULL, 'huutien921@gma.com', NULL, NULL, NULL, 'default.png', NULL, NULL, 1, '2020-08-05', NULL, 0),
(81, 'danthy', '$2a$10$uCamWdBo2me8pwRARwQhtO9uwYzj75vjp.Gm7q0vR/FijwgcedHHa', 'Nguyen Tran Dan Thy', '1999-01-15', 'thytran.251299@gmail.com', 'Vinh Long', NULL, 'male', '0608202018290600001IMG_00001_BURST20200620134326.jpg', '123123123123', NULL, 1, '2020-08-05', NULL, 0),
(82, 'nguyentien', '$2a$10$k8zcxukSx2bQVMnU.l8pyuwalDPRaJhQxtskKVeCve6J9dK3eGTKW', NULL, NULL, 'huutien921@gmail.com', NULL, NULL, NULL, 'default.png', NULL, NULL, 1, '2020-08-10', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bed_type`
--

CREATE TABLE `bed_type` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bed_type`
--

INSERT INTO `bed_type` (`id`, `name`, `status`) VALUES
(1, 'single', 1),
(2, 'queen', 1),
(3, 'team', 1),
(4, 'double', 1);

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `content` longtext,
  `account_id` int(11) NOT NULL,
  `src` varchar(250) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `title`, `content`, `account_id`, `src`, `created`, `id_category`, `status`) VALUES
(1, '8 Best hotel in Dubai that you don\'t miss out', '            <h2 class="mb-3">It is a long established fact a reader be distracted</h2>\n            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio deserunt molestiae voluptates soluta architecto tempora.</p>\n            <p>\n              <img src="images/image_6.jpg" alt="" class="img-fluid">\n            </p>\n            <p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!</p>\n            <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>\n            <p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic non? Debitis commodi aut, adipisci.</p>\n            <p>\n            \n            </p>\n            <p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim veniam, modi rem maiores.</p>\n            <p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro explicabo soluta commodi libero voluptatem similique id quidem? Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia laboriosam harum excepturi ea.</p>\n            <p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae numquam nam ab voluptatibus culpa, tenetur recusandae!</p>\n            <p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit. Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p>\n           ', 5, 'image_1.jpg', '2019-11-30', NULL, 1),
(2, 'Share 4 ideal destinations for the winter 2019', '            <h2 class="mb-3">It is a long established fact a reader be distracted</h2>\n            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio deserunt molestiae voluptates soluta architecto tempora.</p>\n            <p>\n              <img src="images/image_6.jpg" alt="" class="img-fluid">\n            </p>\n            <p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!</p>\n            <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>\n            <p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic non? Debitis commodi aut, adipisci.</p>\n            <p>\n            \n            </p>\n            <p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim veniam, modi rem maiores.</p>\n            <p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro explicabo soluta commodi libero voluptatem similique id quidem? Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia laboriosam harum excepturi ea.</p>\n            <p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae numquam nam ab voluptatibus culpa, tenetur recusandae!</p>\n            <p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit. Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p>\n           ', 5, 'image_2.jpg', '2019-11-30', 1, 1),
(3, '5 best restauran in Dubai that you don\'t miss out', '            <h2 class="mb-3">It is a long established fact a reader be distracted</h2>\n            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio deserunt molestiae voluptates soluta architecto tempora.</p>\n            <p>\n              <img src="images/image_6.jpg" alt="" class="img-fluid">\n            </p>\n            <p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!</p>\n            <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>\n            <p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic non? Debitis commodi aut, adipisci.</p>\n            <p>\n            \n            </p>\n            <p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim veniam, modi rem maiores.</p>\n            <p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro explicabo soluta commodi libero voluptatem similique id quidem? Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia laboriosam harum excepturi ea.</p>\n            <p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae numquam nam ab voluptatibus culpa, tenetur recusandae!</p>\n            <p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit. Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p>\n           ', 5, 'image_3.jpg', '2019-11-30', 1, 1),
(4, 'Share 10 experience of traveling abroad', '            <h2 class="mb-3">It is a long established fact a reader be distracted</h2>\n            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio deserunt molestiae voluptates soluta architecto tempora.</p>\n            <p>\n              <img src="images/image_6.jpg" alt="" class="img-fluid">\n            </p>\n            <p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!</p>\n            <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>\n            <p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic non? Debitis commodi aut, adipisci.</p>\n            <p>\n            \n            </p>\n            <p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim veniam, modi rem maiores.</p>\n            <p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro explicabo soluta commodi libero voluptatem similique id quidem? Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia laboriosam harum excepturi ea.</p>\n            <p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae numquam nam ab voluptatibus culpa, tenetur recusandae!</p>\n            <p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit. Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p>\n           ', 5, 'image_4.jpg', '2019-11-30', 1, 1),
(5, 'Share 10 experience of traveling abroad', '<h1>Share 10 experience of traveling </h1>\nabroadShare 10 experience of traveling abroadShare 10 experience of traveling abroadShare 10 experience of traveling abroadShare 10 experience of traveling abroadShare 10 experience of traveling abroadShare 10 experience of traveling abroad', 5, 'image_1.jpg', '2019-11-30', 1, 0),
(6, 'How to booking on Bookbed?', '            <h2 class="mb-3">It is a long established fact a reader be distracted</h2>\n            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio deserunt molestiae voluptates soluta architecto tempora.</p>\n            <p>\n              <img src="images/image_6.jpg" alt="" class="img-fluid">\n            </p>\n            <p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!</p>\n            <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>\n            <p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic non? Debitis commodi aut, adipisci.</p>\n            <p>\n            \n            </p>\n            <p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim veniam, modi rem maiores.</p>\n            <p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro explicabo soluta commodi libero voluptatem similique id quidem? Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia laboriosam harum excepturi ea.</p>\n            <p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae numquam nam ab voluptatibus culpa, tenetur recusandae!</p>\n            <p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit. Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p>\n           ', 5, 'image_1.jpg', '2019-12-10', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE `card` (
  `id` int(11) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `value` double NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category_blog`
--

CREATE TABLE `category_blog` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_blog`
--

INSERT INTO `category_blog` (`id`, `name`, `image`, `description`, `status`) VALUES
(1, 'Du lich', 'dulich.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et.', 1),
(2, 'Du lich2', 'dulich.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et.', 1),
(3, 'Du lich3', 'dulich.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et.', 1),
(4, 'Du lich4', 'dulich.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et.', 1),
(5, 'Du lich5', 'dulich.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et.', 1),
(6, 'Du lich6', 'dulich.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `email` varchar(40) NOT NULL,
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `created` date NOT NULL,
  `id_order` int(11) DEFAULT NULL,
  `id_type` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `title`, `content`, `created`, `id_order`, `id_type`, `status`) VALUES
(4, 'TIEN', 'huutien921@gmail.com', '3333', '33333', '2020-08-11', NULL, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `contact_type`
--

CREATE TABLE `contact_type` (
  `id` int(11) NOT NULL,
  `name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_type`
--

INSERT INTO `contact_type` (`id`, `name`, `status`) VALUES
(1, 'Vấn đề về đối tác', 1),
(2, 'Vấn đề về đặt phòng', 1),
(3, 'Vấn đề về thanh toán', 1);

-- --------------------------------------------------------

--
-- Table structure for table `coppon_hotel`
--

CREATE TABLE `coppon_hotel` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `sale` double DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coppon_hotel`
--

INSERT INTO `coppon_hotel` (`id`, `name`, `sale`, `status`) VALUES
(1, 'envet 11', 70, 1),
(2, 'sale Manh', 50, 1),
(3, 'sale 20', 20, 1),
(4, 'TTTTWWW', 10, 1),
(5, 'ok', 20, 1),
(6, '6', 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `coppon_room`
--

CREATE TABLE `coppon_room` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `sale` double DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coppon_room`
--

INSERT INTO `coppon_room` (`id`, `name`, `sale`, `status`) VALUES
(111, 'salevn', 10, 1),
(123, '333', 33, 1),
(128, 'SADFGH', 2, 1),
(129, 'Nha dat lanh', 20, 1),
(131, 'ok', 22, 1),
(134, '33', 3, 1),
(139, '20', 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `credit_card`
--

CREATE TABLE `credit_card` (
  `id` int(11) NOT NULL,
  `name_card` varchar(250) NOT NULL,
  `card_number` varchar(20) NOT NULL,
  `expires_on` varchar(250) NOT NULL,
  `id_type` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `default_card` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `credit_card`
--

INSERT INTO `credit_card` (`id`, `name_card`, `card_number`, `expires_on`, `id_type`, `id_account`, `default_card`, `status`) VALUES
(22, 'NGUYEN HUU TIEN', '342434234223423', '01/2020', 2, 81, 1, 1),
(23, 'SDSA', '123123131231231', '01/2020', 1, 81, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `email`
--

CREATE TABLE `email` (
  `id` int(11) NOT NULL,
  `emailsend` varchar(50) NOT NULL,
  `title` varchar(500) DEFAULT NULL,
  `content` text,
  `status` tinyint(1) NOT NULL,
  `account_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `evaluate`
--

CREATE TABLE `evaluate` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `number_of_stars` int(11) DEFAULT '3',
  `content` text,
  `created` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `image` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_vietnamese_ci,
  `address_full` varchar(500) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `ward` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `city` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `provincial` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `wifi` tinyint(1) DEFAULT NULL,
  `parking` tinyint(1) DEFAULT NULL,
  `spa` tinyint(1) DEFAULT NULL,
  `gym` tinyint(1) DEFAULT NULL,
  `car_rental` tinyint(1) DEFAULT NULL,
  `airport_transfer` tinyint(1) DEFAULT NULL,
  `free_breakfast` tinyint(1) DEFAULT NULL,
  `swimming_pool` tinyint(1) DEFAULT NULL,
  `elevator` tinyint(1) DEFAULT NULL,
  `receptionist` tinyint(1) DEFAULT NULL,
  `air_conditioner` tinyint(1) DEFAULT NULL,
  `free_cancellation` tinyint(1) DEFAULT NULL,
  `pay_at_hotel` tinyint(1) DEFAULT NULL,
  `assembly_facilites` tinyint(1) DEFAULT NULL,
  `driveway` tinyint(1) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `id_ac_employee` int(11) DEFAULT NULL,
  `starrating_id` int(11) NOT NULL,
  `id_coppon_hotel` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`id`, `name`, `image`, `description`, `address_full`, `ward`, `city`, `provincial`, `country`, `wifi`, `parking`, `spa`, `gym`, `car_rental`, `airport_transfer`, `free_breakfast`, `swimming_pool`, `elevator`, `receptionist`, `air_conditioner`, `free_cancellation`, `pay_at_hotel`, `assembly_facilites`, `driveway`, `account_id`, `id_ac_employee`, `starrating_id`, `id_coppon_hotel`, `status`) VALUES
(1, 'Vườn Dau Hotel1', 'room-6.jpg', 'Far far away, behind the word mountains, far from the countries Vokalia and Consonantia', '250 Mau Than, Phuong 12 , Da Lat , Lam Dong', 'Phuong 12', 'Đà Lạt', 'Lam Dong', 'Viet Nam', 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 4, 5, 2, 4, 1),
(17, 'Victoria', 'room-6.jpg', '<p>Victoria</p>', 'Phan Thiet, Victoria', 'Victoria', 'Phan Thiet', 'Mui ne', 'Viet Nam', 1, 0, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 10, 5, 1, 3, 0),
(21, 'Bui Chuoi Hotel', 'room-6.jpg', '', '5/7B ap Xuan Thoi Son', 'Xuan Thoi son', 'Ho Chi Minh', 'Hoc Mon', 'Viet Nam', 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 7, NULL, 2, NULL, 1),
(26, 'Tre 2', 'room-6.jpg', '<p>sss</p>', 'Ha Noi', 'Pho giay', 'Pho giay', 'Pho giay', 'Pho giay', 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 40, 5, 4, NULL, 0),
(29, 'Da lat View', 'room-6.jpg', '<p>\r\n\r\nVery clean. The family was great, and the son was helpful and friendly.\r\n\r\n<br></p>', '222  Mau Than, Phuong 12 , Da Lat , Lam Dong', 'Phuong 12', 'Đà Lạt', 'Lam Dong', 'Viet Nam', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 5, 3, NULL, 1),
(30, 'Bien Xanh', 'room-6.jpg', '<p>\r\n\r\n</p><div><div><div><div><div><div><pre>As a coastal hotel in Da Nang, A La Carte always impresses visitors with its bold design of modern French architecture and sophisticated western-style interiors, taking white as the main color. Each bedroom here brings a separate living space, with views overlooking the beautiful blue sea. The highlight here is the overflow swimming pool on the hotel\'s rooftop.</pre></div></div></div></div></div></div><p></p>', ' Vo Nguyen Giap, Phuoc My, Son Tra and Da Nang', 'Phuoc My', ' Da Nang', ' Da Nang', 'Viet Nam', 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 3, 5, 2, 6, 1),
(31, 'Da Lat Hotel', 'room-6.jpg', 'Da Lat Hotel is a hotel hostel established in 2017 with 26 rooms of different sizes to suit the needs of customers. System of modern equipment, air-conditioner, television, tables and chairs made from wood, wifi and other services to take tourists to visit the tourist destinations. Designed and decorated in a royal style that is luxurious and noble. The equipment and rooms of the guest house - the hotel are very comfortable and modern to bring satisfaction and comfort to customers during their stay in the hotel room.\r\n', '250 Mau Than, Phuong 12 , Da Lat , Lam Dong', 'Phuong 12', 'Đà Lạt', 'Lam Dong', 'Viet Nam', 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 4, 5, 1, NULL, 0),
(32, 'Villa Dela', 'room-6.jpg', '<p>Villa <i>sach se thoang mat,</i> co <u>hoi boi rieng</u>, gan pho co <b>Hoi An</b>, <b>Cau Rong</b>, phong sach se, yen tinh</p>', 'Villa Dela Danang, Da Nang', 'phuong 10', 'Đà Lạt', 'Lam Dong', 'Viet Nam', 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 44, 5, 3, NULL, 1),
(33, 'Aroma Building Da Nang', 'room-6.jpg', '<p>Phong<b> sach se</b> <u>thoang mat</u>, <i><b>view dep</b></i>, <small>gan bien</small>, <u>nhan vien phuc vu tan tinh</u>, chu dao, <i>mien phi huy phong,</i>&nbsp;</p>', 'Duong so 2, F10, toa nha aroma , Da Nang', 'so 2', 'Da Nang', 'Da nang', 'Viet Nam', 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 45, 5, 2, NULL, 1),
(34, 'Villa Delag 2', 'room-6.jpg', '<p>Nhan vien phuc vu tan tinh, chu dao, chuan khach san <b><i><u><small></small></u></i></b></p><p></p><blockquote><b><i><u><small>5 sao</small></u></i></b></blockquote><p></p>, le tan 24/7, p<i>hong sach s</i>e, <u>view dep</u><p></p>', 'Villa Dela Danang, duong so 3, f9, Da Nang', 'so 3', 'Đà Lạt', 'Lam Dong', 'Viet Nam', 1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1, 44, 5, 2, 5, 1),
(35, 'Vuon Dau Hotel1', 'room-6.jpg', '<h1>toi ten</h1><p>Nguyen Huu<u> Tien</u><br></p><h1></h1>', '250 Mau Than, Phuong 12 , Da Lat , Lam Dong', 'Phuong 12', 'Đà Lạt', 'Lam Dong', 'Viet Nam', 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 4, 5, 2, 4, 1),
(36, 'Victoria', 'room-6.jpg', '<p>Victoria</p>', 'Phan Thiet, Victoria', 'Victoria', 'Phan Thiet', 'Mui ne', 'Viet Nam', 1, 0, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 10, 5, 1, 3, 0),
(37, 'Bui Chuoi Hotel', 'room-6.jpg', '', '5/7B ap Xuan Thoi Son', 'Xuan Thoi son', 'Ho Chi Minh', 'Hoc Mon', 'Viet Nam', 1, 1, 0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 7, NULL, 2, NULL, 1),
(38, 'Tre 2', 'room-6.jpg', '<p>sss</p>', 'Ha Noi', 'Pho giay', 'Pho giay', 'Pho giay', 'Pho giay', 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 40, 5, 4, NULL, 0),
(39, 'Da lat View', 'room-6.jpg', '<p>\r\n\r\nVery clean. The family was great, and the son was helpful and friendly.\r\n\r\n<br></p>', '222  Mau Than, Phuong 12 , Da Lat , Lam Dong', 'Phuong 12', 'Đà Lạt', 'Lam Dong', 'Viet Nam', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 5, 3, NULL, 1),
(40, 'Bien Xanh', 'room-6.jpg', '<p>\r\n\r\n</p><div><div><div><div><div><div><pre>As a coastal hotel in Da Nang, A La Carte always impresses visitors with its bold design of modern French architecture and sophisticated western-style interiors, taking white as the main color. Each bedroom here brings a separate living space, with views overlooking the beautiful blue sea. The highlight here is the overflow swimming pool on the hotel\'s rooftop.</pre></div></div></div></div></div></div><p></p>', ' Vo Nguyen Giap, Phuoc My, Son Tra and Da Nang', 'Phuoc My', ' Da Nang', ' Da Nang', 'Viet Nam', 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 3, 5, 2, 6, 1),
(41, 'Da Lat Hotel', 'room-6.jpg', 'Da Lat Hotel is a hotel hostel established in 2017 with 26 rooms of different sizes to suit the needs of customers. System of modern equipment, air-conditioner, television, tables and chairs made from wood, wifi and other services to take tourists to visit the tourist destinations. Designed and decorated in a royal style that is luxurious and noble. The equipment and rooms of the guest house - the hotel are very comfortable and modern to bring satisfaction and comfort to customers during their stay in the hotel room.\r\n', '250 Mau Than, Phuong 12 , Da Lat , Lam Dong', 'Phuong 12', 'Đà Lạt', 'Lam Dong', 'Viet Nam', 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 4, 5, 1, NULL, 0),
(42, 'Villa Dela', 'room-6.jpg', '<p>Villa <i>sach se thoang mat,</i> co <u>hoi boi rieng</u>, gan pho co <b>Hoi An</b>, <b>Cau Rong</b>, phong sach se, yen tinh</p>', 'Villa Dela Danang, Da Nang', 'phuong 10', 'Đà Lạt', 'Lam Dong', 'Viet Nam', 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 44, 5, 3, NULL, 1),
(43, 'Aroma Building Da Nang', 'room-6.jpg', '<p>Phong<b> sach se</b> <u>thoang mat</u>, <i><b>view dep</b></i>, <small>gan bien</small>, <u>nhan vien phuc vu tan tinh</u>, chu dao, <i>mien phi huy phong,</i>&nbsp;</p>', 'Duong so 2, F10, toa nha aroma , Da Nang', 'so 2', 'Da Nang', 'Da nang', 'Viet Nam', 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 45, 5, 2, NULL, 1),
(44, 'Villa Delag 2', 'room-6.jpg', '<p>Nhan vien phuc vu tan tinh, chu dao, chuan khach san <b><i><u><small></small></u></i></b></p><p></p><blockquote><b><i><u><small>5 sao</small></u></i></b></blockquote><p></p>, le tan 24/7, p<i>hong sach s</i>e, <u>view dep</u><p></p>', 'Villa Dela Danang, duong so 3, f9, Da Nang', 'so 3', 'Da lat', 'Lam Dong', 'Viet Nam', 1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1, 44, 5, 2, 5, 1),
(45, 'Villa Dela', 'room-6.jpg', '<p>Villa <i>sach se thoang mat,</i> co <u>hoi boi rieng</u>, gan pho co <b>Hoi An</b>, <b>Cau Rong</b>, phong sach se, yen tinh</p>', 'Villa Dela Danang, Da Nang', 'phuong 10', 'Da lat', 'Lam Dong', 'Viet Nam', 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 44, 5, 3, NULL, 1),
(46, 'Aroma Building Da Nang', 'room-6.jpg', '<p>Phong<b> sach se</b> <u>thoang mat</u>, <i><b>view dep</b></i>, <small>gan bien</small>, <u>nhan vien phuc vu tan tinh</u>, chu dao, <i>mien phi huy phong,</i>&nbsp;</p>', 'Duong so 2, F10, toa nha aroma , Da Nang', 'so 2', 'Da Nang', 'Da nang', 'Viet Nam', 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 45, 5, 2, NULL, 1),
(47, 'Villa Delag 2', 'room-6.jpg', '<p>Nhan vien phuc vu tan tinh, chu dao, chuan khach san <b><i><u><small></small></u></i></b></p><p></p><blockquote><b><i><u><small>5 sao</small></u></i></b></blockquote><p></p>, le tan 24/7, p<i>hong sach s</i>e, <u>view dep</u><p></p>', 'Villa Dela Danang, duong so 3, f9, Da Nang', 'so 3', 'Da lat', 'Lam Dong', 'Viet Nam', 1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1, 44, 5, 2, 5, 1),
(48, 'Vuon Dau Hotel2', 'room-6.jpg', '<h1>toi ten</h1><p>Nguyen Huu<u> Tien</u><br></p><h1></h1>', '250 Mau Than, Phuong 12 , Da Lat , Lam Dong', 'Phuong 12', 'Da Lat', 'Lam Dong', 'Viet Nam', 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 4, 5, 2, 4, 1),
(49, 'Da lat View', 'room-6.jpg', '<p>\r\n\r\nVery clean. The family was great, and the son was helpful and friendly.\r\n\r\n<br></p>', '222  Mau Than, Phuong 12 , Da Lat , Lam Dong', 'Phuong 12', 'Da Lat', 'Lam Dong', 'Viet Nam', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 5, 3, NULL, 1),
(50, 'Villa Dela', 'room-6.jpg', '<p>Villa <i>sach se thoang mat,</i> co <u>hoi boi rieng</u>, gan pho co <b>Hoi An</b>, <b>Cau Rong</b>, phong sach se, yen tinh</p>', 'Villa Dela Danang, Da Nang', 'phuong 10', 'Da lat', 'Lam Dong', 'Viet Nam', 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 44, 5, 3, NULL, 1),
(51, 'Villa Delag 2', 'room-6.jpg', '<p>Nhan vien phuc vu tan tinh, chu dao, chuan khach san <b><i><u><small></small></u></i></b></p><p></p><blockquote><b><i><u><small>5 sao</small></u></i></b></blockquote><p></p>, le tan 24/7, p<i>hong sach s</i>e, <u>view dep</u><p></p>', 'Villa Dela Danang, duong so 3, f9, Da Nang', 'so 3', 'Da lat', 'Lam Dong', 'Viet Nam', 1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1, 44, 5, 2, 5, 1),
(52, 'Da lat View', 'room-6.jpg', '<p>\r\n\r\nVery clean. The family was great, and the son was helpful and friendly.\r\n\r\n<br></p>', '222  Mau Than, Phuong 12 , Da Lat , Lam Dong', 'Phuong 12', 'Da Lat', 'Lam Dong', 'Viet Nam', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 5, 3, NULL, 1),
(53, 'Da lat View', 'room-6.jpg', '<p>\r\n\r\nVery clean. The family was great, and the son was helpful and friendly.\r\n\r\n<br></p>', '222  Mau Than, Phuong 12 , Da Lat , Lam Dong', 'Phuong 12', 'Da Lat', 'Lam Dong', 'Viet Nam', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 5, 3, NULL, 1),
(54, 'Villa Dela', 'room-6.jpg', '<p>Villa <i>sach se thoang mat,</i> co <u>hoi boi rieng</u>, gan pho co <b>Hoi An</b>, <b>Cau Rong</b>, phong sach se, yen tinh</p>', 'Villa Dela Danang, Da Nang', 'phuong 10', 'Da lat', 'Lam Dong', 'Viet Nam', 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 44, 5, 3, NULL, 1),
(55, 'Aroma Building Da Nang', 'room-6.jpg', '<p>Phong<b> sach se</b> <u>thoang mat</u>, <i><b>view dep</b></i>, <small>gan bien</small>, <u>nhan vien phuc vu tan tinh</u>, chu dao, <i>mien phi huy phong,</i>&nbsp;</p>', 'Duong so 2, F10, toa nha aroma , Da Nang', 'so 2', 'Da Nang', 'Da nang', 'Viet Nam', 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 45, 5, 2, NULL, 1),
(56, 'Villa Delag 2', 'room-6.jpg', '<p>Nhan vien phuc vu tan tinh, chu dao, chuan khach san <b><i><u><small></small></u></i></b></p><p></p><blockquote><b><i><u><small>5 sao</small></u></i></b></blockquote><p></p>, le tan 24/7, p<i>hong sach s</i>e, <u>view dep</u><p></p>', 'Villa Dela Danang, duong so 3, f9, Da Nang', 'so 3', 'Da lat', 'Lam Dong', 'Viet Nam', 1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1, 44, 5, 2, 5, 1),
(57, 'Vuon Dau Hotel', 'room-6.jpg', '<h1>toi ten</h1><p>Nguyen Huu<u> Tien</u><br></p><h1></h1>', '250 Mau Than, Phuong 12 , Da Lat , Lam Dong', 'Phuong 12', 'Da Lat', 'Lam Dong', 'Viet Nam', 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 4, 5, 2, 4, 1),
(58, 'Da lat View', 'room-6.jpg', '<p>\r\n\r\nVery clean. The family was great, and the son was helpful and friendly.\r\n\r\n<br></p>', '222  Mau Than, Phuong 12 , Da Lat , Lam Dong', 'Phuong 12', 'Da Lat', 'Lam Dong', 'Viet Nam', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 5, 3, NULL, 1),
(59, 'Villa Dela', 'room-6.jpg', '<p>Villa <i>sach se thoang mat,</i> co <u>hoi boi rieng</u>, gan pho co <b>Hoi An</b>, <b>Cau Rong</b>, phong sach se, yen tinh</p>', 'Villa Dela Danang, Da Nang', 'phuong 10', 'Da lat', 'Lam Dong', 'Viet Nam', 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 44, 5, 3, NULL, 1),
(60, 'Villa Delag 2', 'room-6.jpg', '<p>Nhan vien phuc vu tan tinh, chu dao, chuan khach san <b><i><u><small></small></u></i></b></p><p></p><blockquote><b><i><u><small>5 sao</small></u></i></b></blockquote><p></p>, le tan 24/7, p<i>hong sach s</i>e, <u>view dep</u><p></p>', 'Villa Dela Danang, duong so 3, f9, Da Nang', 'so 3', 'Da lat', 'Lam Dong', 'Viet Nam', 1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1, 44, 5, 2, 5, 1),
(61, 'Da lat View', 'room-6.jpg', '<p>\r\n\r\nVery clean. The family was great, and the son was helpful and friendly.\r\n\r\n<br></p>', '222  Mau Than, Phuong 12 , Da Lat , Lam Dong', 'Phuong 12', 'Da Lat', 'Lam Dong', 'Viet Nam', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 5, 3, NULL, 1),
(62, 'Da lat View', 'room-6.jpg', '<p>\r\n\r\nVery clean. The family was great, and the son was helpful and friendly.\r\n\r\n<br></p>', '222  Mau Than, Phuong 12 , Da Lat , Lam Dong', 'Phuong 12', 'Da Lat', 'Lam Dong', 'Viet Nam', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 5, 3, NULL, 1),
(63, 'Da lat View', 'room-6.jpg', '<p>\r\n\r\nVery clean. The family was great, and the son was helpful and friendly.\r\n\r\n<br></p>', '222  Mau Than, Phuong 12 , Da Lat , Lam Dong', 'Phuong 12', 'Da Lat', 'Lam Dong', 'Viet Nam', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 5, 3, NULL, 1),
(64, 'Da lat View', 'room-6.jpg', '<p>\r\n\r\nVery clean. The family was great, and the son was helpful and friendly.\r\n\r\n<br></p>', '222  Mau Than, Phuong 12 , Da Lat , Lam Dong', 'Phuong 12', 'Da Lat', 'Lam Dong', 'Viet Nam', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 5, 3, NULL, 1),
(65, 'Da lat View', 'room-6.jpg', '<p>\r\n\r\nVery clean. The family was great, and the son was helpful and friendly.\r\n\r\n<br></p>', '222  Mau Than, Phuong 12 , Da Lat , Lam Dong', 'Phuong 12', 'Da Lat', 'Lam Dong', 'Viet Nam', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 5, 3, NULL, 1),
(66, 'Da lat View', 'room-6.jpg', '<p>\r\n\r\nVery clean. The family was great, and the son was helpful and friendly.\r\n\r\n<br></p>', '222  Mau Than, Phuong 12 , Da Lat , Lam Dong', 'Phuong 12', 'Da Lat', 'Lam Dong', 'Viet Nam', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 5, 3, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `imageblog`
--

CREATE TABLE `imageblog` (
  `id` int(11) NOT NULL,
  `src` varchar(250) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `image_room`
--

CREATE TABLE `image_room` (
  `id` int(11) NOT NULL,
  `src` varchar(250) DEFAULT NULL,
  `alt` varchar(250) DEFAULT NULL,
  `room_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `image_room`
--

INSERT INTO `image_room` (`id`, `src`, `alt`, `room_id`, `status`) VALUES
(1, 'room-1.jpg', 'hinh mo ta', 1, 1),
(2, 'room-2.jpg', 'hinh mo ta', 1, 1),
(22, '30112019095326bg_1.jpg', 'tttt', 24, 0),
(23, '30112019095326destination-1.jpg', 'tttt', 24, 0),
(24, '30112019095326destination-2.jpg', 'tttt', 24, 0),
(25, '30112019095326destination-2-1.jpg', 'tttt', 24, 0),
(26, '30112019095326destination-3.jpg', 'tttt', 24, 0),
(27, '30112019095326destination-4.jpg', 'tttt', 24, 0),
(28, '30112019095326destination-5.jpg', 'tttt', 24, 0),
(29, '30112019095447bg_1.jpg', 'tttt', 25, 0),
(30, '30112019095447destination-1.jpg', 'tttt', 25, 0),
(31, '30112019095447destination-2.jpg', 'tttt', 25, 0),
(32, '30112019095447destination-2-1.jpg', 'tttt', 25, 0),
(33, '30112019095447destination-3.jpg', 'tttt', 25, 0),
(34, '30112019095447destination-4.jpg', 'tttt', 25, 0),
(35, '30112019095447destination-5.jpg', 'tttt', 25, 0),
(37, '11122019004518', 'vxcvx', 27, 0),
(39, '12122019211925destination-5.jpg', 'Mua Xuan', 2, 0),
(40, '12122019211925destination-6.jpg', 'Mua Xuan', 2, 0),
(41, '12122019211925hotel-1.jpg', 'Mua Xuan', 2, 0),
(42, '12122019211925hotel-2.jpg', 'Mua Xuan', 2, 0),
(43, '12122019211925hotel-3.jpg', 'Mua Xuan', 2, 0),
(44, '12122019211925hotel-4.jpg', 'Mua Xuan', 2, 0),
(45, '12122019212301hotel-3.jpg', 'tttt', 23, 0),
(46, '12122019212325destination-5.jpg', 'tttt', 23, 0),
(47, '12122019212325destination-6.jpg', 'tttt', 23, 0),
(48, '12122019212325hotel-1.jpg', 'tttt', 23, 0),
(49, '12122019212325hotel-2.jpg', 'tttt', 23, 0),
(50, '12122019212325hotel-3.jpg', 'tttt', 23, 0),
(51, '12122019212325hotel-4.jpg', 'tttt', 23, 0),
(52, '12122019212325hotel-5.jpg', 'tttt', 23, 0),
(53, '12122019212325hotel-6.jpg', 'tttt', 23, 0),
(54, '12122019212353', 'Nguyen', 23, 0),
(55, '20122019081311destination-5.jpg', 'Room vip', 29, 0),
(56, '20122019081311destination-6.jpg', 'Room vip', 29, 0),
(57, '20122019081311hotel-1.jpg', 'Room vip', 29, 0),
(58, '20122019081311hotel-2.jpg', 'Room vip', 29, 0),
(59, '20122019081311hotel-3.jpg', 'Room vip', 29, 0),
(60, '20122019081311hotel-5.jpg', 'Room vip', 29, 0),
(61, '20122019081311hotel-6.jpg', 'Room vip', 29, 0),
(62, '20122019081311image_1.jpg', 'Room vip', 29, 0),
(63, '20122019081311image_5.jpg', 'Room vip', 29, 0),
(64, '20122019081428destination-5.jpg', 'Room Vip', 30, 0),
(65, '20122019081428destination-6.jpg', 'Room Vip', 30, 0),
(66, '20122019081428hotel-1.jpg', 'Room Vip', 30, 0),
(67, '20122019081428hotel-2.jpg', 'Room Vip', 30, 0),
(68, '20122019081428hotel-3.jpg', 'Room Vip', 30, 0),
(75, '20122019083619room-1.jpg', 'Vip room', 32, 0),
(76, '20122019083619room-2.jpg', 'Vip room', 32, 0),
(77, '20122019083619room-3.jpg', 'Vip room', 32, 0),
(78, '20122019083619room-4.jpg', 'Vip room', 32, 0),
(79, '20122019091112room-1.jpg', 'Phong Base', 33, 0),
(80, '20122019091112room-2.jpg', 'Phong Base', 33, 0),
(81, '20122019091112room-3.jpg', 'Phong Base', 33, 0),
(82, '20122019091112room-4.jpg', 'Phong Base', 33, 0),
(83, '20122019091112room-6.jpg', 'Phong Base', 33, 0),
(84, '20122019091112thudong.png', 'Phong Base', 33, 0),
(85, '20122019091245room-1.jpg', 'Phong Vip', 34, 0),
(86, '20122019091245room-2.jpg', 'Phong Vip', 34, 0),
(87, '20122019091245room-3.jpg', 'Phong Vip', 34, 0),
(88, '20122019091245room-4.jpg', 'Phong Vip', 34, 0),
(89, '20122019091245room-6.jpg', 'Phong Vip', 34, 0),
(90, '20122019091245thudong.png', 'Phong Vip', 34, 0),
(91, '201220191416553452345.jpg', 'Room normal', 35, 0),
(92, '2012201914174032452345.jpg', 'Room vip', 36, 0),
(93, '20122019141835456346346346.jpg', 'Room Team', 37, 0),
(94, '20122019142829345235.jpg', 'Room Swimming', 38, 0),
(95, '2012201914292734623636.jpg', 'Family Room', 39, 0),
(96, '201220191430213146346.jpg', 'Room Swimming', 38, 0),
(97, '2012201914304732452345.jpg', 'Room Swimming', 38, 0),
(98, '2012201914304732462346.jpg', 'Room Swimming', 38, 0),
(99, '2012201914304732463466.jpg', 'Room Swimming', 38, 0),
(100, '20122019143152', 'Room Swimming', 38, 0),
(101, '20122019143158', 'Family Room', 39, 0),
(102, '201220191454362134213414.jpg', 'rom 1', 26, 0),
(103, '201220191454521346346.jpg', 'vxcvx', 27, 0),
(104, '201220191454522352354.jpg', 'vxcvx', 27, 0),
(105, '201220191454523146346.jpg', 'vxcvx', 27, 0),
(106, '201220191454523246236.jpg', 'vxcvx', 27, 0),
(107, '2012201914545232463466.jpg', 'vxcvx', 27, 0),
(108, '201220191455151346346.jpg', 'zxcvzxcv', 28, 0),
(109, '201220191455153146346.jpg', 'zxcvzxcv', 28, 0),
(110, '2012201914551532452345.jpg', 'zxcvzxcv', 28, 0),
(111, '2012201914551532462346.jpg', 'zxcvzxcv', 28, 0),
(112, '20122019145515213412344`4.jpg', 'zxcvzxcv', 28, 0),
(113, '201220191455151234123421.jpg', 'zxcvzxcv', 28, 0),
(114, '201220191455152134213414.jpg', 'zxcvzxcv', 28, 0),
(115, '20122019145523', 'zxcvzxcv', 28, 0);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_card`
--

CREATE TABLE `invoice_card` (
  `id` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `id_card` int(11) DEFAULT NULL,
  `id_hotel` int(11) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(250) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `payment` varchar(250) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `total_price` double NOT NULL,
  `account_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `payment`, `created`, `total_price`, `account_id`, `sale_id`, `status`) VALUES
(132, 'TS4GDET7V57TS', 'PAYID-L34WWTA3KR12926E85524109', '2020-06-29', 4.7, 3, NULL, 0),
(133, 'TS4GDET7V57TS', 'PAYID-L342VCQ2XE76411M8539450G', '2020-06-29', 3840, 3, NULL, 0),
(134, 'TS4GDET7V57TS', 'PAYID-L4CG6PQ3K1961000V193900C', '2020-07-02', 1280, 3, NULL, 0),
(135, 'payathotel', 'payathotel', '2020-07-07', 1280, 3, NULL, 0),
(136, 'payathotel', 'payathotel', '2020-07-12', 72, 3, NULL, 0),
(137, 'payathotel', 'payathotel', '2020-08-01', 70, 3, NULL, 0),
(138, 'payathotel', 'payathotel', '2020-08-06', 720, 3, NULL, 0),
(139, 'payathotel', 'payathotel', '2020-08-09', 720, 4, NULL, 0),
(140, 'TS4GDET7V57TS', 'PAYID-L4ZGF2I55088365P8091521E', '2020-08-11', 720, 81, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `namestaying` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `note` text,
  `order_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `room_id`, `check_in_date`, `check_out_date`, `quantity`, `namestaying`, `email`, `note`, `order_id`, `status`) VALUES
(136, 25, '2020-06-30', '2020-07-01', 1, 'Nguyen Tien', 'huutien921@gmail.com', '', 132, 1),
(137, 1, '2020-06-30', '2020-07-06', 1, 'Nguyen Tien', 'huutien921@gmail.com', '', 133, 1),
(138, 1, '2020-07-07', '2020-07-09', 1, 'Nguyen Tien', 'huutien921@gmail.com', '', 134, 1),
(139, 1, '2020-07-09', '2020-07-11', 1, 'Thanh', 'huutien921@gmail.com', '', 135, 1),
(140, 61, '2020-07-15', '2020-07-16', 1, 'Thanh truc v444', 'huutien921@gmail.com', '', 136, 1),
(141, 2, '2020-08-04', '2020-08-05', 1, 'Thanh truc v444', 'huutien921@gmail.com', '', 137, 1),
(142, 1, '2020-08-13', '2020-08-14', 1, 'Thanh truc v444', 'huutien922@gmail.com', '', 138, 1),
(143, 1, '2020-08-25', '2020-08-26', 1, 'Nguyen Thuan', 'huutien92@gmail.com', '', 139, 1),
(144, 1, '2020-08-14', '2020-08-15', 1, 'Nguyen Tran Dan Thy', 'thytran.251299@gmail.com', '', 140, 1);

-- --------------------------------------------------------

--
-- Table structure for table `panel`
--

CREATE TABLE `panel` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `image_src` varchar(250) NOT NULL,
  `video` varchar(250) DEFAULT NULL,
  `id_super_admin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `panel`
--

INSERT INTO `panel` (`id`, `name`, `title`, `content`, `status`, `image_src`, `video`, `id_super_admin`) VALUES
(1, 'Home', 'Make Your Tour Amazing With Us', 'Travel to the any corner of the world, without going around in circles', 1, 'bg_2.jpg', 'https://www.youtube.com/watch?v=f0TyZQAntLA', NULL),
(2, 'promotions', '', '', 1, 'bg_2.jpg', '', NULL),
(3, 'blog', '', '', 1, 'bg_2.jpg', '', NULL),
(4, 'contact', '', '', 1, 'bg_2.jpg', '', NULL),
(5, 'search_result', '', '', 1, 'bg_2.jpg', '', NULL),
(6, 'Hotel detail', '', '', 1, 'bg_2.jpg', '', NULL),
(7, 'Booking', '', '', 1, 'bg_2.jpg', '', NULL),
(8, 'Profile', '', '', 1, 'bg_2.jpg', '', NULL),
(9, 'status order', '', '', 1, 'bg_2.jpg', '', NULL),
(10, 'surplus', '', '', 1, 'bg_2.jpg', '', NULL),
(11, 'editEmailNotification', '', '', 1, 'bg_2.jpg', '', NULL),
(12, 'purchase', '', '', 1, 'bg_2.jpg', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `image` varchar(50) NOT NULL,
  `idtype` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `name`, `image`, `idtype`) VALUES
(1, 'acb', 'acb.png', 1),
(2, 'bidv', 'bidv.png', 1),
(3, 'framily', 'framily.png', 1),
(4, 'jcb', 'jcb.png', 1),
(5, 'master', 'master.png', 1),
(6, 'onepay', 'onepay.png', 1),
(7, 'framily', 'framily.png', 1),
(8, 'payoo', 'payoo.png', 1),
(9, 'sacombank', 'saccombank.png', 1),
(10, 'techcom', 'techcom.png', 1),
(11, 'vietcombank', 'vietcombank.png', 1),
(12, 'vietnampost', 'vietnampost.png', 1),
(13, 'viettinbank', 'viettinbank.png', 1),
(14, 'visa', 'visa.png', 1),
(15, 'framily', 'framily.png', 1),
(16, 'payoo', 'payoo.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `id_service_hotel` int(11) DEFAULT NULL,
  `id_order` int(11) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `paymentcode` varchar(250) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reason_report`
--

CREATE TABLE `reason_report` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `content` text,
  `created` date NOT NULL,
  `id_reason` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ROLE_SUPER_ADMIN'),
(2, 'ROLE_ADMIN'),
(3, 'ROLE_EMPLOYEE'),
(4, 'ROLE_USER'),
(5, 'ROLE_SUPER_USER');

-- --------------------------------------------------------

--
-- Table structure for table `role_account`
--

CREATE TABLE `role_account` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role_account`
--

INSERT INTO `role_account` (`id`, `account_id`, `role_id`, `status`) VALUES
(68, 81, 4, 1),
(69, 4, 4, 1),
(70, 82, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `src_icon` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount_of_bed` int(11) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `bedtype_id` int(11) NOT NULL,
  `roomtype_id` int(11) NOT NULL,
  `roomcategory_id` int(11) NOT NULL,
  `amount_of_room` int(11) DEFAULT NULL,
  `hotel_id` int(11) NOT NULL,
  `id_coppon_room` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `name`, `src_icon`, `price`, `amount_of_bed`, `capacity`, `bedtype_id`, `roomtype_id`, `roomcategory_id`, `amount_of_room`, `hotel_id`, `id_coppon_room`, `status`) VALUES
(1, 'Thu dong13', 'room-1.jpg', 800, 1, 2, 1, 1, 2, 5, 1, NULL, 1),
(2, 'Mua Xuan', 'room-2.jpg', 100, 2, 4, 1, 2, 1, 2, 1, 139, 1),
(23, 'Mua Mua', '12122019212353destination-2.jpg', 10, 10, 10, 1, 1, 1, 10, 1, 128, 1),
(24, 'Mua Ha', 'room-2.jpg', 10, 10, 7, 1, 1, 1, 20, 1, 123, 1),
(25, 'Mua Thu', 'room-2.jpg', 10, 10, 7, 1, 1, 1, 20, 1, 123, 1),
(26, 'rom 1', '201220191454361346346.jpg', 10, 2, 2, 1, 1, 1, 5, 21, NULL, 1),
(27, 'vxcvx', NULL, 12, 12, 13, 1, 2, 2, 1, 21, NULL, 1),
(28, 'zxcvzxcv', NULL, 12, 1, 4, 1, 1, 1, 21, 21, NULL, 1),
(29, 'Room vip', '20122019081311hotel-2.jpg', 80, 10, 7, 3, 1, 1, 10, 29, 129, 1),
(30, 'Room Vip', '20122019081428hotel-6.jpg', 100, 2, 4, 1, 1, 1, 20, 29, 129, 1),
(31, 'Room Bao Ngu', NULL, 50, 1, 2, 2, 1, 1, 15, 30, NULL, 1),
(32, 'Vip room', '20122019083619room-1.jpg', 60, 2, 4, 1, 1, 1, 15, 30, 134, 1),
(33, 'Phong Base', '20122019091112room-2.jpg', 79, 2, 4, 2, 1, 2, 15, 31, NULL, 1),
(34, 'Phong Vip', '20122019091245room-3.jpg', 60, 2, 5, 3, 2, 1, 10, 31, NULL, 1),
(35, 'Room normal', '20122019141655456346346346.jpg', 40, 2, 4, 4, 3, 2, 5, 32, NULL, 1),
(36, 'Room vip', '2012201914174034623462346.jpg', 70, 1, 4, 2, 1, 1, 3, 32, NULL, 1),
(37, 'Room Team', '20122019141835234624362346.jpg', 56, 2, 8, 4, 3, 1, 1, 32, NULL, 1),
(38, 'Room Swimming', '201220191431521463.jpg', 59, 2, 5, 3, 2, 1, 2, 34, 131, 1),
(39, 'Family Room', '201220191431581234123421.jpg', 26, 2, 6, 2, 3, 3, 6, 34, 131, 1),
(40, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 1, 111, 1),
(41, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 0, 48, 111, 1),
(42, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 48, 111, 1),
(43, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 48, 111, 1),
(44, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 48, 111, 1),
(45, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 49, 111, 1),
(46, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 49, 111, 1),
(47, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 49, 111, 1),
(48, 'Thu dong1', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 49, 111, 1),
(49, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 49, 111, 1),
(50, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 50, 111, 1),
(51, 'Thu dong1', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 50, 111, 1),
(52, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 50, 111, 1),
(53, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 50, 111, 1),
(54, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 50, 111, 1),
(55, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 53, 111, 1),
(56, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 53, 111, 1),
(57, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 53, 111, 1),
(58, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 54, 111, 1),
(59, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 54, 111, 1),
(60, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 54, 111, 1),
(61, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 55, 111, 1),
(62, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 55, 111, 1),
(63, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 55, 111, 1),
(64, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 56, 111, 1),
(65, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 56, 111, 1),
(66, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 56, 111, 1),
(97, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 57, 111, 1),
(98, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 58, 111, 1),
(99, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 59, 111, 1),
(100, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 59, 111, 1),
(101, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 60, 111, 1),
(102, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 60, 111, 1),
(103, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 61, 111, 1),
(104, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 62, 111, 1),
(105, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 48, 111, 1),
(106, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 62, 111, 1),
(107, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 63, 111, 1),
(108, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 64, 111, 1),
(109, 'Thu dong', 'room-1.jpg', 80, 1, 2, 1, 1, 2, 10, 65, 111, 1);

-- --------------------------------------------------------

--
-- Table structure for table `room_category`
--

CREATE TABLE `room_category` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room_category`
--

INSERT INTO `room_category` (`id`, `name`, `status`) VALUES
(1, 'vip', 1),
(2, 'highclass', 1),
(3, 'common', 1);

-- --------------------------------------------------------

--
-- Table structure for table `room_type`
--

CREATE TABLE `room_type` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room_type`
--

INSERT INTO `room_type` (`id`, `name`, `status`) VALUES
(1, 'single', 1),
(2, 'double', 1),
(3, 'team', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `id` int(11) NOT NULL,
  `code` varchar(250) NOT NULL,
  `description` text,
  `sales` double NOT NULL,
  `startday` date DEFAULT NULL,
  `endday` date DEFAULT NULL,
  `src` varchar(250) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`id`, `code`, `description`, `sales`, `startday`, `endday`, `src`, `account_id`, `status`) VALUES
(1, 'TINHYEU', '            <h2 class="mb-3">It is a long established fact a reader be distracted</h2>\n            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio deserunt molestiae voluptates soluta architecto tempora.</p>\n            <p>\n              <img src="images/image_6.jpg" alt="" class="img-fluid">\n            </p>\n            <p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!</p>\n            <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>\n            <p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic non? Debitis commodi aut, adipisci.</p>\n            <p>\n            \n            </p>\n            <p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim veniam, modi rem maiores.</p>\n            <p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro explicabo soluta commodi libero voluptatem similique id quidem? Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia laboriosam harum excepturi ea.</p>\n            <p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae numquam nam ab voluptatibus culpa, tenetur recusandae!</p>\n            <p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit. Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p>\n           ', 20, '2019-12-01', '2021-12-31', 'promotion1.png', 5, 1),
(2, 'LECUOI', '            <h2 class="mb-3">It is a long established fact a reader be distracted</h2>\r\n            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio deserunt molestiae voluptates soluta architecto tempora.</p>\r\n            <p>\r\n              <img src="images/image_6.jpg" alt="" class="img-fluid">\r\n            </p>\r\n            <p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!</p>\r\n            <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>\r\n            <p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic non? Debitis commodi aut, adipisci.</p>\r\n            <p>\r\n            \r\n            </p>\r\n            <p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim veniam, modi rem maiores.</p>\r\n            <p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro explicabo soluta commodi libero voluptatem similique id quidem? Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia laboriosam harum excepturi ea.</p>\r\n            <p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae numquam nam ab voluptatibus culpa, tenetur recusandae!</p>\r\n            <p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit. Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p>\r\n           ', 30, '2019-12-01', '2022-12-31', 'promotion2.png', 5, 1),
(3, 'VIVUTET', '\r\n            <h2 class="mb-3">It is a long established fact a reader be distracted</h2>\r\n            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio deserunt molestiae voluptates soluta architecto tempora.</p>\r\n            <p>\r\n              <img src="images/image_6.jpg" alt="" class="img-fluid">\r\n            </p>\r\n            <p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!</p>\r\n            <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>\r\n            <p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic non? Debitis commodi aut, adipisci.</p>\r\n            <p>\r\n            \r\n            </p>\r\n            <p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim veniam, modi rem maiores.</p>\r\n            <p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro explicabo soluta commodi libero voluptatem similique id quidem? Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia laboriosam harum excepturi ea.</p>\r\n            <p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae numquam nam ab voluptatibus culpa, tenetur recusandae!</p>\r\n            <p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit. Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p>\r\n           ', 0.2, '2019-12-01', '2021-01-31', 'promotion3.png', 5, 1),
(4, 'CUOINAM', '\r\n            <h2 class="mb-3">It is a long established fact a reader be distracted</h2>\r\n            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio deserunt molestiae voluptates soluta architecto tempora.</p>\r\n            <p>\r\n              <img src="images/image_6.jpg" alt="" class="img-fluid">\r\n            </p>\r\n            <p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!</p>\r\n            <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>\r\n            <p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic non? Debitis commodi aut, adipisci.</p>\r\n            <p>\r\n            \r\n            </p>\r\n            <p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim veniam, modi rem maiores.</p>\r\n            <p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro explicabo soluta commodi libero voluptatem similique id quidem? Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia laboriosam harum excepturi ea.</p>\r\n            <p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae numquam nam ab voluptatibus culpa, tenetur recusandae!</p>\r\n            <p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit. Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p>\r\n           ', 0.3, '2019-12-17', '2023-01-31', 'promotion4.png', 5, 1),
(5, 'DULICHANTETNIEN', '\r\n            <h2 class="mb-3">It is a long established fact a reader be distracted</h2>\r\n            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio deserunt molestiae voluptates soluta architecto tempora.</p>\r\n            <p>\r\n              <img src="images/image_6.jpg" alt="" class="img-fluid">\r\n            </p>\r\n            <p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!</p>\r\n            <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>\r\n            <p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic non? Debitis commodi aut, adipisci.</p>\r\n            <p>\r\n            \r\n            </p>\r\n            <p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim veniam, modi rem maiores.</p>\r\n            <p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro explicabo soluta commodi libero voluptatem similique id quidem? Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia laboriosam harum excepturi ea.</p>\r\n            <p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae numquam nam ab voluptatibus culpa, tenetur recusandae!</p>\r\n            <p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit. Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p>\r\n           ', 0.25, '2020-01-02', '2020-01-31', 'promotion5.png', 5, 1),
(6, 'TETAMLICH', '\r\n            <h2 class="mb-3">It is a long established fact a reader be distracted</h2>\r\n            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio deserunt molestiae voluptates soluta architecto tempora.</p>\r\n            <p>\r\n              <img src="images/image_6.jpg" alt="" class="img-fluid">\r\n            </p>\r\n            <p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!</p>\r\n            <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>\r\n            <p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic non? Debitis commodi aut, adipisci.</p>\r\n            <p>\r\n            \r\n            </p>\r\n            <p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim veniam, modi rem maiores.</p>\r\n            <p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro explicabo soluta commodi libero voluptatem similique id quidem? Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia laboriosam harum excepturi ea.</p>\r\n            <p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae numquam nam ab voluptatibus culpa, tenetur recusandae!</p>\r\n            <p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit. Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p>\r\n           ', 0.35, '2020-01-17', '2020-01-31', 'promotion6.png', 5, 1),
(42, 'CUOINAM1', '\r\n            <h2 class="mb-3">It is a long established fact a reader be distracted</h2>\r\n            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio deserunt molestiae voluptates soluta architecto tempora.</p>\r\n            <p>\r\n              <img src="images/image_6.jpg" alt="" class="img-fluid">\r\n            </p>\r\n            <p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!</p>\r\n            <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>\r\n            <p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic non? Debitis commodi aut, adipisci.</p>\r\n            <p>\r\n            \r\n            </p>\r\n            <p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim veniam, modi rem maiores.</p>\r\n            <p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro explicabo soluta commodi libero voluptatem similique id quidem? Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia laboriosam harum excepturi ea.</p>\r\n            <p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae numquam nam ab voluptatibus culpa, tenetur recusandae!</p>\r\n            <p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit. Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p>\r\n           ', 0.3, '2019-12-17', '2023-01-31', 'promotion4.png', 5, 1),
(53, 'TINHYEU1', 'description description description description description description description description description description description description description description description description description description description description description description description description  description description description description description  description description description description description  description description description description description  description description description description description description  description description', 20, '2019-12-01', '2021-12-31', 'promotion1.png', 5, 1),
(54, 'LECUOI1', '\r\n            <h2 class="mb-3">It is a long established fact a reader be distracted</h2>\r\n            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio deserunt molestiae voluptates soluta architecto tempora.</p>\r\n            <p>\r\n              <img src="images/image_6.jpg" alt="" class="img-fluid">\r\n            </p>\r\n            <p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!</p>\r\n            <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>\r\n            <p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic non? Debitis commodi aut, adipisci.</p>\r\n            <p>\r\n            \r\n            </p>\r\n            <p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim veniam, modi rem maiores.</p>\r\n            <p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro explicabo soluta commodi libero voluptatem similique id quidem? Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia laboriosam harum excepturi ea.</p>\r\n            <p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae numquam nam ab voluptatibus culpa, tenetur recusandae!</p>\r\n            <p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit. Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p>\r\n           ', 30, '2019-12-01', '2022-12-31', 'promotion2.png', 5, 1),
(55, 'VIVUTET1', '\r\n            <h2 class="mb-3">It is a long established fact a reader be distracted</h2>\r\n            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio deserunt molestiae voluptates soluta architecto tempora.</p>\r\n            <p>\r\n              <img src="images/image_6.jpg" alt="" class="img-fluid">\r\n            </p>\r\n            <p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!</p>\r\n            <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>\r\n            <p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic non? Debitis commodi aut, adipisci.</p>\r\n            <p>\r\n            \r\n            </p>\r\n            <p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim veniam, modi rem maiores.</p>\r\n            <p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro explicabo soluta commodi libero voluptatem similique id quidem? Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia laboriosam harum excepturi ea.</p>\r\n            <p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae numquam nam ab voluptatibus culpa, tenetur recusandae!</p>\r\n            <p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit. Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p>\r\n           ', 0.2, '2019-12-01', '2021-01-31', 'promotion3.png', 5, 1),
(56, 'CUOINAM111', '\r\n            <h2 class="mb-3">It is a long established fact a reader be distracted</h2>\r\n            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio deserunt molestiae voluptates soluta architecto tempora.</p>\r\n            <p>\r\n              <img src="images/image_6.jpg" alt="" class="img-fluid">\r\n            </p>\r\n            <p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!</p>\r\n            <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>\r\n            <p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic non? Debitis commodi aut, adipisci.</p>\r\n            <p>\r\n            \r\n            </p>\r\n            <p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim veniam, modi rem maiores.</p>\r\n            <p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro explicabo soluta commodi libero voluptatem similique id quidem? Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia laboriosam harum excepturi ea.</p>\r\n            <p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae numquam nam ab voluptatibus culpa, tenetur recusandae!</p>\r\n            <p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit. Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p>\r\n           ', 0.3, '2019-12-17', '2023-01-31', 'promotion4.png', 5, 1),
(57, 'CUOINAM11', '\r\n            <h2 class="mb-3">It is a long established fact a reader be distracted</h2>\r\n            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio deserunt molestiae voluptates soluta architecto tempora.</p>\r\n            <p>\r\n              <img src="images/image_6.jpg" alt="" class="img-fluid">\r\n            </p>\r\n            <p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!</p>\r\n            <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>\r\n            <p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic non? Debitis commodi aut, adipisci.</p>\r\n            <p>\r\n            \r\n            </p>\r\n            <p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim veniam, modi rem maiores.</p>\r\n            <p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro explicabo soluta commodi libero voluptatem similique id quidem? Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia laboriosam harum excepturi ea.</p>\r\n            <p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae numquam nam ab voluptatibus culpa, tenetur recusandae!</p>\r\n            <p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit. Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p>\r\n           ', 0.3, '2019-12-17', '2023-01-31', 'promotion4.png', 5, 1),
(58, 'CUOINAM2', '\r\n            <h2 class="mb-3">It is a long established fact a reader be distracted</h2>\r\n            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio deserunt molestiae voluptates soluta architecto tempora.</p>\r\n            <p>\r\n              <img src="images/image_6.jpg" alt="" class="img-fluid">\r\n            </p>\r\n            <p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!</p>\r\n            <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>\r\n            <p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic non? Debitis commodi aut, adipisci.</p>\r\n            <p>\r\n            \r\n            </p>\r\n            <p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim veniam, modi rem maiores.</p>\r\n            <p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro explicabo soluta commodi libero voluptatem similique id quidem? Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia laboriosam harum excepturi ea.</p>\r\n            <p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae numquam nam ab voluptatibus culpa, tenetur recusandae!</p>\r\n            <p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit. Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p>\r\n           ', 0.3, '2019-12-17', '2023-01-31', 'promotion4.png', 5, 1),
(59, 'DULICHANTETNIEN2', '\r\n            <h2 class="mb-3">It is a long established fact a reader be distracted</h2>\r\n            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio deserunt molestiae voluptates soluta architecto tempora.</p>\r\n            <p>\r\n              <img src="images/image_6.jpg" alt="" class="img-fluid">\r\n            </p>\r\n            <p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!</p>\r\n            <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>\r\n            <p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic non? Debitis commodi aut, adipisci.</p>\r\n            <p>\r\n            \r\n            </p>\r\n            <p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim veniam, modi rem maiores.</p>\r\n            <p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro explicabo soluta commodi libero voluptatem similique id quidem? Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia laboriosam harum excepturi ea.</p>\r\n            <p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae numquam nam ab voluptatibus culpa, tenetur recusandae!</p>\r\n            <p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit. Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p>\r\n           ', 0.25, '2020-01-02', '2020-01-31', 'promotion5.png', 5, 1),
(60, 'TETAMLICH2', '\r\n            <h2 class="mb-3">It is a long established fact a reader be distracted</h2>\r\n            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio deserunt molestiae voluptates soluta architecto tempora.</p>\r\n            <p>\r\n              <img src="images/image_6.jpg" alt="" class="img-fluid">\r\n            </p>\r\n            <p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!</p>\r\n            <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>\r\n            <p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic non? Debitis commodi aut, adipisci.</p>\r\n            <p>\r\n            \r\n            </p>\r\n            <p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim veniam, modi rem maiores.</p>\r\n            <p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro explicabo soluta commodi libero voluptatem similique id quidem? Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia laboriosam harum excepturi ea.</p>\r\n            <p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae numquam nam ab voluptatibus culpa, tenetur recusandae!</p>\r\n            <p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit. Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p>\r\n           ', 0.35, '2020-01-17', '2020-01-31', 'promotion6.png', 5, 1),
(61, 'CUOINAM12', '\r\n            <h2 class="mb-3">It is a long established fact a reader be distracted</h2>\r\n            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio deserunt molestiae voluptates soluta architecto tempora.</p>\r\n            <p>\r\n              <img src="images/image_6.jpg" alt="" class="img-fluid">\r\n            </p>\r\n            <p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!</p>\r\n            <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>\r\n            <p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic non? Debitis commodi aut, adipisci.</p>\r\n            <p>\r\n            \r\n            </p>\r\n            <p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim veniam, modi rem maiores.</p>\r\n            <p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro explicabo soluta commodi libero voluptatem similique id quidem? Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia laboriosam harum excepturi ea.</p>\r\n            <p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae numquam nam ab voluptatibus culpa, tenetur recusandae!</p>\r\n            <p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit. Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p>\r\n           ', 0.3, '2019-12-17', '2023-01-31', 'promotion4.png', 5, 1);
INSERT INTO `sale` (`id`, `code`, `description`, `sales`, `startday`, `endday`, `src`, `account_id`, `status`) VALUES
(62, 'CUOINAM3', '\r\n            <h2 class="mb-3">It is a long established fact a reader be distracted</h2>\r\n            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio deserunt molestiae voluptates soluta architecto tempora.</p>\r\n            <p>\r\n              <img src="images/image_6.jpg" alt="" class="img-fluid">\r\n            </p>\r\n            <p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!</p>\r\n            <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>\r\n            <p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic non? Debitis commodi aut, adipisci.</p>\r\n            <p>\r\n            \r\n            </p>\r\n            <p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim veniam, modi rem maiores.</p>\r\n            <p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro explicabo soluta commodi libero voluptatem similique id quidem? Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia laboriosam harum excepturi ea.</p>\r\n            <p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae numquam nam ab voluptatibus culpa, tenetur recusandae!</p>\r\n            <p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit. Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p>\r\n           ', 0.3, '2019-12-17', '2023-01-31', 'promotion4.png', 5, 1),
(63, 'TINHYEU4', 'description description description description description description description description description description description description description description description description description description description description description description description description  description description description description description  description description description description description  description description description description description  description description description description description description  description description', 20, '2019-12-01', '2021-12-31', 'promotion1.png', 5, 1),
(64, 'LECUOI4', '\r\n            <h2 class="mb-3">It is a long established fact a reader be distracted</h2>\r\n            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio deserunt molestiae voluptates soluta architecto tempora.</p>\r\n            <p>\r\n              <img src="images/image_6.jpg" alt="" class="img-fluid">\r\n            </p>\r\n            <p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!</p>\r\n            <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>\r\n            <p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic non? Debitis commodi aut, adipisci.</p>\r\n            <p>\r\n            \r\n            </p>\r\n            <p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim veniam, modi rem maiores.</p>\r\n            <p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro explicabo soluta commodi libero voluptatem similique id quidem? Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia laboriosam harum excepturi ea.</p>\r\n            <p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae numquam nam ab voluptatibus culpa, tenetur recusandae!</p>\r\n            <p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit. Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p>\r\n           ', 30, '2019-12-01', '2022-12-31', 'promotion2.png', 5, 1),
(65, 'VIVUTET4', '\r\n            <h2 class="mb-3">It is a long established fact a reader be distracted</h2>\r\n            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio deserunt molestiae voluptates soluta architecto tempora.</p>\r\n            <p>\r\n              <img src="images/image_6.jpg" alt="" class="img-fluid">\r\n            </p>\r\n            <p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!</p>\r\n            <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>\r\n            <p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic non? Debitis commodi aut, adipisci.</p>\r\n            <p>\r\n            \r\n            </p>\r\n            <p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim veniam, modi rem maiores.</p>\r\n            <p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro explicabo soluta commodi libero voluptatem similique id quidem? Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia laboriosam harum excepturi ea.</p>\r\n            <p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae numquam nam ab voluptatibus culpa, tenetur recusandae!</p>\r\n            <p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit. Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p>\r\n           ', 0.2, '2019-12-01', '2021-01-31', 'promotion3.png', 5, 1),
(66, 'CUOINAM4', '\r\n            <h2 class="mb-3">It is a long established fact a reader be distracted</h2>\r\n            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio deserunt molestiae voluptates soluta architecto tempora.</p>\r\n            <p>\r\n              <img src="images/image_6.jpg" alt="" class="img-fluid">\r\n            </p>\r\n            <p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!</p>\r\n            <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>\r\n            <p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic non? Debitis commodi aut, adipisci.</p>\r\n            <p>\r\n            \r\n            </p>\r\n            <p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim veniam, modi rem maiores.</p>\r\n            <p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro explicabo soluta commodi libero voluptatem similique id quidem? Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia laboriosam harum excepturi ea.</p>\r\n            <p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae numquam nam ab voluptatibus culpa, tenetur recusandae!</p>\r\n            <p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit. Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p>\r\n           ', 0.3, '2019-12-17', '2023-01-31', 'promotion4.png', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `core` char(10) DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `icon_src` varchar(50) DEFAULT NULL,
  `id_account` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `description` text,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `name`, `price`, `core`, `priority`, `icon_src`, `id_account`, `type_id`, `description`, `status`) VALUES
(1, 'QC', '8', 'QC01', 1, NULL, 2, 1, '<p><strong>Day tin Len dau muc 1</strong></p>\r\n', 1),
(2, 'QC', '9', 'QC02', 2, NULL, 2, 1, '<p>Day tin Len dau muc 2</p>\r\n', 1),
(3, 'QC', '10', 'QC03', 3, NULL, 2, 1, '<p>Day tin Len dau muc 3</p>\r\n', 1),
(4, 'QC', '11', 'QC04', 4, NULL, 2, 1, '<p>Day tin Len dau muc 4</p>\r\n', 1),
(5, 'Add Hotel', '12', 'add', 0, NULL, 2, 1, '<p>Create Hotel</p>\r\n', 1);

-- --------------------------------------------------------

--
-- Table structure for table `servicetype`
--

CREATE TABLE `servicetype` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `servicetype`
--

INSERT INTO `servicetype` (`id`, `name`) VALUES
(1, 'Push the news first'),
(2, 'Create Hotel');

-- --------------------------------------------------------

--
-- Table structure for table `service_hotel`
--

CREATE TABLE `service_hotel` (
  `id` int(11) NOT NULL,
  `id_hotel` int(11) NOT NULL,
  `id_service` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created` date NOT NULL,
  `tatol` double DEFAULT NULL,
  `payment` varchar(250) DEFAULT NULL,
  `idpayer` varchar(250) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_hotel`
--

INSERT INTO `service_hotel` (`id`, `id_hotel`, `id_service`, `start_date`, `end_date`, `created`, `tatol`, `payment`, `idpayer`, `status`) VALUES
(1, 1, 4, '2019-11-06', '2019-12-06', '2019-11-07', 600, NULL, NULL, 1),
(11, 17, 5, '2019-01-02', '2020-12-02', '2019-01-02', 1440, NULL, NULL, 1),
(13, 1, 1, '2019-02-07', '2020-12-07', '2019-02-07', 960, NULL, NULL, 1),
(17, 21, 5, '2019-03-07', '2020-12-07', '2019-03-07', 144, NULL, NULL, 1),
(18, 26, 5, '2019-04-12', '2020-12-12', '2019-04-12', 399, NULL, NULL, 1),
(23, 29, 5, '2019-05-20', '2020-12-20', '2019-05-20', 146, NULL, NULL, 1),
(24, 31, 5, '2019-06-20', '2020-07-20', '2019-06-20', 1436, NULL, NULL, 1),
(25, 34, 5, '2019-12-20', '2020-12-20', '2019-12-20', 1442, NULL, NULL, 1),
(26, 21, 5, '2019-07-07', '2020-12-07', '2019-07-07', 500, NULL, NULL, 1),
(27, 21, 5, '2019-08-07', '2020-12-07', '2019-08-07', 2000, NULL, NULL, 1),
(28, 1, 4, '2019-09-06', '2019-12-06', '2019-09-07', 288, NULL, NULL, 1),
(29, 1, 4, '2019-10-06', '2019-12-06', '2019-10-07', 700, NULL, NULL, 1),
(30, 1, 4, '2019-10-06', '2019-12-06', '2019-05-07', 700, NULL, NULL, 1),
(31, 21, 5, '2019-08-07', '2020-12-07', '2019-08-07', 2000, NULL, NULL, 1),
(32, 21, 5, '2019-01-07', '2020-12-07', '2019-01-07', 2000, NULL, NULL, 1),
(33, 21, 5, '2019-01-07', '2020-12-07', '2019-01-07', 2000, NULL, NULL, 1),
(34, 21, 5, '2019-03-07', '2020-12-07', '2019-03-07', 2000, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `star_rating`
--

CREATE TABLE `star_rating` (
  `id` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `star_rating`
--

INSERT INTO `star_rating` (`id`, `amount`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `support_customer`
--

CREATE TABLE `support_customer` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `email` int(11) NOT NULL,
  `content` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_type` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `type_card`
--

CREATE TABLE `type_card` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type_card`
--

INSERT INTO `type_card` (`id`, `name`, `description`, `status`) VALUES
(1, 'Visa', 'Visa', 1),
(2, 'MasterCard', 'MasterCard', 1);

-- --------------------------------------------------------

--
-- Table structure for table `type_part`
--

CREATE TABLE `type_part` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type_part`
--

INSERT INTO `type_part` (`id`, `name`, `description`, `status`) VALUES
(1, 'PAYMENT', 'this is payment method ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `verification_token`
--

CREATE TABLE `verification_token` (
  `id` int(11) NOT NULL,
  `token` varchar(500) DEFAULT NULL,
  `expiry_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_account` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `verification_token`
--

INSERT INTO `verification_token` (`id`, `token`, `expiry_date`, `id_account`, `status`) VALUES
(1, '3e940eff-a8c5-4e7b-a25d-13394bb83470', '2020-08-10 00:53:05', 80, 0),
(2, 'b431b150-ff74-4cbc-b205-3f0f63bf6766', '2020-08-10 00:03:23', 80, 0),
(3, 'b1a5305c-fff8-469c-af9c-7f0e7826a7e2', '2020-08-10 00:21:09', 80, 0),
(4, '303475f3-88b3-4128-b910-069587d008d1', '2020-08-10 00:00:50', 80, 0),
(5, 'a2c482c3-9bb1-4abb-9900-4c23a877c572', '2020-08-11 00:34:21', 82, 1),
(6, '2307a870-6121-4949-8176-e6c07c14956f', '2020-08-11 00:36:06', 82, 1),
(7, '8dc16b3a-71d7-43f1-aa46-a3ac27611379', '2020-08-12 00:09:13', 82, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `bed_type`
--
ALTER TABLE `bed_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `id_type` (`id_category`);

--
-- Indexes for table `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_blog`
--
ALTER TABLE `category_blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_type` (`id_type`),
  ADD KEY `id_order` (`id_order`);

--
-- Indexes for table `contact_type`
--
ALTER TABLE `contact_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coppon_hotel`
--
ALTER TABLE `coppon_hotel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotel_id` (`name`);

--
-- Indexes for table `coppon_room`
--
ALTER TABLE `coppon_room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotel_id` (`name`);

--
-- Indexes for table `credit_card`
--
ALTER TABLE `credit_card`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_type` (`id_type`),
  ADD KEY `id_account` (`id_account`);

--
-- Indexes for table `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `evaluate`
--
ALTER TABLE `evaluate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `starrating_id` (`starrating_id`),
  ADD KEY `id_coppon_hotel` (`id_coppon_hotel`),
  ADD KEY `id_ac_employee` (`id_ac_employee`);

--
-- Indexes for table `imageblog`
--
ALTER TABLE `imageblog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_id` (`blog_id`);

--
-- Indexes for table `image_room`
--
ALTER TABLE `image_room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `invoice_card`
--
ALTER TABLE `invoice_card`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_account` (`id_account`),
  ADD KEY `id_card` (`id_card`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `sale_id` (`sale_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `panel`
--
ALTER TABLE `panel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_super_admin` (`id_super_admin`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idtype` (`idtype`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_service_hotel` (`id_service_hotel`),
  ADD KEY `id_order` (`id_order`);

--
-- Indexes for table `reason_report`
--
ALTER TABLE `reason_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `room_id` (`hotel_id`),
  ADD KEY `id_reason` (`id_reason`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_account`
--
ALTER TABLE `role_account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bedtype_id` (`bedtype_id`),
  ADD KEY `hotel_id` (`hotel_id`),
  ADD KEY `roomcategory_id` (`roomcategory_id`),
  ADD KEY `roomtype_id` (`roomtype_id`),
  ADD KEY `id_coppon_room` (`id_coppon_room`);

--
-- Indexes for table `room_category`
--
ALTER TABLE `room_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_type`
--
ALTER TABLE `room_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `id_account` (`id_account`);

--
-- Indexes for table `servicetype`
--
ALTER TABLE `servicetype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_hotel`
--
ALTER TABLE `service_hotel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_hotel` (`id_hotel`),
  ADD KEY `id_service` (`id_service`);

--
-- Indexes for table `star_rating`
--
ALTER TABLE `star_rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_card`
--
ALTER TABLE `type_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_part`
--
ALTER TABLE `type_part`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verification_token`
--
ALTER TABLE `verification_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_account` (`id_account`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about`
--
ALTER TABLE `about`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT for table `bed_type`
--
ALTER TABLE `bed_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `card`
--
ALTER TABLE `card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category_blog`
--
ALTER TABLE `category_blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `contact_type`
--
ALTER TABLE `contact_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `coppon_hotel`
--
ALTER TABLE `coppon_hotel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `coppon_room`
--
ALTER TABLE `coppon_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;
--
-- AUTO_INCREMENT for table `credit_card`
--
ALTER TABLE `credit_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `email`
--
ALTER TABLE `email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `evaluate`
--
ALTER TABLE `evaluate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT for table `imageblog`
--
ALTER TABLE `imageblog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `image_room`
--
ALTER TABLE `image_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;
--
-- AUTO_INCREMENT for table `invoice_card`
--
ALTER TABLE `invoice_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;
--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;
--
-- AUTO_INCREMENT for table `panel`
--
ALTER TABLE `panel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `role_account`
--
ALTER TABLE `role_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
--
-- AUTO_INCREMENT for table `room_category`
--
ALTER TABLE `room_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `room_type`
--
ALTER TABLE `room_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `servicetype`
--
ALTER TABLE `servicetype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `service_hotel`
--
ALTER TABLE `service_hotel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `star_rating`
--
ALTER TABLE `star_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `type_part`
--
ALTER TABLE `type_part`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `verification_token`
--
ALTER TABLE `verification_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `blog_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `category_blog` (`id`);

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `contact_type` (`id`);

--
-- Constraints for table `credit_card`
--
ALTER TABLE `credit_card`
  ADD CONSTRAINT `credit_card_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type_card` (`id`),
  ADD CONSTRAINT `credit_card_ibfk_2` FOREIGN KEY (`id_account`) REFERENCES `account` (`id`);

--
-- Constraints for table `email`
--
ALTER TABLE `email`
  ADD CONSTRAINT `email_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);

--
-- Constraints for table `evaluate`
--
ALTER TABLE `evaluate`
  ADD CONSTRAINT `evaluate_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `evaluate_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
  ADD CONSTRAINT `evaluate_ibfk_3` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`);

--
-- Constraints for table `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `hotel_ibfk_2` FOREIGN KEY (`starrating_id`) REFERENCES `star_rating` (`id`),
  ADD CONSTRAINT `hotel_ibfk_3` FOREIGN KEY (`id_coppon_hotel`) REFERENCES `coppon_hotel` (`id`),
  ADD CONSTRAINT `hotel_ibfk_4` FOREIGN KEY (`id_ac_employee`) REFERENCES `account` (`id`);

--
-- Constraints for table `imageblog`
--
ALTER TABLE `imageblog`
  ADD CONSTRAINT `imageblog_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`);

--
-- Constraints for table `image_room`
--
ALTER TABLE `image_room`
  ADD CONSTRAINT `image_room_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`);

--
-- Constraints for table `invoice_card`
--
ALTER TABLE `invoice_card`
  ADD CONSTRAINT `invoice_card_ibfk_1` FOREIGN KEY (`id_account`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `invoice_card_ibfk_2` FOREIGN KEY (`id_card`) REFERENCES `card` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`sale_id`) REFERENCES `sale` (`id`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`);

--
-- Constraints for table `panel`
--
ALTER TABLE `panel`
  ADD CONSTRAINT `panel_ibfk_1` FOREIGN KEY (`id_super_admin`) REFERENCES `account` (`id`);

--
-- Constraints for table `partners`
--
ALTER TABLE `partners`
  ADD CONSTRAINT `partners_ibfk_1` FOREIGN KEY (`idtype`) REFERENCES `type_part` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`id_service_hotel`) REFERENCES `service_hotel` (`id`);

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `report_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `room` (`id`),
  ADD CONSTRAINT `report_ibfk_3` FOREIGN KEY (`id_reason`) REFERENCES `reason_report` (`id`);

--
-- Constraints for table `role_account`
--
ALTER TABLE `role_account`
  ADD CONSTRAINT `role_account_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `role_account_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`bedtype_id`) REFERENCES `bed_type` (`id`),
  ADD CONSTRAINT `room_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`),
  ADD CONSTRAINT `room_ibfk_3` FOREIGN KEY (`roomcategory_id`) REFERENCES `room_category` (`id`),
  ADD CONSTRAINT `room_ibfk_4` FOREIGN KEY (`roomtype_id`) REFERENCES `room_type` (`id`),
  ADD CONSTRAINT `room_ibfk_5` FOREIGN KEY (`id_coppon_room`) REFERENCES `coppon_room` (`id`);

--
-- Constraints for table `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `servicetype` (`id`),
  ADD CONSTRAINT `service_ibfk_3` FOREIGN KEY (`id_account`) REFERENCES `account` (`id`);

--
-- Constraints for table `service_hotel`
--
ALTER TABLE `service_hotel`
  ADD CONSTRAINT `service_hotel_ibfk_1` FOREIGN KEY (`id_hotel`) REFERENCES `hotel` (`id`),
  ADD CONSTRAINT `service_hotel_ibfk_2` FOREIGN KEY (`id_service`) REFERENCES `service` (`id`);

--
-- Constraints for table `verification_token`
--
ALTER TABLE `verification_token`
  ADD CONSTRAINT `verification_token_ibfk_1` FOREIGN KEY (`id_account`) REFERENCES `account` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

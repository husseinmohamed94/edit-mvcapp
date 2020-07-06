-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2020 at 07:46 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `storedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_clients`
--

CREATE TABLE `app_clients` (
  `clienId` int(10) UNSIGNED NOT NULL,
  `Name` varchar(40) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app_expenses_categories`
--

CREATE TABLE `app_expenses_categories` (
  `ExpenseId` tinyint(3) UNSIGNED NOT NULL,
  `ExpenseName` varchar(30) NOT NULL,
  `fixedPayment` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app_expenses_daily_list`
--

CREATE TABLE `app_expenses_daily_list` (
  `DExpenseId` int(10) UNSIGNED NOT NULL,
  `ExpenseId` tinyint(3) UNSIGNED NOT NULL,
  `payment` decimal(7,2) NOT NULL,
  `created` datetime NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app_notifications`
--

CREATE TABLE `app_notifications` (
  `NotificationId` int(10) UNSIGNED NOT NULL,
  `title` varchar(30) NOT NULL,
  `content` varchar(255) NOT NULL,
  `type` tinyint(2) NOT NULL,
  `created` datetime NOT NULL,
  `UserId` int(10) UNSIGNED NOT NULL,
  `seen` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app_products_categories`
--

CREATE TABLE `app_products_categories` (
  `categortyid` int(10) UNSIGNED NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Image` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app_products_list`
--

CREATE TABLE `app_products_list` (
  `productid` int(10) UNSIGNED NOT NULL,
  `categoryid` int(10) UNSIGNED NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Image` varchar(30) DEFAULT NULL,
  `Quantity` smallint(5) UNSIGNED NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `Barcode` char(20) DEFAULT NULL,
  `unit` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app_purchases_invoices_receipts`
--

CREATE TABLE `app_purchases_invoices_receipts` (
  `ReceiptId` int(10) UNSIGNED NOT NULL,
  `InvoicedId` int(10) UNSIGNED NOT NULL,
  `paymentType` tinyint(1) NOT NULL,
  `paymentAmount` decimal(8,2) NOT NULL,
  `paymentLiteral` varchar(60) NOT NULL,
  `BankName` varchar(30) DEFAULT NULL,
  `BankAccountNumber` varchar(30) DEFAULT NULL,
  `checkNumber` varchar(15) DEFAULT NULL,
  `trandferedTo` varchar(30) DEFAULT NULL,
  `created` date NOT NULL,
  `UserId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app_purcheses_invoices`
--

CREATE TABLE `app_purcheses_invoices` (
  `InvoicedId` int(10) UNSIGNED NOT NULL,
  `supplierId` int(10) UNSIGNED NOT NULL,
  `paymentType` tinyint(1) NOT NULL,
  `paymentStatus` tinyint(1) NOT NULL,
  `created` date NOT NULL,
  `Discount` decimal(8,2) DEFAULT NULL,
  `Userid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app_purcheses_invoices_details`
--

CREATE TABLE `app_purcheses_invoices_details` (
  `Id` int(10) UNSIGNED NOT NULL,
  `productId` int(10) UNSIGNED NOT NULL,
  `Quantity` smallint(6) NOT NULL,
  `productprice` decimal(7,2) NOT NULL,
  `InvoiceId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app_sales_invoices`
--

CREATE TABLE `app_sales_invoices` (
  `InvoicedId` int(10) UNSIGNED NOT NULL,
  `clientId` int(10) UNSIGNED NOT NULL,
  `paymentType` tinyint(1) NOT NULL,
  `paymentStatus` tinyint(1) NOT NULL,
  `created` date NOT NULL,
  `Discount` decimal(8,2) DEFAULT NULL,
  `Userid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app_sales_invoices_details`
--

CREATE TABLE `app_sales_invoices_details` (
  `Id` int(10) UNSIGNED NOT NULL,
  `productId` int(10) UNSIGNED NOT NULL,
  `Quantity` smallint(6) NOT NULL,
  `productprice` decimal(7,2) NOT NULL,
  `InvoiceId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app_sales_invoices_receipts`
--

CREATE TABLE `app_sales_invoices_receipts` (
  `ReceiptId` int(10) UNSIGNED NOT NULL,
  `InvoicedId` int(10) UNSIGNED NOT NULL,
  `paymentType` tinyint(1) NOT NULL,
  `paymentAmount` decimal(8,2) NOT NULL,
  `paymentLiteral` varchar(60) NOT NULL,
  `BankName` varchar(30) DEFAULT NULL,
  `BankAccountNumber` varchar(30) DEFAULT NULL,
  `checkNumber` varchar(15) DEFAULT NULL,
  `trandferedTo` varchar(30) DEFAULT NULL,
  `created` date NOT NULL,
  `UserId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app_suppliers`
--

CREATE TABLE `app_suppliers` (
  `supplierId` int(10) UNSIGNED NOT NULL,
  `Name` varchar(40) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app_users`
--

CREATE TABLE `app_users` (
  `UserId` int(10) UNSIGNED NOT NULL,
  `Username` varchar(12) NOT NULL,
  `password` char(60) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phoneNumber` varchar(50) DEFAULT NULL,
  `subscriptionDate` date NOT NULL,
  `lastlogin` datetime NOT NULL,
  `GroupId` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app_users_groups`
--

CREATE TABLE `app_users_groups` (
  `groupid` tinyint(1) UNSIGNED NOT NULL,
  `GroupName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_users_groups`
--

INSERT INTO `app_users_groups` (`groupid`, `GroupName`) VALUES
(1, 'المحاسب'),
(2, 'المحاسب'),
(3, 'مديرالتطبيق'),
(4, 'المحاسب');

-- --------------------------------------------------------

--
-- Table structure for table `app_users_groups_privileges`
--

CREATE TABLE `app_users_groups_privileges` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `GroupId` tinyint(1) UNSIGNED NOT NULL,
  `privilegeId` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_users_groups_privileges`
--

INSERT INTO `app_users_groups_privileges` (`id`, `GroupId`, `privilegeId`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 2, 1),
(6, 2, 3),
(7, 3, 1),
(8, 3, 2),
(9, 3, 3),
(10, 3, 4),
(11, 3, 5),
(12, 3, 8),
(13, 3, 10),
(14, 4, 1),
(15, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `app_users_privileges`
--

CREATE TABLE `app_users_privileges` (
  `privilegeId` tinyint(3) UNSIGNED NOT NULL,
  `privilege` varchar(30) NOT NULL,
  `privilegeTitle` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_users_privileges`
--

INSERT INTO `app_users_privileges` (`privilegeId`, `privilege`, `privilegeTitle`) VALUES
(1, '/suppliers/create', 'انشاء مورد جديد'),
(2, '/suppliers/create', 'انشاء مورد'),
(3, '/supplire/create', ' تعديل بيانات مورد'),
(4, '/supplire/create', ' تعديل بيانات عميل جديد'),
(5, '/clintes/creact', ' حدف عميل'),
(8, 'clints/create', ' انشاء عميل جديد'),
(10, '//suppliers/crsuppliers/create', 'انشاء مورد جديد');

-- --------------------------------------------------------

--
-- Table structure for table `app_users_profiles`
--

CREATE TABLE `app_users_profiles` (
  `userid` int(10) UNSIGNED NOT NULL,
  `firstName` varchar(10) NOT NULL,
  `lastName` varchar(10) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Image` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_clients`
--
ALTER TABLE `app_clients`
  ADD PRIMARY KEY (`clienId`);

--
-- Indexes for table `app_expenses_categories`
--
ALTER TABLE `app_expenses_categories`
  ADD PRIMARY KEY (`ExpenseId`);

--
-- Indexes for table `app_expenses_daily_list`
--
ALTER TABLE `app_expenses_daily_list`
  ADD PRIMARY KEY (`DExpenseId`),
  ADD KEY `ExpenseId` (`ExpenseId`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `app_notifications`
--
ALTER TABLE `app_notifications`
  ADD PRIMARY KEY (`NotificationId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `app_products_categories`
--
ALTER TABLE `app_products_categories`
  ADD PRIMARY KEY (`categortyid`);

--
-- Indexes for table `app_products_list`
--
ALTER TABLE `app_products_list`
  ADD PRIMARY KEY (`productid`),
  ADD KEY `categoryid` (`categoryid`);

--
-- Indexes for table `app_purchases_invoices_receipts`
--
ALTER TABLE `app_purchases_invoices_receipts`
  ADD PRIMARY KEY (`ReceiptId`),
  ADD KEY `InvoicedId` (`InvoicedId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `app_purcheses_invoices`
--
ALTER TABLE `app_purcheses_invoices`
  ADD PRIMARY KEY (`InvoicedId`),
  ADD KEY `supplierId` (`supplierId`),
  ADD KEY `Userid` (`Userid`);

--
-- Indexes for table `app_purcheses_invoices_details`
--
ALTER TABLE `app_purcheses_invoices_details`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `productId` (`productId`),
  ADD KEY `InvoiceId` (`InvoiceId`);

--
-- Indexes for table `app_sales_invoices`
--
ALTER TABLE `app_sales_invoices`
  ADD PRIMARY KEY (`InvoicedId`),
  ADD KEY `clientId` (`clientId`),
  ADD KEY `Userid` (`Userid`);

--
-- Indexes for table `app_sales_invoices_details`
--
ALTER TABLE `app_sales_invoices_details`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `productId` (`productId`),
  ADD KEY `InvoiceId` (`InvoiceId`);

--
-- Indexes for table `app_sales_invoices_receipts`
--
ALTER TABLE `app_sales_invoices_receipts`
  ADD PRIMARY KEY (`ReceiptId`),
  ADD KEY `InvoicedId` (`InvoicedId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `app_suppliers`
--
ALTER TABLE `app_suppliers`
  ADD PRIMARY KEY (`supplierId`);

--
-- Indexes for table `app_users`
--
ALTER TABLE `app_users`
  ADD PRIMARY KEY (`UserId`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `GroupId` (`GroupId`);

--
-- Indexes for table `app_users_groups`
--
ALTER TABLE `app_users_groups`
  ADD PRIMARY KEY (`groupid`);

--
-- Indexes for table `app_users_groups_privileges`
--
ALTER TABLE `app_users_groups_privileges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `GroupId` (`GroupId`),
  ADD KEY `privilegeId` (`privilegeId`);

--
-- Indexes for table `app_users_privileges`
--
ALTER TABLE `app_users_privileges`
  ADD PRIMARY KEY (`privilegeId`);

--
-- Indexes for table `app_users_profiles`
--
ALTER TABLE `app_users_profiles`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_clients`
--
ALTER TABLE `app_clients`
  MODIFY `clienId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_expenses_categories`
--
ALTER TABLE `app_expenses_categories`
  MODIFY `ExpenseId` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_expenses_daily_list`
--
ALTER TABLE `app_expenses_daily_list`
  MODIFY `DExpenseId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_notifications`
--
ALTER TABLE `app_notifications`
  MODIFY `NotificationId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_products_categories`
--
ALTER TABLE `app_products_categories`
  MODIFY `categortyid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_products_list`
--
ALTER TABLE `app_products_list`
  MODIFY `productid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_purchases_invoices_receipts`
--
ALTER TABLE `app_purchases_invoices_receipts`
  MODIFY `ReceiptId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_purcheses_invoices`
--
ALTER TABLE `app_purcheses_invoices`
  MODIFY `InvoicedId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_purcheses_invoices_details`
--
ALTER TABLE `app_purcheses_invoices_details`
  MODIFY `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_sales_invoices`
--
ALTER TABLE `app_sales_invoices`
  MODIFY `InvoicedId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_sales_invoices_details`
--
ALTER TABLE `app_sales_invoices_details`
  MODIFY `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_sales_invoices_receipts`
--
ALTER TABLE `app_sales_invoices_receipts`
  MODIFY `ReceiptId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_suppliers`
--
ALTER TABLE `app_suppliers`
  MODIFY `supplierId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_users`
--
ALTER TABLE `app_users`
  MODIFY `UserId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_users_groups`
--
ALTER TABLE `app_users_groups`
  MODIFY `groupid` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `app_users_groups_privileges`
--
ALTER TABLE `app_users_groups_privileges`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `app_users_privileges`
--
ALTER TABLE `app_users_privileges`
  MODIFY `privilegeId` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `app_users_profiles`
--
ALTER TABLE `app_users_profiles`
  MODIFY `userid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `app_expenses_daily_list`
--
ALTER TABLE `app_expenses_daily_list`
  ADD CONSTRAINT `app_expenses_daily_list_ibfk_1` FOREIGN KEY (`ExpenseId`) REFERENCES `app_expenses_categories` (`ExpenseId`),
  ADD CONSTRAINT `app_expenses_daily_list_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `app_users` (`UserId`);

--
-- Constraints for table `app_notifications`
--
ALTER TABLE `app_notifications`
  ADD CONSTRAINT `app_notifications_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `app_users` (`UserId`);

--
-- Constraints for table `app_products_list`
--
ALTER TABLE `app_products_list`
  ADD CONSTRAINT `app_products_list_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `app_products_categories` (`categortyid`);

--
-- Constraints for table `app_purchases_invoices_receipts`
--
ALTER TABLE `app_purchases_invoices_receipts`
  ADD CONSTRAINT `app_purchases_invoices_receipts_ibfk_1` FOREIGN KEY (`InvoicedId`) REFERENCES `app_purcheses_invoices` (`InvoicedId`),
  ADD CONSTRAINT `app_purchases_invoices_receipts_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `app_users` (`UserId`);

--
-- Constraints for table `app_purcheses_invoices`
--
ALTER TABLE `app_purcheses_invoices`
  ADD CONSTRAINT `app_purcheses_invoices_ibfk_1` FOREIGN KEY (`supplierId`) REFERENCES `app_suppliers` (`supplierId`),
  ADD CONSTRAINT `app_purcheses_invoices_ibfk_2` FOREIGN KEY (`Userid`) REFERENCES `app_users` (`UserId`);

--
-- Constraints for table `app_purcheses_invoices_details`
--
ALTER TABLE `app_purcheses_invoices_details`
  ADD CONSTRAINT `app_purcheses_invoices_details_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `app_products_list` (`productid`),
  ADD CONSTRAINT `app_purcheses_invoices_details_ibfk_2` FOREIGN KEY (`InvoiceId`) REFERENCES `app_purcheses_invoices` (`InvoicedId`);

--
-- Constraints for table `app_sales_invoices`
--
ALTER TABLE `app_sales_invoices`
  ADD CONSTRAINT `app_sales_invoices_ibfk_1` FOREIGN KEY (`clientId`) REFERENCES `app_clients` (`clienId`),
  ADD CONSTRAINT `app_sales_invoices_ibfk_2` FOREIGN KEY (`Userid`) REFERENCES `app_users` (`UserId`);

--
-- Constraints for table `app_sales_invoices_details`
--
ALTER TABLE `app_sales_invoices_details`
  ADD CONSTRAINT `app_sales_invoices_details_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `app_products_list` (`productid`),
  ADD CONSTRAINT `app_sales_invoices_details_ibfk_2` FOREIGN KEY (`InvoiceId`) REFERENCES `app_sales_invoices` (`InvoicedId`);

--
-- Constraints for table `app_sales_invoices_receipts`
--
ALTER TABLE `app_sales_invoices_receipts`
  ADD CONSTRAINT `app_sales_invoices_receipts_ibfk_1` FOREIGN KEY (`InvoicedId`) REFERENCES `app_sales_invoices` (`InvoicedId`),
  ADD CONSTRAINT `app_sales_invoices_receipts_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `app_users` (`UserId`);

--
-- Constraints for table `app_users`
--
ALTER TABLE `app_users`
  ADD CONSTRAINT `app_users_ibfk_1` FOREIGN KEY (`GroupId`) REFERENCES `app_users_groups` (`groupid`);

--
-- Constraints for table `app_users_groups_privileges`
--
ALTER TABLE `app_users_groups_privileges`
  ADD CONSTRAINT `app_users_groups_privileges_ibfk_1` FOREIGN KEY (`GroupId`) REFERENCES `app_users_groups` (`groupid`),
  ADD CONSTRAINT `app_users_groups_privileges_ibfk_2` FOREIGN KEY (`privilegeId`) REFERENCES `app_users_privileges` (`privilegeId`);

--
-- Constraints for table `app_users_profiles`
--
ALTER TABLE `app_users_profiles`
  ADD CONSTRAINT `app_users_profiles_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `app_users` (`UserId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

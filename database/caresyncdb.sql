-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2025 at 06:59 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `caresyncdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `Name`, `Email`, `Password`) VALUES
(1, 'Main Admin', 'admin.main@gmail.com', 'adminpass123'),
(2, 'Assistant Admin', 'admin.assistant@gmail.com', 'assistpass456');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `AppointmentID` int(11) NOT NULL,
  `PatientID` int(11) DEFAULT NULL,
  `DoctorID` int(11) DEFAULT NULL,
  `AppointmentDate` date DEFAULT NULL,
  `AppointmentTime` time DEFAULT NULL,
  `ReasonForVisit` text DEFAULT NULL,
  `Status` enum('Scheduled','Completed','Cancelled') DEFAULT 'Scheduled',
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`AppointmentID`, `PatientID`, `DoctorID`, `AppointmentDate`, `AppointmentTime`, `ReasonForVisit`, `Status`, `CreatedAt`, `UpdatedAt`) VALUES
(11, 1, 100, '2025-01-23', '10:00:00', 'Flu check-up', 'Scheduled', '2025-01-23 17:52:41', '2025-01-23 17:52:41'),
(12, 2, 101, '2025-01-22', '11:30:00', 'Cold treatment', 'Scheduled', '2025-01-23 17:52:41', '2025-01-23 17:52:41'),
(13, 3, 102, '2025-01-21', '09:00:00', 'Migraine consultation', 'Scheduled', '2025-01-23 17:52:41', '2025-01-23 17:52:41'),
(14, 4, 103, '2025-01-20', '14:00:00', 'Stomach Ache diagnosis', 'Scheduled', '2025-01-23 17:52:41', '2025-01-23 17:52:41'),
(15, 5, 104, '2025-01-19', '15:30:00', 'Cough treatment', 'Scheduled', '2025-01-23 17:52:41', '2025-01-23 17:52:41'),
(16, 6, 105, '2025-01-18', '10:30:00', 'Back pain consultation', 'Scheduled', '2025-01-23 17:52:41', '2025-01-23 17:52:41'),
(17, 7, 106, '2025-01-17', '08:00:00', 'Anxiety management', 'Scheduled', '2025-01-23 17:52:41', '2025-01-23 17:52:41'),
(18, 8, 107, '2025-01-16', '16:00:00', 'Hypertension monitoring', 'Scheduled', '2025-01-23 17:52:41', '2025-01-23 17:52:41'),
(19, 9, 108, '2025-01-15', '13:30:00', 'Diabetes consultation', 'Scheduled', '2025-01-23 17:52:41', '2025-01-23 17:52:41'),
(20, 10, 109, '2025-01-14', '09:45:00', 'Depression therapy', 'Scheduled', '2025-01-23 17:52:41', '2025-01-23 17:52:41');

-- --------------------------------------------------------

--
-- Table structure for table `blood_donor`
--

CREATE TABLE `blood_donor` (
  `DonorID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `BloodGroup` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blood_donor`
--

INSERT INTO `blood_donor` (`DonorID`, `Name`, `Email`, `PhoneNumber`, `Address`, `BloodGroup`) VALUES
(1, 'Shafiqur Rahman', 'shafiq.donor@gmail.com', '01810000001', 'Dhaka, Bangladesh', 'A+'),
(2, 'Lamia Khan', 'lamia.donor@gmail.com', '01810000002', 'Barishal, Bangladesh', 'O+'),
(3, 'Kamal Hossain', 'kamal.donor@gmail.com', '01810000003', 'Rangpur, Bangladesh', 'B+'),
(4, 'Sharmin Sultana', 'sharmin.donor@gmail.com', '01810000004', 'Sylhet, Bangladesh', 'AB-'),
(5, 'Jamal Ahmed', 'jamal.donor@gmail.com', '01810000005', 'Mymensingh, Bangladesh', 'O-');

-- --------------------------------------------------------

--
-- Table structure for table `blood_recipient`
--

CREATE TABLE `blood_recipient` (
  `RecipientID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `BloodGroup` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blood_recipient`
--

INSERT INTO `blood_recipient` (`RecipientID`, `Name`, `Email`, `PhoneNumber`, `Address`, `BloodGroup`) VALUES
(1, 'Md. Rahim', 'rahim.recipient@gmail.com', '01710000001', 'Dhaka, Bangladesh', 'A+'),
(2, 'Sumaiya Akter', 'sumaiya.recipient@gmail.com', '01710000002', 'Chittagong, Bangladesh', 'O+'),
(3, 'Nasir Uddin', 'nasir.recipient@gmail.com', '01710000003', 'Sylhet, Bangladesh', 'B+'),
(4, 'Fatema Begum', 'fatema.recipient@gmail.com', '01710000004', 'Rajshahi, Bangladesh', 'AB-'),
(5, 'Abul Hossain', 'abul.recipient@gmail.com', '01710000005', 'Khulna, Bangladesh', 'O-');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Specialty` varchar(100) DEFAULT NULL,
  `Degree` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`ID`, `Name`, `Email`, `Specialty`, `Degree`) VALUES
(100, 'Dr. Ahmed Hossain', 'ahmed.hossain@gmail.com', 'Cardiology', 'MBBS, MD'),
(101, 'Dr. Imran Mahmud', 'imran.mahmud@gmail.com', 'Orthopedics', 'MBBS, MS'),
(102, 'Dr. Saifur Rahman', 'saifur.rahman@gmail.com', 'Neurology', 'MBBS, MD'),
(103, 'Dr. Zubair Karim', 'zubair.karim@gmail.com', 'General Surgery', 'MBBS, FCPS'),
(104, 'Dr. Khaled Hasan', 'khaled.hasan@gmail.com', 'Urology', 'MBBS, MS'),
(105, 'Dr. Farzana Rahman', 'farzana.rahman@gmail.com', 'Pediatrics', 'MBBS, FCPS'),
(106, 'Dr. Nusrat Jahan', 'nusrat.jahan@gmail.com', 'Gynecology', 'MBBS, DGO'),
(107, 'Dr. Tasnim Ahmed', 'tasnim.ahmed@gmail.com', 'Dermatology', 'MBBS, DD'),
(108, 'Dr. Fatima Yasmin', 'fatima.yasmin@gmail.com', 'Endocrinology', 'MBBS, MD'),
(109, 'Dr. Rina Akhter', 'rina.akhter@gmail.com', 'Oncology', 'MBBS, DM');

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `EquipmentID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Type` enum('Medicine') NOT NULL,
  `Quantity` int(11) NOT NULL,
  `ExpirationDate` date DEFAULT NULL,
  `Supplier` varchar(255) DEFAULT NULL,
  `DateReceived` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`EquipmentID`, `Name`, `Type`, `Quantity`, `ExpirationDate`, `Supplier`, `DateReceived`) VALUES
(1, 'Anesthesia', 'Medicine', 50, '2026-06-30', 'MedSupply Co.', '2025-01-10'),
(2, 'Ibuprofen', 'Medicine', 100, '2025-12-10', 'Pharma Ltd.', '2025-01-12'),
(3, 'Amoxicillin', 'Medicine', 200, '2025-11-15', 'BioMed', '2025-01-14'),
(4, 'Aspirin', 'Medicine', 150, '2025-12-15', 'MedSupply', '2025-01-16'),
(5, 'Insulin', 'Medicine', 120, '2025-11-30', 'Health Pharma', '2025-01-18'),
(6, 'Diazepam', 'Medicine', 90, '2026-01-20', 'Pharma Solutions', '2025-01-20'),
(7, 'Paracetamol', 'Medicine', 250, '2026-03-10', 'Pharma Ltd.', '2025-01-22'),
(8, 'Atorvastatin', 'Medicine', 180, '2025-10-05', 'MedPharma', '2025-01-25'),
(9, 'Prednisone', 'Medicine', 75, '2025-08-30', 'HealthCorp', '2025-01-28'),
(10, 'Metformin', 'Medicine', 300, '2026-02-14', 'MedCare', '2025-02-01'),
(11, 'Omeprazole', 'Medicine', 50, '2025-07-18', 'Pharma Ltd.', '2025-02-05'),
(12, 'Lisinopril', 'Medicine', 130, '2025-10-20', 'MedSupply', '2025-02-08'),
(13, 'Ciprofloxacin', 'Medicine', 150, '2025-12-10', 'BioMed', '2025-02-10'),
(14, 'Hydrochlorothiazide', 'Medicine', 80, '2025-11-15', 'MedStore', '2025-02-15'),
(15, 'Warfarin', 'Medicine', 100, '2025-09-30', 'PharmaCare', '2025-02-18'),
(16, 'Levothyroxine', 'Medicine', 200, '2025-11-01', 'Health Co.', '2025-02-22'),
(17, 'Lorazepam', 'Medicine', 60, '2026-03-10', 'HealthPharm', '2025-02-25'),
(18, 'Fluoxetine', 'Medicine', 150, '2025-06-15', 'BioPharma', '2025-02-28'),
(19, 'Gabapentin', 'Medicine', 120, '2025-10-01', 'MedExpress', '2025-03-02'),
(20, 'Sildenafil', 'Medicine', 200, '2025-05-30', 'Pharma Solutions', '2025-03-05'),
(21, 'Clopidogrel', 'Medicine', 250, '2025-08-25', 'BioMed', '2025-03-08'),
(22, 'Simvastatin', 'Medicine', 180, '2025-10-12', 'MedStore', '2025-03-12'),
(23, 'Pantoprazole', 'Medicine', 90, '2025-12-01', 'PharmaCorp', '2025-03-15'),
(24, 'Metoprolol', 'Medicine', 150, '2025-07-25', 'HealthCare', '2025-03-18'),
(25, 'Fluconazole', 'Medicine', 80, '2025-09-10', 'MedSupply Co.', '2025-03-20'),
(26, 'Tamsulosin', 'Medicine', 100, '2025-06-25', 'BioMed', '2025-03-25'),
(27, 'Dexamethasone', 'Medicine', 75, '2025-11-05', 'MedPharma', '2025-03-28'),
(28, 'Furosemide', 'Medicine', 90, '2025-10-01', 'Pharma Ltd.', '2025-04-02'),
(29, 'Ranitidine', 'Medicine', 250, '2025-09-20', 'BioPharm', '2025-04-05'),
(30, 'Chloroquine', 'Medicine', 180, '2025-08-15', 'MedExpress', '2025-04-08'),
(31, 'Amlodipine', 'Medicine', 200, '2025-12-05', 'Health Pharma', '2025-04-10'),
(32, 'Alprazolam', 'Medicine', 80, '2025-10-30', 'Pharma Solutions', '2025-04-12'),
(33, 'Duloxetine', 'Medicine', 150, '2025-06-10', 'MedSupply', '2025-04-15'),
(34, 'Propranolol', 'Medicine', 100, '2025-12-20', 'HealthCare Ltd.', '2025-04-17'),
(35, 'Amiodarone', 'Medicine', 90, '2025-07-01', 'Pharma Ltd.', '2025-04-20'),
(36, 'Levofloxacin', 'Medicine', 120, '2025-05-30', 'MedPharm', '2025-04-22'),
(37, 'Azithromycin', 'Medicine', 200, '2025-09-25', 'BioCare', '2025-04-25'),
(38, 'Cyclobenzaprine', 'Medicine', 60, '2025-11-12', 'MedExpress', '2025-04-27'),
(39, 'Zolpidem', 'Medicine', 180, '2025-12-15', 'MedPharma', '2025-04-30'),
(40, 'Corticosteroids', 'Medicine', 75, '2025-06-20', 'BioPharm', '2025-05-02'),
(41, 'Cetirizine', 'Medicine', 250, '2025-10-10', 'Health Pharma', '2025-05-05'),
(42, 'Diphenhydramine', 'Medicine', 200, '2025-11-25', 'MedSolutions', '2025-05-08'),
(43, 'Methotrexate', 'Medicine', 90, '2025-08-20', 'MedCare', '2025-05-10'),
(44, 'Levocetirizine', 'Medicine', 120, '2025-12-01', 'Pharma Corp', '2025-05-12'),
(45, 'Tadalafil', 'Medicine', 150, '2025-09-30', 'HealthPharm', '2025-05-15'),
(46, 'Mupirocin', 'Medicine', 200, '2025-07-15', 'BioMed', '2025-05-17'),
(47, 'Acarbose', 'Medicine', 80, '2025-11-20', 'MedSolutions', '2025-05-20'),
(48, 'Ondansetron', 'Medicine', 100, '2025-09-15', 'MedPharma', '2025-05-22'),
(49, 'Carvedilol', 'Medicine', 90, '2025-10-10', 'BioPharm', '2025-05-25'),
(50, 'Clarithromycin', 'Medicine', 120, '2025-08-25', 'HealthCare', '2025-05-28'),
(51, 'Piperacillin', 'Medicine', 150, '2025-12-10', 'PharmaCorp', '2025-05-30'),
(52, 'Loratadine', 'Medicine', 200, '2025-11-05', 'MedSupply Co.', '2025-06-02'),
(53, 'Candesartan', 'Medicine', 80, '2025-09-05', 'BioCare', '2025-06-05'),
(54, 'Ipratropium', 'Medicine', 100, '2025-10-30', 'HealthPharm', '2025-06-08'),
(55, 'Sertraline', 'Medicine', 120, '2025-07-01', 'Pharma Solutions', '2025-06-10'),
(56, 'Mirtazapine', 'Medicine', 150, '2025-12-20', 'MedCare', '2025-06-12');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `PatientID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `BloodGroup` varchar(10) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`PatientID`, `Name`, `Email`, `PhoneNumber`, `Address`, `BloodGroup`, `DateOfBirth`) VALUES
(1, 'John Doe', 'john.doe@example.com', '1234567890', '123 Main St, Dhaka', 'O+', '1990-01-01'),
(2, 'Jane Smith', 'jane.smith@example.com', '0987654321', '456 Elm St, Dhaka', 'A+', '1985-05-15'),
(3, 'Alex Rahman', 'alex.rahman@example.com', '1231231234', '789 Oak St, Dhaka', 'B-', '1992-11-20'),
(4, 'Sara Ahmed', 'sara.ahmed@example.com', '9876543210', '101 Pine St, Dhaka', 'AB+', '1994-07-18'),
(5, 'Moushumi Sultana', 'moushumi.sultana@example.com', '1029384756', '202 Maple St, Dhaka', 'O-', '1988-03-25'),
(6, 'Rasel Hossain', 'rasel.hossain@example.com', '4567890123', '303 Birch St, Dhaka', 'A-', '1995-12-10'),
(7, 'Fariha Begum', 'fariha.begum@example.com', '7896541230', '404 Cedar St, Dhaka', 'B+', '1993-06-14'),
(8, 'Tariq Khan', 'tariq.khan@example.com', '5556667777', '505 Walnut St, Dhaka', 'AB-', '1991-08-05'),
(9, 'Rina Akter', 'rina.akter@example.com', '1122334455', '606 Ash St, Dhaka', 'O+', '1987-11-29'),
(10, 'Suman Roy', 'suman.roy@example.com', '6677889900', '707 Oakwood St, Dhaka', 'A+', '1990-02-17');

-- --------------------------------------------------------

--
-- Table structure for table `patient_reports`
--

CREATE TABLE `patient_reports` (
  `ReportID` varchar(7) NOT NULL,
  `PatientID` int(11) DEFAULT NULL,
  `ReportDate` date DEFAULT NULL,
  `Diagnosis` text DEFAULT NULL,
  `Treatment` text DEFAULT NULL,
  `Prescriptions` text DEFAULT NULL,
  `TestResults` text DEFAULT NULL,
  `FollowUpDate` date DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_reports`
--

INSERT INTO `patient_reports` (`ReportID`, `PatientID`, `ReportDate`, `Diagnosis`, `Treatment`, `Prescriptions`, `TestResults`, `FollowUpDate`, `CreatedAt`, `UpdatedAt`) VALUES
('#000001', 1, '2025-01-23', 'Flu', 'Rest and fluids', NULL, NULL, NULL, '2025-01-23 17:47:49', '2025-01-23 17:47:49'),
('#000002', 2, '2025-01-22', 'Cold', 'Vitamin C and hydration', NULL, NULL, NULL, '2025-01-23 17:47:49', '2025-01-23 17:47:49'),
('#000003', 3, '2025-01-21', 'Migraine', 'Pain relievers and rest', NULL, NULL, NULL, '2025-01-23 17:47:49', '2025-01-23 17:47:49'),
('#000004', 4, '2025-01-20', 'Stomach Ache', 'Antacids and hydration', NULL, NULL, NULL, '2025-01-23 17:47:49', '2025-01-23 17:47:49'),
('#000005', 5, '2025-01-19', 'Cough', 'Cough syrup and rest', NULL, NULL, NULL, '2025-01-23 17:47:49', '2025-01-23 17:47:49'),
('#000006', 6, '2025-01-18', 'Back Pain', 'Physical therapy and pain relievers', NULL, NULL, NULL, '2025-01-23 17:47:49', '2025-01-23 17:47:49'),
('#000007', 7, '2025-01-17', 'Anxiety', 'Counseling and medication', NULL, NULL, NULL, '2025-01-23 17:47:49', '2025-01-23 17:47:49'),
('#000008', 8, '2025-01-16', 'Hypertension', 'Blood pressure medication and lifestyle changes', NULL, NULL, NULL, '2025-01-23 17:47:49', '2025-01-23 17:47:49'),
('#000009', 9, '2025-01-15', 'Diabetes', 'Insulin and dietary changes', NULL, NULL, NULL, '2025-01-23 17:47:49', '2025-01-23 17:47:49'),
('#000010', 10, '2025-01-14', 'Depression', 'Antidepressants and counseling', NULL, NULL, NULL, '2025-01-23 17:47:49', '2025-01-23 17:47:49');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `StaffID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`StaffID`, `Name`, `Email`, `Password`, `Role`) VALUES
(1, 'Dr. Ahmed Hossain', 'ahmed.hossain@gmail.com', 'password123', 'Doctor'),
(2, 'Dr. Imran Mahmud', 'imran.mahmud@gmail.com', 'password123', 'Doctor'),
(3, 'Dr. Saifur Rahman', 'saifur.rahman@gmail.com', 'password123', 'Doctor'),
(4, 'Dr. Zubair Karim', 'zubair.karim@gmail.com', 'password123', 'Doctor'),
(5, 'Dr. Khaled Hasan', 'khaled.hasan@gmail.com', 'password123', 'Doctor'),
(6, 'Dr. Farzana Rahman', 'farzana.rahman@gmail.com', 'password123', 'Doctor'),
(7, 'Dr. Nusrat Jahan', 'nusrat.jahan@gmail.com', 'password123', 'Doctor'),
(8, 'Dr. Tasnim Ahmed', 'tasnim.ahmed@gmail.com', 'password123', 'Doctor'),
(9, 'Dr. Fatima Yasmin', 'fatima.yasmin@gmail.com', 'password123', 'Doctor'),
(10, 'Dr. Rina Akhter', 'rina.akhter@gmail.com', 'password123', 'Doctor'),
(11, 'Nurse Jahanara', 'jahanara.nurse@gmail.com', 'nursepass', 'Nurse'),
(12, 'Nurse Rahima', 'rahima.nurse@gmail.com', 'nursepass', 'Nurse');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`AppointmentID`),
  ADD KEY `PatientID` (`PatientID`),
  ADD KEY `DoctorID` (`DoctorID`);

--
-- Indexes for table `blood_donor`
--
ALTER TABLE `blood_donor`
  ADD PRIMARY KEY (`DonorID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `blood_recipient`
--
ALTER TABLE `blood_recipient`
  ADD PRIMARY KEY (`RecipientID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`EquipmentID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`PatientID`);

--
-- Indexes for table `patient_reports`
--
ALTER TABLE `patient_reports`
  ADD PRIMARY KEY (`ReportID`),
  ADD KEY `PatientID` (`PatientID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `AppointmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `blood_donor`
--
ALTER TABLE `blood_donor`
  MODIFY `DonorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blood_recipient`
--
ALTER TABLE `blood_recipient`
  MODIFY `RecipientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `EquipmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `PatientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `StaffID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patient_reports`
--
ALTER TABLE `patient_reports`
  ADD CONSTRAINT `patient_reports_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

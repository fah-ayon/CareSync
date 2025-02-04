<?php
session_start();
require '../Resources/db_connection.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: ../index.html"); 
    exit();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $user_id = $_SESSION['user_id'];
    
    $phone = $_POST['phone'];
    $address = $_POST['address'];
    $blood_group = $_POST['blood_group'];
    $dob = $_POST['dob'];

    $stmt = $conn->prepare("UPDATE patient SET PhoneNumber = ?, Address = ?, BloodGroup = ?, DateOfBirth = ? WHERE PatientID = ?");
    $stmt->bind_param("ssssi", $phone, $address, $blood_group, $dob, $user_id);

    if ($stmt->execute()) {
        header("Location: UI.php");
        exit();
    } else {
        echo "Error updating profile: " . $conn->error;
    }

    $stmt->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration</title>
    <link rel="stylesheet" href="complete_profile.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap');
    </style>
</head>
<body>
    <header class="main-header">
        <div class="logo">
            <a href="../index.html" class="logo-link">
                <img src="../images/logo.jpg" alt="CareSync Logo">
                <span class="logo-text">CareSync</span>
            </a>
                        
        </div>
        <nav class="nav-links">
            <a href="/html/contact.html">Contact Us</a>
            <a href="/html/aboutus.html">About Us</a>
            <a href="/html/admin.html">Administrative Login</a>
        </nav>
    </header>

    <div class="hero">
    

        <div class="form-box">
            <form method="POST" action="" class="input-group">
                <h2>Complete Your Profile</h2>
                <label for="phone"> Phone Number:</label>
                <input type="tel" id="phone_no" phone_no="phone_no" required placeholder="Enter your phone number">
            <!-- Address field -->
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" required placeholder="Enter your address">
                <!-- Blood_Group field -->
                <label for="blood_group">Blood Group:</label>
                    <select id="blood_group" name="blood_group" required>
                        <option value="" disabled selected>Select your Blood-Group</option>
                        <option value="A+">A+</option>
                        <option value="A-">A-</option>
                        <option value="B+">B+</option>
                        <option value="B-">B-</option>
                        <option value="AB+">AB+</option>
                        <option value="AB-">AB-</option>
                        <option value="O+">O+</option>
                        <option value="O-">O-</option>
                    </select>
                
                <input type="date" name="dob" class="input-field" placeholder="Date of Birth" required>
                
                <button type="submit" class="submit-btn">Complete Profile</button>
            </form>
        </div>
    </div>


</body>
</html>
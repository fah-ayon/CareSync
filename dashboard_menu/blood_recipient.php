<?php
session_start();
require '../Resources/db_connection.php'; // Ensure the connection is properly established

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data safely
    $name = trim($_POST['name']);
    $email = trim($_POST['email']);
    $phone = trim($_POST['phone_no']);
    $address = trim($_POST['address']);
    $blood_group = trim($_POST['blood_group']);

    // Input validation
    if (empty($name) || empty($email) || empty($phone) || empty($address) || empty($blood_group)) {
        die("All fields are required!");
    }
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        die("Invalid email format.");
    }

    // Check if the email or phone number already exists in the database
    $check_stmt = $conn->prepare("SELECT * FROM blood_recipient WHERE Email = ? OR PhoneNumber = ?");
    $check_stmt->bind_param("ss", $email, $phone);
    $check_stmt->execute();
    $check_result = $check_stmt->get_result();

    if ($check_result->num_rows > 0) {
        die("Error: Email or Phone Number already exists.");
    }

    // Prepare an INSERT query using prepared statements
    $stmt = $conn->prepare("INSERT INTO blood_recipient (Name, Email, PhoneNumber, Address, BloodGroup) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("sssss", $name, $email, $phone, $address, $blood_group);

    if ($stmt->execute()) {
        echo "Success! Data has been inserted.";
        header("Location: thankyou2.html"); // Redirect to UI page after successful submission
        exit();
    } else {
        echo "Error: " . $conn->error;
    }

    // Close connections
    $stmt->close();
    $check_stmt->close();
    $conn->close();
}
?>

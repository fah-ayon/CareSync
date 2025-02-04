<?php
// Start session
session_start();

// Include the database connection
require '../../Resources/db_connection.php'; // Make sure the path is correct

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['submit'])) {
    // Get form data and sanitize it
    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $phone_no = mysqli_real_escape_string($conn, $_POST['phone_no']);
    $address = mysqli_real_escape_string($conn, $_POST['address']);
    $blood_group = mysqli_real_escape_string($conn, $_POST['blood_group']);

    // Validate form data
    if (empty($name) || empty($email) || empty($phone_no) || empty($address) || empty($blood_group)) {
        $_SESSION['error_message'] = "Please fill in all fields.";
        mysqli_close($conn); // Close the connection
        header("Location: ../html/blood_donor_form.html"); // Redirect to form page
        exit();
    }

    // Insert the data into the database
    $sql = "INSERT INTO blood_donor (name, email, phone_no, address, blood_group) 
            VALUES ('$name', '$email', '$phone_no', '$address', '$blood_group')";

    if (mysqli_query($conn, $sql)) {
        $_SESSION['success_message'] = "Thank you for your donation. Your information has been saved.";
        mysqli_close($conn); // Close the connection
        header("Location: ../html/thank_you.html"); // Redirect to a thank you page
        exit();
    } else {
        $_SESSION['error_message'] = "An error occurred while submitting the form. Please try again.";
        mysqli_close($conn); // Close the connection
        header("Location: ../html/blood_donor_form.html"); // Redirect to form page
        exit();
    }
}
?>

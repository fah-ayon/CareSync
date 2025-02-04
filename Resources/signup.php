<?php
session_start();
require 'db_connection.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Trim inputs to remove any accidental whitespace
    $username = trim($_POST['Username']);
    $email = trim($_POST['Email']);
    $password = $_POST['Password']; // Plaintext password

    // Basic validation
    if (empty($username) || empty($email) || empty($password)) {
        echo "<script>
            alert('All fields are required');
            window.location.href='../index.html';
        </script>";
        exit();
    }

    // Check existing user
    $check_stmt = $conn->prepare("SELECT * FROM patient WHERE Name = ? OR Email = ?");
    $check_stmt->bind_param("ss", $username, $email);
    $check_stmt->execute();
    $check_result = $check_stmt->get_result();

    if ($check_result->num_rows > 0) {
        echo "<script>
            alert('Username or email already exists! Please Login!');
            window.location.href='../index.html';
        </script>";
        exit();
    }

    // Insert new user
    $stmt = $conn->prepare("INSERT INTO patient (Name, Email, Password) VALUES (?, ?, ?)");
    $stmt->bind_param("sss", $username, $email, $password);

    if ($stmt->execute()) {
        $user_id = $conn->insert_id;
        $_SESSION['user_id'] = $user_id;
        $_SESSION['username'] = $username;

        header("Location: ../Resources/complete_profile.php");
        exit();
    } else {
        echo "<script>
            alert('Signup failed: " . $stmt->error . "');
            window.location.href='../index.html';
        </script>";
    }

    $stmt->close();
}
$conn->close();
?>
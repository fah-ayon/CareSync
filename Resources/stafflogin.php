<?php
session_start();
require 'db_connection.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['Email'];
    $password = $_POST['Password'];

    // Correct the variable name in the prepared statement
    $stmt = $conn->prepare("SELECT * FROM staff WHERE Email = ? AND Password = ?");
    $stmt->bind_param("ss", $email, $password);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows == 1) {
        $user = $result->fetch_assoc();
        $_SESSION['user_id'] = $user['StaffID'];
        $_SESSION['username'] = $user['Name'];
        header("Location: ../admin-staff-panel/staffpanel.php");
        exit();

    } else {
        echo "<script>
            alert('Invalid email or password');
            window.location.href = '../html/admin.html';

        </script>";
    }

    $stmt->close();
}
$conn->close();
?>
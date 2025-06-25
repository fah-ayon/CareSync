<?php
session_start();
require 'db_connection.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['Email'];
    $password = $_POST['Password'];


    $stmt = $conn->prepare("SELECT * FROM admin WHERE Email = ? AND Password = ?");
    $stmt->bind_param("ss", $email, $password);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows == 1) {
        $user = $result->fetch_assoc();
        $_SESSION['user_id'] = $user['AdminID'];
        $_SESSION['username'] = $user['Name'];
        header("Location: adminpanel.php");
        exit();

    } else {
        echo "<script>
            alert('Invalid email or password');
            window.location.href = '../navbar_menu/admin.html';

        </script>";
    }

    $stmt->close();
}
$conn->close();
?>

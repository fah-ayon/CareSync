<?php
// Start the session
session_start();

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    // If not logged in, redirect to login page
    header("Location: ../html/admin.html");
    exit();
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel</title>
    <link rel="stylesheet" href="adminpanel.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap');
    </style>
</head>
<header class="main-header">
        <div class="logo">
            <a href="../index.html" class="logo-link">
                <img src="../images/logo.jpg" alt="CareSync Logo">
                <span class="logo-text">CareSync</span>
            </a>
        </div>
            <nav class="nav-links">
                <a href="../Resources/logout.php" class="logout-btn">Logout</a>
            </nav>
</header>


<!-- This is for header -->




<body>


    <div class="hero">


        <h1>Welcome on board! <br> <?php echo $_SESSION['username']; ?></h1>
        
        
    </div>


    <footer class="footer">
        <a href="https://www.linkedin.com/in/abdullahalfahadayon" target="_blank">
            <img src="../images/linkedin.png" alt="LinkedIn" class="footer-icon">
        </a>
        <a href="https://github.com/fah-ayon" target="_blank">
            <img src="../images/github.png" alt="Github" class="footer-icon2">
        </a>
        <p>&copy; 2025 CareSync. All rights reserved.</p>
    </footer>

    <!-- Rest of your dashboard content -->
</body>
</html>
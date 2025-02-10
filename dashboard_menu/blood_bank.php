<?php
require_once '../Resources/db_connection.php';

// Count available donors by blood group
$sql = "SELECT BloodGroup, COUNT(*) as Available FROM blood_donor GROUP BY BloodGroup";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Blood Bank</title>
    <link rel="stylesheet" type="text/css" href="/dashboard_menu/css/blood_recipient.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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
            <a href="../navbar_menu/contact.html">Contact Us</a>
            <a href="../navbar_menu/aboutus.html">About Us</a>
            <a href="../navbar_menu/admin.html">Administrative Login</a>
        </nav>
    </header>

    <div class="hero"></div>
    
    <div class="recipient">
        <h2>Blood Bank</h2>
    
        <table class="blood-group-table">
            <thead>
                <tr>
                    <th>Blood Group</th>
                    <th>Available Donors</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody class="recipient-table">
                <?php if ($result->num_rows > 0): ?>
                    <?php while($row = $result->fetch_assoc()): ?>
                        <tr>
                            <td><?php echo htmlspecialchars($row['BloodGroup']); ?></td>
                            <td><?php echo htmlspecialchars($row['Available']); ?></td>
                            <td>
                            <button class="book-button" onclick="bookBloodGroup('<?php echo htmlspecialchars($row['BloodGroup']); ?>')">
                                Book
                            </button>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="3">No donors found.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>

    <script>
    function bookBloodGroup(bloodGroup) {
        window.location.href = `blood_recipient.html?bloodGroup=${bloodGroup}`;
    }
    </script>

    <footer class="footer">
        <a href="https://www.linkedin.com/in/abdullahalfahadayon" target="_blank">
            <img src="../images/linkedin.png" alt="LinkedIn" class="footer-icon">
        </a>
        <a href="https://github.com/fah-ayon" target="_blank">
            <img src="../images/github.png" alt="Github" class="footer-icon2">
        </a>
        <p>&copy; 2025 CareSync. All rights reserved.</p>
    </footer>
</body>
</html>

<?php
$conn->close();
?>





<style>

        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        /* This is for font */
        body {
            font-family: "Roboto", serif;
            font-size: 13px;
            padding-top: 80px;
        
        }
        
        h1, h2, h3 {
            font-family: "Roboto", serif;
            font-size: 20px;
        }
        
        /* Upper code is for font */
        
        /* For background */
        .hero{
            height: 100%;
            width: 100%;
            background-image: linear-gradient(rgba(253, 255, 255, 0.925), rgba(14, 170, 170, 0.4)), url(../images/login_background.jpg);
            background-position: center;
            background-size: cover;
            position: fixed;
            background-repeat: no-repeat;
            background-attachment: fixed;
            z-index: -1;
        }
        
        .recipient {
        text-align: center;        /* Centers all text content */
        margin: 20px auto;         /* Centers the sections horizontally and adds vertical spacing */
        max-width: 800px;          /* Optional: limits section width */
        padding: 30px;
        background: rgba(255, 255, 255, 0.9);
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    
    
    
    .recipient h2{
        text-align: center;        /* Centers all text content */
        margin: 20px auto;         /* Centers the sections horizontally and adds vertical spacing */
        max-width: 500px;          /* Optional: limits section width */
        padding: 30px;
        background: rgba(136, 187, 188, 0.9);
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    
    
    .recipient h2{
        margin: bottom 20px;
        color: #05888d;            /* Matches your color scheme */
    }
    


    .blood-group-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    }
    .blood-group-table th, .blood-group-table td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: center;
    }
    .blood-group-table th {
        background-color: #05888d;
        color: white;
    }
    .blood-group-table tr:nth-child(even) {
        background-color: #f2f2f2;
    }
                
        
    /* This is for Header Styles */
    .main-header {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        background: rgba(173, 236, 231, 0.95);
        padding: 15px 40px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-shadow: 0 2px 5px rgba(5, 121, 111, 0.425);
        z-index: 1000;
    }
    
    .logo {
        display: flex;
        align-items: center;
        gap: 10px; /* Ensure equal spacing between the logo image and text */
    }
    
    .logo img {
        height: 40px;
        width: auto;
    }
    
    .logo-link, .logo-text {
        text-decoration: none; /* Removes underline from <a> */
        font-family: 'PT Serif', serif;
        font-size: 35px;
        color: #05888d;
        position: static;
        margin: 0;
        display: flex; /* Ensures consistent alignment */
        align-items: center;
    }
    
    
    .nav-links {
        display: flex;
        gap: 0px;
    }
    
    .nav-links a {
        text-decoration: none;
        color: #024d50;
        font-family: 'Roboto', sans-serif;
        font-size: 16px;
        padding: 8px 15px;
        border-radius: 20px;
        transition: all 0.3s ease;
    }
    
    .nav-links a:hover {
        background: #b5dadb;
        color: #05888d;
    }
    
    /* Upper code is for Header Styles */

    .book-button {
        background-color: #05888d;
        color: white;
        border: none;
        padding: 8px 15px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    .book-button:hover {
        background-color: #036c6d;
    }


    /* Footer Styles */
    .footer {
        position: fixed;
        left: 0;
        bottom: 0;
        width: 100%;
        background-color: #05888d;
        color: rgb(151, 211, 203);
        text-align: center;
        padding: 0px 0;
        display: flex;
        justify-content: center; /* Changed to space-between */
        align-items: center;
        gap: 30px; /* Adjust spacing as needed */ 
    }
    
    .footer-icon {
        width: 15px; /* Adjust size as needed */
        height: 15px;
        transition: transform 0.3s ease;
        position: absolute;
        left: 10px; /* Distance from the left edge */
        top: 50%; /* Vertical center within the container */
        transform: translateY(-50%); /* Center alignment */
    }
    
    .footer-icon2 {
        width: 15px; /* Adjust size as needed */
        height: 15px;
        transition: transform 0.3s ease;
        position: absolute;
        left: 40px; /* Distance from the left edge */
        top: 50%; /* Vertical center within the container */
        transform: translateY(-50%); /* Center alignment */
    }
    
    /* Combined hover effect for both icons */
    .footer-icon:hover, 
    .footer-icon2:hover {
        transform: scale(1.1); /* Slight zoom effect on hover */
    }
    
    /* Upper code is for footer */


</style>
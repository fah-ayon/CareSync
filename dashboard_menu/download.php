<?php
require('./fpdf186/fpdf.php');
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "caresyncdb";


$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Database connection failed: " . $conn->connect_error);
}


$report_id = $_GET['report_id'] ?? '';

if ($report_id == '') {
    die("No Report ID provided.");
}


$stmt = $conn->prepare("
    SELECT pr.*, p.Name AS PatientName, p.PhoneNumber AS PatientPhone
    FROM patient_reports pr
    JOIN patient p ON pr.PatientID = p.PatientID
    WHERE pr.ReportID = ?
");

$stmt->bind_param("s", $report_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    die("Report not found.");
}

$row = $result->fetch_assoc();


$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial','B',16);
$pdf->Cell(0,10,'Patient Medical Report',0,1,'C');
$pdf->Ln(10);

$pdf->SetFont('Arial','',12);
$pdf->Cell(0,10,'Report ID: ' . $row['ReportID'], 0, 1);
$pdf->Cell(0,10,'Patient ID: ' . $row['PatientID'], 0, 1);
$pdf->Cell(0,10,'Patient Name: ' . $row['PatientName'], 0, 1);
$pdf->Cell(0,10,'Phone Number: ' . $row['PatientPhone'], 0, 1);
$pdf->Cell(0,10,'Report Date: ' . $row['ReportDate'], 0, 1);
$pdf->Cell(0,10,'Diagnosis: ' . $row['Diagnosis'], 0, 1);
$pdf->Cell(0,10,'Treatment: ' . $row['Treatment'], 0, 1);
$pdf->Cell(0,10,'Prescriptions: ' . ($row['Prescriptions'] ?? 'N/A'), 0, 1);
$pdf->Cell(0,10,'Test Results: ' . ($row['TestResults'] ?? 'N/A'), 0, 1);
$pdf->Cell(0,10,'Follow-Up Date: ' . ($row['FollowUpDate'] ?? 'N/A'), 0, 1);
$pdf->Cell(0,10,'Created At: ' . $row['CreatedAt'], 0, 1);
$pdf->Cell(0,10,'Last Updated: ' . $row['UpdatedAt'], 0, 1);


$pdf->Output('D', $row['PatientName'] . '_' . $row['ReportID'] . '.pdf');

exit;
?>

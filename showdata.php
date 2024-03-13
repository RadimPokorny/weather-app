<?php
require_once('dbconnection.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $Odkdy = date('Y-m-d', strtotime($_POST['oddata']));
    $Dokdy = date('Y-m-d', strtotime($_POST['dodata']));

    $sql = "SELECT DATE_FORMAT(insert_time, '%Y-%m-%d') AS day, MAX(temp) AS max_temperature 
            FROM weather 
            WHERE insert_time >= ? 
            AND insert_time <= ? 
            GROUP BY DATE_FORMAT(insert_time, '%Y-%m-%d');";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $Odkdy, $Dokdy);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Output data of each row
        while ($row = $result->fetch_assoc()) {
            echo "Date: " . $row["day"] . " - Max Temperature: " . $row["max_temperature"] . "<br>";
        }
    } else {
        echo "0 results";
    }

    $stmt->close();
} else {
    // Handle the case when the form is not submitted
    echo "Form not submitted.";
}

$conn->close();
?>

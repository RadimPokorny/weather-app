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

    $data = array(); // Initialize an array to hold the data

    if ($result->num_rows > 0) {
        // Output data of each row
        while ($row = $result->fetch_assoc()) {
            // Add each row of data to the array
            $data[] = $row;
        }
    } else {
        echo "0 results";
    }

    // Output the data array as JSON
    echo json_encode($data);

    $stmt->close();
} else {
    // Handle the case when the form is not submitted
    echo "Form not submitted.";
}

$conn->close();
?>
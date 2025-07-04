<?php
//phpinfo();

$dbHost = getenv('DB_HOST');
$dbUser = getenv('DB_USER');
$dbPassword = getenv('DB_PASSWORD');
$dbName = getenv('DB_NAME');

$mysqli = new mysqli($dbHost, $dbUser, $dbPassword, $dbName);
if ($mysqli->connect_error) {
    die('Connect Error (' . $mysqli->connect_errno . ') '. $mysqli->connect_error);
}

//echo "Connected successfully!";

$sql = "select * from employees";
$result = $mysqli->query($sql);
$mysqli->close();
?>

<!DOCTYPE html>
<html lang="en">
<h1>Employees Table</h1>
<body>
    <section>
        <table border='1' cellpadding='5'>
            <tr><th>ID</th><th>Name</th><th>Age</th><th>Department</th><th>Salary</th><th>Date Hired</th></tr>
        <?php 
            while($rows=$result->fetch_assoc()) {
        ?>
            <tr>
                <td><?php echo $rows['id'];?></td>
                <td><?php echo $rows['name'];?></td>
                <td><?php echo $rows['age'];?></td>
                <td><?php echo $rows['department'];?></td>
                <td><?php echo $rows['salary'];?></td>
                <td><?php echo $rows['hire_date'];?></td>
            </tr>
        <?php
            }
        ?>
        </table>
    </section>
</body>
</html>
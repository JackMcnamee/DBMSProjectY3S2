<?php
//Send utf-8 header before any output
header('Content-Type: text/html; charset=utf-8'); 
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Php Picture Table Example</title>
		
	</head>	
    
	<body>	
		<table border="1">
			
			<tr>
				<td><h2>PPSN</h2></td>
				<td><h2>First Name</h2></td>
				<td><h2>Surname</h2></td>
				<td><h2>DOB</h2></td>
				<td><h2>Phone No.</h2></td>
				<td><h2>Address</h2></td>
				<td><h2>Email</h2></td>
				<td><h2>Treatment</h2></td>
				<td><h2>Dental Xray</h2></td>
			</tr>

			<?php			
				$host = "localhost";
				$user = "root";
				$password = "";	
				$database = "dentalpractice";
				
				$query = "Select ppsn, firstname, surname, dob, phoneno, address, email, treatment, dentalXray from patient";
				//Connect to the database
				$connect = mysqli_connect($host,$user,$password,$database) or die("Problem connecting.");
				//Set connection to UTF-8
				mysqli_query($connect,"SET NAMES utf8");
				//Select data
				$result = mysqli_query($connect,$query) or die("Bad Query.");

				mysqli_close($connect);

				while($row = $result->fetch_array())
				{
					echo "<tr>";
					echo "<td><h2>" .$row['ppsn'] . "</h2></td>";
					echo "<td><h2>" .$row['firstname'] . "</h2></td>";
					echo "<td><h2>" .$row['surname'] . "</h2></td>";
					echo "<td><h2>" .$row['dob'] . "</h2></td>";
					echo "<td><h2>" .$row['phoneno'] . "</h2></td>";
					echo "<td><h2>" .$row['address'] . "</h2></td>";
					echo "<td><h2>" .$row['email'] . "</h2></td>";
					echo "<td><h2>" .$row['treatment'] . "</h2></td>";
					echo "<td><h2><img src=image_patients.php?ppsn=".$row['ppsn']." width=200 height=150/></h2></td>";
				    echo "</tr>";
				}
			?>
		<table>
	</body>
</html>
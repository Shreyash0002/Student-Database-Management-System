<%@page import="net.javaguides.sms.controller.StudentController"%>
<%@page import="net.javaguides.sms.entity.Student"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Management System</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>

<br>
<br>
	<div class = "container">
		<div class = "row">
			<div class ="col-lg-6 col-md-6 col-sm-6 container justify-content-center card">
				<h1 class = "text-center"> Update Student </h1>
				<div class = "card-body">
					<form action="/students/${student.id}" modelAttribute="student" method="POST">
						<div class ="form-group">
							<label> Student First Name </label>
							<input
							type = "text"
							name = "firstName"
							value ="${student.firstName}"
							
							/>
						</div>
						
						<div class ="form-group">
							<label> Student Last Name </label>
							<input
							type = "text"
							name = "lastName"
							value ="${student.lastName}"
							
							/>
						</div>
						
						<div class ="form-group">
							<label> Student Email </label>
							<input
							type = "text"
							name = "email"
							value = "${student.email}"
							
							/>
						</div>
						
						<div class = "box-footer">
							<button type="submit" class = "btn btn-primary">
								Submit
							</button>
						</div>
					</form>
				
				</div>
			</div>
		</div>
	</div>
</body>
</html>

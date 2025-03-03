<%@page import="net.javaguides.sms.entity.Student"%>
<%@page import="java.util.List"%>
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


	<div class ="container">
		<div class = "row">
			<h1> List Students </h1>
		</div>
		
		<div class = "row">
			<div class = "col-lg-3">
				<a href="/students/new" class = "btn btn-primary btn-sm mb-3"> Add Student</a>
			</div>
		</div>
		<table class = "table table-striped table-bordered">
			<thead class = "table-dark">
				<tr>
					<th> Student First Name</th>
					<th> Student Last Name</th>
					<th> Student Email </th>
					<th>Date and Time</th>
					<th> Actions </th>
				</tr>
			</thead>
			
	 <tbody>
				<%
					List<Student> students =(List<Student>)request.getAttribute("students");


					for (Student student : students) {
				%>
					<tr>
						<td><%= student.getFirstName() %></td>
						<td><%= student.getLastName() %></td>
						<td><%= student.getEmail() %></td>
						<td><%=student.getRdate() %>/
						</td>
						
				<td>
							<a href="/students/edit/<%= student.getId() %>" class="btn btn-primary">Update</a>
							<a href="/students/<%= student.getId() %>" class="btn btn-danger">Delete</a>
						</td>
					</tr>
				<%
					}
				%>
			</tbody>  
		
		</table>
		
	</div>
</body>
</html>

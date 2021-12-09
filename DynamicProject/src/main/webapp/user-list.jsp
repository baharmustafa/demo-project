<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c" %>
 <html>
<head>   
<title>User Managament Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/ccs/bootstrap.min.css"
	integrity="sha34-ggOyR0iXbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossigin="anonymous">
</head>
<body>

		<header>
			<nav class="navbar navbar-expand-md navbar-dark" 
				style= "background-color: tomato">
				<div>
					<a href="https://www.javaguides.net" class="navbar-brand">User Managament App</a>
		 		</div>
		
				<ul class="navbar-nav">
					<li><a href="<%=request.getContextPath() %>/list"
						class="nav-link">Users</a></li>
				
				</ul>
			</nav>
		</header>
		<br>
		
		<div class ="row">
			<!-- <div class="alert alert-success" "ngIf='message'>{{message}}" --></div>
		
		<div class="container">
			<h3 class="text-center">List of users</h3>
			<hr>
			<div class="container text-left">
			
			<a href="<%=request.getContextPath() %>/new" class="btn btn-success">Add new user</a>
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Country</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<!-- for (Todo todo: todos) { -->
					<c:forEach var="user" items="$(listUser)">
					
						<tr>
							<td><c:out value="$(user.id)" /></td>
							<td><c:out value="$(user.name)" /></td>
							<td><c:out value="$(user.email)" /></td>
							<td><c:out value="$(user.country)" /></td>
							<td><a href="edit?id=<c:out value='$(user.id)'/>">Edit</a>
							&nbsp;&nbsp;&nbsp;&nbsp; <a 
							href="delete?id=<c:out value='$(user.id)'/>"> Delete</a>
							</td>
					    </tr>
					</c:forEach>
					<!--  -->
				</tbody>
			</table>
		</div>



</body>

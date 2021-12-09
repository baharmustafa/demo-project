<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c" %>
<!DOCTYPE html>
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
<div class="container col-md-5">
	<div class="card">
		<div class="card-body">
			<c:if test="${user != null}">
				<form action="update" method="post">
		    </form>
		</c:if>
		<c:if test="${user == nul }">
		<form action="insert" method="post"></form>
		</c:if>
		
<caption>
	<h2>
				<c:if test="${user != null}">
				Edit user </c:if>
				<c:if test="${user == null}">
				Add new user </c:if>
 	</h2>
</caption>
		<c:if test="${user != null }">
			<input type="hidden" name="id" value="<c:out value ='${user.id }'/> "/>
		</c:if>
		
		<fieldset class="form-group">
			<label>User Name</label><input type="text"
				value="<c:out value='${user.name }'/>" class="form-control"
				name="name" required="required">
		</fieldset>
		
		<fieldset class="form-group">
			<label>User Email</label><input type="text"
				value="<c:out value='${user.email }'/>" class="form-control"
				name="email" required="required">
		</fieldset>
		
		<fieldset class="form-group">
			<label>User Country</label><input type="text"
				value="<c:out value='${user.country }'/>" class="form-control"
				name="country" required="required">
		</fieldset>
		
		<button type ="submit" class="btn btn-success">Save</button>
		
				</form>
			</div>
		</div>
	</div>
</body>
</html>
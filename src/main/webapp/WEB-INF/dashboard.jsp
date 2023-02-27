<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Dashboard</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/css/main.css">
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/static.js"></script>
</head>
<body class="p-2">
	
	<header class="d-flex justify-content-center p-5">
		<h1 class="p-2 flex-grow-1 display-4 text-light" >GettinSwol</h1>
		<h4 class="text-light align-self-center display-6 p-4"  >Hi <c:out value="${user.fname }"/></h4>
		<a class="btn btn-warning opacity-50 align-self-center justify-content-end p-2  "  href="/logout">Logout</a>
	</header>
	<div id="dashboardBorder" class="d-flex flex-column justify-content-center">
		<div id="dashboardHeader" class="text-center">
			<h3 class="display-5 p-4"> Activity</h3>
			<a class="btn btn-warning opacity-75 align-self-center justify-content-end p-3  text-dark m-3"  href="/workout/new">Add A Workout</a>
		</div>
		<div id="borderTheme" class="col-6 container text-center">
		<table class="table fs-5">
			  <thead>
			    <tr>
			      <th scope="col">Date of Workout</th>
			      <th scope="col">Posted By</th>
			      <th scope="col">Workout</th>
			      <th scope="col">Type</th>
			      <th scope="col">Duration</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<c:forEach var="workout" items="${allWorkouts }">
			    <tr>
			      <td scope="row"><fmt:formatDate value="${workout.dateOfWorkout}" type="date" dateStyle="long"/></td>
			      <td><c:out value="${workout.createdBy.fname }"/></td>
			      <td><a href="/workout/${workout.id }/view" class="text-warning opacity-75">${workout.name}</a></td>
			      <td>${workout.workoutType }</td>
			      <td>${workout.duration }</td>
			    </tr>
			    </c:forEach>
			  </tbody>
			</table>
		</div>
	</div>
	
	
</body>
</html>


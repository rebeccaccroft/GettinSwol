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
    <title>View Workout</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/css/main.css">
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/static.js"></script>
</head>
<body>
	<header class="d-flex justify-content-center p-5">
		<h1 class="p-2 flex-grow-1 display-4 text-light">GettinSwol</h1>
		<h4 class="text-light align-self-center display-6 p-4"  >Hi <c:out value="${user.fname }"/></h4>
		<a
			class="btn btn-warning opacity-50 align-self-center justify-content-end p-2 m-2  "
			href="/dashboard">Dashboard</a> <a
			class="btn btn-warning opacity-50 align-self-center justify-content-end p-2  "
			href="/logout">Logout</a>
	</header>
	<div>
		<div>
			<h1 class="display-5 d-flex justify-content-center  shadow p-3 mb-5 rounded p-3">Workout Details </h1>
		</div>
		<div>
			<h3 class="display-6 d-flex justify-content-center p-3">Date of Workout: </h3>
			<h3  class="d-flex justify-content-center ">
			<fmt:formatDate value="${workout.dateOfWorkout}" type="date" dateStyle="long"/>
			</h3>
		</div>
		<div>
			<h3 class="display-6 d-flex justify-content-center p-3">Name of Workout: </h3>
			<h3 class="d-flex justify-content-center "><c:out value="${workout.name }"/></h3>
		</div>
		<div>
			<h3 class="display-6 d-flex justify-content-center p-3">Type of Workout: </h3>
			<h3  class="d-flex justify-content-center "><c:out value="${workout.workoutType }"/></h3>
		</div>
		<div>
			<h3 class="display-6 d-flex justify-content-center p-3">Duration (In Minutes): </h3>
			<h3  class="d-flex justify-content-center "><c:out value="${workout.duration}"/></h3>
		</div>
		<div>
			<h3 class="display-6 d-flex justify-content-center p-3">Notes: </h3>
			<h3  class="d-flex justify-content-center "><c:out value="${workout.notes}"/></h3>
		</div>
	</div>
	<c:if test="${workout.createdBy.id == user.id}">
		<div class="d-flex justify-content-center ">
			<a href="/workout/${workout.id}/edit" class="btn btn-warning opacity-75  p-3 m-5 ">Edit Workout</a>
			<a href="/workout/${workout.id}/delete" class="btn btn-danger p-3 m-5 opacity-75">Delete Workout</a>
		</div>
	</c:if>
</body>
</html>


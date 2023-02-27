<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Workout</title>
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
			<h1 class="display-5 d-flex justify-content-center p-3">Edit Workout</h1>
		</div>
		<div class="d-flex justify-content-center">
			<form:form action="/workout/${workout.id }/update" method="POST" modelAttribute="workout">
				<input type="hidden" name="_method" value="PUT" />
				<div class="mb-3">
					<form:label class="form-label" path="name">Name of Workout</form:label>
					<form:input class="form-control" path="name" />
					<form:errors path="name" />
				</div>
				<div class="mb-3">
					<form:label class="form-label" path="dateOfWorkout">Date of Workout</form:label>
					<form:input type="date" class="form-control" path="dateOfWorkout" />
					<form:errors path="dateOfWorkout" />
				</div>
				<div class="mb-3">
					<form:label class="form-label" path="workoutType">Type of Workout</form:label>
					<form:select class="form-control" path="workoutType">
						<c:forEach var="type" items="${typesOfWorkouts}">
							<form:option class="form-control" value="${type}" />
						</c:forEach>
					</form:select>
					<form:errors path="workoutType" />
				</div>
				<div class="mb-3">
					<form:label class="form-label" path="duration">Duration (minutes)</form:label>
					<form:input class="form-control" path="duration" />
					<form:errors path="duration" />
				</div>
				<div class="mb-3">
					<form:label class="form-label" path="notes">Notes</form:label>
					<form:textarea class="form-control" path="notes" />
					<form:errors path="notes" />
				</div>
				<div>
					<form:input type="hidden" path="createdBy" value="${user.id}" />
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form:form>
		</div>
	</div>
</body>
</html>


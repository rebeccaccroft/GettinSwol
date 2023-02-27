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
    <title>Registration</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/css/main.css">
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/static.js"></script>
</head>
<body>
	<header class="d-flex justify-content-center p-5">
		<h1 class="p-2 flex-grow-1 display-4 text-light" >GettinSwol</h1>
		<a class="btn btn-warning opacity-50 align-self-center justify-content-end p-2  "  href="/">Login Here</a>
	</header>
	<div class="d-flex justify-content-center m-2 p-5 " >
		<div class="d-flex p-3 rounded" id="borderTheme">
		<form:form action="/register" method="POST" modelAttribute="user">
		<h3 >Register Here</h3>
			<div class="p-2" >
				<form:label path="fname">First Name: </form:label>
				<form:input class="form-control" path="fname" />
				<form:errors path="fname"/>
			</div>
			<div class="p-2">
				<form:label path="lname">Last Name: </form:label>
				<form:input class="form-control" path="lname" />
				<form:errors path="lname"/>
			</div>
			<div class="p-2">
				<form:label path="email">Email:  </form:label>
				<form:input class="form-control" path="email" />
				<form:errors path="email"/>
			</div>
			<div class="p-2">
				<form:label path="passwordActive">Password: </form:label>
				<form:input  class="form-control" path="passwordActive" type="password"/>
				<form:errors path="passwordActive"/>
			</div>
			<div class="p-2">
				<form:label path="confirmPass">Confirm Password:  </form:label>
				<form:input class="form-control" path="confirmPass" type="password"/>
				<form:errors path="confirmPass"/>
			</div>
			<button class="btn btn-warning opacity-75 m-3">Register</button>
		</form:form>
		</div>
	</div>
		
</body>
</html>


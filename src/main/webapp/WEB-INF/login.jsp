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
    <title>Login</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/css/main.css">
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/static.js"></script>
</head>
<body>
	<header class="d-flex justify-content-center p-5">
		<h1 class="p-2 flex-grow-1 display-4 text-light" >GettinSwol</h1>
		<a class="btn btn-warning opacity-50 align-self-center justify-content-end p-2  "  href="/register">Register Here</a>
	</header>
		<div class="d-flex justify-content-center p-5">
		<div class="d-flex p-3 rounded" id="borderTheme">
		<form:form action="/login" method="POST" modelAttribute="loginUser">
			<h3>Login Here</h3>
			<div class="p-2">
				<form:label class="form-label "  path="email">Email: </form:label>
				<form:input class="form-control" path="email"/>
				<form:errors path="email"/>
			</div>
			<div class="p-2">
				<form:label class="form-label"  path="password">Password: </form:label>
				<form:input class="form-control"  path="password" type="password"/>
				<form:errors path="password"/>
			</div>
			<button class="btn btn-warning opacity-75 m-3">Login</button>
		</form:form>
		</div>
	</div>
</body>
</html>


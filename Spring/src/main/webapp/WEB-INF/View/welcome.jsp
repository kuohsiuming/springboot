<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="">員工薪資系統</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<sec:authorize access="hasRole('manager')">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="/portfolio">員工資料表</a></li>

						<li class="nav-item"><a class="nav-link" href="/salary">薪資資料表</a></li>
					</sec:authorize>
					<li class="nav-item"><a class="nav-link" href="/logout">logout</a>

					</li>

				</ul>
			</div>
		</div>
	</nav>
	
	<%-- <sec:authentication property="principal"/>  查看登入用戶
		 <sec:authentication property="details"/> 查看登入ip session id
	
	 --%>
	
	<br>
	<br>
	<br>
	<div class="container">
		


		
		<sec:authorize access="hasRole('manager')">
			<h2>welcome manager</h2>
		</sec:authorize>
		<sec:authorize access="hasRole('employee')">
			<h2>welcome employee</h2>
		</sec:authorize>


	</div>

	<br>
	<br>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
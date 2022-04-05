<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<a class="navbar-brand" href="/portfolio">員工薪資系統</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/portfolio">員工資料表</a></li>
					<li class="nav-item"><a class="nav-link" href="/salary">薪資</a></li>
					<li class="nav-item"><a class="nav-link" href="/logout">logout</a>
					</li>

				</ul>
			</div>
		</div>
	</nav>
	<br>
	<br>
	

	<form:form method="POST" modelAttribute="employee" class="form-signin">
		<div class="container">
			<h4>使用者: ${pageContext.request.userPrincipal.name}</h4>

			<br>
			<fieldset>
				<legend>員工註冊</legend>
				<div class="row">
					<div class="form-group col-md-6">

						員工id：
						<form:input path="employeeid" class="form-control" />
					</div>
					<div class="form-group col-md-6">

						姓名：
						<form:input path="name" class="form-control" />
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-6">
						密碼：<br />
						<form:input type="password"
							pattern="^((?=.{8,}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).*|(?=.{8,}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!\u0022#$%&'()*+,./:;<=>?@[\]\^_`{|}~-]).*)"
							title="密碼長度須超過八個字  密碼複雜度須包含:
 小寫字母 [a-z] 大寫字母 [A-Z] 數字   "
							path="password" class="form-control" />
					</div>
					<div class="form-group col-md-6">
						連絡電話：<br />
						<form:input path="tel" class="form-control" pattern="^09[0-9]{8}$"
							title="請輸入正確電話號碼" />
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-6">

						角色：<br />
						<form:select path="role"  class="form-select">
							<option selected>請選擇角色</option>
							<option value="admin,normal,ROLE_manager">admin,normal,ROLE_manager</option>
							<option value="normal,ROLE_employee">normal,ROLE_employee</option>
						</form:select>

					</div>
				</div>






				<p />

				<p />
				部門：<br />
				<div class="form-check">
					<form:radiobutton class="form-check-input" path="department"
						value="資訊" />
					<label class="form-check-label" for="flexRadioDefault1">資訊</label>
				</div>
				<div class="form-check">
					<form:radiobutton class="form-check-input" path="department"
						value="銷售" />
					<label class="form-check-label" for="flexRadioDefault2">銷售</label>
				</div>
				<div class="form-check">
					<form:radiobutton class="form-check-input" path="department"
						value="客服" />
					<label class="form-check-label" for="flexRadioDefault3">客服</label>
				</div>
				<div class="form-check">
					<form:radiobutton class="form-check-input" path="department"
						value="人資" />
					<label class="form-check-label" for="flexRadioDefault4">人資</label>
				</div>
				<p />

				<p />

				<p />


				<p />
				<input style="display: none" type="text" id="_method" name="_method"
					class="btn btn-lg btn-primary btn-block" value="${ _method }"
					readonly />
				<p />
				<p />

				<button type="submit" class="btn btn-primary">Submit</button>
			</fieldset>

		</div>

	</form:form>

	<fieldset class="container">


		<legend>員工資料表</legend>

		<table border="1" class="table table-striped">
			<thead>
				<tr>
					<td>ID</td>
					<td>員工id</td>
					<td>部門</td>
					<td>姓名</td>
					<td>密碼</td>
					<td>連絡電話</td>
					<td>角色</td>
					<td>修改</td>
					<td>刪除</td>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="e" items="${employees}">
					<tr>
						<td>${e.id}</td>
						<td>${e.employeeid}</td>
						<td>${e.department}</td>
						<td>${e.name}</td>
						<td>${e.password}</td>
						<td>${e.tel}</td>
						<td>${e.role}</td>
						<td><a href="/portfolio/${ e.id }">Update</a></td>
						<td><a href="/portfolio/delete/${ e.id }">Delete</a></td>
					</tr>

				</c:forEach>
			</tbody>
		</table>



	</fieldset>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
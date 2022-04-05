<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log in with your account</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>


	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="/login">員工薪資系統</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

		</div>
		<div>
			<a class="navbar-brand" href="/register">註冊</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

		</div>


	</nav>

	<br>
	<br>
	<form:form method="POST" modelAttribute="employee" class="form-signin">

		<div class="container">
			<fieldset>
				<legend>登入</legend>

				<div class="form-group col-md-6">
					姓名：<br />
					<form:input type="text"  path="name" class="form-control" />
				</div>

				<p />
				<div class="form-group col-md-6">
					密碼： <br />
					<form:input type="password"  path="password" class="form-control"
						pattern="^((?=.{8,}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).*|(?=.{8,}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!\u0022#$%&'()*+,./:;<=>?@[\]\^_`{|}~-]).*)"
						title="密碼長度須超過八個字  密碼複雜度須包含:
 小寫字母 [a-z] 大寫字母 [A-Z] 數字   " />
					<br> <input type="checkbox" name="remember-me" value="true" />
					remember me <input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />


				</div>
				<br>
				<p />
				<button type="submit" class="btn btn-lg btn-primary btn-block"
					onclick="return myfunction()">login</button>
				<br>	
				<br> <font color="red">${error}</font> 
				
				
				
			</fieldset>
		</div>
	</form:form>

	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
		function myfunction() {

			if (document.getElementById("name").value == '') {
				alert("帳號不能為空")
				return false;
			}
			if (document.getElementById("password").value == '') {
				alert("密碼不能為空")
				return false;
			}
			return true;
		}
	</script>

</body>


</html>
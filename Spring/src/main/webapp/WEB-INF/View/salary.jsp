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
	<form:form method="POST" modelAttribute="salary" class="form-signin">
		<div class="container">
			<br>

			<fieldset>
				<legend>員工薪資</legend>

				<div class="row">

					<div class="form-group col-md-6">


						員工id：
						<form:select path="employeeid"  class="form-select">
							<option selected>請選擇員工id</option>
							<c:forEach var="e" items="${employees}">
								<option  value="${e.employeeid}">${e.employeeid}</option>
							</c:forEach>
						</form:select>

					</div>
					<br>
					<div class="form-group col-md-6">
						本薪：
						<form:input path="salary" class="form-control" />

					</div>

				</div>


				<br>
				<div class="row">
					<div class="form-group col-md-6">
						薪資年月日:
						<form:input path="date" type="date" />
					</div>

				</div>
				<br>





				<hr>

				<div class="row">

					<div class="form-group col-md-6">

						加薪項：<br> <br>
						<div class="form-check">

							<input type="checkbox" class="form-check-input" id="mychbox1"
								onchange="setInput()"> <label class="form-check-lable"
								for="mychbox1">加班費</label> <input type="text" id="inputData1"
								name="raise1" disabled>
						</div>


						<br>
						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="mychbox2"
								onchange="setInput()"> <label class="form-check-lable"
								for="mychbox1">全勤費</label> <input type="text" id="inputData2"
								name="raise2" disabled>

						</div>
						<br>
						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="mychbox3"
								onchange="setInput()"> <label class="form-check-lable"
								for="mychbox1">主管津貼</label> <input type="text" id="inputData3"
								name="raise3" disabled>
						</div>
						<br>
						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="mychbox4"
								onchange="setInput()"> <label class="form-check-lable"
								for="mychbox1">伙食津貼</label> <input type="text" id="inputData4"
								name="raise4" disabled>
						</div>

					</div>
					<div class="form-group col-md-6">
						減薪項：<br> <br>
						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="mychbox5"
								onchange="setInput()"> <label class="form-check-lable"
								for="mychbox1">健保費</label> <input type="text" id="inputData5"
								name="paycut1"  disabled>
						</div>
						<br>
						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="mychbox6"
								onchange="setInput()"> <label class="form-check-lable"
								for="mychbox1">勞保費</label> <input type="text" id="inputData6"
								name="paycut2"  disabled>
						</div>

					</div>
				</div>
				<input style="display: none" type="text" id="_method" name="_method"
					class="btn btn-lg btn-primary btn-block" value="${ _method }"
					readonly /> <br>
				<button type="submit" class="btn btn-primary">Submit</button>

				<br>

			</fieldset>
		</div>





	</form:form>





	<br>
	<fieldset class="container">


		<legend>員工薪資表</legend>

		<table border="1" class="table table-striped">
			<thead>
				<tr>
					<td>ID</td>
					<td>員工id</td>
					<td>薪資年月日</td>
					<td>本薪</td>
					<td>加班費</td>
					<td>全勤費</td>
					<td>主管津貼</td>
					<td>伙食津貼</td>
					<td>加薪總額</td>
					<td>健保費</td>
					<td>勞保費</td>
					<td>減薪總額</td>
					<td>總薪</td>
					<td>修改</td>
					<td>刪除</td>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="e" items="${salarys}">
					<tr>
						<td>${e.id}</td>
						<td>${e.employeeid}</td>
						<td>${e.date}</td>
						<td>${e.salary}</td>
						<td>${e.raise1}</td>
						<td>${e.raise2}</td>
						<td>${e.raise3}</td>
						<td>${e.raise4}</td>
						<td>${e.raise}</td>
						<td>${e.paycut1}</td>
						<td>${e.paycut2}</td>
						<td>${e.paycut}</td>
						<td>${e.total}</td>
						<td><a href="/salary/${ e.id }">Update</a></td>
						<td><a href="/salary/delete/${ e.id }">Delete</a></td>
					</tr>

				</c:forEach>
			</tbody>
		</table>



	</fieldset>
	<script>
		function setInput() {

			document.getElementById("inputData1").disabled = !document
					.getElementById("mychbox1").checked
			document.getElementById("inputData2").disabled = !document
					.getElementById("mychbox2").checked
			document.getElementById("inputData3").disabled = !document
					.getElementById("mychbox3").checked
			document.getElementById("inputData4").disabled = !document
					.getElementById("mychbox4").checked
			document.getElementById("inputData5").disabled = !document
					.getElementById("mychbox5").checked
			document.getElementById("inputData6").disabled = !document
					.getElementById("mychbox6").checked
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js">
		
	</script>
</body>
</html>
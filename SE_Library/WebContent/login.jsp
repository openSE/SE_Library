<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
	<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<title>Login</title>
</head>
<body>
	<%-- header --%>
	<div class = "jumbotron" style="background-color:#BDBDBD;">	
		<header class="blog-header container py-3">
			<div class="row flex-nowrap justify-content-between align-items-center">
				<div class="col-4 pt-1">
					<a class="navbar-brand" href="home.jsp"><i class="fa fa-home" style="color:black" aria-hidden="true"></i></a>
				</div>
				<div class="col-4 text-center">
					<a class="blog-header-logo text-dark" style="font-weight: bold; font-size:2.0rem;">SE도서관 관리자 로그인</a>
				</div>
				<div class="col-4">
					<a class="blog-header-logo text-dark" href="./main.jsp" style="font-weight: bold; font-size:2.0rem;"></a>
				</div>
			</div>
		</header>
	</div>
	
	<%-- content --%>
	<div class="container" align="center">
		<div class="col-md-5 col-md-offset-5">
			<h3 class="form-signin-heading">SE도서관의 도서를 등록하기 위해서는 로그인 하십시오</h3>
			<%-- login fail --%>
			<%
				String error = request.getParameter("error");
				if (error != null){
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요. ");
					out.println("</div>");
				}
			%>
			
			<%-- login form --%>
			<form class="login-Form" action="#" method="post">	
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User ID</label>
					<input type="text" class="form-control" placeholder="ID" name='username' required autofocus>
 				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" class="form-control" placeholder="Password" name='password' required>
 				</div> 
 				<p> <input type="submit" style="background-color:blue; border-color:blue; color:white; border-radius: 12px;" class="btn btn-lg" type="submit" value="Login">			
				<input type="button" style="background-color:white; border-color:black; color:black; border-radius: 12px;" class="btn btn-lg" type="button" onclick="location.href='./main.jsp'" value="back">			
				</p>
			</form>
		</div>
	</div>

	<%-- footer --%>
	<footer class ="container">
		<p>&copy; KGU SE lab</p>
	</footer>	
</body>
</html>	
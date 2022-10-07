<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
	<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<title>SE Library</title>
</head>
<body>
	<div class="container">
		<%-- header --%>
		<header class="blog-header py-3">
			<div class="row flex-nowrap justify-content-between align-items-center">
				<div class="col-4 pt-1">
					<a class="navbar-brand" href="home.jsp"><i class="fa fa-home" style="color:black" aria-hidden="true"></i></a>
				</div>
				<div class="col-4 text-center">
					<a class="blog-header-logo text-dark" href="./home.jsp" style="font-weight: bold; font-size:2.0rem;">SE도서관</a>
				</div>
				<div class="col-4">
					<a class="blog-header-logo text-dark" href="./home.jsp" style="font-weight: bold; font-size:2.0rem;"></a>
				</div>
			</div>
  		</header>
  		
		<%-- nav --%>
		<div class="nav-scroller py-1 mb-2">
			<nav class="nav d-flex justify-content-between">
				<a class="p-2 text-muted" href="./login.jsp" style="font-size:1.2rem;">관리자</a>
				<a class="p-2 text-muted" href="./bookList.jsp" style="font-size:1.2rem;">도서 목록</a>
			</nav>
		</div>
		
		<%-- profile --%>
		<div class="jumbotron p-4 p-md-5 text-white rounded bg-dark">
			<div class="row">
				<div class="col-md-6 px-0">
					<p class="font-weight-bold lead my-3">SE library introduction</p>
					<p class="lead mb-0"><a class="text-white">경기대학교의 자랑 SE도서관에 방문하기 위해 저희 웹사이트를 찾아주셔서 감사합니다. 오늘도 지식이 충만한 하루 보내시길 바랍니다.</a></p>
				</div>
				<div class="col-md-6 px-0" style="text-align:center; display:flex;">
					<img data-src="holder.js/300x300" class="img-thumbnail" alt="300x300" src="./resources/image/SElibrary.jpeg" 
					data-holder-rendered="true" style="width: 300px; height:300px;margin:auto; display:inline-block;">
				</div>
			</div>
			<div class="col-md-6 px-0" class="row" >
				<div> <br> </div>
			</div> 
		</div>
		
		<%-- footer --%>
		<footer>
			<p>&copy; KGU SE lab</p>
		</footer>
	</div>
</body>
</html>
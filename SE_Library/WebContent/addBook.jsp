<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
	<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<title>도서 등록</title>
</head>
<body>
	<% // 로그인 여부 검사
	String id = (String)session.getAttribute("id");
	String role = (String)session.getAttribute("role");
	
	if (id == null || role == null) {
		response.sendRedirect("home.jsp");
	}
	%>

	<% // 도서 등록 여부 검사
	if (request.getParameter("result") != null) {
		int result = Integer.parseInt(request.getParameter("result"));
		if (result >= 1) {
			%>
			<script>
				alert("도서 등록이 완료되었습니다.");
			</script>
			<%
		}
		else {
			%>
			<script>
				alert("도서 등록에 실패했습니다.");
			</script>
			<%
		}
	}
	%>

	<%-- header --%>
	<div class="jumbotron container" style="background-color:#BDBDBD;">
		<header class="blog-header py-3">
			<div class="row flex-nowrap justify-content-between align-items-center">
				<div class="col-4 pt-1">
					<a class="navbar-brand" href="main.jsp"><i class="fa fa-home" style="color:black" aria-hidden="true"></i></a>
				</div>
				<div class="col-4 text-center">
					<a class="blog-header-logo text-dark" style="font-weight: bold; font-size:2.0rem;">도서 등록</a>
				</div>
				<div class="col-4">
					<a class="blog-header-logo text-dark"  style="font-weight: bold; font-size:2.0rem;"></a>
				</div>
			</div>
		</header>
	</div>

	<div class="container">
		<%-- logout --%>
		<div class="text-right">
			<a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
		</div>

		<%-- form --%>
		<form name="newBook" action="book" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row"> 
				<label class="col-sm-2">도서 제목</label>
				<div class="col-sm-3">
					<input type="text" id="bookName" name="bookName" class="form-control">
					<!-- 유효성 검사 위해 id 속성 추가 -->
 				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">저자</label>
				<div class="col-sm-3">
					<input type="text" id="author" name="bookAuthor" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">출판사</label>
				<div class="col-sm-3">
					<input type="text" id ="publisher" name="bookPublisher" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">출판 년도</label>
				<div class="col-sm-3">
					<input type="number" id ="publishYear" name="bookPublishYear" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상세 설명</label>
				<div class="col-sm-3">
					<textarea id = "description" name="bookDescription" cols="60" rows="3" class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">표지</label>
				<div class="col-sm-5">
					<input type="file" name="bookImage" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" style="background-color:blue; border-color:blue; color:white; border-radius: 12px;" class="btn btn-primary" type="submit" value="등록">
				</div>
			</div>
		</form>
	</div>
</body>
</html>
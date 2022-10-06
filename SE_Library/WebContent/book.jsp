<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.Book" %>
<%
String id = request.getParameter("id");
Book book = null;
book = (Book)request.getAttribute("book");

if (id == null) {
	response.sendRedirect("home.jsp");
	// 에러 페이지 이동 수정
} else if (book == null){
	response.sendRedirect("book/info?id=" + id);
} else if (book.getBookId() > 0) { %>

<!DOCTYPE html>
<html>
<head>
<title>도서 상세 정보</title>
	<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
	<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<%-- header --%>
	<div class = "jumbotron" style="background-color:#BDBDBD;">
		<div class="container">
			<header class="blog-header py-3">
				<div class="row flex-nowrap justify-content-between align-items-center">
					<div class="col-4 pt-1">
						<a class="navbar-brand" href="./main.jsp"><i class="fa fa-home" style="color:black" aria-hidden="true"></i></a>
					</div>
					<div class="col-4 text-center">
						<a class="blog-header-logo text-dark" style="font-weight: bold; font-size:2.0rem;">SE 도서 상세 정보</a>
					</div>
					<div class="col-4">
						<a class="blog-header-logo text-dark" style="font-weight: bold; font-size:2.0rem;"></a>
					</div>
				</div>
			</header>
      </div>
	</div>
      
	<%-- content, 도서 상세 정보 출력 부분 --%>
	<div class="container">
		<div class="row">
			<div class ="col-md-4">
				<img src="../resources/image/<%= book.getBookImageName() %>" style="width: 100%"/>
			</div>
			<div class="col-md-8"	>
				<h3><%= book.getBookName() %></h3>
				<p><%= book.getBookDescription() %></p>
				<p><b>출판사 : </b><%= book.getBookPublisher() %></p>
				<p><b>저자 : </b><%= book.getBookAuthor() %></p>
				<p> <b>출판날짜 </b> : <%=book.getBookPublishYear() %></p>
			</div>
		</div>
	</div>

	<%-- footer --%>
	<footer class ="container mt-3">
		<p>&copy; KGU SE lab</p>
	</footer>
</body>
</html>
<%
} else {
	// error 페이지 전송
	response.sendRedirect("../home.jsp");
}
%>
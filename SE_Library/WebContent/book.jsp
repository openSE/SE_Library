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
<title>Insert title here</title>
</head>
<body>
	<header>
		<div style="height: 100px;">
			<h1 align="center">도서 상세 정보</h1>
		</div>
	</header>
	<div style="width: 500px;">
		<h3><%= book.getBookName() %></h3>
		<p><%= book.getBookId() %></p>
		<p><%= book.getBookDescription() %></p>
		<p><b>저자 : </b><%= book.getBookAuthor() %></p>
		<p><b>출판사 : </b><%= book.getBookPublisher() %></p>
		<img alt="300x300" src="../resources/image/<%= book.getBookImageName() %>" style="width:800px; margin: 40px auto"/>
	</div>
	<footer class ="container">
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
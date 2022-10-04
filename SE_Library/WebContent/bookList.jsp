<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Book, java.util.*" %>
<%
	ArrayList<Book> books = null;
	books = (ArrayList<Book>)request.getAttribute("bookList");
	
	if (books == null) {
		System.out.println("redirect");
		response.sendRedirect("bookList");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Book List</title>
</head>
<body>
	<header>
		<div style="height: 100px;">
			<h1 align="center">도서 목록</h1>
		</div>
	</header>
	<div class="container">
		<table border="1">
			<tr>
				<th>No.</th>
				<th>도서 제목</th>
				<th>저자</th>
				<th>출판사</th>
				<th>출판연도</th>
			</tr>
			<%
				if (books != null) {
					int size = books.size();
					for (int i = 0; i < size; i++) { 
						Book book = books.get(i);
					%>
						<tr>
							<td><%= "" + book.getBookId() %></td>
							<td><%= "" + book.getBookName() %></td>
							<td><%= "" + book.getBookAuthor() %></td>
							<td><%= "" + book.getBookPublisher() %></td>
							<td><%= "" + book.getBookPublishYear() %></td>
						</tr>
					<%}
				}
			%>
		</table>
	</div>
	<footer class ="container">
		<p>&copy; KGU SE lab</p>
	</footer>
</body>
</html>
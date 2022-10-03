<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<%--
				for (;;) { %>
					<tr>
						<td><%=id %></td>
						<td><%=title %></td>
						<td><%=author %></td>
						<td><%=publisher %></td>
						<td><%=publishDate %></td>
					</tr>
				<%}
			--%>
		</table>
	</div>
	<footer class ="container">
		<p>&copy; KGU SE lab</p>
	</footer>
</body>
</html>
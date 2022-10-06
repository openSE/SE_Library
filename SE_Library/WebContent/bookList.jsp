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
	<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
	<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<title>Book List</title>
</head>
<body>
	<%-- header --%>
	<div class = "jumbotron" style="background-color:#BDBDBD;">
		<div class="container">
			<header class="blog-header py-3">
				<div class="row flex-nowrap justify-content-between align-items-center">
					<div class="col-4 pt-1">
						<a class="navbar-brand" href="<%= application.getContextPath() %>/home.jsp"><i class="fa fa-home" style="color:black" aria-hidden="true"></i></a>
					</div>
					<div class="col-4 text-center">
						<a class="blog-header-logo text-dark" style="font-weight: bold; font-size:2.0rem;">SE 도서목록</a>
					</div>
					<div class="col-4">
						<a class="blog-header-logo text-dark" style="font-weight: bold; font-size:2.0rem;"></a>
					</div>
				</div>
			</header>
		</div>
	</div>
	
	<div class="container">
		<%-- search --%>
		<form action="<%= application.getContextPath() %>/bookList/search" class="form-horizontal mb-5">
			<div class="form-inline form-group pull-right">
				<label for="search" class="col-sm-2 control-label font-weight-bold">도서 제목 검색</label>
				<input class="form-control col-sm-6" type="text" id="search" name="search" placeholder="Search" autocomplete="off">
				<div class="col-sm-1">
					<button class="btn btn-dark" type="submit">Search</button>          
				</div>
			</div>
		</form>
		
		<%-- book list --%>
		<table class="table table-striped table-bordered text-center">
			<tr>
				<th>No.</th>
				<th>도서 제목</th>
				<th>저자</th>
				<th>출판사</th>
				<th>출판연도</th>
				<th>비고</th>
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
							<td class="p-1"><a class="btn btn-secondary text-white" href="<%= application.getContextPath() %>/book.jsp?id=<%= book.getBookId()%>">상세보기 &raquo;</a></td>
						</tr>
					<%}
				}
			%>
		</table>
		
		<%-- footer --%>
		<footer class ="container">
			<p>&copy; KGU SE lab</p>
		</footer>
	</div>
</body>
</html>
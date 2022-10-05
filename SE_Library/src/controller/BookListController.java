package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.Book;
import service.BookService;

@WebServlet(urlPatterns = {"/bookList", "/bookList/search"})
public class BookListController extends HttpServlet {
	private final Logger LOGGER = LoggerFactory.getLogger(BookController.class.getName());
	private BookService bookService = null;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		LOGGER.info("[실행] BookListController init");
		bookService = new BookService();
		super.init(config);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LOGGER.info("[실행] get book list controller");
		List<Book> bookList = new ArrayList();
		
		if (req.getServletPath().equals("/bookList")) {
			bookList = bookService.getBookList();
		}
		else if (req.getServletPath().contentEquals("/bookList/search")) {
			bookList = bookService.searchBookList(req.getParameter("search"));
		}
		
		req.setAttribute("bookList", bookList);
		RequestDispatcher rd = req.getRequestDispatcher("/bookList.jsp");
		rd.forward(req, resp);
	}
}
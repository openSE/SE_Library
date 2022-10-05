package controller;

import java.io.IOException;
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

@WebServlet("/book")
public class BookSaveController extends HttpServlet {
	private final Logger LOGGER = LoggerFactory.getLogger(BookSaveController.class.getName());
	private BookService bookService = null;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		LOGGER.info("[실행] BookController init");
		bookService = new BookService();
		super.init(config);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LOGGER.info("[실행] add book controller");
		
		int result = bookService.addBook(req, resp);
		
		LOGGER.info("[결과] add book 결과: " + result);
		
		resp.sendRedirect("addBook.jsp?result="+result);
	}
}

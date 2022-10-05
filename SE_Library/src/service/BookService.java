package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.Book;
import repository.BookRepository;

public class BookService {
	private final Logger LOGGER = LoggerFactory.getLogger(BookService.class.getName());
	private BookRepository bookRepository = null;
	
	public BookService() {
		LOGGER.info("[실행] BookController init");
		bookRepository = new BookRepository();
	}
	
	public int addBook(HttpServletRequest req, HttpServletResponse resp) {
		LOGGER.info("[실행] BookService addBook");
		int result = 0;
		try {
			String saveFolder = req.getSession().getServletContext().getRealPath("/resources/image");
			String encType = "UTF-8";
			int maxSize = 5 * 1024 * 1024;
			
			MultipartRequest multi = null;
			multi = new MultipartRequest(req, saveFolder, maxSize, encType, new DefaultFileRenamePolicy());
			
			String bookName = multi.getParameter("bookName");
			String bookAuthor = multi.getParameter("bookAuthor");
			String bookPublisher = multi.getParameter("bookPublisher");
			String bookPublishYear = multi.getParameter("bookPublishYear");
			String bookDescription = multi.getParameter("bookDescription");
			String bookImageName = multi.getFilesystemName("bookImage");
			Book book = new Book(bookName, bookAuthor, bookPublisher, bookPublishYear, bookDescription, bookImageName);
			
			result = bookRepository.addBook(book);
		} catch (Exception e) {
			LOGGER.error("BookService addBook fail");
			LOGGER.error("Exception: " + e.getMessage());
		}
		
		return result;
	}
	
	public List<Book> getBookList() {
		LOGGER.info("[실행] BookService getBookList");
		List<Book> bookList = bookRepository.getBookList();
		return bookList;
	}
	
	public List<Book> searchBookList(String search) {
		LOGGER.info("[실행] BookService searchBookList");
		List<Book> bookList = bookRepository.searchBookList(search);
		return bookList;
	}
	
	public Book getBook(String id) {
		LOGGER.info("[실행] BookService getBook");
		Book book = bookRepository.getBook(Integer.parseInt(id));
		return book;
	}
}
package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.Book;

public class BookRepository {
	private final Logger LOGGER = LoggerFactory.getLogger(BookRepository.class.getName());
	DBConnection dbConnection = null;
	
	public BookRepository() {
		try {
			dbConnection = DBConnection.getInstance();
		} catch (Exception e) {
			LOGGER.error("DBConnection getInstance fail\n", e);
		}
	}
	public int addBook(Book book) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			conn = dbConnection.getConnection();
			
			String bookName = book.getBookName();
			String bookAuthor = book.getBookAuthor();
			String bookPublisher = book.getBookPublisher();
			String bookPublishYear = book.getBookPublishYear();
			String bookDescription = book.getBookDescription();
			String bookImageName = book.getBookImageName();
			
			if (bookImageName != null) {
			
				String sql = "insert into book (b_name, b_author, b_publisher, b_publishYear, b_description, b_imageName) values (?, ?, ?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bookName);
				pstmt.setString(2, bookAuthor);
				pstmt.setString(3, bookPublisher);
				pstmt.setString(4, bookPublishYear);
				pstmt.setString(5, bookDescription);
				pstmt.setString(6, bookImageName);
			}
			else {
				String sql = "insert into book (b_name, b_author, b_publisher, b_publishYear, b_description) values (?, ?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bookName);
				pstmt.setString(2, bookAuthor);
				pstmt.setString(3, bookPublisher);
				pstmt.setString(4, bookPublishYear);
				pstmt.setString(5, bookDescription);
			}
			
			result = pstmt.executeUpdate();
		
		} catch (Exception e) {
			LOGGER.error("insert 실패");
			LOGGER.error("Exception: " + e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				LOGGER.error("close 실패");
				LOGGER.error("Exception: " + e.getMessage());
			}
		}
		
		return result;
	}
	
	public List<Book> getBookList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Book> bookList = new ArrayList();
		
		try {
			conn = dbConnection.getConnection();
			
			String sql = "select * from book";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
	
			while (rs.next()) {
				int bookId = rs.getInt("b_id");
				String bookName = rs.getString("b_name");
				String bookAuthor = rs.getString("b_author");
				String bookPublisher = rs.getString("b_publisher");
				String bookPublishYear = rs.getString("b_publishYear");
				String bookDescription = rs.getString("b_description");
				Book book = new Book(bookId, bookName, bookAuthor, bookPublisher, bookPublishYear, bookDescription);
				bookList.add(book);
			}
		} catch (Exception e) {
			LOGGER.error("book list load fail");
			LOGGER.error("Exception: " + e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				LOGGER.error("close 실패");
				LOGGER.error("Exception: " + e.getMessage());
			}
		}
		return bookList;
	}
	
	public List<Book> searchBookList(String search) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Book> bookList = new ArrayList();
		
		try {
			conn = dbConnection.getConnection();
			
			String sql = "select * from book where b_name like '%"+ search +"%'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
	
			while (rs.next()) {
				int bookId = rs.getInt("b_id");
				String bookName = rs.getString("b_name");
				String bookAuthor = rs.getString("b_author");
				String bookPublisher = rs.getString("b_publisher");
				String bookPublishYear = rs.getString("b_publishYear");
				String bookDescription = rs.getString("b_description");
				Book book = new Book(bookId, bookName, bookAuthor, bookPublisher, bookPublishYear, bookDescription);
				bookList.add(book);
			}
		} catch (Exception e) {
			LOGGER.error("book list search fail");
			LOGGER.error("Exception: " + e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				LOGGER.error("close 실패");
				LOGGER.error("Exception: " + e.getMessage());
			}
		}
		return bookList;
	}
	
	public Book getBook(int id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Book book = new Book();
		
		try {
			conn = dbConnection.getConnection();
	
			String sql = "select * from book where b_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();

			rs.next();
			int bookId = rs.getInt("b_id");
			String bookName = rs.getString("b_name");
			String bookAuthor = rs.getString("b_author");
			String bookPublisher = rs.getString("b_publisher");
			String bookPublishYear = rs.getString("b_publishYear");
			String bookDescription = rs.getString("b_description");
			String bookImageName = rs.getString("b_imageName");
			
			book = new Book(bookId, bookName, bookAuthor, bookPublisher, bookPublishYear, bookDescription, bookImageName);
			
			LOGGER.info("Book info load 완료 / " + book);
		} catch (Exception e) {
			LOGGER.error("book info get fail");
			LOGGER.error("Exception: " + e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				LOGGER.error("close 실패");
				LOGGER.error("Exception: " + e.getMessage());
			}
		}
		return book;
	}
}
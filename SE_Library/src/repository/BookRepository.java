package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
			String bookImageName = book.getBookImageName();
			
			if (bookImageName != null) {
			
				String sql = "insert into book (b_name, b_author, b_publisher, b_publishYear, b_imageName) values (?, ?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bookName);
				pstmt.setString(2, bookAuthor);
				pstmt.setString(3, bookPublisher);
				pstmt.setString(4, bookPublishYear);
				pstmt.setString(5, bookImageName);
			}
			else {
				String sql = "insert into book (b_name, b_author, b_publisher, b_publishYear) values (?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bookName);
				pstmt.setString(2, bookAuthor);
				pstmt.setString(3, bookPublisher);
				pstmt.setString(4, bookPublishYear);
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
}

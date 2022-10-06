package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.Book;

public class UserRepository {
	private final Logger LOGGER = LoggerFactory.getLogger(UserRepository.class.getName());
	DBConnection dbConnection = null;
	
	public UserRepository() {
		try {
			dbConnection = DBConnection.getInstance();
		} catch (Exception e) {
			LOGGER.error("DBConnection getInstance fail\n", e);
		}
	}
	
	public String getUser(String id, String password) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String role = null;
		
		try {
			conn = dbConnection.getConnection();
	
			String sql = "select * from user where u_id = ? and u_password = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();

			if (rs.next() == false) {
				role = "error";
			}
			else {
				role = rs.getString("u_role");
			}
			
			LOGGER.info("User info load 완료 / " + id);
		} catch (Exception e) {
			LOGGER.error("user info get fail");
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
		return role;
	}
}

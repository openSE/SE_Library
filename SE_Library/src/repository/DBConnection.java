package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	private String url = "jdbc:mariadb://localhost:3308/library_db?characterEncoding=UTF-8";
	private String user = "libraryUser";
	private String password = "0000";
	private String className = "org.mariadb.jdbc.Driver";
	
	private static DBConnection instance = null;
	
	public DBConnection() throws Exception {
		try {
			Class.forName(className);
		} catch (Exception e) {
			throw new Exception("Failed to create JDBC Driver", e);
		}
	}
	
	public static DBConnection getInstance() throws Exception {
		if (instance == null) {
			instance = new DBConnection();
		}
		
		return instance;
	}
	
	public Connection getConnection() throws SQLException {
		return DriverManager.getConnection(url, user, password);
	}
}

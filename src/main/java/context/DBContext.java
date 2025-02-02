package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
	 private static final String URL = "jdbc:mysql://localhost:3306/foodweb";
	    private static final String USER = "root"; // Thay bằng user của bạn
	    private static final String PASSWORD = "root"; // Nếu có mật khẩu, nhập vào đây

	    public static Connection getConnection() throws SQLException, ClassNotFoundException {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        return DriverManager.getConnection(URL, USER, PASSWORD);
	    }
}

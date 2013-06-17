package user.Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*properties file needs to be implemented*/
public class Util {
	private static Connection conn = null;
	
	public static Connection getConnection(){
		if(conn != null){
			return conn;
		}else{
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/abhi", "root", "abhi5555");
				return conn;
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
		return conn;
	}
}

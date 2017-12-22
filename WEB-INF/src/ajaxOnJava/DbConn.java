package ajaxOnJava;

import java.sql.Connection;
import java.sql.DriverManager; 

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConn{
	
	private static Connection conn;
	
	public static Connection getConnection() {
		
		if ( conn != null ) return conn;
		
		Connection con = null;
		String driver = "com.mysql.jdbc.Driver";
		try {
			Class.forName(driver).newInstance();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Failed to load mySQL driver.");
			return null;
		}
		// mysql> select user();
		// +----------------+
		// | user()         |
		// +----------------+
		// | root@localhost |
		// +----------------+		 
		// mysql> SHOW VARIABLES WHERE Variable_name = 'port';
		// +---------------+-------+
		// | Variable_name | Value |
		// +---------------+-------+
		// | port          | 3306  |
		// +---------------+-------+
		try {
			con = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/AJAX?user=root&password=sktelecom82e");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	
	
	public static void main(String[] args) {
		Connection conn  = getConnection();
		
		String queryString = "";
        try
        {
            queryString = "SELECT CITY, STATE FROM ZIPCODES where ZIPCODE="
                + "0154" + ";";
            Statement select = conn.createStatement();
            ResultSet result = select
                    .executeQuery(queryString);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(">>>>");
	}
}

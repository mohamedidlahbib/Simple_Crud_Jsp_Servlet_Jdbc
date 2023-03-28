package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {

	
	private static Connection cn;
	private static String url="jdbc:mysql://localhost:3306/prepa";
		
		public static Connection getConnection() throws ClassNotFoundException, SQLException{
	        if(cn == null){
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            cn=DriverManager.getConnection(url,"root","");
	            System.out.print("connected");
	        }else {
	        	System.out.print("error");
	        }
	        return cn;
	    }
	
}


package Config;

import java.sql.Connection;
import java.sql.DriverManager;



public class Conexion {
	
	Connection con;
	
	public Conexion() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/barberia_db","root","mysql");
		}catch(Exception e) {
			System.err.print("Error "+ e);
		}
		
	}
	
	
	public Connection getConnection() {
		return con;
	}
	
	
}

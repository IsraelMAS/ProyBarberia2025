package Config;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    private Connection con;

    public Conexion() {

        try {
        	
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Variables de entorno (Railway)
            String host = System.getenv("MYSQLHOST");
            String port = System.getenv("MYSQLPORT");
            String db   = System.getenv("MYSQLDATABASE");
            String user = System.getenv("MYSQLUSER");
            String pass = System.getenv("MYSQLPASSWORD");


            String url = "jdbc:mysql://" + host + ":" + port + "/" + db
                       + "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

            con = DriverManager.getConnection(url, user, pass);

            System.out.println("Conexión MySQL exitosa");

        } catch (Exception e) {
            System.err.println("Error de conexión MySQL");
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        return con;
    }
}



// mysql://root:dvUqnwdyAjMasJNhmodtbzAtqvrCEIiA@switchyard.proxy.rlwy.net:13545/railway









/*
package Config;

import java.sql.Connection;
import java.sql.DriverManager;



public class Conexion {
	
	Connection con;
	
	public Conexion() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/barberia_db","root","Sistemas141004*");
		}catch(Exception e) {
			System.err.print("Error "+ e);
		}
		
	}
	
	
	public Connection getConnection() {
		return con;
	}
	
	
}*/

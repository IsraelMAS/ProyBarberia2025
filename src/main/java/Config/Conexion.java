package Config; 

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    private Connection con;

    public Conexion() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // AQUÍ ESTÁN TUS DATOS DE RAILWAY DIRECTOS:
            // Esto funcionará tanto en tu PC como en la Nube
            String url = "jdbc:mysql://nozomi.proxy.rlwy.net:10989/railway";
            String user = "root";
            String pass = "NPZVRHqmRpvWGtKNEpjbkpQpEBnxTQaH"; 
            
            con = DriverManager.getConnection(url, user, pass);
            System.out.println("✅ Conexión exitosa a la base de datos de Railway");
            
        } catch (Exception e) {
            System.err.println("Error de conexión: " + e.getMessage());
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

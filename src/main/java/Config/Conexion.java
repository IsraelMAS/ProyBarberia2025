package Config; // <--- OJO: Asegúrate de que esto coincida con tu paquete real

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    Connection con;

    public Conexion() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // 1. Intentamos leer las variables de la Nube (Railway)
            String host = System.getenv("MYSQLHOST");
            String port = System.getenv("MYSQLPORT");
            String user = System.getenv("MYSQLUSER");
            String password = System.getenv("MYSQLPASSWORD");
            String database = System.getenv("MYSQLDATABASE");

            // 2. Si las variables están vacías, significa que estamos en TU PC (Local)
            if (host == null || host.isEmpty()) {
                System.out.println("⚠️ Variables de entorno no detectadas. Usando configuración LOCAL.");
                host = "localhost";
                port = "3306";
                user = "root";       // <--- Tu usuario local de MySQL
                password = "Sistemas141004*";       // <--- Tu contraseña local (a veces es vacía o "root" o "123456")
                database = "barberia_db"; // <--- El nombre de tu base de datos EN TU PC
            } else {
                System.out.println("✅ Variables de entorno detectadas. Conectando a RAILWAY.");
            }

            // 3. Armamos la URL final
            String url = "jdbc:mysql://" + host + ":" + port + "/" + database;
            
            // 4. Conectamos
            con = DriverManager.getConnection(url, user, password);
            
        } catch (Exception e) {
            System.err.println("Error de conexión: " + e.getMessage());
        }
    }

    public Connection getConexion() {
        return con;
    }
}




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

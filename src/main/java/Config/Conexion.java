package Config; // <--- OJO: Asegúrate de que esto coincida con tu paquete real

import java.sql.Connection;
import java.sql.DriverManager;

 public Conexion() {

        try {
            // DRIVER NUEVO (el viejo ya está deprecado)
        	
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Variables de entorno (Railway)

		 public class Conexion {

            con = DriverManager.getConnection(url, user, pass);

            System.out.println("✅ Conexión MySQL exitosa");
            System.out.println("Conexión MySQL exitosa");

        } catch (Exception e) {
            System.err.println("❌ Error de conexión MySQL");
            System.err.println("Error de conexión MySQL");
            e.printStackTrace();
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

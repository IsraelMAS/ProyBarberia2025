package ModeloDAO;

import Config.Conexion;
import Modelos.Admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDAO {

    Conexion cn = new Conexion();

    public Admin login(String usuario, String contrasena) {
        String sql = "SELECT * FROM admin WHERE usuario = ? AND contrasena = ?";
        Admin a = null;

        try (Connection con = cn.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, usuario);
            ps.setString(2, contrasena);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                a = new Admin();
                a.setIdAdmin(rs.getInt("id_admin"));
                a.setUsuario(rs.getString("usuario"));
            }

        } catch (Exception e) {
            System.err.println("Error login admin: " + e.getMessage());
        }
        return a;
    }

}

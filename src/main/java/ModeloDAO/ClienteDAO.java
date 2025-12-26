package ModeloDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Config.Conexion;
import Modelos.Cliente;

public class ClienteDAO {

    private final Conexion cn = new Conexion();

    public boolean registrar(Cliente cliente) {
        String sql = "INSERT INTO cliente (nombre, telefono, contrasena) VALUES (?, ?, ?)";
        try (Connection con = cn.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, cliente.getNombre());
            ps.setString(2, cliente.getTelefono());
            ps.setString(3, cliente.getContrasena());
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.err.println("Error registrar cliente: " + e.getMessage());
            return false;
        }
    }

    public Cliente validarLogin(String telefono, String contrasena) {
        String sql = "SELECT id_cliente, nombre, telefono, contrasena FROM cliente WHERE telefono=? AND contrasena=?";
        try (Connection con = cn.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, telefono);
            ps.setString(2, contrasena);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Cliente c = new Cliente();
                    c.setIdCliente(rs.getInt("id_cliente"));
                    c.setNombre(rs.getString("nombre"));
                    c.setTelefono(rs.getString("telefono"));
                    c.setContrasena(rs.getString("contrasena"));
                    return c;
                }
            }

        } catch (Exception e) {
            System.err.println("Error validar login: " + e.getMessage());
        }
        return null;
    }
}

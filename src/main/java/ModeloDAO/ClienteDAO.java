package ModeloDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Config.Conexion;
import Interfaces.Inter_cliente;
import Modelos.Cliente;

public class ClienteDAO implements Inter_cliente {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Cliente c = new Cliente();


    // ================= INSERTAR =================
    @Override
	public boolean insertar(Cliente cliente) {
		String sql = "INSERT INTO cliente (nombre, telefono) VALUES('" + cliente.getNombre() + "','" + cliente.getTelefono() + "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.execute();
            return true;
        } catch (Exception e) {
            System.err.println("Error insertar cliente: " + e.getMessage());
        }
        return false;
	}

    // ================= BUSCAR POR TELÉFONO =================
    @Override
    public Cliente buscarPorTelefono(String telefono) {
		String sql = "SELECT * FROM cliente WHERE telefono='" + telefono + "'";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                c.setIdCliente(rs.getInt("id_cliente"));
                c.setNombre(rs.getString("nombre"));
                c.setTelefono(rs.getString("telefono"));
            }
        } catch (Exception e) {
            System.err.println("Error buscar cliente por teléfono: " + e.getMessage());
        }
        return c;
	}

    // ================= BUSCAR POR ID =================
    @Override
    public Cliente buscarPorId(int idCliente) {
		String sql = "SELECT * FROM cliente WHERE id_cliente=" + idCliente;

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                c.setIdCliente(rs.getInt("id_cliente"));
                c.setNombre(rs.getString("nombre"));
                c.setTelefono(rs.getString("telefono"));
            }
        } catch (Exception e) {
            System.err.println("Error buscar cliente por ID: " + e.getMessage());
        }
        return c;
	}
    // ================= LISTAR (ADMIN) =================
    public List<Cliente> listar() {
        List<Cliente> lista = new ArrayList<>();
        String sql = "SELECT id_cliente, nombre, telefono FROM cliente ORDER BY id_cliente DESC";

<<<<<<< Updated upstream
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Cliente c = new Cliente();
                c.setIdCliente(rs.getInt("id_cliente"));
                c.setNombre(rs.getString("nombre"));
                c.setTelefono(rs.getString("telefono"));
                lista.add(c);
            }

        } catch (Exception e) {
            System.err.println("Error listar clientes: " + e.getMessage());
        }

        return lista;
    }
=======

>>>>>>> Stashed changes
}

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

    // ================= INSERTAR (SIN LOGIN) =================
    @Override
    public boolean insertar(Cliente cliente) {
        String sql = "INSERT INTO cliente (nombre, telefono) VALUES (?, ?)";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cliente.getNombre());
            ps.setString(2, cliente.getTelefono());
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            System.err.println("Error insertar cliente: " + e.getMessage());
            return false;
        }
    }
   
    // ================= LOGIN CLIENTE=================
    public Cliente login(String telefono, String contrasena) {
        String sql = "SELECT * FROM cliente WHERE telefono = ? AND contrasena = ?";
        Cliente c = null;

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, telefono);
            ps.setString(2, contrasena);
            rs = ps.executeQuery();

            if (rs.next()) {
                c = new Cliente();
                c.setIdCliente(rs.getInt("id_cliente"));
                c.setNombre(rs.getString("nombre"));
                c.setTelefono(rs.getString("telefono"));
            }

        } catch (Exception e) {
            System.err.println("Error login cliente: " + e.getMessage());
        }
        return c;
    }

 // ================= REGISTRAR =================
    public boolean registrar(Cliente cliente) {
        String sql = "INSERT INTO cliente (nombre, telefono, contrasena) VALUES (?, ?, ?)";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cliente.getNombre());
            ps.setString(2, cliente.getTelefono());
            ps.setString(3, cliente.getContrasena());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.err.println("Error registrar cliente: " + e.getMessage());
            return false;
        }
    }
    
    // ================= BUSCAR POR TELÉFONO =================
    @Override
    public Cliente buscarPorTelefono(String telefono) {
        String sql = "SELECT * FROM cliente WHERE telefono = ?";
        Cliente c = null;

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, telefono);
            rs = ps.executeQuery();

            if (rs.next()) {
                c = new Cliente();
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
        String sql = "SELECT * FROM cliente WHERE id_cliente = ?";
        Cliente c = null;

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idCliente);
            rs = ps.executeQuery();

            if (rs.next()) {
                c = new Cliente();
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
    
    
    
}

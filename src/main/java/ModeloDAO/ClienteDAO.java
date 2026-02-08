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
    public Cliente login(String nombre, String contrasena) {
        String sql = "SELECT * FROM cliente WHERE nombre = ? AND contrasena = ?";
        Cliente c = null;

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, nombre);
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
    public boolean registrar(Cliente c) {

        if (telefonoExiste(c.getTelefono())) {
            return false; // teléfono duplicado
        }

        String sql = "INSERT INTO cliente(nombre, telefono, correo, contrasena) VALUES (?, ?, ?, ?)";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getNombre());
            ps.setString(2, c.getTelefono());
            ps.setString(3, c.getCorreo());
            ps.setString(4, c.getContrasena());
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            System.err.println("Error registrar cliente: " + e.getMessage());
        }

        return false;
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
        String sql = "SELECT id_cliente, nombre, telefono, correo FROM cliente ORDER BY id_cliente DESC";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Cliente c = new Cliente();
                c.setIdCliente(rs.getInt("id_cliente"));
                c.setNombre(rs.getString("nombre"));
                c.setTelefono(rs.getString("telefono"));
                c.setCorreo(rs.getString("correo"));
                lista.add(c);
            }

        } catch (Exception e) {
            System.err.println("Error listar clientes: " + e.getMessage());
        }
        return lista;
    }
    
    //TRY CATCH VALIDACION DE REGISTRO
    
    public boolean telefonoExiste(String telefono) {

        String sql = "SELECT id_cliente FROM cliente WHERE telefono = ?";
        boolean existe = false;

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, telefono);
            rs = ps.executeQuery();

            if (rs.next()) {
                existe = true;
            }

        } catch (Exception e) {
            System.err.println("Error verificar teléfono: " + e.getMessage());
        }

        return existe;
    }

    public Cliente buscarPorCorreo(String correo) {
        String sql = "SELECT * FROM cliente WHERE correo = ?";
        Cliente c = null;

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            rs = ps.executeQuery();

            if (rs.next()) {
                c = new Cliente();
                c.setIdCliente(rs.getInt("id_cliente"));
                c.setNombre(rs.getString("nombre"));
                c.setTelefono(rs.getString("telefono"));
                c.setCorreo(rs.getString("correo"));
            }

        } catch (Exception e) {
            System.err.println("Error buscarPorCorreo: " + e.getMessage());
        }
        return c;
    }

    public void guardarTokenRecuperacion(String correo, String token) {
        String sql =
            "UPDATE cliente "
          + "SET token_recuperacion = ?, "
          + "token_expiracion = DATE_ADD(NOW(), INTERVAL 15 MINUTE) "
          + "WHERE correo = ?";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, token);
            ps.setString(2, correo);
            ps.executeUpdate();

        } catch (Exception e) {
            System.err.println("Error guardarTokenRecuperacion: " + e.getMessage());
        }
    }
	
    
    
    public Cliente buscarPorToken(String token) {
        String sql = "SELECT * FROM cliente WHERE token_recuperacion = ? AND token_expiracion > NOW()";
        Cliente c = null;

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, token);
            rs = ps.executeQuery();

            if (rs.next()) {
                c = new Cliente();
                c.setIdCliente(rs.getInt("id_cliente"));
                c.setNombre(rs.getString("nombre"));
                c.setTelefono(rs.getString("telefono"));
                c.setCorreo(rs.getString("correo")); // si lo tienes en tu modelo
            }

        } catch (Exception e) {
            System.err.println("Error buscarPorToken: " + e.getMessage());
        }
        return c;
    }

    public void actualizarContrasena(int idCliente, String nuevaContrasena) {
        String sql = "UPDATE cliente SET contrasena = ? WHERE id_cliente = ?";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, nuevaContrasena);
            ps.setInt(2, idCliente);
            ps.executeUpdate();

        } catch (Exception e) {
            System.err.println("Error actualizarContrasena: " + e.getMessage());
        }
    }

    public void limpiarToken(int idCliente) {
        String sql = "UPDATE cliente SET token_recuperacion = NULL, token_expiracion = NULL WHERE id_cliente = ?"; 

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idCliente);
            ps.executeUpdate();

        } catch (Exception e) {
            System.err.println("Error limpiarToken: " + e.getMessage());
        }
    }


    
    
}

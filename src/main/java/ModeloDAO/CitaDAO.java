package ModeloDAO;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import Interfaces.Inter_cita;
import Modelos.Barbero;
import Modelos.Cita;
import Modelos.Cliente;
import Modelos.Servicio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Config.Conexion;


public class CitaDAO implements Inter_cita{
	
	Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
	@Override
	public boolean insertar(Cita c) {
		String sql = "INSERT INTO cita (id_cliente, id_barbero, id_servicio, fecha, hora, instrucciones, estado) "
                + "VALUES (" + c.getCliente().getIdCliente() + ", "
                + c.getBarbero().getIdBarbero() + ", "
                + c.getServicio().getId() + ", '"
                + c.getFecha() + "', '"
                + c.getHora() + "', '"
                + c.getInstrucciones() + "', '"
                + c.getEstado() + "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.execute();
            return true;
        } catch (Exception e) {
            System.err.println("Error insertar cita: " + e.getMessage());
        }
        return false;
	}

	@Override
	public Cita listarId(int id) {
	    Cita cita = new Cita();
	    // Usamos INNER JOIN para traer los nombres de barbero y servicio que faltaban
	    String sql = "SELECT c.*, b.nombre as nomBar, s.nombre as nomSer, cli.nombre as nomCli, cli.telefono " +
	                 "FROM cita c " +
	                 "INNER JOIN barbero b ON c.id_barbero = b.id_barbero " +
	                 "INNER JOIN servicio s ON c.id_servicio = s.id_servicio " +
	                 "INNER JOIN cliente cli ON c.id_cliente = cli.id_cliente " +
	                 "WHERE c.id_cita=" + id;
	    try {
	        con = cn.getConnection();
	        ps = con.prepareStatement(sql);
	        rs = ps.executeQuery();
	        while (rs.next()) {
	            cita.setIdCita(rs.getInt("id_cita"));
	            cita.setFecha(rs.getDate("fecha"));
	            cita.setHora(rs.getTime("hora"));
	            cita.setInstrucciones(rs.getString("instrucciones"));
	            cita.setEstado(rs.getString("estado"));

	            // Objeto Cliente (para Nombre y Teléfono)
	            Cliente cli = new Cliente();
	            cli.setIdCliente(rs.getInt("id_cliente"));
	            cli.setNombre(rs.getString("nomCli"));
	            cli.setTelefono(rs.getString("telefono"));
	            cita.setCliente(cli);

	            // Objeto Barbero (para el ID y el Nombre)
	            Barbero b = new Barbero();
	            b.setIdBarbero(rs.getInt("id_barbero"));
	            b.setNombre(rs.getString("nomBar"));
	            cita.setBarbero(b);

	            // Objeto Servicio (para el ID y el Nombre)
	            Servicio s = new Servicio();
	            s.setId(rs.getInt("id_servicio"));
	            s.setNombre(rs.getString("nomSer"));
	            cita.setServicio(s);
	        }
	    } catch (Exception e) {
	        System.err.println("Error listarId en CitaDAO: " + e.getMessage());
	    }
	    return cita;
	}

	@Override
	public boolean editar(Cita c) {
	    String sql = "UPDATE cita SET "
	               + "id_barbero=" + c.getBarbero().getIdBarbero() + ", "
	               + "id_servicio=" + c.getServicio().getId() + ", "
	               + "id_cliente=" + c.getCliente().getIdCliente() + ", "
	               + "fecha='" + c.getFecha() + "', "
	               + "hora='" + c.getHora() + "', "
	               + "instrucciones='" + c.getInstrucciones() + "' "
	               + "WHERE id_cita=" + c.getIdCita();
	    
	    // ESTA LÍNEA ES CLAVE: Imprime el SQL real que se manda a MySQL
	    System.out.println("SQL A EJECUTAR: " + sql);

	    try {
	        con = cn.getConnection();
	        ps = con.prepareStatement(sql);
	        int resultado = ps.executeUpdate();
	        
	        System.out.println(">>> DAO: Filas afectadas: " + resultado);
	        return resultado > 0;
	    } catch (Exception e) {
	        System.err.println(">>> DAO ERROR: " + e.getMessage());
	        return false;
	    }
	}
	@Override
	public boolean CancelarCita(int id) {
		
        String sql = "UPDATE cita SET estado='CANCELADA' WHERE id_cita=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.err.println("Error eliminar (cancelar) cita: " + e.getMessage());
        }
        return false;
	}

	@Override
	public boolean existeCita(int idBarbero, Date fecha, Time hora) {
		String sql = "SELECT * FROM cita WHERE id_barbero=" + idBarbero 
                + " AND fecha='" + fecha + "' AND hora='" + hora + "' AND estado='RESERVADA'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true; // Ya existe una cita activa en ese horario
            }
        } catch (Exception e) {
            System.err.println("Error validar existencia: " + e.getMessage());
        }
        return false;
    }

	@Override
	public List<Cita> listarPorBarbero(int idBarbero) {
		List<Cita> lista = new ArrayList<>();
        String sql = "SELECT * FROM cita WHERE id_barbero=" + idBarbero + " AND estado='RESERVADA'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cita cita = new Cita();
                cita.setFecha(rs.getDate("fecha"));
                cita.setHora(rs.getTime("hora"));
                lista.add(cita);
            }
        } catch (Exception e) {
            System.err.println("Error listarPorBarbero: " + e.getMessage());
        }
        return lista;
	}

	@Override
	public List<Cita> listarPorCliente(int idCliente) {
		List<Cita> lista = new ArrayList<>();
        String sql = "SELECT * FROM cita WHERE id_cliente=" + idCliente + " ORDER BY fecha DESC";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cita cita = new Cita();
                cita.setIdCita(rs.getInt("id_cita"));
                cita.setFecha(rs.getDate("fecha"));
                cita.setHora(rs.getTime("hora"));
                cita.setEstado(rs.getString("estado"));
                
                lista.add(cita);
            }
        } catch (Exception e) {
            System.err.println("Error listarPorCliente: " + e.getMessage());
        }
        return lista;
	}

	@Override
	public List<Cita> listarTodas() {
		List<Cita> lista = new ArrayList<>();
        String sql = "SELECT * FROM cita";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cita cita = new Cita();
                cita.setIdCita(rs.getInt("id_cita"));
                cita.setFecha(rs.getDate("fecha"));
                cita.setHora(rs.getTime("hora"));
                cita.setEstado(rs.getString("estado"));
                lista.add(cita);
            }
        } catch (Exception e) {
            System.err.println("Error listarTodas: " + e.getMessage());
        }
        return lista;
	}

	@Override
	public boolean cambiarEstado(int idCita, String nuevoEstado) {
		String sql = "UPDATE cita SET estado='" + nuevoEstado + "' WHERE id_cita=" + idCita;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.err.println("Error cambiarEstado: " + e.getMessage());
        }
        return false;
	}

	@Override
	public List<Cita> listarPorRango(Date inicio, Date fin) {
		List<Cita> lista = new ArrayList<>();
        String sql = "SELECT * FROM cita WHERE fecha BETWEEN '" + inicio + "' AND '" + fin + "'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cita cita = new Cita();
                
                lista.add(cita);
            }
        } catch (Exception e) {
            System.err.println("Error listarPorRango: " + e.getMessage());
        }
        return lista;
    }

    
}

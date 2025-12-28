package ModeloDAO;

import java.util.List;
import java.util.ArrayList;

import Interfaces.Inter_servicio;
import Modelos.Servicio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Config.Conexion;
	

public class ServicioDAO implements Inter_servicio{
	
	Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public List<Servicio> listar() {
        List<Servicio> list = new ArrayList<>();
        
        // Cambié 'id' por 'id_servicio' en la consulta SQL
        String sql = "SELECT id_servicio, nombre, descripcion, duracion_min, incluye, precio, imagen, alt, orden " +
                     "FROM servicio ORDER BY orden, nombre";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Servicio s = new Servicio();
                // Asegúrate de que este nombre sea igual al del SELECT (id_servicio)
                s.setId(rs.getInt("id_servicio")); 
                s.setNombre(rs.getString("nombre"));
                s.setDescripcion(rs.getString("descripcion"));
                s.setDuracionMin(rs.getInt("duracion_min"));
                s.setIncluye(rs.getString("incluye"));
                s.setPrecio(rs.getDouble("precio"));
                s.setImagen(rs.getString("imagen"));
                s.setAlt(rs.getString("alt"));
                s.setOrden(rs.getInt("orden"));
                list.add(s);
            }
        } catch (Exception e) {
            System.err.println("Error Metodo listar servicios: " + e.getMessage());
        } 
        return list;
    }


	@Override
	public Servicio obtenerPorId(int id) {

		Servicio s = null;
		
        String sql = "SELECT id, nombre, descripcion, duracion_min, incluye, precio, imagen, alt, orden " +
                     "FROM servicio WHERE id = " + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                s = new Servicio();
                s.setId(rs.getInt("id_servicio"));
                s.setNombre(rs.getString("nombre"));
                s.setDescripcion(rs.getString("descripcion"));
                s.setDuracionMin(rs.getInt("duracion_min"));
                s.setIncluye(rs.getString("incluye"));
                s.setPrecio(rs.getDouble("precio"));
                s.setImagen(rs.getString("imagen"));
                s.setAlt(rs.getString("alt"));
                s.setOrden(rs.getInt("orden"));
            }
        } catch (Exception e) {
            System.err.println("Error Metodo obtenerPorId servicio: " + e.getMessage());
        } 
        return s;
    }
	
	public Servicio buscarPorId(int id) {
        Servicio s = new Servicio();
        String sql = "SELECT * FROM servicio WHERE id_servicio = " + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                s.setId(rs.getInt("id_servicio"));
                s.setNombre(rs.getString("nombre"));
                s.setDescripcion(rs.getString("descripcion"));
                s.setDuracionMin(rs.getInt("duracion_min"));
                s.setIncluye(rs.getString("incluye"));
                s.setPrecio(rs.getDouble("precio"));
                s.setImagen(rs.getString("imagen"));
                s.setAlt(rs.getString("alt"));
                s.setOrden(rs.getInt("orden"));
            }
        } catch (Exception e) {
            System.err.println("Error al buscar servicio: " + e);
        }
        return s;
    }
	
	public boolean insertar(Servicio s) {
        String sql = "INSERT INTO servicio (nombre, descripcion, duracion_min, incluye, precio, imagen, alt, orden) VALUES (?,?,?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, s.getNombre());
            ps.setString(2, s.getDescripcion());
            ps.setInt(3, s.getDuracionMin());
            ps.setString(4, s.getIncluye());
            ps.setDouble(5, s.getPrecio());
            ps.setString(6, s.getImagen());
            ps.setString(7, s.getAlt());
            ps.setInt(8, s.getOrden());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.err.println("Error al insertar servicio: " + e);
            return false;
        }
    }
	
	public boolean actualizar(Servicio s) {
        String sql = "UPDATE servicio SET nombre=?, descripcion=?, duracion_min=?, incluye=?, precio=?, imagen=?, alt=?, orden=? WHERE id_servicio=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, s.getNombre());
            ps.setString(2, s.getDescripcion());
            ps.setInt(3, s.getDuracionMin());
            ps.setString(4, s.getIncluye());
            ps.setDouble(5, s.getPrecio());
            ps.setString(6, s.getImagen());
            ps.setString(7, s.getAlt());
            ps.setInt(8, s.getOrden());
            ps.setInt(9, s.getId());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.err.println("Error al actualizar servicio: " + e);
            return false;
        }
    }
	
	public void eliminar(int id) {
        String sql = "DELETE FROM servicio WHERE id_servicio = " + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println("Error al eliminar servicio: " + e);
        }
    }

	}


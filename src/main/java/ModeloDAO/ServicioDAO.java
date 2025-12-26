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
		
        String sql = "SELECT id, nombre, descripcion, duracion_min, incluye, precio, imagen, alt, orden " +
                     "FROM servicio ORDER BY orden, nombre";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Servicio s = new Servicio();
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

	}


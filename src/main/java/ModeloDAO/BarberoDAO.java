package ModeloDAO;

import java.util.ArrayList;
import java.util.List;

import Interfaces.Inter_barbero;
import Modelos.Barbero;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Config.Conexion;


public class BarberoDAO implements Inter_barbero{

	Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Barbero b = new Barbero();
	
	@Override
	public List<Barbero> listar() {
	    List<Barbero> list = new ArrayList<>();
	    String sql = "SELECT * FROM barbero WHERE activo = 1";
	    try {
	        con = cn.getConnection();
	        ps = con.prepareStatement(sql);
	        rs = ps.executeQuery();
	        while (rs.next()) {
	            Barbero b = new Barbero();
	            b.setIdBarbero(rs.getInt("id_barbero"));
	            b.setNombre(rs.getString("nombre"));
	            b.setEspecialidad(rs.getString("especialidad"));
	            b.setExperiencia(rs.getInt("experiencia"));
	            b.setRating(rs.getDouble("rating"));
	            b.setDescripcion(rs.getString("descripcion"));
	            b.setImagen(rs.getString("imagen"));
	            b.setActivo(rs.getBoolean("activo"));
	            list.add(b);
	        }
	    } catch (Exception e) {
	        System.err.println("Error en BarberoDAO: " + e.getMessage());
	    }
	    return list;
	}
	@Override
	public Barbero buscarPorId(int id) {
		String sql = "SELECT * FROM barbero WHERE id_barbero=" + id;

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                b.setIdBarbero(rs.getInt("id_barbero"));
                b.setNombre(rs.getString("nombre"));
                b.setActivo(rs.getBoolean("activo"));
            }

        } catch (Exception e) {
            System.err.println("Error buscar barbero por ID: " + e.getMessage());
        }
        return b;
	}

}

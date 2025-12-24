package ModeloDAO;

import java.util.ArrayList;
import java.util.List;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Config.Conexion;
import Interfaces.Inter_paquete;
import Modelos.Paquete;


public class PaqueteDAO implements Inter_paquete{

	Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

	@Override
	public List<Paquete> listar() {

		List<Paquete> list = new ArrayList<>();
        String sql = "SELECT id, nombre, descripcion, detalles, precio, orden " +
                     "FROM paquete ORDER BY orden, nombre";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Paquete p = new Paquete();
                p.setId(rs.getInt("id"));
                p.setNombre(rs.getString("nombre"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setDetalles(rs.getString("detalles"));
                p.setPrecio(rs.getDouble("precio"));
                p.setOrden(rs.getInt("orden"));
                list.add(p);
            }
        } catch (Exception e) {
            System.err.println("Error listar paquetes: " + e.getMessage());
        } 
        return list;

	}

	@Override
	public Paquete obtenerPorId(int id) {

		Paquete p = null;
        // Concatenación directa del id (siguiendo tu patrón)
        String sql = "SELECT id, nombre, descripcion, detalles, precio, orden " +
                     "FROM paquete WHERE id = " + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                p = new Paquete();
                p.setId(rs.getInt("id"));
                p.setNombre(rs.getString("nombre"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setDetalles(rs.getString("detalles"));
                p.setPrecio(rs.getDouble("precio"));
                p.setOrden(rs.getInt("orden"));
            }
        } catch (Exception e) {
            System.err.println("Error obtenerPorId paquete: " + e.getMessage());
        } 
        return p;

	}

	@Override
	public boolean add(Paquete p) {

		String sql = "INSERT INTO paquete (nombre, descripcion, detalles, precio, orden) " +
        "VALUES ('" + p.getNombre() + "','" + p.getDescripcion() + "','" + p.getDetalles() + "'," + p.getPrecio() + "," + p.getOrden() + ")";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            System.err.println("Error add paquete: " + e.getMessage());
            return false;
        }

	}

	@Override
	public boolean edit(Paquete p) {

		String sql = "UPDATE paquete SET nombre='" + p.getNombre() + "', descripcion='" + p.getDescripcion() + "', " +
                     "detalles='" + p.getDetalles() + "', precio=" + p.getPrecio() + ", orden=" + p.getOrden() +
                     " WHERE id=" + p.getId();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            System.err.println("Error edit paquete: " + e.getMessage());
            return false;
        }

	}

	@Override
	public boolean eliminar(int id) {

		String sql = "DELETE FROM paquete WHERE id=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            System.err.println("Error eliminar paquete: " + e.getMessage());
            return false;
        }

	}
	
	

}

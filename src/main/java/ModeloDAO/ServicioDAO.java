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
    Servicio s = new Servicio();

	@Override
	public List<Servicio> listar() {
		ArrayList<Servicio> list = new ArrayList<>();
        String sql = "SELECT * FROM servicio";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Servicio ser = new Servicio();
                ser.setIdServicio(rs.getInt("id_servicio"));
                ser.setNombre(rs.getString("nombre"));
                ser.setTipo(rs.getString("tipo"));
                ser.setPrecio(rs.getDouble("precio"));
                ser.setDuracionMinutos(rs.getInt("duracion_minutos"));
                list.add(ser);
            }

        } catch (Exception e) {
            System.err.println("Error listar servicios: " + e.getMessage());
        }
        return list;
	}

	@Override
	public List<Servicio> listarPorTipo(String tipo) {
		ArrayList<Servicio> list = new ArrayList<>();
        String sql = "SELECT * FROM servicio WHERE tipo='" + tipo + "'";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Servicio ser = new Servicio();
                ser.setIdServicio(rs.getInt("id_servicio"));
                ser.setNombre(rs.getString("nombre"));
                ser.setTipo(rs.getString("tipo"));
                ser.setPrecio(rs.getDouble("precio"));
                ser.setDuracionMinutos(rs.getInt("duracion_minutos"));
                list.add(ser);
            }

        } catch (Exception e) {
            System.err.println("Error listar servicios por tipo: " + e.getMessage());
        }
        return list;
	}

	@Override
	public Servicio buscarPorId(int id) {
		String sql = "SELECT * FROM servicio WHERE id_servicio=" + id;

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                s.setIdServicio(rs.getInt("id_servicio"));
                s.setNombre(rs.getString("nombre"));
                s.setTipo(rs.getString("tipo"));
                s.setPrecio(rs.getDouble("precio"));
                s.setDuracionMinutos(rs.getInt("duracion_minutos"));
            }

        } catch (Exception e) {
            System.err.println("Error buscar servicio por ID: " + e.getMessage());
        }
        return s;
	}

}

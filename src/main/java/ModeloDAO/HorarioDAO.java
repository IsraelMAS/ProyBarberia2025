package ModeloDAO;

import java.util.ArrayList;
import java.util.List;

import Interfaces.Inter_horario;
import Modelos.Horario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Config.Conexion;

public class HorarioDAO implements Inter_horario{

	Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

	
	@Override
	public List<Horario> listar() {
        List<Horario> lista = new ArrayList<>();
        String sql = "SELECT * FROM horario ORDER BY orden ASC";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Horario h = new Horario();
                h.setIdHorario(rs.getInt("id"));
                h.setTurno(rs.getString("turno"));
                h.setHora(rs.getString("hora"));
                h.setOrden(rs.getInt("orden"));
                lista.add(h);
            }
        } catch (Exception e) { System.err.println(e); }
        return lista;
    }

	@Override
	public List<Horario> listarPorTurno(String turno) {
		ArrayList<Horario> list = new ArrayList<>();
        /*String sql = "SELECT * FROM horario WHERE turno='" + turno + "' ORDER BY hora";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Horario h = new Horario();
                h.setIdHorario(rs.getInt("id_horario"));
                h.setTurno(rs.getString("turno"));
                h.setHora(rs.getTime("hora"));
                list.add(h);
            }

        } catch (Exception e) {
            System.err.println("Error listar horario por turno: " + e.getMessage());
        }*/
        return list;
	}
	public Horario buscarPorId(int id) {
        Horario h = new Horario();
        String sql = "SELECT * FROM horario WHERE id = " + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                h.setIdHorario(rs.getInt("id"));
                h.setTurno(rs.getString("turno"));
                h.setHora(rs.getString("hora"));
                h.setOrden(rs.getInt("orden"));
            }
        } catch (Exception e) { System.err.println(e); }
        return h;
    }
	
	
	public void insertar(Horario h) {
        String sql = "INSERT INTO horario (turno, hora, orden) VALUES (?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, h.getTurno());
            ps.setString(2, h.getHora());
            ps.setInt(3, h.getOrden());
            ps.executeUpdate();
        } catch (Exception e) { System.err.println(e); }
    }
	
	public void actualizar(Horario h) {
        String sql = "UPDATE horario SET turno=?, hora=?, orden=? WHERE id=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, h.getTurno());
            ps.setString(2, h.getHora());
            ps.setInt(3, h.getOrden());
            ps.setInt(4, h.getIdHorario());
            ps.executeUpdate();
        } catch (Exception e) { System.err.println(e); }
    }
	
	public void eliminar(int id) {
        String sql = "DELETE FROM horario WHERE id = " + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) { System.err.println(e); }
    }
}

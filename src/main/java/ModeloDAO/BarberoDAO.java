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
		ArrayList<Barbero> list = new ArrayList<>();
        String sql = "SELECT * FROM barbero WHERE activo = 1";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Barbero bar = new Barbero();
                bar.setIdBarbero(rs.getInt("id_barbero"));
                bar.setNombre(rs.getString("nombre"));
                bar.setActivo(rs.getBoolean("activo"));
                list.add(bar);
            }

        } catch (Exception e) {
            System.err.println("Error listar barberos: " + e.getMessage());
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

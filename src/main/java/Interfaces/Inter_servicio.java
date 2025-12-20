package Interfaces;

import java.util.List;

import Modelos.Servicio;

public interface Inter_servicio {
	public List<Servicio> listar();

	public List<Servicio> listarPorTipo(String tipo);

	public Servicio buscarPorId(int idServicio);
}

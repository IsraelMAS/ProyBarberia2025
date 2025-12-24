package Interfaces;

import java.util.List;

import Modelos.Servicio;


/**
 * Interfaz mínima para el módulo de Servicios:
 * - listar(): obtener todos los servicios para el catálogo
 * - obtenerPorId(int id): obtener un servicio específico (p.ej., para Horarios.jsp)
 */


public interface Inter_servicio {
	
	public List<Servicio> listar();


	public Servicio obtenerPorId(int id);
}

package Interfaces;

import java.util.List;

import Modelos.Barbero;

public interface Inter_barbero {
	 public List<Barbero> listar();

	 public Barbero buscarPorId(int idBarbero);
}

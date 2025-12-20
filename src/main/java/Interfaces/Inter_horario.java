package Interfaces;

import java.util.List;

import Modelos.Horario;

public interface Inter_horario {
		
	 public List<Horario> listarTodos();

	 public List<Horario> listarPorTurno(String turno);
	
}

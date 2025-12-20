package Interfaces;

import Modelos.Cliente;

public interface Inter_cliente {
	
	public boolean insertar(Cliente cliente);

	public Cliente buscarPorTelefono(String telefono);

	public Cliente buscarPorId(int idCliente);
}

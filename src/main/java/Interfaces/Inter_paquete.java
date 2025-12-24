package Interfaces;

import java.util.List;
import Modelos.Paquete;

public interface Inter_paquete {

	public List<Paquete> listar();
    public Paquete obtenerPorId(int id);
    public boolean add(Paquete p);
    public boolean edit(Paquete p);
    public boolean eliminar(int id);

}

	package Interfaces;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

import Modelos.Cita;

public interface Inter_cita {
    
    // --- MÉTODOS PARA EL CLIENTE  ---
    
    // Registrar la reserva
    public boolean insertar(Cita c);
    
    // Buscar una cita por ID para cargarla en el formulario al editar
    public Cita listarId(int id);
    
    // Actualizar los datos de una cita existente
    public boolean editar(Cita c);
    
    // Tu consejo: Cambio de estado a 'CANCELADA' (Eliminado lógico)
    public boolean CancelarCita(int id);
    
    // Validar si el barbero ya tiene cita ese día a esa hora
    public boolean existeCita(int idBarbero, Date fecha, Time hora);
    
    // Listar las citas de un barbero específico (para mostrar su disponibilidad)
    public List<Cita> listarPorBarbero(int idBarbero);
    
    // Listar las citas de un cliente específico (para que el usuario vea su historial)
    public List<Cita> listarPorCliente(int idCliente);

    // --- MÉTODOS PARA EL ADMINISTRADOR (Lo que usarás más adelante) ---
    
    // Ver TODAS las citas registradas en el sistema
    public List<Cita> listarTodas();
    
    // Cambiar estado (ej: de 'RESERVADA' a 'COMPLETADA' o 'NO ASISTIÓ')
    public boolean cambiarEstado(int idCita, String nuevoEstado);
    
    // Reporte de citas por rango de fechas
    public List<Cita> listarPorRango(Date inicio, Date fin);
}
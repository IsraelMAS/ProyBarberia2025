package Modelos;

public class Barbero {
	
	private int idBarbero;
    private String nombre;
    private String especialidad;
    private int experiencia;
    private double rating;
    private String descripcion;
    private String imagen;
    private boolean activo;
	public Barbero() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Barbero(String nombre, String especialidad, int experiencia, double rating, String descripcion,
			String imagen, boolean activo) {
		super();
		this.nombre = nombre;
		this.especialidad = especialidad;
		this.experiencia = experiencia;
		this.rating = rating;
		this.descripcion = descripcion;
		this.imagen = imagen;
		this.activo = activo;
	}
	public int getIdBarbero() {
		return idBarbero;
	}
	public void setIdBarbero(int idBarbero) {
		this.idBarbero = idBarbero;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getEspecialidad() {
		return especialidad;
	}
	public void setEspecialidad(String especialidad) {
		this.especialidad = especialidad;
	}
	public int getExperiencia() {
		return experiencia;
	}
	public void setExperiencia(int experiencia) {
		this.experiencia = experiencia;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getImagen() {
		return imagen;
	}
	public void setImagen(String imagen) {
		this.imagen = imagen;
	}
	public boolean isActivo() {
		return activo;
	}
	public void setActivo(boolean activo) {
		this.activo = activo;
	}
    

}


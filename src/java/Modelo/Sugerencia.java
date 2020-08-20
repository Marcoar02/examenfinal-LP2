
package Modelo;


public class Sugerencia {
    
    private int idsugerencia;
    private String fecha;
    private String descripcion;
    private Persona persona;
    private Rol rol;
    private Area area;
    
    public Sugerencia(){
        
    }

    public Sugerencia(int idsugerencia, String fecha, String descripcion, Persona persona, Rol rol, Area area) {
        this.idsugerencia = idsugerencia;
        this.fecha = fecha;
        this.descripcion = descripcion;
        this.persona = persona;
        this.rol = rol;
        this.area = area;
    }

    public Area getArea() {
        return area;
    }

    public void setArea(Area area) {
        this.area = area;
    }

    public int getIdsugerencia() {
        return idsugerencia;
    }

    public void setIdsugerencia(int idsugerencia) {
        this.idsugerencia = idsugerencia;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }

    public Rol getRol() {
        return rol;
    }

    public void setRol(Rol rol) {
        this.rol = rol;
    }
    
    
    
}


package com.emergentes.modelo;
// autor : Limber Mamani Canaza
public class estudiante 
{
    private int id;
    private String fecha;
    private String nombre;
    private String apellidos;
    private String turno;
    private String tipoSeminario;
    
    public estudiante()
    {
        this.id=0;
        this.fecha="";
        this.nombre="";
        this.apellidos="";
        this.turno="";
        this.tipoSeminario="";
                
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getTurno() {
        return turno;
    }

    public void setTurno(String turno) {
        this.turno = turno;
    }

    public String getTipoSeminario() {
        return tipoSeminario;
    }

    public void setTipoSeminario(String tipoSeminario) {
        this.tipoSeminario = tipoSeminario;
    }

    @Override
    public String toString() {
        return "estudiante{" + "id=" + id + ", fecha=" + fecha + ", nombre=" + nombre + ", apellidos=" + apellidos + ", turno=" + turno + ", tipoSeminario=" + tipoSeminario + '}';
    }
    
    
            
            
    
}

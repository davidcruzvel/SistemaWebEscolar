/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.Date;

/**
 *
 * @author david
 */
public class ViewModelEmpleados {

    //Atributos de la tabla Empleados
    private int ID_Empleado;
    private String DUI_Empleado;
    private int ISSS_Empleado;
    private String nombresEmpleado;
    private String apellidosEmpleado;
    private Date fechaNacEmpleado;
    private String telefonoEmpleado;
    private String correo;
    private int ID_Cargo;
    private String cargo;
    private int ID_Direccion;
    private String direccionCompleta;

    //Metodos de la clase ViewModelEmpleados
    /**
     * @return the ID_Empleado
     */
    public int getID_Empleado() {
        return ID_Empleado;
    }

    /**
     * @param ID_Empleado the ID_Empleado to set
     */
    public void setID_Empleado(int ID_Empleado) {
        this.ID_Empleado = ID_Empleado;
    }

    /**
     * @return the DUI_Empleado
     */
    public String getDUI_Empleado() {
        return DUI_Empleado;
    }

    /**
     * @param DUI_Empleado the DUI_Empleado to set
     */
    public void setDUI_Empleado(String DUI_Empleado) {
        this.DUI_Empleado = DUI_Empleado;
    }

    /**
     * @return the ISSS_Empleado
     */
    public int getISSS_Empleado() {
        return ISSS_Empleado;
    }

    /**
     * @param ISSS_Empleado the ISSS_Empleado to set
     */
    public void setISSS_Empleado(int ISSS_Empleado) {
        this.ISSS_Empleado = ISSS_Empleado;
    }

    /**
     * @return the nombresEmpleado
     */
    public String getNombresEmpleado() {
        return nombresEmpleado;
    }

    /**
     * @param nombresEmpleado the nombresEmpleado to set
     */
    public void setNombresEmpleado(String nombresEmpleado) {
        this.nombresEmpleado = nombresEmpleado;
    }

    /**
     * @return the apellidosEmpleado
     */
    public String getApellidosEmpleado() {
        return apellidosEmpleado;
    }

    /**
     * @param apellidosEmpleado the apellidosEmpleado to set
     */
    public void setApellidosEmpleado(String apellidosEmpleado) {
        this.apellidosEmpleado = apellidosEmpleado;
    }

    /**
     * @return the fechaNacEmpleado
     */
    public Date getFechaNacEmpleado() {
        return fechaNacEmpleado;
    }

    /**
     * @param fechaNacEmpleado the fechaNacEmpleado to set
     */
    public void setFechaNacEmpleado(Date fechaNacEmpleado) {
        this.fechaNacEmpleado = fechaNacEmpleado;
    }
    
/**
     * @return the telefonoEmpleado
     */
    public String getTelefonoEmpleado() {
        return telefonoEmpleado;
    }

    /**
     * @param telefonoEmpleado the telefonoEmpleado to set
     */
    public void setTelefonoEmpleado(String telefonoEmpleado) {
        this.telefonoEmpleado = telefonoEmpleado;
    }

    /**
     * @return the correo
     */
    public String getCorreo() {
        return correo;
    }

    /**
     * @param correo the correo to set
     */
    public void setCorreo(String correo) {
        this.correo = correo;
    }

    /**
     * @return the ID_Cargo
     */
    public int getID_Cargo() {
        return ID_Cargo;
    }

    /**
     * @param ID_Cargo the ID_Cargo to set
     */
    public void setID_Cargo(int ID_Cargo) {
        this.ID_Cargo = ID_Cargo;
    }
    
     /**
     * @return the cargo
     */
    public String getCargo() {
        return cargo;
    }

    /**
     * @param cargo the cargo to set
     */
    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    /**
     * @return the ID_Direccion
     */
    public int getID_Direccion() {
        return ID_Direccion;
    }

    /**
     * @param ID_Direccion the ID_Direccion to set
     */
    public void setID_Direccion(int ID_Direccion) {
        this.ID_Direccion = ID_Direccion;
    }
    
    /**
     * @return the direccionCompleta
     */
    public String getDireccionCompleta() {
        return direccionCompleta;
    }

    /**
     * @param direccionCompleta the direccionCompleta to set
     */
    public void setDireccionCompleta(String direccionCompleta) {
        this.direccionCompleta = direccionCompleta;
    }
    
}

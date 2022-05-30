/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ipn.mx.modelo.dto;

import com.ipn.mx.modelo.entidades.Alumno;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import lombok.AllArgsConstructor;
import lombok.Data;

/**
 *
 * @author Edwin VD
 */

public class AlumnoDTO implements Serializable {

    private Alumno entidad;

    public AlumnoDTO() {
        entidad = new Alumno();
    }

    public Alumno getEntidad() {
        return entidad;
    }

    public void setEntidad(Alumno entidad) {
        this.entidad = entidad;
    }

 
    @Override
    public String toString(){
        StringBuilder sb = new StringBuilder();
        sb.append("Clave : ").append(getEntidad().getIdAlumno()).append("\n");
        sb.append("Nombre : ").append(getEntidad().getNombreAlumno()).append("\n");
        sb.append("Paterno : ").append(getEntidad().getPaternoAlumno()).append("\n");
        sb.append("Materno : ").append(getEntidad().getMaternoAlumno()).append("\n");
        sb.append("Email : ").append(getEntidad().getEmailAlumno()).append("\n");
        sb.append("Clave Carrera  : ").append(getEntidad().getIdCarrera()).append("\n");
        //sb.append("Clave Carrera  : ").append(getEntidad().getIdCarrera().getIdCarrera).append("\n");
        
        return sb.toString();
    }
    
    public static void main(String[] args) {
        AlumnoDTO dto = new AlumnoDTO();
        dto.getEntidad().setIdAlumno(1L);
        dto.getEntidad().setNombreAlumno("Edwin Ivan");
        dto.getEntidad().setPaternoAlumno("Villegas");
        dto.getEntidad().setMaternoAlumno("Dorantes");
        dto.getEntidad().setEmailAlumno("edwinvillegas9@gmail.com");
        dto.getEntidad().setIdCarrera('2');
        
        System.out.println(dto.toString());
        
        
    }
    
    private Connection conexion;
    private void obtenerConexion(){
        String usuario="root";
        String clave="root";
        String url ="jdbc:mysql://localhost:3306/EscuelaWeb";
        String driverBD="com.mysql.cj.jdbc.Driver";
        try {
            Class.forName(driverBD);
            conexion = DriverManager.getConnection(url,usuario, clave);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AlumnoDTO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}













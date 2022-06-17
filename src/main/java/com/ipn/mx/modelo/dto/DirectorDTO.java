/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ipn.mx.modelo.dto;

import com.ipn.mx.modelo.entidades.Director;
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

public class DirectorDTO implements Serializable {

    private Director entidad;

    public DirectorDTO() {
        entidad = new Director();
    }

    public Director getEntidad() {
        return entidad;
    }

    public void setEntidad(Director entidad) {
        this.entidad = entidad;
    }    
    
 
    @Override
    public String toString(){
        StringBuilder sb = new StringBuilder();
        sb.append("Clave de Director: ").append(getEntidad().getIdDirector()).append("\n");
        sb.append("Nombre Director: ").append(getEntidad().getNombreDirector()).append("\n");
        sb.append("Edad : ").append(getEntidad().getEdad()).append("\n");
        sb.append("Biografia : ").append(getEntidad().getBiografia()).append("\n");
        sb.append("Nacionalidad : ").append(getEntidad().getNacionalidad()).append("\n");
        sb.append("idPelicula  : ").append(getEntidad().getIdPelicula()).append("\n");
        //sb.append("Clave Carrera  : ").append(getEntidad().getIdCarrera().getIdCarrera).append("\n");
        
        return sb.toString();
    }
    
    public static void main(String[] args) {
        DirectorDTO dto = new DirectorDTO();
        dto.getEntidad().setIdDirector(1L);
        dto.getEntidad().setNombreDirector("Marcelo Tolces");
        dto.getEntidad().setEdad("54");
        dto.getEntidad().setBiografia(" Comenzo su carrera en el septimo arte filmando los cortometrajes Vitajon (2006) y El camino del samurai (2009). En 2010 estreno su opera prima 18 cigarrillos y medio." +
                "Director y guionista  originario de Asuncion, Paraguay. Realizo estudios de cinematografía en la Escuela de Arte Camera Obscura de Tel Aviv, en Israel; ademas de literatura creativa en la Escuela Universitaria de Artes y Espectaculos TAI, de Madrid, España.\n");
        dto.getEntidad().setNacionalidad("Paraguay");
        dto.getEntidad().setIdPelicula('1');
        
        System.out.println(dto.toString());
        
        
    }
    
    private Connection conexion;
    private void obtenerConexion(){
        String usuario="root";
        String clave="root";
        String url ="jdbc:mysql://localhost:3306/Cinema22";
        String driverBD="com.mysql.cj.jdbc.Driver";
        try {
            Class.forName(driverBD);
            conexion = DriverManager.getConnection(url,usuario, clave);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DirectorDTO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}













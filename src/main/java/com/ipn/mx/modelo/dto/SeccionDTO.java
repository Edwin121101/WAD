/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ipn.mx.modelo.dto;

import com.ipn.mx.modelo.entidades.Seccion;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Edwin VD
 */

public class SeccionDTO implements Serializable {

    private Seccion entidad;

    public SeccionDTO() {
        entidad = new Seccion();
    }

    public Seccion getEntidad() {
        return entidad;
    }

    public void setEntidad(Seccion entidad) {
        this.entidad = entidad;
    }    
    
 
    @Override
    public String toString(){
        StringBuilder sb = new StringBuilder();
        sb.append("Clave de Sección: ").append(getEntidad().getIdSeccion()).append("\n");
        sb.append("Nombre Sección: ").append(getEntidad().getNombreSeccion()).append("\n");
        sb.append("idPelicula  : ").append(getEntidad().getIdPelicula()).append("\n");
      
        return sb.toString();
    }
    
    public static void main(String[] args) {
        SeccionDTO dto = new SeccionDTO();
        dto.getEntidad().setIdSeccion(1L);
        dto.getEntidad().setNombreSeccion("Shorts México");
        dto.getEntidad().setIdPelicula('1');
        
        System.out.println(dto.toString());
        
        
    }
    
    private Connection conexion;
    private void obtenerConexion(){
        String usuario="lauozpxgsrwnzj";
        String clave="c525a73012080870fb4b718e683ad8de986251cc8cbd454c5bb70a051a0313ec";
        String url ="jdbc:postgresql://ec2-34-207-12-160.compute-1.amazonaws.com:5432/d6mdi1uk6hpjd";
        String driverBD="org.postgresql.Driver";
        try {
            Class.forName(driverBD);
            conexion = DriverManager.getConnection(url,usuario, clave);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SeccionDTO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}













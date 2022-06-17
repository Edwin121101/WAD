/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ipn.mx.modelo.dto;

import com.ipn.mx.modelo.entidades.Pelicula;
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
public class PeliculaDTO implements Serializable{
    private Pelicula entidad;
    
    public PeliculaDTO() {
        entidad = new Pelicula();
    }

    public Pelicula getEntidad() {
        return entidad;
    }

    public void setEntidad(Pelicula entidad) {
        this.entidad = entidad;
    }
    
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(" Clave de la Pelicula : ").append(entidad.getIdPelicula()).append("\n");
        sb.append(" Nombre de la Pelicula : ").append(entidad.getNombrePelicula()).append("\n");
        sb.append(" Sinopsis de la Pelicula : ").append(entidad.getSinopsisPelicula()).append("\n");
        sb.append(" Año : ").append(entidad.getAno()).append("\n");
        sb.append(" Director de la Pelicula : ").append(entidad.getDirectorPelicula()).append("\n");
        return sb.toString();
    }
    
    
    public static void main(String[] args) {
        PeliculaDTO dto = new PeliculaDTO();
        dto.getEntidad().setIdPelicula(1L);
        dto.getEntidad().setNombrePelicula("Ingeniaría en Sistemas Computacionales");
        dto.getEntidad().setSinopsisPelicula("La descripcion de la Peli");
        dto.getEntidad().setAno("1986");
        dto.getEntidad().setDirectorPelicula("La prueba");
        
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
            Logger.getLogger(PeliculaDTO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
}

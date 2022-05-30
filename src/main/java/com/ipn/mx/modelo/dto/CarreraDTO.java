/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ipn.mx.modelo.dto;

import java.io.Serializable;
import com.ipn.mx.modelo.entidades.Carrera;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Edwin VD
 */
public class CarreraDTO implements Serializable{
    private Carrera entidad;

    public CarreraDTO() {
        entidad = new Carrera();
    }

    public Carrera getEntidad() {
        return entidad;
    }

    public void setEntidad(Carrera entidad) {
        this.entidad = entidad;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(" Clave de la Carrera : ").append(entidad.getIdCarrera()).append("\n");
        sb.append(" Nombre de la Carrera : ").append(entidad.getNombreCarrera()).append("\n");
        sb.append(" Descripción de la Carrera : ").append(entidad.getDescripcionCarrera()).append("\n");
        return sb.toString();
    }
    
    
    public static void main(String[] args) {
        CarreraDTO dto = new CarreraDTO();
        dto.getEntidad().setIdCarrera(1L);
        dto.getEntidad().setNombreCarrera("Ingeniaría en Sistemas Computacionales");
        dto.getEntidad().setDescripcionCarrera("La descriopcion de la carrera");
        
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
            Logger.getLogger(CarreraDTO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}

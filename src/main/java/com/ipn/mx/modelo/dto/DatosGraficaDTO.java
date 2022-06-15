/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ipn.mx.modelo.dto;

import java.io.Serializable;

/**
 *
 * @author Edwin VD
 */
public class DatosGraficaDTO implements Serializable{
    private int cantidad;
    private String nombre;

    public DatosGraficaDTO() {
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("cantidad = ").append(cantidad).append("\n");
        sb.append("nombre = ").append(nombre).append("\n");
        return sb.toString();
    }
    
    
    
}

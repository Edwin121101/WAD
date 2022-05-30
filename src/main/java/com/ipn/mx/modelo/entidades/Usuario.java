/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ipn.mx.modelo.entidades;

import java.io.Serializable;
import java.sql.Date;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *
 * @author darkdestiny
 */
@Data
@NoArgsConstructor
public class Usuario implements Serializable{
    private int idUsuario;
    private String nombre;
    private String paterno;
    private String materno;
    private String email;
    private String nombreUsuario;
    private String claveUsuario;
    private Date fechaDeCreacion;
    
}

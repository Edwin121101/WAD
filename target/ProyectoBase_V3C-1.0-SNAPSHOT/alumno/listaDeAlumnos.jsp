<%-- 
    Document   : listaDeAlumnos
    Created on : 24 mar. 2022, 07:15:23
    Author     : Edwin VD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ipn.mx.modelo.dao.AlumnoDAO" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.List" %>
<%@page import="com.ipn.mx.modelo.dto.AlumnoDTO" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado Carrera</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    </head>
    <body>
        <div class="container">
            <div class="mb-3"></div>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand text-primary" href="#">Escuela Web </a>
                    <button class="navbar-toggler text-primary" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse text-primary" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link active text-primary" aria-current="page" href="../index.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-primary" href="../carrera/listaDeCarreras.jsp">Lista de Carreras</a>
                            </li>


                        </ul>
                    </div>
                </div>
            </nav>
            <div class="mb-3"></div>
            <div class="card border-primary">
                <div class="card-header text-primary">
                    <h1 class="text-center">
                        Listado de Alumnos
                    </h1>
                </div>
                <div class="card-body text-primary">
                    <a href="nuevaAlumno.jsp" class="btn btn-outline-primary">Nuevo</a>   
                    <div class="mb-3"></div>
                    <table class="table table-striped" style="text-align: center";>
                        <tr>
                            <th>Clave del Alumno</th>
                            <th>Nombre del Alumno</th>
                            <th>Apellido Paterno</th>
                            <th>Apellido Materno</th>
                            <th>Email</th>
                            <th>Clave de Carrera</th>
                            <th>Eliminar</th>
                            <th>Actualizar</th>

                        </tr>
                        <%
                        AlumnoDAO dao = new AlumnoDAO();
                        List lista = dao.readAll();
                        if(lista != null){
                            for(int i =0; i < lista.size(); i++){
                                AlumnoDTO dto = (AlumnoDTO) lista.get(i);
                            %>
                            <tr>
                                <td>
                                     <a href="verAlumno.jsp?id=<%= dto.getEntidad().getIdAlumno() %>" class="btn btn-outline-info">
                                        <%= dto.getEntidad().getIdAlumno() %>
                                    </a>
                                </td>
                                <td>
                                    <%= dto.getEntidad().getNombreAlumno() %>
                                </td>
                                <td>
                                    <%= dto.getEntidad().getPaternoAlumno() %>
                                </td>
                                <td>
                                    <%= dto.getEntidad().getMaternoAlumno() %>
                                </td>
                                <td>
                                    <%= dto.getEntidad().getEmailAlumno() %>
                                </td>            
                                <td>
                                <a href="../carrera/verCarrera.jsp?id=<%= dto.getEntidad().getIdCarrera() %>" class="btn btn-outline-warning">
                                        <%= dto.getEntidad().getIdCarrera() %>
                                    </a>
                                </td>
                                <td>
                                    
                                    <a href="eliminarAlumno.jsp?id=<%= dto.getEntidad().getIdAlumno() %>" class="btn btn-danger">
                                        Eliminar
                                    </a>
                                </td>
                                <td>
                                    
                                    <a href="actualizarAlumno.jsp?id=<%= dto.getEntidad().getIdAlumno() %>" class="btn btn-outline-success">
                                        Actualizar
                                    </a>
                                </td>
                            </tr>
                            
                            <%
                            }
                        }else{
                            out.println("<td colspan=5> No hay registros a mostrar </td>");
                        }
                        
                        
                       
                        %>


                    </table>
                </div>
            </div>

        </div>
    </body>
</html>

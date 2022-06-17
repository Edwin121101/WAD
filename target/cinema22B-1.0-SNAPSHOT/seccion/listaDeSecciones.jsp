<%-- 
    Document   : listaDeSecciones
    Created on : 24 mar. 2022, 07:15:23
    Author     : Edwin VD
--%>


<%@page import="com.ipn.mx.modelo.dao.SeccionDAO" %>
<%@page import="com.ipn.mx.modelo.dto.SeccionDTO" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.List" %>


<!DOCTYPE html>
<html>
    <head>
 
        <title>Secciones</title>
        <link rel="stylesheet" href="../styles/styles.css" type="text/css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    </head>
    <body>
        <div class="container">
            <div class="mb-3"></div>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container-fluid">
                    <a class="navbar-brand text-danger" href="#">Cinema22 </a>
                    <button class="navbar-toggler text-danger" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon text-danger"></span>
                    </button>
                    <div class="collapse navbar-collapse text-danger" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link active text-danger" aria-current="page" href="../index.jsp">Inicio</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-danger" href="../pelicula/listaDePeliculas.jsp">Catálogo</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="mb-3"></div>
                <div class="card-header text-light">
                    <h1 class="text-center">
                        Secciones
                    </h1>
                </div>
                <div class="card-body text-primary">
                    <a href="nuevaSeccion.jsp" class="btn btn-outline-light">Nueva Seccion</a>   
                    <div class="mb-3"></div>
                    <table class="table table-dark table-hover alineacion">
                        <tr class="items">
                            <th>Clave</th>
                            <th>Nombre de la seccion</th>
                            <th>Clave de Pelicula</th>
                            <th>Eliminar</th>
                            <th>Actualizar</th>

                        </tr>
                        <%
                        SeccionDAO dao = new SeccionDAO();
                        List lista = dao.readAll();
                        if(lista != null){
                            for(int i =0; i < lista.size(); i++){
                                SeccionDTO dto = (SeccionDTO) lista.get(i);
                        %>
                                       
                            <tr class="items">
                                <td>
                                     <a href="verSeccion.jsp?id=<%= dto.getEntidad().getIdSeccion() %>" class="btn btn-outline-info">
                                        <%= dto.getEntidad().getIdSeccion() %>
                                    </a>
                                </td>
                                <td>
                                    <%= dto.getEntidad().getNombreSeccion() %>
                                </td>          
                                <td>
                                <a href="../pelicula/verPelicula.jsp?id=<%= dto.getEntidad().getIdPelicula() %>" class="btn btn-outline-warning">
                                        <%= dto.getEntidad().getIdPelicula() %>
                                </a>
                                </td>
                                <td>
                                    
                                    <a href="eliminarSeccion.jsp?id=<%= dto.getEntidad().getIdSeccion() %>" class="btn btn-danger">
                                        Eliminar
                                    </a>
                                </td>
                                <td>
                                    
                                    <a href="actualizarSeccion.jsp?id=<%= dto.getEntidad().getIdSeccion() %>" class="btn btn-outline-success">
                                        Actualizar
                                    </a>
                                </td>
                            </tr>
                            
                            <%
                            }
                        }else{
                            out.println("<td colspan=8> No hay registros a mostrar </td>");
                        }
                        
                        
                       
                        %>
                    </table>
                </div>
            </div>
    </body>
</html>

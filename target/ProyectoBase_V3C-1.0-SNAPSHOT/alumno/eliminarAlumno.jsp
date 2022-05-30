<%-- 
    Document   : eliminarAlumno
    Created on : 26 mar. 2022, 01:49:01
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
        <title>Eliminar Carrera</title>
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
                                <a class="nav-link text-primary" href="../carrera/listaDeCarreras.jsp">Listado de Carreras</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-primary" href="listaDeAlumnos.jsp">Listado de Alumnos</a>
                            </li>


                        </ul>
                    </div>
                </div>
            </nav>
            <div class="mb-3"></div>
            <div class="card border-primary">
                <div class="card-header text-primary">
                    <h1 class="text-center">
                        Eliminar Alumno
                    </h1>
                </div>
                <div class="mb-3"></div>
                <%
                AlumnoDAO dao = new AlumnoDAO();
                AlumnoDTO dto = new AlumnoDTO();
                dto.getEntidad().setIdAlumno(Long.parseLong(request.getParameter("id")));
                try {
                    dao.delete(dto);
                    //out.println(dto); //Imprime los datos de la carrera  
                    out.println("<div class='container'>");
                        out.println("<div class='alert alert-danger' role='alert'>");
                        out.println("<h4>El alumno ha sido eliminado...</h4>");
                        out.println("</div>");
                        out.println("<a class='btn btn-primary'  href='listaDeAlumnos.jsp'>Regresar</a>");
                    out.println("</div>");
                } catch (SQLException ex) {
                    out.println("<h2> No se ha podido borrar</h2>");
                }
                %>

                <div class="mb-3"></div>
            </div>
        </div>
    </body>
</html>

<%-- 
    Document   : agregarCarrera
    Created on : 24 mar. 2022, 07:16:01
    Author     : Edwin VD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ipn.mx.modelo.dao.CarreraDAO" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.List" %>
<%@page import="com.ipn.mx.modelo.dto.CarreraDTO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                                <a class="nav-link text-primary" href="listaDeCarreras.jsp">Listado de Carreras</a>
                            </li>


                        </ul>
                    </div>
                </div>
            </nav>
            <div class="mb-3"></div>
            <div class="card border-primary">
                
                <div class="mb-3"></div>

                <%
                    CarreraDTO dto = new CarreraDTO();
                    dto.getEntidad().setNombreCarrera(request.getParameter("txtNombreCarrera"));
                    dto.getEntidad().setDescripcionCarrera(request.getParameter("txtDescripcionCarrera"));
                    CarreraDAO dao = new CarreraDAO();
                 %>
                 
                 <%
                    try {
                        dao.create(dto);
                        out.println("<div class='alert alert-primary' role='alert'>");
                        out.println("Registro insertado correctamente");
                        out.println("</div>");
                    } catch (SQLException ex) {
                        out.println("<h2> No se ha agregado una carrera</h2>");
                    }
                %>
                
                
            </div>
                <div class='mb-3'></div>
                    <a class='btn btn-primary'  href='listaDeCarreras.jsp'>Listado de Carreras</a>
    </body>
</html>


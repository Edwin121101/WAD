<%-- 
    Document   : actualizar
    Created on : 27 mar. 2022, 01:14:43
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
        <title>nuevaAlumno</title>
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
                        Actualizar Alumno
                    </h1>
                </div>
                <div class="mb-3"></div>
                
                        <%
                        AlumnoDAO dao = new AlumnoDAO();
                        AlumnoDTO dto = new AlumnoDTO();
                        dto.getEntidad().setIdAlumno(Long.parseLong(request.getParameter("id")));
                        try {
                            dto = dao.read(dto);
                           
            
                        } catch (SQLException ex) {
            
                        }
                        %>
                                
                <section>
                    <form method="get" action="actualizarA.jsp" name="frmDatos">
                        <div class="mb-3">
                        <label class="form-label" for="txtIdAlumno"> Clave de Alumno </label>
                        <input type="text" name="txtIdAlumno" id="txtIdAlumno"
                            placeholder="Clave del alumno"
                            class="form-control"
                            required
                            maxlength="50"
                            value="<%= dto.getEntidad().getIdAlumno() %>"
                            readonly/> 
                        </div>
                        <div class="mb-3">
                        <label class="form-label" for="txtNombreAlumno"> Nombre Alumno </label>
                        <input type="text" name="txtNombreAlumno" id="txtNombreAlumno"
                            placeholder="Nombre del alumno"
                            class="form-control"
                            required
                            maxlength="50"
                            value="<%= dto.getEntidad().getNombreAlumno() %>"/> 
                        </div>
                        <div class="mb-3">
                        <label class="form-label" for="txtPaternoAlumno"> Apellido Paterno </label>
                        <input type="text" name="txtPaternoAlumno" id="txtPaternoAlumno"
                            placeholder="Apellido Paterno"
                            class="form-control"
                            required
                            maxlength="100"
                            value="<%= dto.getEntidad().getPaternoAlumno() %>"/> 
                        </div>
                        <div class="mb-3">
                        <label class="form-label" for="txtMaternoAlumno"> Apellido Materno </label>
                        <input type="text" name="txtMaternoAlumno" id="txtMaternoAlumno"
                            placeholder="Apellido Materno"
                            class="form-control"
                            required
                            maxlength="50"
                            value="<%= dto.getEntidad().getMaternoAlumno() %>"/> 
                        </div>
                        <div class="mb-3">
                        <label class="form-label" for="txtEmailAlumno"> Email Alumno </label>
                        <input type="text" name="txtEmailAlumno" id="txtEmailAlumno"
                            placeholder="Email del Alumno"
                            class="form-control"
                            required
                            maxlength="50"
                            value="<%= dto.getEntidad().getEmailAlumno() %>"/> 
                        </div>
                        <div class="mb-3">
                        <label class="form-label" for="txtIdCarrera"> Clave de carrera </label>
                        <input type="number" name="txtIdCarrera" id="txtIdCarrera"
                            placeholder="Clave de carrera"
                            class="form-control"
                            required
                            maxlength="50"
                            value="<%= dto.getEntidad().getIdCarrera() %>"/> 
                        </div>
                        
                        
                        
                        <div class="mb-3" style="text-align: right">
                        <input class="btn btn-outline-primary" type="submit" name="cmdEnviar" value="Enviar"/>
                        </div>
                    </form>
                        
                </section>
            </div>
        </div>

    </body>
</html>

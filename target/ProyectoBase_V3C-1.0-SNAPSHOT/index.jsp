<%-- 
    Document   : index
    Created on : 18 mar. 2022, 09:32:35
    Author     : darkdestiny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <a class="navbar-brand text-primary" href="index.php">Escuela Web </a>
                    <button class="navbar-toggler text-primary" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse text-primary" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link active text-primary" aria-current="page" href="index.php">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-primary" href="carrera/nuevaCarrera.jsp">Nueva Carrera</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-primary" href="carrera/listaDeCarreras.jsp">Listado de Carrera</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-primary" href="alumno/nuevaAlumno.jsp">Nuevo Alumno</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-primary" href="alumno/listaDeAlumnos.jsp">Listado de Alumnos</a>
                            </li>
                            
                            
                        </ul>
                    </div>
                </div>
            </nav>

           
        </div>
        
        <center>
            <img src='https://www.creadores.unam.mx/wp-content/uploads/2019/04/Escuela-Superior-de-Co%CC%81mputo-1280x720.jpg' width="60%" height="20%" alt="alt"/>
            <br>
            <!--<div>
                ALUMNOS:
            </div>
            <div>
                <ul>
                    <li>
                        HERNANDEZ DOMINGUEZ FREDY ADAIR
                    </li>
                    <li>
                        RAFAEL ACEVEDO ARIADNA
                    </li>
                    <li>
                        VILLEGAS DORANTES EDWIN IVAN
                    </li>
                </ul>
            </div>-->
            </center>
    </body>
</html>
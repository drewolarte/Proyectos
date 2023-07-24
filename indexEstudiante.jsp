<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@include file="WEB-INF/jspf/conexion.jspf"%>

<!DOCTYPE html>
<html lang="es">

<head>
    <title>Index Estudiante</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="css/stilos.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <style>
        body{
            background-image: url("img/slider.jpg");
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
    </style>
</head>

<body>
    <div class="container">
        <br>
        <div class="d-flex justify-content-center">
            <a  href="https://www.uts.edu.co/sitio/" target="_blank">
                <img src="img/logo.jpg" alt="logo" style="width:120px;" class="img-thumbnail">
            </a>
        </div>
        <br>
        <h1 class="text-center" id="titulo">Sistema Gestor de Proyectos</h1>
        <h2 class="text-center" id="titulo">Bienvenido: <c:out value="${admin.nombre_estudiante} ${admin.apellido_estudiante}"/></h2>
        <h3 class="text-center" id="titulo">Identificacion: <c:out value="${admin.id_estudiante}"/></h3>
        <br>
                                
        <div class="container d-flex justify-content-center">
            <div class="card bg-light text-dark m-1" style="width:300px" >
                <div class="card-body d-flex flex-column justify-content-center text-center">
                    <span class="material-symbols-outlined" width="70px">psychology</span>
                    <p class="card-text">Gestionar Proyecto</p>
                    <form action="gestionarProyectoEstudiante.jsp" method="POST">
                        <button type="submit" class="btn">
                            <a class="btn btn-outline-dark">Gestionar</a>
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <div class="container d-flex justify-content-center">
            <div class="card bg-light text-dark m-1" style="width:300px" >
                <div class="card-body d-flex flex-column justify-content-center text-center">
                    <span class="material-symbols-outlined" width="70px">school</span>
                    <p class="card-text">Formatos de Anteproyecto/Proyecto de Grado</p>
                    <form action="gestionarFormatos.jsp" method="POST">
                        <button type="submit" class="btn">
                            <a class="btn btn-outline-dark">Gestionar</a>
                        </button>
                    </form>
                </div>
            </div>
            <div class="card bg-light text-dark m-1" style="width:300px" >
                <div class="card-body d-flex flex-column justify-content-center text-center">
                    <span class="material-symbols-outlined" width="70px">calendar_month</span>
                    <p class="card-text">Calendario Academico</p>
                    <form action="gestionarCalendario.jsp" method="POST">
                        <button type="submit" class="btn">
                            <a class="btn btn-outline-dark">Gestionar</a>
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <form method="POST" class="d-flex justify-content-center text-center mt-1">
            <input type="hidden" name="logout" value="SI">
            <button type="submit" class="btn">
                <a class="btn btn-outline-primary">Cerrar Sesion</a>
            </button>
        </form>
        <c:if test="${param.logout != null}">
            <c:remove var="admin" scope="session"/>
            <c:redirect url="index.jsp"/>
        </c:if>
    </div>
</body>

</html>
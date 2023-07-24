<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@include file="WEB-INF/jspf/conexion.jspf"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <title>Sistema Gestor de Proyectos UTS</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="css/stilos.css">
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
                <img src="img/logo.jpg" alt="logo" style="width:150px;" class="img-thumbnail">
            </a>
        </div>
        <br>
        <h1 class="text-center" id="titulo">Sistema Gestor de Proyectos</h1>
        <h2 class="text-center" id="titulo">LOGIN</h2>
        <form action="loginAdministrador.jsp" method="POST" class="d-flex justify-content-center mb-2 mt-4">
            <button type="submit" class="btn btn-outline-info" style="width:200px;">ADMINISTRADOR</button>
        </form>
        <form action="loginCoordinador.jsp" method="POST" class="d-flex justify-content-center mb-2">
            <button type="submit" class="btn btn-outline-info" style="width:200px;">COORDINADOR</button>
        </form>
        <form action="loginDirector.jsp" method="POST" class="d-flex justify-content-center mb-2">
            <button type="submit" class="btn btn-outline-info" style="width:200px;">DIRECTOR</button>
        </form>
        <form action="loginEvaluador.jsp" method="POST" class="d-flex justify-content-center mb-2">
            <button type="submit" class="btn btn-outline-info" style="width:200px;">EVALUADOR</button>
        </form>
        <form action="loginEstudiante.jsp" method="POST" class="d-flex justify-content-center mb-2">
            <button type="submit" class="btn btn-outline-info" style="width:200px;">ESTUDIANTE</button>
        </form>
    </div>

</body>

</html>
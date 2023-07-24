<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@include file="WEB-INF/jspf/conexion.jspf"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <title>Login Director</title>
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
                <img src="img/logo.jpg" alt="logo" style="width:120px;" class="img-thumbnail">
            </a>
        </div>
        <br>
        <h1 class="text-center" id="titulo">Sistema Gestor de Proyectos</h1>
        <h2 class="text-center" id="titulo">LOGIN DIRECTOR</h2>
            <form method="POST">
                <div class="form-group">
                    <label for="user">Usuario:</label>
                    <input type="text" class="form-control" id="user" placeholder="Digite su documento de identidad"
                        name="user" required>
                </div>
                <div class="form-group">
                    <label for="pwd">Contraseña:</label>
                    <input type="password" class="form-control" id="pwd" placeholder="Digite su contraseña"
                        name="pwd" required>
                </div>
                <input type="hidden" class="form-control" id="modifica" name="modifica" value="SI">
                <button type="submit" class="btn btn-outline-primary btn-block">Ingresar</button>
            </form>
        <c:if test="${param.modifica != null}">
            <sql:query var="resultado" dataSource="${universidad}">
                Select * from roles where descripcion_roles = 'Director'
            </sql:query>
            <c:forEach var="rol" items="${resultado.rows}">
                <c:set var="idRol" value="${rol.id_roles}"/>
            </c:forEach>
            <sql:query var="result" dataSource="${universidad}" sql="SELECT * FROM docente WHERE id_docente=? and contrasena_docente=? and roles_id_director=?">
                <sql:param value="${param.user}"/>
                <sql:param value="${param.pwd}"/>
                <sql:param value="${idRol}"/>
            </sql:query>
            <c:forEach var="row" items="${result.rows}">
                <c:if test="${row.id_docente==param.user&&row.contrasena_docente==param.pwd}">
                    <c:set value="${row}" var="admin" scope="session"/>
                    <c:redirect url="indexDirector.jsp"/>
                </c:if>
            </c:forEach>
            <br>
            <div class="alert alert-primary text-center">
                Credenciales no validas. Intentelo de nuevo. 
            </div>
        </c:if>
    </div>

</body>

</html>
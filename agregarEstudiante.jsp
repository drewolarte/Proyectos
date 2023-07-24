<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@include file="WEB-INF/jspf/conexion.jspf"%>

<!DOCTYPE html>
<html lang="es">

<head>
    <title>Agregar Estudiante</title>
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
            <a  href="indexAdministrador.jsp">
                <img src="img/logo.jpg" alt="logo" style="width:120px;" class="img-thumbnail">
            </a>
        </div>
        <br>
        <h1 class="text-center" id="titulo">Agregar Estudiante</h1>
        <br>
        <form method="POST">
            <div class="form-group">
                <label for="id">Identificacion:</label>
                <input type="text" class="form-control" id="id" placeholder="Ingrese el documento de identidad" name="id" required>
            </div>
            <div class="form-group">
                <label for="nombre">Nombre:</label>
                <input type="text" class="form-control" id="nombre" placeholder="Ingrese el nombre" name="nombre" required>
            </div>
            <div class="form-group">
                <label for="apellido">Apellido:</label>
                <input type="text" class="form-control" id="apellido" placeholder="Ingrese el apellido" name="apellido" required>
            </div>
            <div class="form-group">
                <label for="contrasena">Contraseña:</label>
                <input type="password" class="form-control" id="contrasena" placeholder="Ingrese la contraseña" name="contrasena" required>
            </div>
            <div class="form-group">
                <sql:query var="rsRol" dataSource="${universidad}">
                    SELECT * FROM roles
                </sql:query>
                <label for="rol">Seleccione el rol:</label>
                <select class="form-control" id="rol" name="rol">
                    <c:forEach var="item" items="${rsRol.rows}">
                        <option value="${item.id_roles}" required 
                            <c:if test="${'Estudiante'!=item.descripcion_roles}">
                                disabled
                            </c:if>>
                            <c:out value="${item.descripcion_roles}"/>
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="semestre">Seleccione el semestre academico:</label>
                <select class="form-control" id="semestre" name="semestre">
                        <option value="5" required>5</option>
                        <option value="6" required>6</option>
                        <option value="9" required>9</option>
                        <option value="10" required>10</option>
                </select>
            </div>
            <button type="submit" class="btn btn-outline-primary btn-block">Agregar</button>
        </form>
        <c:if test="${param.id != null}">
            <sql:update var="result" dataSource="${universidad}">
                INSERT INTO
                estudiante (id_estudiante,nombre_estudiante,apellido_estudiante,contrasena_estudiante,roles_id,semestre_estudiante)
                values ('${param.id}','${param.nombre}','${param.apellido}','${param.contrasena}','${param.rol}','${param.semestre}')
            </sql:update>
            <c:if test="${result==1}">
                <c:redirect url="listarEstudiantes.jsp"/>
            </c:if>
        </c:if>
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
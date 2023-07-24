<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@include file="WEB-INF/jspf/conexion.jspf"%>

<!DOCTYPE html>
<html lang="es">

<head>
    <title>Gestionar Coordinadores</title>
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
        <h1 class="text-center" id="titulo">Gestión de Coordinadores</h1>
        <br>
        <sql:query var="coordinador" scope="request" dataSource="${universidad}">
            Select * from coordinador
        </sql:query>
        <table class="table table-bordered table-hover text-center">
            <thead>
                <tr>
                    <th class="align-middle">ID</th>
                    <th class="align-middle">NOMBRE</th>
                    <th class="align-middle">APELLIDO</th>
                    <th class="align-middle">ROL</th>
                    <th colspan="2" class="align-middle">ACCIONES</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="fila" items="${coordinador.rows}">
                    <sql:query var="rol" scope="request" dataSource="${universidad}">
                        Select descripcion_roles
                        from roles
                        where id_roles=${fila.roles_id}
                    </sql:query>
                    <tr>
                        <td class="align-middle"><c:out value="${fila.id_coordinador}"/></td>
                        <td class="align-middle"><c:out value="${fila.nombre_coordinador}"/></td>
                        <td class="align-middle"><c:out value="${fila.apellido_coordinador}"/></td>
                        <td class="align-middle">
                            <c:forEach var="roles" items="${rol.rows}">
                                <c:out value="${roles.descripcion_roles}"/></td>
                            </c:forEach>  
                        <td class="align-middle">
                            <form action="eliminarCoordinador.jsp" method="POST">
                                <input type="hidden" name="id" value="${fila.id_coordinador}">
                                <input type="hidden" name="contrasena" value="${fila.contrasena_coordinador}">
                                <button type="submit" class="btn btn-outline-info">Eliminar</button>
                            </form>
                        </td>
                        <td class="align-middle">
                            <form action="actualizarCoordinador.jsp" method="POST">
                                <input type="hidden" name="id" value="${fila.id_coordinador}">
                                <input type="hidden" name="contrasena" value="${fila.contrasena_coordinador}">
                                <button type="submit" class="btn btn-outline-info">Actualizar</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <form action="agregarCoordinador.jsp" method="POST">
            <button type="submit" class="btn btn-outline-primary btn-block">Nuevo Coordinador</button>
        </form>
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@include file="WEB-INF/jspf/conexion.jspf"%>

<!DOCTYPE html>
<html lang="es">

<head>
    <title>Gestion Estudiante Coordinador</title>
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
            <a  href="indexCoordinador.jsp">
                <img src="img/logo.jpg" alt="logo" style="width:120px;" class="img-thumbnail">
            </a>
        </div>
        <br>
        <h1 class="text-center" id="titulo">Gestionar Proyecto</h1>
        <br>
        <hr size="80px" color="#2e85a4">
        <sql:query var="result" dataSource="${universidad}" sql="SELECT * FROM estudiante WHERE id_estudiante=?">
                <sql:param value="${param.id}"/>
        </sql:query>

        <h3 class="text-center" id="titulo">Novedad por Gestionar</h3>
        <c:forEach var="row" items="${result.rows}">
            <c:if test="${row.anteproyecto_estudiante==null}">
                <h5 class="text-center">Esperando anteproyecto por estudiante.</h5>
            </c:if>
            <c:if test="${row.anteproyecto_estudiante!= null && row.docente_id_docentedirector==null}">
                <form method="POST">
                    <input type="hidden" name="id" value="${row.id_estudiante}"> 
                    <div class="form-group">
                        <sql:query var="director" dataSource="${universidad}">
                            SELECT * FROM docente
                        </sql:query>
                        <label for="direc">Seleccione el docente director de Proyecto:</label>
                        <select class="form-control" id="direc" name="direc">
                            <c:forEach var="itema" items="${director.rows}">
                                <option value="${itema.id_docente}" required>
                                    <c:out value="${itema.nombre_docente} ${itema.apellido_docente}"/>
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-outline-primary btn-block">Asignar</button>
                </form>
            </c:if>
            <c:if test="${row.anteproyecto_estudiante!= null && row.docente_id_docentedirector!=null  && row.aprobacion_director_anteproyecto_estudiante==null}">
                <h5 class="text-center">Esperando calificacion de anteproyecto por docente director.</h5>
            </c:if>
            <c:if test="${row.anteproyecto_estudiante!= null && row.docente_id_docentedirector!=null  && row.aprobacion_director_anteproyecto_estudiante.equals('No Aprobado') && row.estado_idea_anteproyecto_estudiante==null}">
                <h5 class="text-center">Esperando correcciones de anteproyecto por estudiante.</h5>
            </c:if>
            <c:if test="${row.anteproyecto_estudiante!= null && row.docente_id_docentedirector!=null  && row.aprobacion_director_anteproyecto_estudiante.equals('No Aprobado') && row.estado_idea_anteproyecto_estudiante!=null}">
                <h5 class="text-center">Esperando calificacion de anteproyecto con correciones por docente director.</h5>
            </c:if>
            <c:if test="${row.anteproyecto_estudiante!= null && row.docente_id_docentedirector!=null  && row.aprobacion_director_anteproyecto_estudiante.equals('Aprobado') && row.docente_id_docenteevaluador_anteproyecto==null}">
                <form method="POST">
                    <input type="hidden" name="id" value="${row.id_estudiante}">
                    <div class="form-group">
                        <label for="radanteproyecto">Agregar radicado de aprobacion de AnteProyecto:</label>
                        <input type="url" class="form-control" id="radanteproyecto" name="radanteproyecto" placeholder="Agregar enlace al radicado de aprobacion de anteproyecto por director" required>
                    </div>
                    <div class="form-group">
                        <sql:query var="evaluador" dataSource="${universidad}">
                            SELECT * FROM docente
                        </sql:query>
                        <label for="eval">Seleccione el docente evaluador de AnteProyecto:</label>
                        <select class="form-control" id="eval" name="eval">
                            <c:forEach var="iteme" items="${evaluador.rows}">
                                <c:if test="${iteme.id_docente!=row.docente_id_docentedirector}">
                                    <option value="${iteme.id_docente}" required>
                                        <c:out value="${iteme.nombre_docente} ${iteme.apellido_docente}"/>
                                    </option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-outline-primary btn-block">Asignar</button>
                </form>
            </c:if>
            <c:if test="${row.anteproyecto_estudiante!= null && row.docente_id_docentedirector!=null && row.docente_id_docenteevaluador_anteproyecto!=null && row.aprobacion_evaluador_anteproyecto_estudiante==null }" >
                <h5 class="text-center">Esperando calificacion de anteproyecto por docente evaluador.</h5>
            </c:if>
            <c:if test="${row.anteproyecto_estudiante!= null && row.docente_id_docenteevaluador_anteproyecto!=null  && row.aprobacion_evaluador_anteproyecto_estudiante.equals('No Aprobado') && row.pago_estudiante==null}">
                <h5 class="text-center">Esperando correcciones de anteproyecto por estudiante.</h5>
            </c:if>
            <c:if test="${row.anteproyecto_estudiante!= null && row.docente_id_docenteevaluador_anteproyecto!=null  && row.aprobacion_evaluador_anteproyecto_estudiante.equals('No Aprobado') && row.pago_estudiante!=null}">
                <h5 class="text-center">Esperando calificacion de anteproyecto con correciones por docente evaluador.</h5>
            </c:if>
            <c:if test="${row.anteproyecto_estudiante!= null && row.docente_id_docenteevaluador_anteproyecto!=null  && row.aprobacion_evaluador_anteproyecto_estudiante.equals('Aprobado') && row.radicado_anteproyecto_estudiante==null}">
                <form method="POST">
                    <input type="hidden" name="id" value="${row.id_estudiante}">
                    <div class="form-group">
                        <label for="radanteproyectocomite">Agregar radicado de aprobacion de AnteProyecto:</label>
                        <input type="url" class="form-control" id="radanteproyectocomite" name="radanteproyectocomite" placeholder="Agregar enlace al radicado de aprobacion de anteproyecto por comite de proyectos de grado" required>
                    </div>
                    <button type="submit" class="btn btn-outline-primary btn-block">Agregar</button>
                </form>
            </c:if>
            <c:if test="${row.anteproyecto_estudiante!= null && row.docente_id_docenteevaluador_anteproyecto!=null  && row.aprobacion_evaluador_anteproyecto_estudiante.equals('Aprobado') && row.radicado_anteproyecto_estudiante!=null}">
                <h5 class="text-center">Estudiante gestionado satisfactoriamente.</h5>
            </c:if>
        </c:forEach>
        <form method="POST" class="d-flex justify-content-center text-center mt-1">
            <input type="hidden" name="logout" value="SI">
            <button type="submit" class="btn">
                <a class="btn btn-outline-primary">Cerrar Sesion</a>
            </button>
        </form>
        <c:if test="${param.direc!=null}">
            <sql:query var="result" dataSource="${universidad}">
                Select * from roles where descripcion_roles  =  'Director'
            </sql:query>
            <c:forEach var="rol" items="${result.rows}">
                <c:set var="idRol" value="${rol.id_roles}"/>
            </c:forEach>
            <sql:transaction dataSource="${universidad}">  
                <sql:update var="result1">
                    update estudiante 
                    set docente_id_docentedirector = '${param.direc}' where id_estudiante = ${param.id}
                </sql:update>
                <sql:update var="result2">
                    update docente
                    set roles_id_director = '${idRol}' where id_docente = ${param.direc}
                </sql:update>
            </sql:transaction>  
            <c:if test="${result1==1&&result2==1}">
                <c:redirect url="gestionarProyectosCoordinador.jsp"/>
            </c:if>
        </c:if>
        <c:if test="${param.radanteproyecto!=null}">
            <sql:query var="result" dataSource="${universidad}">
                Select * from roles where descripcion_roles  =  'Evaluador'
            </sql:query>
            <c:forEach var="rol" items="${result.rows}">
                <c:set var="idRol" value="${rol.id_roles}"/>
            </c:forEach>
            <sql:transaction dataSource="${universidad}">  
                <sql:update var="result1">
                    update estudiante 
                    set docente_id_docenteevaluador_anteproyecto = '${param.eval}',
                    radicado_idea_anteproyecto_estudiante = '${param.radanteproyecto}' where id_estudiante = ${param.id}
                </sql:update>
                <sql:update var="result2">
                    update docente
                    set roles_id_evaluador  = '${idRol}' where id_docente = ${param.eval}
                </sql:update>
            </sql:transaction>  
            <c:if test="${result1==1&&result2==1}">
                <c:redirect url="gestionarProyectosCoordinador.jsp"/>
            </c:if>
        </c:if>
        <c:if test="${param.radanteproyectocomite!=null}">
            <sql:update var="result3" dataSource="${universidad}">
                update estudiante 
                set estado_anteproyecto_estudiante = 'Aprobado',
                radicado_anteproyecto_estudiante = '${param.radanteproyectocomite}' where id_estudiante = ${param.id}
            </sql:update>
            <c:if test="${result3==1}">
                <c:redirect url="gestionarProyectosCoordinador.jsp"/>
            </c:if>
        </c:if>
        <c:if test="${param.logout != null}">
            <c:remove var="admin" scope="session"/>
            <c:redirect url="index.jsp"/>
        </c:if>
    </div>
</body>

</html>
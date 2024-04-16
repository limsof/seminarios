<%@page import="com.emergentes.modelo.estudiante"%>
<%
     estudiante reg= (estudiante) request.getAttribute("miobjper");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>

        .container {
            width: 80%;
            margin: auto;


            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        form table {
            width: 100%;
            border-collapse: collapse;
        }

        form table td {
            padding: 8px;
        }

        form table td label {
            font-weight: bold;
        }

        form table input[type="text"],
        form table input[type="radio"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-top: 5px;
        }

        form table input[type="radio"] {
            width: auto;
        }

        .radio2 {
            border: 2px solid black; 
            padding: 20px;
        }
        .radio1{
             border: 2px solid black; 
            padding: 20px;
        }

        .radio2 label {
            margin-right: 20px;
        }

        .radio2 input[type="radio"] {
            margin-right: 5px;
        }

        input[type="submit"] {
            display: block;
            width: 100%;
            padding: 10px;
            margin-top: 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1 style="text-align: center;">Registro de seminarios</h1>

    <div class="container">
        <form action="mainServlet" method="post">
            
            
            <div class="radio1">
                <table>
                <tr>
                    <td><label>ID</label></td>
                    <td><input type="text" name="id" value="<%= reg.getId() %>" size="2" readonly></td>
                </tr>
                <tr>
                    <td><label>Fecha</label></td>
                    <td><input type="text" name="fecha" value="<%= reg.getFecha()%>"></td>
                </tr>
                <tr>
                    <td><label>Nombre</label></td>
                    <td><input type="text" name="nombre" value="<%= reg.getNombre() %>"></td>
                </tr>
                <tr>
                    <td><label>Apellidos</label></td>
                    <td><input type="text" name="apellidos" value="<%= reg.getApellidos()%>"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label>Turno</label><br>
                        <input type="radio" id="mañana" name="turno" value="mañana" <%= reg.getTurno().equals("mañana") ? "checked" : "" %>>
                        <label for="mañana">Mañana</label>
                        <input type="radio" id="tarde" name="turno" value="tarde" <%= reg.getTurno().equals("tarde") ? "checked" : "" %>>
                        <label for="tarde">Tarde</label>
                        <input type="radio" id="noche" name="turno" value="noche" <%= reg.getTurno().equals("noche") ? "checked" : "" %>>
                        <label for="noche">Noche</label>
                    </td>
                </tr>
            </table>
            </div>


            <div class="radio2">
                <label>Seleccione el tipo de Seminario:</label><br>
                <input type="radio" id="InteligenciaArtificial" name="tipoSeminario" value="Inteligencia Artificial" <%= reg.getTipoSeminario().equals("Inteligencia Artificial") ? "checked" : "" %>>
                <label for="InteligenciaArtificial">Inteligencia Artificial</label>
                <input type="radio" id="MachineLeoming" name="tipoSeminario" value="Machine Leoming" <%= reg.getTipoSeminario().equals("Machine Leoming") ? "checked" : "" %>>
                <label for="MachineLeoming">Machine Leoming</label>
                <input type="radio" id="SimulacionConArena" name="tipoSeminario" value="Simulacion Con Arena" <%= reg.getTipoSeminario().equals("Simulacion Con Arena") ? "checked" : "" %>>
                <label for="SimulacionConArena">Simulacion Con Arena</label>
                <input type="radio" id="RoboticaEducativa" name="tipoSeminario" value="Robotica Educativa" <%= reg.getTipoSeminario().equals("Robotica Educativa") ? "checked" : "" %>>
                <label for="RoboticaEducativa">Robotica Educativa</label>
            </div>

            <input type="submit" value="Enviar">
        </form>
    </div>
</body>
</html>

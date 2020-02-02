<%-- 
    Document   : ErroBd
    Created on : Jan 31, 2020, 11:02:59 AM
    Author     : Paulo Victor
--%>

<%@page import="java.sql.Connection"%>
<%@page import="Controle.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">      
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/> 
        <meta name="description" content="Sistema de login"/>
        <meta name="author" content="Paulo Victor"/> 
        <link rel="shortcut icon" href="images/icones/parking.png">
        <link type="text/css" rel="stylesheet" href="css/styleErros.css"/>
        <title>Erro com o banco!!!</title>
    </head>
    <body>
        <section>
            <div class="center">
                <div class="container">
                    <h2>Ops! Erro ao Localizar o banco de dados!!</h2>
                    <div class="robot"></div>
                    <form action="ErroBd.jsp">
                        <%
                            Conexion conn = new Conexion();
                            Connection verificarConexao = conn.ConectarBancoMysql("SistemaLogin");
                            if(verificarConexao != null){
                                session.invalidate();
                                response.sendRedirect("index.jsp");
                            }    
                        %>
                        <h2>Tentar Novamente</h2>
                        <div class="submit">
                            <input type="submit" name="reload" value=""/>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        
    </body>
</html>

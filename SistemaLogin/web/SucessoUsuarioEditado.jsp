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
        <title>Sucesso!!!</title>
    </head>
    <body>
        <section>
            <div class="center">
                <div class="container">
                    <h2>Usuario cadastrado com Sucesso</h2>   
                    <h2>Você já pode acessar ao sistema</h2>
                    <div class="success"></div>
                    <form action="PaginaInicial.jsp">
                        <h2>Voltar a página inicial</h2>
                        <div class="submit">
                            <input type="submit" name="reload" value=""/>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        
    </body>
</html>

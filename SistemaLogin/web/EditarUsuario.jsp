<%-- 
    Document   : index.jsp
    Created on : Jan 30, 2020, 11:29:34 AM
    Author     : Paulo Victor
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Controle.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/> 
        <meta name="description" content="Sistema de login"/>
        <meta name="author" content="Paulo Victor"/> 
        <link rel="shortcut icon" href="images/icones/parking.png">
        
        <link rel="stylesheet" href="css/stylePaginaEditar.css"/>        
    </head>
    <body>
        <%
            Conexion conn = new Conexion();
            Connection verificarConexao = conn.ConectarBancoMysql("SistemaLogin");
            if(verificarConexao == null){
                response.sendRedirect("ErroBd.jsp");
            }
            
            String idUsuario = request.getParameter("id");
            String nomeUsuario = request.getParameter("nome");
            String sobrenomeUsuario = request.getParameter("sobrenome");            
            String emailUsuario = request.getParameter("email");                        
            String telefoneCelularUsuario = request.getParameter("telefone_celular");            
        %>
        <header>
            <div class="center">
                <div class="logo">
                    <h1>Paulo.Victor</h1>
                </div>                
                <div class="clear"></div>
            </div>
        </header>
        <section>
            <div class="center">
                <div class="criar-conta">
                    <%
                        out.println("<h2>Estamos editando o usuário com o id: "+idUsuario+"</h2>");
                    %>
                    <h3>É rápido e fácil</h3>                    
                    <form id="criar-nova-conta" method="post" action="./EditarUsuario">
                        <div class="w50">
                            <%
                            out.println("<input type='text' name='id' id='id' readonly  placeholder='Nome*' value="+idUsuario+" required/>");
                            out.println("<input type='text' name='nome' id='nome'  placeholder='Nome*' value="+nomeUsuario+" required/>");
                            %>
                        </div><!--w50-->
                        <div class="w50">
                            <%
                           out.println("<input type='text' name='sobrenome' id='sobrenome'  placeholder='Sobrenome*' value="+sobrenomeUsuario+" required/>");
                            %>
                            <!--<input type="text" name="sobrenome"  id="sobrenome" placeholder="Sobrenome*" required/>-->
                        </div><!--w50-->
                        <div class="w100">
                            <%
                           out.println("<input type='email' name='email' id='email'  placeholder='Email*' value="+emailUsuario+" required/>");
                            %>
                        </div><!--w100-->
                        <div class="w100">
                            <input type="password" name="senha" id="senha" placeholder="Senha*"  required/>
                        </div><!--w100-->
                        <div class="w100">
                            <%
                           out.println("<input type='text' name='telefone' id='telefone'  placeholder='Telefone/Celular' value="+telefoneCelularUsuario+" required/>");
                            %>
                        </div><!--w100-->
                        <div class="w100">
                            <span>*Campos obrigatórios</span>
                        </div><!--w100-->
                        <div class="w50">
                            <input type="submit" name="candastrar" value="Editar"/>                           
                        </div><!--w50-->
                    </form>
                    <div class="w50">
                        <form action="PaginaInicial.jsp">
                            <input type="submit" name="cancelar" value="Cancelar"/>
                        </form>
                    </div>
                    
                        <div class="clear"></div>
                </div><!--criar-conta-->
            </div><!--center-->
        </section>
                      
        <footer>
            <div class="center">
                <p>Criado por <a target="_blank" href="https://www.linkedin.com/in/paulo-victor-22b615182/">Paulo.Victor</a></p>
                <p>Recife(PE) - 01/2020</p>
            </div>
        </footer>
        <script src="javascript/jquery-3.4.1.min.js"></script>    
        <script src="javascript/jquery.mask.js"></script> 
        <script src="javascript/funcoesJs.js"></script> 
    </body>
</html>

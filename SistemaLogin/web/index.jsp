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
        
        <link rel="stylesheet" href="css/style.css"/>        
    </head>
    <body>
        <%
            Conexion conn = new Conexion();
            Connection verificarConexao = conn.ConectarBancoMysql("SistemaLogin");
            if(verificarConexao == null){
                response.sendRedirect("ErroBd.jsp");
            }            
        %>
        <header>
            <div class="center">
                <div class="logo">
                    <h1>Paulo.Victor</h1>
                </div>
                <div class="formulário">
                    <form id="login-principal" action="index.jsp" method="post">
                        <div class="input">
                            <span>E-mail</span>
                            <input type="email" name="email" id="email" required/>
                        </div><!--input-->
                        <div class="input">
                            <span>Senha</span>
                            <input type="password" name="senha" id="senha" required/>
                        </div><!--input-->
                        <% 
                            if(verificarConexao != null ){
                                if((request.getParameter("email") != null) && (request.getParameter("senha") != null)){
                                    Statement st = verificarConexao.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.TYPE_FORWARD_ONLY);
                                    String aaa;
                                    
                                    ResultSet rs = st.executeQuery("select * from dadosUsuarios where email ='"+request.getParameter("email").trim()+"' and senha = '"+request.getParameter("senha").trim()+"'");
                                    if(rs.next()){
                                        session.setAttribute("usuario",request.getParameter("email"));
                                        response.sendRedirect("PaginaInicial.jsp");
                                    }
                                }
                            }
                        
                        %>
                        <div class="input">
                            <input type="submit" name="enviar" id="enviar" value="Enviar"/>
                        </div><!--input-->
                    </form>                    
                </div><!--formulário-->
                <div class="clear"></div>
            </div>
        </header>
        <section>
            <div class="center">
                <div class="criar-conta">
                    <h2>Abra uma conta</h2>
                    <h3>É rápido e fácil</h3>
                    <form id="criar-nova-conta" method="post" action="./SalvarUsuario">
                        <div class="w50">
                            <input type="text" name="nome" id="nome"  placeholder="Nome*" required/>
                        </div><!--w50-->
                        <div class="w50">
                            <input type="text" name="sobrenome"  id="sobrenome" placeholder="Sobrenome*" required/>
                        </div><!--w50-->
                        <div class="w100">
                            <input type="email" name="email" id="email" placeholder="Email*" required/>
                        </div><!--w100-->
                        <div class="w100">
                            <input type="password" name="senha" id="senha" placeholder="Senha*"  required/>
                        </div><!--w100-->
                        <div class="w100">
                            <input type="text" name="telefone" id="telefone" placeholder="Telefone/Celular"/>
                        </div><!--w100-->
                        <div class="w100">
                            <span>*Campos obrigatórios</span>
                        </div><!--w100-->
                        <div class="w100">
                            <input type="submit" name="cadastrar" value="Cadastra-se"/>
                        </div><!--w100-->
                        <div class="clear"></div>
                    </form>
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

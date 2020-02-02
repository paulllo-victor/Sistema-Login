<%-- 
    Document   : PaginaInicial
    Created on : Jan 30, 2020, 3:33:15 PM
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
        
        <link rel="stylesheet" href="css/stylePaginaInicial.css"/>      
        <title>Pagina Inicial</title>
    </head>
    <body>
        <%
            //Verificando o banco de dados
            Conexion conn = new Conexion();
            Connection verificarConexao = conn.ConectarBancoMysql("SistemaLogin");
            if(verificarConexao == null){
                response.sendRedirect("ErroBd.jsp");
            }
            //Verificando a sessão do usuario
            String usuarioLogado = (String) session.getAttribute("usuario");
            if(usuarioLogado == null){
                
                 response.sendRedirect("index.jsp");
            }           
        %>
        <header>
            <div class="center">
                <div class="saudacoes">
                    <h1>Bem vindo, <% out.println(usuarioLogado);%></h1>
                </div><!--saudacoes-->
                <div class="deslogar">
                    <form action="Deslogar.jsp">
                        <input type="submit" value="Deslogar"/>
                    </form>
                </div>
                <div class="clear"></div>
            </div><!--center-->
        </header>
                <section>
                    <div class="center">
                        <div  class="container-table"> 
                            <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nome</th>
                                    <th>Sobrenome</th>
                                    <th>E-mail</th>
                                    <th>telefone</th>
                                     <th>Opções</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                <% 
                                    conn.ExecutaSql("select * from dadosUsuarios order by id");
                                    conn.resultset.first();
                                    do{
                                    out.println("<tr>");
                                    out.println("<td>"+ conn.resultset.getInt("id")+"</td>");
                                    out.println("<td>"+ conn.resultset.getString("nome")+"</td>");
                                    out.println("<td>"+ conn.resultset.getString("sobrenome")+"</td>");
                                    out.println("<td>"+ conn.resultset.getString("email")+"</td>");
                                    out.println("<td>"+ conn.resultset.getString("telefone_celular")+"</td>");
                                    out.println("<td>");
                                        out.println("<form action='EditarUsuario.jsp'>");                                        
                                        out.println("<input type='text'  name='id' id='id' readonly='true' value="+conn.resultset.getInt("id")+">");
                                        out.println("<input type='text'  name='nome' id='nome' readonly='true' value="+conn.resultset.getString("nome")+">");
                                        out.println("<input type='text'  name='sobrenome' id='sobrenome' readonly='true' value="+conn.resultset.getString("sobrenome")+">");
                                        out.println("<input type='text'  name='email' id='email' readonly='true' value="+conn.resultset.getString("email")+">");
                                        out.println("<input type='text'  name='telefone_celular' readonly='true' id='telefone_celular' value="+conn.resultset.getString("telefone_celular")+">");
                                        out.println("<input type='submit' name='editar' value='Editar'/>");
                                        out.println("</form>");
                                        out.println("<form action='./ExcluirUsuario'>");
                                        out.println("<input type='text'  name='id' id='id'  readonly='true' value="+conn.resultset.getInt("id")+">");
                                        out.println("<input type='submit' name='excluir' value='Excluir'/>");
                                        out.println("</form>");
                                    out.println("<td>");
                                    out.println("</tr>");
                                    }while(conn.resultset.next());
                                %>
                                </tr>
                                
                            </tbody>
                        </table>
                        </div><!--container-table-->
                    </div><!--center-->
                </section>
        <footer>
            <div class="center">
                <p>Criado por <a target="_blank" href="https://www.linkedin.com/in/paulo-victor-22b615182/">Paulo.Victor</a></p>
                <p>Recife(PE) - 01/2020</p>
            </div>
        </footer>
    </body>
</html>

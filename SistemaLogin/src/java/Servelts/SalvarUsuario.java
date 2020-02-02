/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servelts;

import Controle.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Paulo Victor
 */
@WebServlet(name = "SalvarUsuario", urlPatterns = {"/SalvarUsuario"})
public class SalvarUsuario extends HttpServlet {
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Conexion conn = new Conexion();
    Connection resp;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");      
        String emailCadastado = "Nenhum";
        /*Variveis sistema do banco de dados*/
        String nome = request.getParameter("nome");
        String sobrenome = request.getParameter("sobrenome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String telefone = request.getParameter("telefone");
        boolean telefoneVerificadoSenhaVerificada = false;
        
        try {
            if(!(telefone.length() < 14) && !(senha.length() < 6)){
                resp = conn.ConectarBancoMysql("SistemaLogin");
                telefoneVerificadoSenhaVerificada = true;
                if(resp != null){
                    conn.ExecutaSql("select * from dadosUsuarios where email = '"+email+"'");

                    if(!conn.resultset.first()){
                        PreparedStatement pst = resp.prepareStatement("insert into dadosUsuarios(nome,sobrenome,email,senha,telefone_celular) values (?,?,?,?,?);");
                        pst.setString(1, nome);
                        pst.setString(2, sobrenome);
                        pst.setString(3, email);
                        pst.setString(4, senha);
                        pst.setString(5, telefone);
                        pst.execute();
                    }else{
                         emailCadastado = conn.resultset.getString("email");
                    }
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(SalvarUsuario.class.getName()).log(Level.SEVERE, null, e);
        }
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            if(emailCadastado.equals("Nenhum")){
                if(telefoneVerificadoSenhaVerificada){
                    response.sendRedirect("SucessoUsuarioCadastrado.jsp");
                }else{
                    response.sendRedirect("ErroTelefoneOuSenha.jsp");
                }
            }else{                
                response.sendRedirect("ErroUsuariocadastrado.jsp");
            }
            //out.println(achouAlgo); 
            //fazer um if e else para encaminhar o usuario para a pagina adequada
           //response.sendRedirect("index.jsp");
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

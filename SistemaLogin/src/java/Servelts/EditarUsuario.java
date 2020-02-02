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
@WebServlet(name = "EditarUsuario", urlPatterns = {"/EditarUsuario"})
public class EditarUsuario extends HttpServlet {

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
        int id = Integer.parseInt(request.getParameter("id"));
        String nome = request.getParameter("nome");
        String sobrenome = request.getParameter("sobrenome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String telefone = request.getParameter("telefone");
        boolean telefoneVerificadoSenhaVerificada = false;
        
        try {
            if(!(telefone.length() < 14) && !(senha.length() < 6)){
                resp = conn.ConectarBancoMysql("SistemaLogin");
                
                if(resp != null){                    
                        PreparedStatement pst = resp.prepareStatement("update dadosUsuarios set nome = ?, sobrenome = ?, email = ?, senha = ?, telefone_celular = ? where id = ?");
                        pst.setString(1, nome);
                        pst.setString(2, sobrenome);
                        pst.setString(3, email);
                        pst.setString(4, senha);
                        pst.setString(5, telefone);
                        pst.setInt(6,id);
                        pst.executeUpdate();
                        telefoneVerificadoSenhaVerificada = true;
                        //response.sendRedirect("SucessoUsuarioCadastrado.jsp");
                    
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(SalvarUsuario.class.getName()).log(Level.SEVERE, null, e);
        }
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            if(telefoneVerificadoSenhaVerificada){
                response.sendRedirect("SucessoUsuarioEditado.jsp");
            }else{
                response.sendRedirect("ErroEditarTelefoneOuSenha.jsp");
            }            
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

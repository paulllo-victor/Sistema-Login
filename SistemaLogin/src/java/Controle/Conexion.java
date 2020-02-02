

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author Paulo Victor
 */
public class Conexion {
    public Statement statement;
    public ResultSet resultset;
    public Connection conn = null;
    String url ="jdbc:mysql://localhost:3306/";
    String user = "root";
    String password = "";
    
    public Connection ConectarBancoMysql(String nomeBanco){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            try {
                conn = DriverManager.getConnection(url+nomeBanco, user, password);
            } catch (SQLException ex){
                System.out.println("Caminho, senha ou usuario incorretos");
            }
        } catch (ClassNotFoundException ex) {
            System.out.println("Driver não encontrado");
        }
        return conn;
    }
    public void ExecutaSql(String sql){
        try {
            statement = conn.createStatement(resultset.TYPE_SCROLL_INSENSITIVE, resultset.CONCUR_READ_ONLY);
            resultset = statement.executeQuery(sql);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Erro" + e);
        }
    }
}

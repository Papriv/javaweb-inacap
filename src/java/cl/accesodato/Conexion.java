package cl.accesodato;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
public class Conexion {
    private Connection con;
    private Statement stmt;
    private ResultSet rs;
    private String driver="com.mysql.jdbc.Driver";
    private String url="jdbc:mysql://localhost:3306/inacap";
    private String user="root";
    private String pass="";
    public Conexion(){
        try{
            Class.forName(driver);
            con=DriverManager.getConnection(url,user,pass);
            System.out.println("Conexion Establecida");
        }catch(Exception ex){
            System.out.println("ERROR EN CONEXION"+ex.getMessage());
        }
    }
    public void runSql(String sql){
        try {
            stmt=con.createStatement();
            stmt.executeUpdate(sql);
        } catch (SQLException ex) {
            System.out.println("ERROR SQL");
        }
    }
    public void setSQL(String sql){
        try{
            stmt=con.createStatement();
            rs=stmt.executeQuery(sql);
        }catch(Exception ex){
            System.out.println("ERRO SQL");
        }
    }
    public ResultSet getRs(){
        return rs;
    }
}

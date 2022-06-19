/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import business.model.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;


public class UserDAO {
    
    private static DataSource ds;
    private static Connection connexionBD;
    private static Statement stmt;
    private static ResultSet resultat;
       private Connection db;
    public UserDAO (Connection db) {
        this.db = db;
    }


public void insererUser(User user) //penser a changer le type retourné
    {
        try
        {
            
            Connection con = db;
            String reqParam="insert into `User`(prenom, nom, email,mdp,tel,adr) values (?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(reqParam);
            pstmt.setString(1,user.getPrenom());
            pstmt.setString(2,user.getNom());
            pstmt.setString(3,user.getEmail());
            pstmt.setString(4,user.getMdp());
            pstmt.setLong(5,user.getTel());
            pstmt.setString(6,user.getAdr());
	    pstmt.execute();
                
        }
        
        catch (SQLException ex) {
            System.out.println("Erreur ! : " + ex);
        }
        
        // return ce que l'on veut
        
    }
	public User getUserbyId(int id) {
		User user=null;
		try
        {
            Connection con = dao.ConnectionDB.getInstance();
            String reqParam="SELECT * from User where id=?";
             PreparedStatement pstmt = con.prepareStatement(reqParam);
             pstmt.setInt(1,id);
             pstmt.execute();
            
            resultat = pstmt.executeQuery();
            
            while(resultat.next())
            {
            	String prenom=resultat.getString("prenom");       
            	String nom=resultat.getString("nom");
            	String email=resultat.getString("email");
            	String mdp=resultat.getString("mdp");
                long tel=resultat.getLong("tel");
                String adr=resultat.getString("adr");
                id=resultat.getInt("id");
               user= new User(prenom, nom, email,mdp,tel,adr,resultat.getString("role"));
               user.setId(id);
            }
        }catch (SQLException ex) {
            System.out.println("Erreur ! : " + ex);
        }
		return user;
	}

    public User getVerifUser(String emailUser,String mdpUser)  //penser a changer le type retourné
    {
        User user=null;
        String prenom;       
         String nom;
         String email;
         String mdp;
         long tel;
         String adr;
         int id;
        try
        {
            Connection con = dao.ConnectionDB.getInstance();
            String reqParam="SELECT * from User where email=? and mdp=? ";
             PreparedStatement pstmt = con.prepareStatement(reqParam);
             pstmt.setString(1,emailUser);
             pstmt.setString(2,mdpUser);
             pstmt.execute();
            
            resultat = pstmt.executeQuery();
            
            while(resultat.next())
            {
                      prenom=resultat.getString("prenom");       
                      nom=resultat.getString("nom");
                      email=resultat.getString("email");
                      mdp=resultat.getString("mdp");
                      tel=resultat.getLong("tel");
                      adr=resultat.getString("adr");
                      id=resultat.getInt("id");
                     user= new User(prenom, nom, email,mdp,tel,adr,resultat.getString("role"));
                     user.setId(id);
                
            }  
        }
        
        catch (SQLException ex) {
            System.out.println("Erreur ! : " + ex);
        }
        
        // return ce que l'on veut
       return user; 
    }
}
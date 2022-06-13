/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import business.model.Produit;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;

/**
 *
 * @author p1801454
 */
public class ProduitDAO {
    
    private static DataSource ds;
    private static Connection connexionBD;
    private static Statement stmt;
    private static ResultSet resultat;
     private Connection db;
    
    public ProduitDAO(Connection db) {
        this.db = db;
    }

 


public List<Produit> listeProduit() throws SQLException //penser a changer le type retourné
    {
     List <Produit> listeproduit= new ArrayList<>();
        try
        {
     
            Connection con = db;
            PreparedStatement stm = con.prepareStatement("SELECT * from Produit");
            ResultSet resultat = stm.executeQuery();
              String nom;
              int id;
              String photo;
              int prix;
            
            
            while(resultat.next())
            {
                nom=resultat.getString("nom");
                photo=resultat.getString("photo");
                id=resultat.getInt("id");
                prix=resultat.getInt("prix");
                
                Produit produit= new Produit(nom,photo,prix);
                produit.setId(id);
                listeproduit.add(produit);
                
            }
        }
        
        catch (SQLException ex) {
            System.out.println("Erreur ! : " + ex);
        }
        
       return listeproduit;
        
    }

    public Produit getProduit(int idProduit){
       Produit produit=null;
       ResultSet resultat;
        try
        {
     
            Connection con = dao.ConnectionDB.getInstance();
            PreparedStatement stm = con.prepareStatement("SELECT * from Produit where id=?");
            stm.setInt(1,idProduit);
            resultat = stm.executeQuery();
              String nom;
              int id;
              String photo;
              int prix;
            
            
            while(resultat.next())
            {
                nom=resultat.getString("nom");
                photo=resultat.getString("photo");
                id=resultat.getInt("id");
                prix=resultat.getInt("prix");
                
                produit= new Produit(nom,photo,prix);
                produit.setId(id);
                
                
            }
        }
        
        catch (SQLException ex) {
            System.out.println("Erreur ! : " + ex);
        }
        
       return produit;
    
    
    
    }
    
    public void insertProduit (Produit p) {
    	
    	try {
            Connection con = dao.ConnectionDB.getInstance();
            PreparedStatement stm = con.prepareStatement("INSERT INTO Produit (nom, prix, photo, stock) VALUES (?, ?, ?, ?)");
            stm.setString(1,p.getNom());
            stm.setInt(2,p.getPrix());
            stm.setString(3,p.getPhoto());
            stm.setInt(4,0); //bizarre
            
            resultat = stm.executeQuery();
            
    	}
        catch (SQLException ex) {
            System.out.println("Erreur dans l'insertion ! : " + ex);
        }
    	
    }
}
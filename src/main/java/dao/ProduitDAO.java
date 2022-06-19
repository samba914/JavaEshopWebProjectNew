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
            PreparedStatement stm = con.prepareStatement("SELECT * from Produit order by  stock desc");
            ResultSet resultat = stm.executeQuery();
              String nom;
              int id;
              String photo;
              int prix;
              int stock;
            
            
            while(resultat.next())
            {
                nom=resultat.getString("nom");
                photo=resultat.getString("photo");
                id=resultat.getInt("id");
                prix=resultat.getInt("prix");
                stock=resultat.getInt("stock");
                Produit produit= new Produit(nom,photo,prix,stock);
            
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
            PreparedStatement stm = con.prepareStatement("SELECT * from Produit where id=? ");
            stm.setInt(1,idProduit);
            resultat = stm.executeQuery();
              String nom;
              int id;
              String photo;
              int prix;
              int stock;
            
            
            while(resultat.next())
            {
                nom=resultat.getString("nom");
                photo=resultat.getString("photo");
                id=resultat.getInt("id");
                prix=resultat.getInt("prix");
                stock=resultat.getInt("stock");
                produit= new Produit(nom,photo,prix,stock);
                produit.setId(id);
                
                
            }
        }
        
        catch (SQLException ex) {
            System.out.println("Erreur ! : " + ex);
        }
        
       return produit;
    
    
    
    }

    
    public void updateProduit (Produit p) {
    	
    	try {
            Connection con = dao.ConnectionDB.getInstance();
            PreparedStatement stm = con.prepareStatement("Update produit set nom=?, prix=?,stock=? where id=?;");
            stm.setString(1,p.getNom());
            stm.setInt(2,p.getPrix());
            stm.setInt(3,p.getStock()); 
            stm.setInt(4,p.getId()); 
            
            resultat = stm.executeQuery();
            
    	}
        catch (SQLException ex) {
            System.out.println("Erreur dans l'update ! : " + ex);
        }
    	
    }
    
    public void insertProduit (Produit p) {
    	
    	try {
            Connection con = dao.ConnectionDB.getInstance();
            PreparedStatement stm = con.prepareStatement("INSERT INTO Produit (nom, prix, photo, stock) VALUES (?, ?, ?, ?)");
            stm.setString(1,p.getNom());
            stm.setInt(2,p.getPrix());
            stm.setString(3,p.getPhoto());
            stm.setInt(4,p.getStock()); //bizarre
            
            resultat = stm.executeQuery();
            
    	}
        catch (SQLException ex) {
            System.out.println("Erreur dans l'insertion ! : " + ex);
        }
    	
    }
}
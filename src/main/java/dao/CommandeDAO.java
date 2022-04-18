/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import business.model.Commande;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;

/**
 *
 * @author p1801454
 */
public class CommandeDAO {
    
 static  int numCommande=0;

    Connection db;
    public CommandeDAO(Connection db) {
        this.db=db;
    }
    


public void insererCommande(Commande commande) //penser a changer le type retourné
    {
    
        try
        {
           
            Connection con = db;
             int num=commande.getNum();
             int idUser=commande.getIdUser();
             Map<Integer, Integer> listeProduit=commande.getListeProduit();
                 Iterator<Entry<Integer, Integer>> il = listeProduit.entrySet().iterator();       
                 while (il.hasNext()) {
                                   Entry<Integer, Integer> entry = il.next();
                                    String reqParam="insert into Commande values(?,?,?,?)";        
                                    PreparedStatement stm = con.prepareStatement(reqParam);
                                    stm.setInt(1,num);
                                    stm.setInt(2,idUser);
                                    stm.setInt(3,entry.getKey());
                                    stm.setInt(4,entry.getValue());
                                    stm.execute();
                                
              } 
           
            
           
        }
        
        catch (SQLException ex) {
            System.out.println("Erreur ! : " + ex);
        }
        
        // return ce que l'on veut
        
    }

public List<Commande> getListeCommande(int idUsers) //penser a changer le type retourné
    {
    ResultSet resultat1;
    ResultSet resultat2;
    ResultSet resultat3;
    
    List<Commande> listeCommande=new ArrayList<>();
        try
        {
           
            Connection con = db;
             int num;
             int idUser;
             int nbCommande;
             int idProduit;
           
             int quantite;
            
             int first=1;
             Commande commande=null;
           
         
             Map<Integer, Integer> listeProduit=new HashMap<>();
        
             
            PreparedStatement stm2 = con.prepareStatement("SELECT * FROM `Commande` where idUser=?" );
             stm2.setInt(1,idUsers);
             stm2.execute();
             resultat2 = stm2.executeQuery();
             System.out.println(resultat2.next());
            do
            {
                 if(numCommande ==resultat2.getInt("num" ) || first==1){
                     System.out.println("ici");
                    numCommande=resultat2.getInt("num");
                       
;                   idProduit=resultat2.getInt("idProduit");
                     
                    quantite=resultat2.getInt("quantite");
                    listeProduit.put(idProduit,quantite);
                     System.out.println("gro");
                    first++;
                 }else{
                     commande= new Commande(idUsers,listeProduit);
                    
                    commande.setNum(numCommande);
                     listeCommande.add(commande);
                     listeProduit.clear();
                     numCommande=resultat2.getInt("num")
;                   idProduit=resultat2.getInt("idProduit");
                    quantite=resultat2.getInt("quantite");
                    listeProduit.put(idProduit,quantite);   
                 }
          ;
            }  while(resultat2.next());
               
            
           
        }
        
        catch (SQLException ex) {
            System.out.println("Erreur ! : " + ex);
        }
        return listeCommande;
        
    
        
    }
}
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business.logic;

import business.model.Commande;
import business.model.Produit;
import dao.CommandeDAO;
import dao.ConnectionDB;
import dao.ProduitDAO;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 *
 * @author p1422359
 */
public class ServicesMagasin {
    
        public void faireCommande( Map<Integer, Integer> listeProduit,int idUser) throws SQLException{
             CommandeDAO commandeDao=new CommandeDAO(ConnectionDB.getInstance());
             Commande commande= new Commande(idUser,listeProduit);
             commandeDao.insererCommande(commande);
        
        } 
        
        public List<Commande> getListeCommande(int Users){
             CommandeDAO commandeDao=new CommandeDAO(ConnectionDB.getInstance());
             List<Commande>  liste= commandeDao.getListeCommande(Users);
             return liste;
        }
        
        public Produit voirProduit(int idProduit){
            ProduitDAO produitDao = new ProduitDAO(ConnectionDB.getInstance());
            Produit produit = produitDao.getProduit(idProduit);
        
        return produit;
        }
        
        
    
   
}

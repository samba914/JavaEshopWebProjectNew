
package business.logic;

import business.model.Commande;
import business.model.Produit;
import dao.CommandeDAO;
import dao.ConnectionDB;
import dao.ProduitDAO;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class ServicesMagasin {
    
        public void faireCommande( Map<Integer, Integer> listeProduit,int idUser) throws SQLException{
             CommandeDAO commandeDao=new CommandeDAO(ConnectionDB.getInstance());
             Commande commande= new Commande(idUser,listeProduit);
             commandeDao.insererCommande(commande);
        
        } 
        public Commande getCommandeById(List<Commande> listCommande,int id) {
        	for(Commande commande:listCommande) {
        		if(commande.getNum()==id)
        			return commande;
        	}
        	return null;
        }
        
        public List<Commande> getListeCommande(int Users){
             CommandeDAO commandeDao=new CommandeDAO(ConnectionDB.getInstance());
             List<Commande>  liste= commandeDao.getListeCommande(Users);
             return liste;
        }
        public List<Commande> getListeCommande(){
            CommandeDAO commandeDao=new CommandeDAO(ConnectionDB.getInstance());
            List<Commande>  liste= commandeDao.getListeCommande();
            return liste;
       }
        
        public Produit voirProduit(int idProduit){
            ProduitDAO produitDao = new ProduitDAO(ConnectionDB.getInstance());
            Produit produit = produitDao.getProduit(idProduit);
        
        return produit;
        }
        
        
    
   
}

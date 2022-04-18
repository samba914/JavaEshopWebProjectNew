/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package coeurdemetier;

import business.logic.ServicesMagasin;
import business.model.Commande;
import business.model.Produit;
import dao.ConnectionDB;
import dao.ProduitDAO;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author p1422359
 */
public class Coeurdemetier {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       List<Commande> liste = new ArrayList<>();
       ServicesMagasin service= new ServicesMagasin();
       liste=service.getListeCommande(1);
       
       for(Commande e:liste){
       
           System.out.println(e);
       }
       
       
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business.model;

import java.util.List;
import java.util.Map;

/**
 *
 * @author p1422359
 */
public class Commande {
    private static int NBCOMMANDE;
    private int num;
    private int idUser;
    private  Map<Integer, Integer> listeProduit;
 

    public Commande() {
        NBCOMMANDE++;
        this.num = NBCOMMANDE;
    }
    
    public Commande(int idUser, Map<Integer, Integer> listeProduit) {
        NBCOMMANDE++;
        this.num = NBCOMMANDE;
        this.idUser=idUser;
        this.listeProduit=listeProduit;
       
    }

    
 

 

    public Map<Integer, Integer>getListeProduit() {
        return listeProduit;
    }

    public void setListeProduit(Map<Integer, Integer> listeProduit) {
        this.listeProduit = listeProduit;
    }


  

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    @Override
    public String toString() {
        return "Commande{" + "num=" + num + ", idUser=" + idUser + ", listeProduit=" + listeProduit + '}';
    }

    
}

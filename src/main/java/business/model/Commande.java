/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business.model;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author p1422359
 */
public class Commande {
    private int num;
    private int idUser;
    private Date date;
    private String etat;
    private  Map<Integer, Integer> listeProduit;
 

    public Commande(int idUser, Map<Integer, Integer> listeProduit) {
        this.idUser=idUser;
        this.listeProduit=listeProduit;
       
    }
    public Commande(int num,int idUser, Map<Integer, Integer> listeProduit) {
        this.num = num;
        this.idUser=idUser;
        this.listeProduit=listeProduit;
       
    }
    public Commande(int num,int idUser,Date date,String etat) {
        this.num = num;
        this.idUser=idUser;
        this.date=date;
        this.etat=etat;
        this.listeProduit=new HashMap<>();
       
    }

    
 

 
   
    public Map<Integer, Integer>getListeProduit() {
        return listeProduit;
    }

    public void setListeProduit(Map<Integer, Integer> listeProduit) {
        this.listeProduit = listeProduit;
    }

    public void addProduct(int id,int quantity) {
    	this.listeProduit.put(id,quantity);
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
    public String getEtat() {
    	return etat;
    }
    public Date getDate() {
    	return date;
    }
    public void setDate(Date date) {
    	this.date=date;
    }

    public void setNum(int num) {
        this.num = num;
    }

    @Override
    public String toString() {
        return "Commande{" + "num=" + num + ", idUser=" + idUser + ", listeProduit=" + listeProduit + '}';
    }

    
}

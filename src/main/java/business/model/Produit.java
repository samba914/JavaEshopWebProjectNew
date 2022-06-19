/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business.model;

/**
 *
 * @author p1422359
 */
public class Produit {
    
    private String nom;
    private int id;
    private String photo;
    private int prix;
    private int stock;

    
    public Produit(){
        
    }

    public Produit(String nom, String photo, int prix) {
        this.nom = nom;
     
        this.photo = photo;
        this.prix = prix;
        this.stock=0;
    }
    public Produit(String nom, String photo, int prix, int stock) {
        this.nom = nom;
     
        this.photo = photo;
        this.prix = prix;
        this.stock=stock;
    }
    
    public int getPrix() {
        return prix;
    }

    public void setPrix(int prix) {
        this.prix = prix;
    }
    
    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }


    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }





    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    

    @Override
    public String toString() {
        return "Produit{" + "nom=" + nom + ", id=" + id + ", photo=" + photo + ", prix=" + prix + '}';
    }
    

}

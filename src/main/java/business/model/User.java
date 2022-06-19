/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business.model;

public class User {

    private static int NBUSER=0;

      
    private String prenom;       
    private String nom;
    private String email;
    private String mdp;
    private long tel;
    private String adr;
    private int id;
    private String role;
    
    public User() {
        
    }

    public User(String prenom, String nom, String email, String mdp, long tel, String adr,String role) {
        this.prenom = prenom;
        this.nom = nom;
        this.email = email;
        this.mdp = mdp;
        this.tel = tel;
        this.adr = adr;
        this.role=role;
    }

    public static int getNBUSER() {
        return NBUSER;
    }

    public String getPrenom() {
        return prenom;
    }

    public String getNom() {
        return nom;
    }

    public String getEmail() {
        return email;
    }
    public String getRole() {
    	return role;
    }

    public String getMdp() {
        return mdp;
    }

    public long getTel() {
        return tel;
    }

    public String getAdr() {
        return adr;
    }

    public int getId() {
        return id;
    }

    public static void setNBUSER(int NBUSER) {
        User.NBUSER = NBUSER;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }

    public void setTel(int tel) {
        this.tel = tel;
    }

    public void setAdr(String adr) {
        this.adr = adr;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id+ ", prenom=" + prenom + ", nom=" + nom + ", email=" + email + ", mdp=" + mdp + ", tel=" + tel + ", adr=" + adr +'}';
    }
    
    

   

}

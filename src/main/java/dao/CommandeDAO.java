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
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;


public class CommandeDAO {

	static int numCommande = 0;

	Connection db;

	public CommandeDAO(Connection db) {
		this.db = db;
	}

	public void insererCommande(Commande commande) // penser a changer le type retourné
	{

		try {

			Connection con = db;
			int num = commande.getNum();
			int idUser = commande.getIdUser();
			Map<Integer, Integer> listeProduit = commande.getListeProduit();
			Iterator<Entry<Integer, Integer>> il = listeProduit.entrySet().iterator();
			int lastNum = getLastOrderNum();

			while (il.hasNext()) {
				Entry<Integer, Integer> entry = il.next();
				String reqParam = "insert into Commande  values(?,?,?,?,?,?)";
				PreparedStatement stm = con.prepareStatement(reqParam);
				stm.setInt(1, lastNum + 1);
				stm.setInt(2, idUser);
				stm.setInt(3, entry.getKey());
				stm.setInt(4, entry.getValue());
				stm.setDate(5, new java.sql.Date(System.currentTimeMillis()));
				stm.setString(6, "En attente de validation");
				stm.execute();
				
				PreparedStatement stm2=con.prepareStatement("update produit set stock=stock-? where id=?");
				stm2.setInt(1,entry.getValue() );
				stm2.setInt(2, entry.getKey());
				stm2.execute();

			}

		}

		catch (SQLException ex) {
			System.out.println("Erreur ! : " + ex);
		}

		// return ce que l'on veut

	}

	public int getLastOrderNum() {
		String request = "select num from commande order by num desc";
		ResultSet resultat2;
		int lastCommandeNum = 0;

		try {
			Connection con = db;
			int idProduit;
			int previousCommande = 0;
			int quantite;
			Commande commande = null;

			PreparedStatement stm2 = con.prepareStatement(request);
			stm2.execute();
			resultat2 = stm2.executeQuery();
			if (resultat2.next())
				lastCommandeNum = resultat2.getInt("num");
			System.out.println(lastCommandeNum);
		} catch (SQLException ex) {
			System.out.println("Erreur ! : " + ex);
		}
		return lastCommandeNum;
	}
	public void updateCommandeEtat(int id, String etat){
		try {
			Connection con = db;
			PreparedStatement stm2 = con.prepareStatement("update commande set etat=? where num=?");
			stm2.setInt(2, id);
			stm2.setString(1, etat);
			stm2.executeQuery();
		}catch (SQLException ex) {
				System.out.println("Erreur ! : " + ex);
	    }
	}

	public List<Commande> getListeCommande() 
	{
		ResultSet resultat2;

		List<Commande> listeCommande = new ArrayList<>();
		try {

			Connection con = db;
			int idProduit;
			int previousCommande = 0;
			int quantite;
			Commande commande = null;

			PreparedStatement stm2 = con.prepareStatement("SELECT * FROM `Commande`order by num desc");
			stm2.execute();
			resultat2 = stm2.executeQuery();
			System.out.println(resultat2.next());
			do {
				int currentCommande = resultat2.getInt("num");
				if (previousCommande != currentCommande) {
					if (previousCommande != 0) {
						listeCommande.add(commande);
					}
					commande = new Commande(resultat2.getInt("num"), resultat2.getInt("idUser"),
							resultat2.getDate("date"),resultat2.getString("etat"));
					idProduit = resultat2.getInt("idProduit");
					quantite = resultat2.getInt("quantite");
					commande.addProduct(idProduit, quantite);
					previousCommande = currentCommande;

				} else {
					idProduit = resultat2.getInt("idProduit");
					quantite = resultat2.getInt("quantite");
					commande.addProduct(idProduit, quantite);
				}
				if (resultat2.isLast()) {
					listeCommande.add(commande);
				}
			} while (resultat2.next());

		}

		catch (SQLException ex) {
			System.out.println("Erreur ! : " + ex);
		}
		return listeCommande;

	}
	
	public List<Commande> getListeCommande(int idUsers) // penser a changer le type retourné
	{
		ResultSet resultat2;

		List<Commande> listeCommande = new ArrayList<>();
		try {

			Connection con = db;
			int idProduit;
			int previousCommande = 0;
			int quantite;
			Commande commande = null;

			PreparedStatement stm2 = con.prepareStatement("SELECT * FROM `Commande` where idUser=? order by num desc");
			stm2.setInt(1, idUsers);
			stm2.execute();
			resultat2 = stm2.executeQuery();
			System.out.println(resultat2.next());
			do {
				int currentCommande = resultat2.getInt("num");
				if (previousCommande != currentCommande) {
					if (previousCommande != 0) {
						listeCommande.add(commande);
					}
					commande = new Commande(resultat2.getInt("num"), resultat2.getInt("idUser"),
							resultat2.getDate("date"),resultat2.getString("etat"));
					idProduit = resultat2.getInt("idProduit");
					quantite = resultat2.getInt("quantite");
					commande.addProduct(idProduit, quantite);
					previousCommande = currentCommande;

				} else {
					idProduit = resultat2.getInt("idProduit");
					quantite = resultat2.getInt("quantite");
					commande.addProduct(idProduit, quantite);
				}
				if (resultat2.isLast()) {
					listeCommande.add(commande);
				}
			} while (resultat2.next());

		}

		catch (SQLException ex) {
			System.out.println("Erreur ! : " + ex);
		}
		return listeCommande;

	}
}
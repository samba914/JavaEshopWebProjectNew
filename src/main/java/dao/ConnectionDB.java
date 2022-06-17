/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.beans.Statement;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;


public class ConnectionDB {

    private static ConnectionDB instance = null;
    
    public static Connection getInstance() {
        if(instance == null)
            instance = new ConnectionDB();
        
        return instance.con;
    }
    
    private String userName,password,url,driver;
    Connection con;
    //Statement st;

    private ConnectionDB() {
        FileInputStream file = null;
        
        Properties props = new Properties();
		try{
		
        	   url = "jdbc:mariadb://localhost:3306/eShoopProject";
	   			userName = "root";
	   			 password = "Douldoul1";
	   			 driver= "org.mariadb.jdbc.Driver";
	  
               // driver="org.mariadb.jdbc.Driver";

               
               Class.forName(driver);
                con=DriverManager.getConnection(url, userName, password);
                
                //st = (Statement) con.createStatement();
                
                System.out.println("Connection to database is successful");
            } catch (Exception e) {
                e.printStackTrace();
            }
    }
    
}

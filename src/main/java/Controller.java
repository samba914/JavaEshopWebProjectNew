/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import business.logic.ServicesMagasin;
import business.model.Commande;
import business.model.Produit;
import business.model.User;
import dao.ConnectionDB;
import dao.ProduitDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import static java.lang.Thread.sleep;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author samba
 */
@WebServlet(urlPatterns = {"/controller"})
public class Controller extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    Map<Integer, Integer> panier = new HashMap<>();
    static Boolean b=false;
	
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException,SQLException, InterruptedException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String page=request.getParameter("page");
           //hashmap panier
            
            HttpSession session = request.getSession(true);
            
             session.setAttribute("panierValide",b) ;
            //session qui gere le panier
            session.setAttribute("panier",panier);
            
            switch(page){
            
                case "page-shop":{
                                   //get liste des articles
                                   List<Produit> listeproduit = new ArrayList<>();
                                    ProduitDAO produitDao = new ProduitDAO(ConnectionDB.getInstance());
                                   listeproduit=produitDao.listeProduit();
                                   request.setAttribute("listeProduit",listeproduit); 
                                   
                                   //Pour l'ajout d un produit au panier
                                   if(request.getParameter("action")!=null){
                                       
                                       ajouterArticle(parseInt(request.getParameter("produit_panier")),request);
                                       
                                       
                                       
                                   }
 
                                   RequestDispatcher rd= request.getRequestDispatcher(page+".jsp");
                                   rd.forward(request, response);
                                   
                }break;
                case "panier":{
                                    if(request.getParameter("action")!=null){
                                       ((Map<Integer, Integer>) session.getAttribute("panier")).remove(parseInt(request.getParameter("id")));
                                    }
                                   RequestDispatcher rd= request.getRequestDispatcher(page+".jsp");
                                    rd.forward(request, response);
                }break;
                 case "index":{
                                   
                                   
                                   RequestDispatcher rd= request.getRequestDispatcher(page+".jsp");
                                    rd.forward(request, response);
                }break;
                case "register":{
                                         RequestDispatcher rd= request.getRequestDispatcher(page+".jsp");
                                         rd.forward(request, response);   
                                            
                                        
                }break;
                case "Connexion_register":{
                                         //recupération des champs                         
                                         String prenom=request.getParameter("prenom");
                                         String nom=request.getParameter("nom");
                                         String email=request.getParameter("email");
                                         String mdp=request.getParameter("password");
                                         int tel=parseInt(request.getParameter("telephone"));
                                         String adr=request.getParameter("adresse");
                                         
                                         User user= new User(prenom, nom, email,mdp,tel,adr);
                                         //methode d'insertion dans la base de donnée
                                         UserDAO userDao=new UserDAO(ConnectionDB.getInstance());
                                         userDao.insererUser(user);
                                        try {  
                                            sleep(700);
                                        } catch (InterruptedException ex) {
                    Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
                }
                                         RequestDispatcher rd= request.getRequestDispatcher("Connexion"+".jsp");
                                        rd.forward(request, response);
                                         
                
                
                }break;
                case "Connexion":{
                                        RequestDispatcher rd= request.getRequestDispatcher(page+".jsp");
                                        rd.forward(request, response);
                
                }
                case "Connexion_verif":{
                                         //recupération des champs   pour la connexion                      
                                         String email=request.getParameter("email");
                                         String mdp=request.getParameter("password");  
                                         //methode d'insertion dans la base de donnée
                                         UserDAO userDao=new UserDAO(ConnectionDB.getInstance());
                                         User user =userDao.getVerifUser(email,mdp);
                                         System.out.println(userDao.getVerifUser(email,mdp));
                                         if(user!=null){
                                           
                                             
                                                session.setAttribute("UserConnecte",user);
                                                 sleep(700);
                                                 //si l'utilisateur valider son panier il va etre rediger au panier sinon il sera dans la page d accueil
                                                 System.out.println(session.getAttribute("panierValide"));
                                             
                                                
                                                if((Boolean) session.getAttribute("panierValide")==false || (Boolean) session.getAttribute("panierValide")==null){
                                                        RequestDispatcher rd= request.getRequestDispatcher("index"+".jsp");
                                                       rd.forward(request, response);
                                                       
                                                }else{
                                                    b=false;
                                                     session.setAttribute("panierValide",b) ;
                                                       RequestDispatcher rd= request.getRequestDispatcher("panier"+".jsp");
                                                       rd.forward(request, response);
                                                       
                                                }
                                        
                                         }else{
                                              sleep(300);
                                             RequestDispatcher rd= request.getRequestDispatcher("Connexion"+".jsp");
                                              rd.forward(request, response);
                                         }
                                         
                
                
                }break;
                case "MesCommandes":{
                                        //liste des commandes
                                         List<Commande> liste = new ArrayList<>();
                                         ServicesMagasin service= new ServicesMagasin();
                                          liste=service.getListeCommande(((User)session.getAttribute("UserConnecte")).getId());
                                          for(Commande e:liste){
                                              System.out.println(e);
                                          }
                                          
                                          request.setAttribute("listeCommande", liste);
                                        RequestDispatcher rd= request.getRequestDispatcher(page+".jsp");
                                        rd.forward(request, response);
                
                }break;
                case "AjoutCommande":{
                                        //insertion commande
                                        ServicesMagasin service=new ServicesMagasin();
                                        //si le user s est connecter il fait la commande sinon il se connecte d'abord
                                        
                                        if((User)session.getAttribute("UserConnecte")!=null){
                                                service.faireCommande(((Map<Integer, Integer>) session.getAttribute("panier")),((User)session.getAttribute("UserConnecte")).getId());
                                                ((Map<Integer, Integer>) session.getAttribute("panier")).clear();
                                                
                                                RequestDispatcher rd= request.getRequestDispatcher("index"+".jsp");
                                                rd.forward(request, response);
                                                
                                        }else{
                                                b=true;
                                                session.setAttribute("panierValide",b);
                                                RequestDispatcher rd= request.getRequestDispatcher("Connexion"+".jsp");
                                                rd.forward(request, response);
                                        }
                
                }break;
                case "Deconnexion":{
                                         sleep(700);
                                        
                                         session.setAttribute("UserConnecte",null);
                                        RequestDispatcher rd= request.getRequestDispatcher("index"+".jsp");
                                        rd.forward(request, response);
                
                }break;
                
                
                
                default:{
                                      RequestDispatcher rd= request.getRequestDispatcher("index"+".jsp");
                                        rd.forward(request, response);
                }break;
            
            
            }
            
           
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InterruptedException ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InterruptedException ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    public void ajouterArticle(int art,HttpServletRequest request) {
		HttpSession session = request.getSession(true);  
                Integer quantity =((Map<Integer, Integer>) session.getAttribute("panier")).get(art);
                System.out.println(quantity);
		if (quantity == null){
			quantity = Integer.valueOf(0);
 
		}
                quantity = Integer.valueOf(quantity.intValue()+1);
                System.out.println(quantity);
		((Map<Integer, Integer>) session.getAttribute("panier")).put(art,quantity);
                
                System.out.println(((Map<Integer, Integer>) session.getAttribute("panier")).get(art));
	}
 

}

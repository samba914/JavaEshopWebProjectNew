import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.annotation.*;

import business.logic.ServicesMagasin;
import business.model.Commande;
import business.model.Produit;
import dao.CommandeDAO;
import dao.ConnectionDB;
import dao.ProduitDAO;

@WebServlet(urlPatterns = { "/controlleradmin" })
@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
		)
public class ControllerAdmin extends HttpServlet {
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException, InterruptedException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String page = request.getParameter("page");
			switch (page) {

			case "CommandeViewAdmin": {
				List<Commande> liste = new ArrayList<>();
				ServicesMagasin service = new ServicesMagasin();
				liste = service.getListeCommande();
				request.setAttribute("listeCommande", liste);
				RequestDispatcher rd = request.getRequestDispatcher(page + ".jsp");
				rd.forward(request, response);
			}break;
			
			case "ajoutProduit" :{

				
				if (request.getMethod().equalsIgnoreCase("POST")) {

					Produit p = new Produit(); 

					p.setNom(request.getParameter("nomProduit"));

					
					p.setPrix(Integer.parseInt(request.getParameter("prixProduit")));
					Part filePart = request.getPart("imageProduit");
				    String fileName =  filePart.getSubmittedFileName();
					p.setPhoto(fileName);
				    
					filePart.write("C:\\Users\\m_ala\\git\\JavaEshopWebProjectNew\\src\\main\\webapp\\photoh\\" + fileName);
				    

					ProduitDAO pDAO = new ProduitDAO(ConnectionDB.getInstance()); 


					pDAO.insertProduit(p);

					page = "listProduit" ;
				}
				else if (request.getMethod().equalsIgnoreCase("GET")) {
					RequestDispatcher rd = request.getRequestDispatcher(page + ".jsp");
					rd.forward(request, response);
					break;
				}

				

			}
			case "listProduit" :{
				ProduitDAO pDAO = new ProduitDAO(ConnectionDB.getInstance()); 
				List<Produit> listp = pDAO.listeProduit() ;
				request.setAttribute("listProduit", listp);
				
				RequestDispatcher rd = request.getRequestDispatcher(page + ".jsp");
				rd.forward(request, response);
			}break;
			
			default: {
				RequestDispatcher rd = request.getRequestDispatcher("index" + ".jsp");
				rd.forward(request, response);
			}
				break;

			}
		
		}catch(Exception e) {
			System.out.println(e);
		}
	}
	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			processRequest(request, response);
		} catch (SQLException ex) {
			Logger.getLogger(ControllerAdmin.class.getName()).log(Level.SEVERE, null, ex);
		} catch (InterruptedException ex) {
			Logger.getLogger(ControllerAdmin.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (SQLException ex) {
			Logger.getLogger(ControllerAdmin.class.getName()).log(Level.SEVERE, null, ex);
		} catch (InterruptedException ex) {
			Logger.getLogger(ControllerAdmin.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
}

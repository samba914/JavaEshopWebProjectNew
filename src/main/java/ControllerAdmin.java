import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import business.logic.ServicesMagasin;
import business.logic.ServicesUser;
import business.model.Commande;
import business.model.User;

@WebServlet(urlPatterns = { "/controlleradmin" })
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
			case "AdminShowCommande": {
				int idCommande = Integer.parseInt(request.getParameter("id"));
				if(request.getParameter("etat")!=null) {
					String etat = request.getParameter("etat");
					ServicesMagasin service = new ServicesMagasin();
					service.updateCommandeEtat(idCommande, etat);
				}
				List<Commande> liste = new ArrayList<>();
				ServicesMagasin service = new ServicesMagasin();
				liste = service.getListeCommande();
				ServicesUser serviceUser = new ServicesUser();
				
				Commande commandeTosee= service.getCommandeById(liste, idCommande);
				User user= serviceUser.getUserById(commandeTosee.getIdUser());
				request.setAttribute("user",user );
				request.setAttribute("commande",commandeTosee );
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
			System.out.println("");
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

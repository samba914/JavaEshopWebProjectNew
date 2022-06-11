package business.logic;

import business.model.Produit;
import business.model.User;
import dao.ConnectionDB;
import dao.ProduitDAO;
import dao.UserDAO;

public class ServicesUser {
	public User getUserById(int id) {
		UserDAO userDao = new UserDAO(ConnectionDB.getInstance());
        User user = userDao.getUserbyId(id);
        return user;
	}
}

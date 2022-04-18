<%-- 
    Document   : MesCommandes
    Created on : 21 janv. 2020, 16:20:48
    Author     : samba
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="business.logic.ServicesMagasin"%>
<%@page import="dao.ProduitDAO"%>
<%@page import="business.model.Produit"%>
<%@page import="dao.ConnectionDB"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="business.model.Commande"%>
<%@page import="java.util.List"%>
<%@
   include file ="Header.jsp"
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link href="css/MesCommandes.css" rel="stylesheet" type="text/css"/>
        <title>Mes Commandes</title>
    </head>
    <body>
        <%
        List<Commande> listeCommande=(ArrayList<Commande>) request.getAttribute("listeCommande");
        %>
        
        <h1>Liste des commandes</h1>
     <% for(Commande commande:listeCommande){ %>
        <div class="table">
            <h2 class="heading">
             Numero :<%= commande.getNum() %> 
             
             </h2>
  
  <% 
    Iterator<Entry<Integer, Integer>> il = (commande.getListeProduit()).entrySet().iterator();
                int total=0;
		while (il.hasNext()) {
                        Entry<Integer, Integer> entry = il.next();
                        ServicesMagasin service = new ServicesMagasin();
                        Produit produit = service.voirProduit((entry.getKey()));
                        total=total+(produit.getPrix()*entry.getValue());
  %>
    <div class="block">
        <ul class="options">
          <li>
            <p class="nav-link" ><%= produit.getNom()+"   "+entry.getValue()+"unite(s)" %></p>
            
          </li>
        </ul>
      </div>  
     <% }%>
    </div>
      <% }%>  
    </body>
</html>

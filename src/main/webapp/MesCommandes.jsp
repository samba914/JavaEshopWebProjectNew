
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
   include file="Header.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script src="js/MesCommandes.js"></script>
		<link href="css/MesCommandes.css" rel="stylesheet" type="text/css" />
		<link href="css/panier.css" rel="stylesheet" type="text/css"/>
		<title>Mes Commandes</title>
	</head>
<body>
<div style="margin-left:10%">
	
	<%
        List<Commande> listeCommande=(ArrayList<Commande>) request.getAttribute("listeCommande");
        %>

	<h2>Mes commandes</h2>
	<select id="produit_list">

		<% for(Commande commande:listeCommande){ %>
		<option value="<%=commande.getNum()%>" <%=(Integer)(request.getAttribute("idCommande"))==commande.getNum()?"selected":"" %>  >
			<%= commande.getDate()+" Commande: "+commande.getNum()%>
		</option>

		<% }%>
	</select>
	<%if((Integer)(request.getAttribute("idCommande"))==0 && listeCommande.size()==0){%>
	<p>Aucune commande</p>
	<%}else{
	   	Commande commande =(Commande) request.getAttribute("commande");
	    Iterator<Entry<Integer, Integer>> il = (commande.getListeProduit()).entrySet().iterator();
	    int total=0;%>
	   
	<table>
		<!--article1-->
		<tr class="pro-qté-p">
			<th class="produit">Produit</th>
			
			<th></th>
                <th class="qté">Quantité</th>
                <th class="prix">Prix Unitaire</th>
                <th class="totalProduit">Montant Total</th>
            </tr>
            <tr class="hr-margin">
                <td colspan="6" class="hr-margin"><hr></td>
            </tr>
	    
				<%
		while (il.hasNext()) {
	           Entry<Integer, Integer> entry = il.next();
	           ServicesMagasin service = new ServicesMagasin();
	           Produit produit = service.voirProduit((entry.getKey()));
	           total=total+(produit.getPrix()*entry.getValue());%><tr class="product_l
			ine">
                <td class="image"><img
				src="photoh/<%=produit.getPhoto()%>" alt=""></td>
                <td> <p class="art-name"><%=produit.getNom()%></p>
                </td>
                <td></td>
                <td class="quantité"><span
				data-price="<%=produit.getPrix()%>" class="qte_product" style="color:black"
				data-id="<%=produit.getId()%>"><%=entry.getValue()%></span></td>
                <td class="prixx" style="padding-left: 12%;"><%=produit.getPrix()%>$</td>
                <td id="montant_produit_<%=produit.getId()%>"><%=entry.getValue()*produit.getPrix()%>$</td>
                    
            </tr>
           
            <!--Total-->
            <tr>
                <td></td>
            </tr>
           
            <tr class="hr-margin">
                    <td colspan="6" class="hr-margin"><hr></td>
                </tr>
               <%}%>
            <tr class="total-p">
                     <td colspan="4" id="total">Total</td>
                     <td id="p-total"><%= total %>$</td>
                   
            </tr>
            	
        </table>     
	      
	<%}%>
</div>
</body>
</html>

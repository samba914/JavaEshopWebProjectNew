
<%@page import="java.util.ArrayList"%>
<%@page import="business.logic.ServicesMagasin"%>
<%@page import="dao.ProduitDAO"%>
<%@page import="business.model.Produit"%>
<%@page import="dao.ConnectionDB"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="business.model.Commande"%>
<%@page import="business.model.User"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@
   include file="HeaderAdmin.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script src="js/AdminShowCommande.js"></script>
		<link href="css/MesCommandes.css" rel="stylesheet" type="text/css" />
		<link href="css/panier.css" rel="stylesheet" type="text/css"/>
		<title>Commande</title>
	</head>
<body>
<div style="margin-left:10%">
	

		<%
	   	Commande commande =(Commande) request.getAttribute("commande");
		User user = (User) request.getAttribute("user");
	    Iterator<Entry<Integer, Integer>> il = (commande.getListeProduit()).entrySet().iterator();
	    int total=0;%>
	    
    <h4><%="Commande #"+commande.getNum()+ " "+ user.getPrenom() + " "+user.getNom()+" du "+new SimpleDateFormat("dd-MM-yyyy").format(commande.getDate()) %></h4>
	 
	 
	 
	 <div class="row mt-3">
        <div class="col-lg-4 col-xs-3">
            <div class="card amount" style="border: double black; width: 70%; background-color: transparent;">
                <div class="card-body amountCard">
                    <h4 class="card-title"><i class="fa fa-user"></i> Client</h4>
                    <div class="text-center">
                        <b><%=user.getPrenom() + " "+user.getNom() %></b>
                        <p class="mb-0"><%=user.getEmail() %></p>
                        <p class="mb-0"><%=user.getTel() %></p>
                        <p class="mb-0"><%=user.getAdr() %></p>

                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-xs-3" style="align-self: center;">
      		<b>Etat :</b> 
      		<select id="status" data-idCommande="<%=commande.getNum()%>" >
      			<option value="En attente de validation"  <%=(commande.getEtat().equals("En attente de validation"))?"selected":"" %>  >En attente de validation</option>
      			<option value="En cours"  <%=(commande.getEtat().equals("En cours"))?"selected":"" %> >En cours</option>
      			<option value="Livré" <%=(commande.getEtat().equals("Livré"))?"selected":"" %> >Livré</option>
      		</select>
      	</div> 
      </div> 
      
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
	      
	
</div>
</body>
</html>

<%-- 
    Document   : panier
    Created on : 15 janv. 2020, 15:14:37
    Author     : p1812347
--%>
<%@page import="business.logic.ServicesMagasin"%>
<%@page import="dao.ProduitDAO"%>
<%@page import="dao.ConnectionDB"%>
<%@page import="business.model.Produit"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Iterator"%>
<%@
   include file ="Header.jsp"
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    	<script src="js/panier.js"></script>
    	
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="css/panier.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
       
         <!--panier-->
    <div class="panier">
        <h1>Panier</h1>
        <%if(((Map<Integer, Integer>) session.getAttribute("panier")).size()>0){%>
        <form id="formPanier" method="post" action="controller?page=AjoutCommande">
        <table>
        <!--article1-->
            <tr class="pro-qté-p">
                <th class="produit">Produit</th>
                <th></td>
                <th class="qté">Quantité</th>
                <th class="prix">Prix Unitaire</th>
                <th class="totalProduit">Montant Total</th>
            </tr>
      
            
            <!--article2-->
          <%
		Iterator<Entry<Integer, Integer>> il = ((Map<Integer, Integer>) session.getAttribute("panier")).entrySet().iterator();
                int total=0;
		while (il.hasNext()) {
                        Entry<Integer, Integer> entry = il.next();
                       ServicesMagasin service = new ServicesMagasin();
                        Produit produit = service.voirProduit((entry.getKey()));
                        total=total+(produit.getPrix()*entry.getValue());
                  
           %>
                        
                         
        
            <tr class="hr-margin">
                <td colspan="6" class="hr-margin" ><hr></td>
            </tr>
            <tr class="product_line" data-total="<%=entry.getValue()*produit.getPrix()%>">
                <td class="image" ><img src="photoh/<%=produit.getPhoto()%>" alt=""></td>
                <td> <p class="art-name"><%=produit.getNom()%></p>
                    <a href="controller?page=panier&action=delete&id=<%=produit.getId()%>" class="delete">Supprimer</a>
                </td>
                <td></td>
                <td class="quantité"><input data-price="<%=produit.getPrix()%>" class="qte_product" data-id="<%=produit.getId()%>" type="number" value="<%=entry.getValue()%>"></td>
                <td class="prixx"><%=produit.getPrix()%>$</td>
                <td id="montant_produit_<%=produit.getId()%>"><%=entry.getValue()*produit.getPrix()%>$</td>
                    
            </tr>
                   <%
		}
                 
                 %> 

           
            <!--Total-->
            <tr>
                <td></td>
            </tr>
             
            <tr class="hr-margin">
                    <td colspan="6" class="hr-margin" ><hr></td>
                </tr>
             
            <tr class="total-p">
                     <td  colspan="4" id="total" >Total</td>
                     <td id="p-total"><%= total %>$</td>
                     <%if((User) session.getAttribute("UserConnecte")==null){ %>
                     	<td><button type="submit"><span>Commander</span></button></td>
                     <%}else{ %>
                     	<td><div id="paypal-button-container"></div></td>
                     <%} %>
            </tr>
            
        </table>
    <form/>
     <%}else{%>
                <h1 style="margin-left: auto;margin-right: auto; ">Votre Panier est Vide :(</h1>
        <%}%>
        
    </div>
    <!--fin panier-->


      <!--30%off monochest n+1page-->
        
      <div class="monochest">
            <div class="text_monochest">
              <h1>
                    Monochest  30%  de reduction
              </h1>
              <p id="t-monochest">
                    Monochest est la façon la plus élégante d’organiser vos groupes préférés et de charger votre Apple Watch en même temps. Conservez jusqu’à 3 bandes de rechange, insérez votre propre câble de charge à l’arrière et placez-le là où vous en avez besoin.
    
              </p>
    
    
            </div>    
                
    
    
         </div>
         <!--fin 30%off monochest n+1page-->
            <script src="https://www.paypal.com/sdk/js?client-id=AftX3mgELqCAq0bDhRWcyvXiuaNSCGqnSI0STNK-wJ92Bt7dnUoGiMbhyWgvUCK525Q0OOnGCJ-W4Jlo"></script>
    <script>
    	if(document.getElementById("paypal-button-container")){
    		paypal.Buttons({
    	    	 style: {
    	    		    layout: 'horizontal',
    	    		    color:  'silver',
    	          },
    	    	  createOrder: function(data, actions) {
    	    	  	var tt= Number($("#p-total").text().split('$')[0]);
    	    	    return actions.order.create({
    	    	      purchase_units: [{
    	    	        amount: {
    	    	          value: tt
    	    	        }
    	    	      }]
    	    	    });
    	    	  },
    	    	  onApprove: function(data, actions) {
    	    	    // This function captures the funds from the transaction.
    	    	    return actions.order.capture().then(function(details) {
    	    	        $("#formPanier").submit();
    	    	    });
    	    	  },
    	    	  onError: function (err) {
    	    		 alert("Une erreur est survenue! Veillez vérifier vos moyens de paiement.");
    	    		  },
    	          onCancel: function (data) {
    	        	 alert("Une erreur est survenue! Veillez vérifier vos moyens de paiement.");
    	          }	  
    	    	}).render('#paypal-button-container');
    	}
    
    
    </script>
    </body>
     <%@
   include file ="footer.jsp"
%>

</html>




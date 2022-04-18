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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="css/panier.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
       
         <!--panier-->
    <div class="panier">
        <h1>Panier</h1>
        <%if(((Map<Integer, Integer>) session.getAttribute("panier")).size()>0){%>
        <form method="post" action="controller?page=AjoutCommande">
        <table>
        <!--article1-->
            <tr class="pro-qté-p">
                <th class="produit">Produit</th>
                <th></td>
                <th class="qté">Quantité</th>
                <th class="prix">Prix</th>
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
            <tr>
                <td class="image" ><img src="photoh/<%=produit.getPhoto()%>" alt=""></td>
                <td> <p class="art-name"><%=produit.getNom()%></p>
                    <a href="controller?page=panier&action=delete&id=<%=produit.getId()%>" class="delete">Supprimer</a>
                </td>
                <td></td>
                <td class="quantité"><input type="number" value="<%=entry.getValue()%>"></td>
                <td class="prixx"><%=produit.getPrix()%>$</td>
                    
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
                     <td><button type="submit"><span>Commander</span></button></td>
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
         <%@
   include file ="footer.jsp"
%>
    </body>
</html>




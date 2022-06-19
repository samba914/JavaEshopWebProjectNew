
<%@page import="java.util.ArrayList"%>
<%@page import="business.model.Produit"%>
<%@page import="java.util.List"%>
<!--Inclusion du header-->
<%@
   include file ="Header.jsp"
%>
   <!--fin du header-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    	<script src="js/page-shop.js"></script>
        <link href="css/page-shop.css" rel="stylesheet" type="text/css"/>
        <title>Boutique</title>
    </head>
    <body>
                    <!--pub-->

        <div class="pub">
            <div class="t-pub">
                <p id="text-pub"> 20%  Black Friday Sale</p>
                       <p id="new"> De Nouveaux Produits Sont Arrivés!</p>
            </div>
        </div>
        <!--fin pub-->
       <div class="serach"> <label><input id="filterInput" type="text" placeholder="Faites votre recherche ici"  /></label></div>
       <!--article ban-->
    <div class="popular">
   
        <% for(Produit produit: (List<Produit>) request.getAttribute("listeProduit")) { %>   
            <div class="article">
            <!--ban1-->
            
                <div class="ligne">
                  <table class="inline">  
                  <form class="lien-ban" action="controller?page=page-shop&action=ajout" method="post">
                        <tr>
                            <td colspan="2"><img  class="band" src="<%="photoh/"+produit.getPhoto()%>" alt="" style="<%= (produit.getStock()==0)? "filter:brightness(70%)":""%>"></td>
                               
                              </tr>
                              <tr class="poliband">
                                  <td class="nomProduit" ><%=produit.getNom()%></td>
                                <td>$<%=produit.getPrix()%></td>
                                 <input type="hidden" name="produit_panier" value=<%=produit.getId()%> />
                              </tr>
                              <tr >
                                <% if(produit.getStock()!=0){ %> 
	                                <td class="band-buy" colspan="2">
	                                    <button type="submit" class="t-buy-now">Ajouter <i class="fa fa-shopping-cart" aria-hidden="true"></i> </button>
	                                </td>
       							<%}else{%>
       								<td class="band-buy" colspan="2">
	                                    <button disabled type="submit" class="t-buy-now-rup" style="color:red">Rupture stock</button>
	                                </td>
       							<%} %>
                               
                              </tr>
                        </form>
                    </table>  
            </div>
        </div>
          <%}%> 
     </div>
        <!--fin article-->


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

 <!--Inclusion du footer-->
 <%@
   include file ="footer.jsp"
%>
   <!--fin du footer-->
    </body>
</html>

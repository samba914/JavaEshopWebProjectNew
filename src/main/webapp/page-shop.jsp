<%-- 
    Document   : page-shop
    Created on : 15 janv. 2020, 15:14:28
    Author     : p1812347

    https://www.developpez.net/forums/d1533536/java/communaute-java/codes-sources-telecharger/implementation-d-panier/
--%>
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
       <div class="serach"> <label><input type="text" placeholder="Faites votre recherche ici!"  ></label></div>
       <!--article ban-->
    <div class="popular">
   
        
       
        
        <% for(Produit produit: (List<Produit>) request.getAttribute("listeProduit")) { %>   
            <div class="aticle">
            <!--ban1-->
            
                <div class="ligne">
                  <table class="inline">  <form class="lien-ban" action="controller?page=page-shop&action=ajout" method="post">
                        <tr>
                            <td colspan="2"><img  class="band" src="<%="photoh/"+produit.getPhoto()%>" alt=""></td>
                               
                              </tr>
                              <tr class="poliband">
                                  <td ><%=produit.getNom()%></td>
                                <td>$<%=produit.getPrix()%></td>
                                 <input type="hidden" name="produit_panier" value=<%=produit.getId()%> />
                              </tr>
                              <tr >
                                  
                                <td class="band-buy" colspan="2">
                                    <input type="submit" value="Acheter" class="t-buy-now"/>
                                </td>
                             
                               
                              </tr>
                        
                    </table></form>
           <%}%>
                    
                 
                
            </div>
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

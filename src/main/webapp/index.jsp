<%@page import="java.util.ArrayList"%>
<%@page import="business.model.Produit"%>
<%@page import="dao.ProduitDAO"%>
<%@page import="dao.ConnectionDB"%>
<%@page import="java.util.List"%>

<%@
   include file ="Header.jsp"
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/cssaccueil.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <!--pub-->
   
  
    <div class="pub" >
        
     <div class="epub">
         <div><p id="buy">15% de reduction  </p></div>
         
         <div><p id="A-buy">Band pour toutes occasions</p></div>
         <a class="lien-epub" href="controller?page=page-shop"><div class="shop-now"> 
                <p id="shop">Boutique</p>
            </div></a>
            <div class="stop"> .</div>
     </div>
 </div>

      <!--fin pub-->
     <!--article ban-->
    <div class="popular">

        <div class="text-popu">
            <div id="t-popu">Nos Plus populaires Bands
            </div>
        </div>
        <div class="aticle">
        <!--ban1-->
            <div class="all_ban">
            <%List<Produit> listeproduit = new ArrayList<>();
			ProduitDAO produitDao = new ProduitDAO(ConnectionDB.getInstance());
			listeproduit = produitDao.listeProduit();
			%>
           
            <% for(Produit produit: listeproduit.subList(0,3)) { %> 
               <a class="lien-ban" href="controller?page=page-shop" ><table class="inline">
                    <tr>
                            <td colspan="2"><img  class="band" src="<%="photoh/"+produit.getPhoto()%>"   alt=""></td>
                        
                          </tr>
                          <tr class="poliband">
                               <td ><%=produit.getNom()%></td>
                                <td>$<%=produit.getPrix()%></td>
                          </tr>
                          <tr >
                              
                           
                           
                          </tr>
                    
                </table></a>
                
             <%}%>
            </div>
        </div>
    </div>
    <!--fin article-->
    <!--Pub-bag-->

    <a href="#" class="Areas-bag">
        <div class="pub-bag">
        <h1>ARES Backpack</h1>
        <br>
        <div class="paragraphe">
            <p>
                La polyvalence du sac à dos ARES a attiré notre attention. ARES fonctionne comme un sac de travail quotidien avec des compartiments spéciaux pour votre équipement d’exercice. Le design simpliste d’ARES et les caractéristiques uniques comme la serrure à glissière sécurisée et le manchon de mallette font de ce sac à dos un excellent choix pour le premier produit Monowear Select.
            </p>
        </div>
    </div>
    </a>
    <!--fin pug bag-->
        
<%@
   include file ="footer.jsp"
%> 
    </body>
</html>

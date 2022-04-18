<<%-- 
    Document   : Accueil
    Created on : 15 janv. 2020, 15:14:15
    Author     : p1812347
--%>

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
            <div class="col-1">
               <a class="lien-ban" href="#" ><table class="inline">
                    <tr>
                            <td colspan="2"><img  class="band" src="photoh/band_contemporary.jpg"  alt=""></td>
                        
                          </tr>
                          <tr class="poliband">
                              <td >Contempory Leather Cuf</td>
                            <td>$52</td>
                            
                          </tr>
                          <tr >
                              
                            <td class="band-buy" colspan="2">
                                <p class="ab">Acheter</p>
                            </td>
                           
                          </tr>
                    
                </table></a>
                
                <!--ban2-->
                <a class="lien-ban" href="#" ><table class="inline">
                        <tr>
                                <td colspan="2"><img  class="band" src="photoh/band_leather-deployant.jpg" alt=""></td>
                               
                              </tr>
                              <tr class="poliband">
                                  <td >Leather Deployant Band</td>
                                <td>$65</td>
                                
                              </tr>
                              <tr >
                                  
                                <td class="band-buy" colspan="2">
                                    <p class="ab">Acheter</p>
                                </td>
                               
                              </tr>
                        
                    </table></a>
               <!--ban3--> 
               <a class="lien-ban" href="#" ><table class="inline">
                    <tr>
                            <td colspan="2"><img  class="band" src="photoh/band_leather_band.jpg"  alt=""></td>
                           
                          </tr>
                          <tr class="poliband">
                              <td >Classic Leather Band</td>
                            <td>$45</td>
                            
                          </tr>
                          <tr >
                              
                            <td class="band-buy" colspan="2">
                                <p class="ab">Acheter</p>
                            </td>
                           
                          </tr>
                    
                </table></a>
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

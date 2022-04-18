<%-- 
    Document   : Header
    Created on : 15 janv. 2020, 15:07:36
    Author     : p1812347
--%>

<%@page import="business.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="css/header.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <!--header-->
    <div class="header">
    <div class="promo">
        <p id="promo">-15% pour le 2eme acheté!  <a id="promo1" href="controller?page=page-shop"> Allez à la boutique</a></p>
        <hr>
    </div>
    <div class="ban">
            <a href="controller?page=index"><img class="logo" src="photoh/logo1.jpg" alt="" > </a>
    
         <div class="nav">
                <div class="lvnav1">
                 <a class="lnav" href="controller?page=index" >Accueil</a>
                <a class="lnav" href="controller?page=page-shop">Boutique</a>
            
                <% if((User) session.getAttribute("UserConnecte")!=null){ %>
                        <a class="lnav" href="controller?page=Deconnexion">Deconnexion</a>
                <%}%>
                
                   <% if((User) session.getAttribute("UserConnecte")==null){ %>
                            <a href="controller?page=Connexion"><img id="connect" src="photoh/connect1.png"  alt=""></a>
                <%}%>
            
                <a href="controller?page=panier"><img id="panier" src="photoh/panier.png"  alt=""></a>
                </div>
            </div>     
    </div>
    </div>
  

<!-- fin header-->
    </body>
</html>

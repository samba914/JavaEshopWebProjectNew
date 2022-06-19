
<%@page import="business.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="css/header.css" rel="stylesheet" type="text/css"/>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
       <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
        <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        
        <title>JSP Page</title>
    </head>
    <body>
        <!--header-->
    <div class="header">
    <div class="promo">
        <p id="promo">  </p>
        <hr>
    </div>
    <div class="ban">
            <a href="controller?page=index"><img class="logo" src="photoh/logo1.jpg" alt="" > </a>
    
         <div class="navv">
                <div class="lvnav1">
                 <a class="lnav" href="controller?page=index" >Accueil</a>
            
                <% if((User) session.getAttribute("UserConnecte")!=null){ %>
                	<a class="lnav" href="controlleradmin?page=CommandeViewAdmin">Commandes</a>                 
                    <a class="lnav" href="controlleradmin?page=listProduit">Produits</a>
                    <a class="link_Icon" href="controller?page=Deconnexion"><span class="material-icons" style="color:black">logout</span></a>
                           
                <%}else{%>
                	 <a class="link_Icon" href="controller?page=Connexion"><i class="fa fa-user" aria-hidden="true"></i></a>
                <%} %>  
               
                </div>
            </div>     
    </div>
    </div>
  

<!-- fin header-->
    </body>
</html>

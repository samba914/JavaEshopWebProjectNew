<%-- 
    Document   : register
    Created on : 15 janv. 2020, 15:14:48
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
        <link href="css/register.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
    
        
    <div class="reg">
        <form  id="reg" action="controller?page=Connexion_register" method="post">
            <h2>Enregistrez vous </h2>
           <label >
            <input type="text" name="prenom" placeholder="Prénom" class="name"></label>
           <label >
            <input type="text" name="nom" placeholder="Nom" class="name"></label>
            <label >
            <input type="email" name="email" placeholder="Entrer votre email" class="name"></label>
             <label >
            <input type="password" name="password" placeholder="Mot de passe" class="name"></label>
           <label >
            <input type="text" name="adresse" placeholder="Adresse" class="name"></label>
           <label >
            <input type="text" name="telephone" placeholder="Téléphone" class="name"></label>
            <label >

       
            <button type="submit" id="sub">Creer le compte</button>
           


        </form>
    </div>

 <%@
   include file ="footer.jsp"
%>
        
    </body>
    
    
</html>

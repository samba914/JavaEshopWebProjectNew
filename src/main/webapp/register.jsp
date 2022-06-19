
<%@
   include file ="Header.jsp"
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      	<link rel="stylesheet" href="css/registerr.css" />
        <title>JSP Page</title>
    </head>
    <body>
    
        
    <div id="page_body" class="mt-3" >
    	<div class="card shadow p-3 mb-5 bg-white rounded" style="margin-left:20%;margin-right:20%">
			<div class="card-body">
		        <form  action="controller?page=Connexion_register" method="post" >
		        
		            <h2>Enregistrez vous </h2>
		            <div class="form-group mb-2">
		            	<label >Prénom</label>
		           		 <input type="text" name="prenom" placeholder="Prénom" class="name form-control">
		            </div>
		           <div class="form-group mb-2">
		            	<label >Email</label>
		           		 <input type="email" name="email" placeholder="Email" class="name form-control">
		            </div>
		       		<div class="form-group mb-2">
		            	<label >Mot de passe</label>
		           		 <input type="password" name="password" placeholder="Mot de passe" class="name form-control">
		            </div>
		     		<div class="form-group mb-2">
		            	<label >Adresse</label>
		           		 <input type="text" name="adresse" placeholder="Adresse" class="name form-control">
		            </div>
		            <div class="form-group mb-2">
		            	<label >Téléphone</label>
		           		 <input type="text" name="telephone" placeholder="Téléphone" class="name form-control">
		            </div>
		       
		            <button type="submit" id="sub">Creer le compte</button>
		           
		
		
		        </form>
        	</div>
        </div>
    </div>

 <%@
   include file ="footer.jsp"
%>
        
    </body>
    
    
</html>

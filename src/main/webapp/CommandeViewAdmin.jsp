<%@page import="java.util.ArrayList"%>
<%@page import="business.logic.ServicesUser"%>
<%@page import="business.model.Produit"%>
<%@page import="dao.ConnectionDB"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="business.model.Commande"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@
   include file ="HeaderAdmin.jsp"
%>
   <!--fin du header-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
	<link
		href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"
		rel="stylesheet"></link>
	<title>Insert title here</title>
</head>
<body>
<div class="mt-3" style="padding:4%;background-color: rgba(237, 237, 237, 0.81);">
	<div class="card shadow p-3 mb-5 bg-white rounded" >
		<div class="card-header">
	    <ul class="nav nav-tabs card-header-tabs" role="tablist">
	      <li class="nav-item">
	        <a class="nav-link active status text-muted" data-toggle="tab" href="#" data-etat="">Toutes les commandes</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link status text-muted" data-toggle="tab" href="#" data-etat="En attente de validation">En attente de validation</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link status text-muted" data-toggle="tab" href="#" data-etat="En cours">En cours</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link status text-muted" data-toggle="tab" href="#" data-etat="Livré">Livré</a>
	      </li>
	    </ul>
	  </div>
       <div class="card-body" id="all" role="tabpanel">
		<table id="myTable" class="table table-striped">
			<thead>
				<tr>
					<th >Commande</th>
					<th >Date</th>
					<th>Etat</th>
				</tr>
			</thead>
			<tbody>
			<% for(Commande commande:(ArrayList<Commande>) request.getAttribute("listeCommande")){ 
				User user =(new ServicesUser()).getUserById(commande.getIdUser());
				%>
				<tr>
					<td><a class="text-black" style="text-decoration:none" href="controlleradmin?page=AdminShowCommande&id=<%=commande.getNum()%>"><%="#"+commande.getNum()+ " "+ user.getPrenom() + " "+user.getNom()%></a></td>
					<td><%=new SimpleDateFormat("dd-MM-yyyy").format(commande.getDate())%></td>
					<td><%=commande.getEtat()%></td>
						
				</tr>
			<%}%>
			<tbody>
		</table>
      </div>
	</div>

</div>
</body>

<script>
	$(document).ready( function () {
	    var datatable=$('#myTable').DataTable({
	    	language: {
	            processing: "Traitement en cours...",
	            search: "Rechercher&nbsp;:",
	            lengthMenu: "_MENU_",
	            info: "Affichage de l'&eacute;lement _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
	            infoEmpty: "Affichage de l'&eacute;lement 0 &agrave; 0 sur 0 &eacute;l&eacute;ments",
	            infoFiltered: "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
	            infoPostFix: "",
	            loadingRecords: "Chargement en cours...",
	            zeroRecords: "Aucun &eacute;l&eacute;ment &agrave; afficher",
	            emptyTable: "Aucune donnée disponible dans le tableau",
	            paginate: {
	                first: "Premier",
	                previous: "Pr&eacute;c&eacute;dent",
	                next: "Suivant",
	                last: "Dernier"
	            },
	            aria: {
	                sortAscending: ": activer pour trier la colonne par ordre croissant",
	                sortDescending: ": activer pour trier la colonne par ordre décroissant"
	            }
	        }
	    });
		$('.status').on('click', function () {
			$('.status').each(function(){
				$(this).removeClass("active");
			});
			$(this).addClass("active");
            var status = $(this).attr("data-etat");
            datatable.column(2).search(status).draw();
        });
	} );
	
	</script>
</html>
<%@
   include file ="footer.jsp"
%>
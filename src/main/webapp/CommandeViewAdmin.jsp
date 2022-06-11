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
<div>
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
				<td><%="#"+commande.getNum()+ " "+ user.getPrenom() + " "+user.getNom()%></td>
				<td><%=new SimpleDateFormat("dd-MM-yyyy").format(commande.getDate())%></td>
				<td><%=commande.getEtat()%></td>
					
			</tr>
		<%}%>
		<tbody>
	</table>

</div>
</body>
<script>
	$(document).ready( function () {
		console.log("ee")
	    $('#myTable').DataTable({
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
	} );
	</script>
</html>
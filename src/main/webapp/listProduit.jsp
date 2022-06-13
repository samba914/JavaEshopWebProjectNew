<%@page import="business.model.Produit"%>
<%@page import="java.util.ArrayList"%>

<%@include file="HeaderAdmin.jsp"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<link
	href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"
	rel="stylesheet"></link>
<title>Liste des Produits</title>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-10">
				<table id="myTable" class="table table-striped">
					<thead>
						<tr>
							<th>id</th>
							<th>Nom</th>
							<th>Prix</th>
							<th>Stock</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (Produit p : (ArrayList<Produit>) request.getAttribute("listProduit")) {
						%>
						<tr>
							<td><%=p.getId()%></td>
							<td><%=p.getNom()%></td>
							<td><%=p.getPrix()%> &#8364;</td>
							<td><%=0%></td>
						</tr>
						<%
						}
						%>
					
					<tbody>
				</table>
			</div>
			<div class="col-2">
			
			<a href="controlleradmin?page=ajoutProduit"> <button type="button" class="btn btn-outline-primary">  Ajouter un produit </button></a>
			</div>
		</div>
	</div>

	<br>

	<%@
   include file="footer.jsp"%>
</body>
<script>
	$(document)
			.ready(
					function() {
						console.log("ee")
						$('#myTable')
								.DataTable(
										{
											language : {
												processing : "Traitement en cours...",
												search : "Rechercher&nbsp;:",
												lengthMenu : "_MENU_",
												info : "Affichage de l'&eacute;lement _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
												infoEmpty : "Affichage de l'&eacute;lement 0 &agrave; 0 sur 0 &eacute;l&eacute;ments",
												infoFiltered : "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
												infoPostFix : "",
												loadingRecords : "Chargement en cours...",
												zeroRecords : "Aucun &eacute;l&eacute;ment &agrave; afficher",
												emptyTable : "Aucune donnée disponible dans le tableau",
												paginate : {
													first : "Premier",
													previous : "Pr&eacute;c&eacute;dent",
													next : "Suivant",
													last : "Dernier"
												},
												aria : {
													sortAscending : ": activer pour trier la colonne par ordre croissant",
													sortDescending : ": activer pour trier la colonne par ordre décroissant"
												}
											}
										});
					});
</script>
</html>
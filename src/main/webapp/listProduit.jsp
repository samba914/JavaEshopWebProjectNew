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
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<title>Liste des Produits</title>

</head>
<body>
	<div class="mt-3" style="padding:4%;background-image: url('background/hero_frosty.jpg');">
		<div class="card shadow p-3 mb-5 bg-white rounded">
			<div class="card-body">
				<div class="mb-3">
					<button id="addProduct" type="button" class="btn btn-outline-secondary action"  >  Ajouter un produit </button>
				</div>
				<table id="myTable" class="table table-striped">
					<thead>
						<tr>
							<th>id</th>
							<th></th>
							<th>Nom</th>
							<th>Prix</th>
							<th>Stock</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<%
						for (Produit p : (ArrayList<Produit>) request.getAttribute("listProduit")) {
						%>
						<tr>
							<td><%=p.getId()%></td>
							<td><img width="40px" src="photoh/<%=p.getPhoto() %>" alt=""></td>
							<td><%=p.getNom()%></td>
							<td><%=p.getPrix()%> &#8364;</td>
							<td><%=p.getStock()%></td>
							<td>
                                        <span> 
                                        	<span data-image="<%=p.getPhoto()%>" data-oId="<%=p.getId()%>" data-nom="<%=p.getNom()%>" data-prix="<%=p.getPrix()%>" data-stock="<%=p.getStock()%>"  data-acionType="edit" class="action"><a href="#" data-toggle="tooltip" data-placement="top" title="Modifier" ><span class="material-icons" style="color:grey">edit</span></a> </span> 
                                        
                                        </span>
                              </td>
						</tr>
						<%
						}
						%>
					
					<tbody>
				</table>
			</div>
			
		</div>
	</div>

	<br>
	
	<div class="modal fade" id="exampleModals" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            	<div class="modal-header">
                    <h5 class="modal-title" id="ModalLabel">Ajouter un produit</h5>
                    <button id="closeModal" type="button" class="close btn btn-outline" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div style="padding: 3%">
	                <form id="formProduit" method="post" action="controlleradmin?page=ajoutProduit" enctype="multipart/form-data">
						<div class="form-group mb-2">
						<input id="idProduit" value="0" type="hidden" name="idProduit"/>
							<label for="formGroupExampleInput">Nom du produit</label> <input
								type="text" class="form-control" name="nomProduit" id="oNom"
								placeholder="Nom du produit">
						</div>
						<div class="form-group mb-2">
							<label for="formGroupExampleInput2">Prix unitaire</label> <input
								type="text" class="form-control" name="prixProduit" id="oPrix"
								placeholder="Prix unitaire">
						</div>
						<div class="form-group mb-2">
							<label for="formGroupExampleInput2">Stock</label> <input
								type="number" class="form-control" name="stockProduit" id="oStock"
								placeholder="Stock">
						</div>
					
						<div class="form-group">
							<label for="exampleFormControlFile1">Image du produit</label>
							<div>
								<img id="imageUpdate" hidden=true width="100px" src="" alt="">
								
							</div>
							
							
							 <input hidden=true id="inputUploadImage"
								type="file" class="form-control-file" name="imageProduit">
						</div>
						<br>
						<div class="modal-footer">
	                        <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
	                        <button type="submit" id="editModelSubmit" class="btn btn-info">Ajouter</button>
	                    </div>
					</form>
				</div>
                
            </div>
        </div>
    </div>

	<%@
   include file="footer.jsp"%>
</body>
<script>
	$(document)
			.ready(
					function() {


					       $("#closeModal").click(function () {
					    	   $("#exampleModals").modal("hide");
					       });
					        $(".action").click(function () {
					        
					        	if ($(this).attr("data-acionType") == "edit") {
					        		$("#inputUploadImage").attr("hidden",true);
					                $("#ModalLabel").html("Modifier votre produit");
					                $("#editModelSubmit").html("Modifier");
					                $("#editModelSubmit").attr("data-acionType", "edit");
					                var nom = $(this).attr("data-nom");
					                var prix = $(this).attr("data-prix");
					                var stock = $(this).attr("data-stock")
					                var imgaePath = $(this).attr("data-image")
					                $("#oNom").val(nom);
					                $("#oPrix").val(prix);
					                $("#oStock").val(Number(stock));
					                var id = $(this).attr("data-oId");
					                $("#idProduit").val(id);
					                $("#imageUpdate").attr("src","photoh/"+imgaePath);
					                $("#imageUpdate").attr("hidden",false);
					                $("#formProduit").attr("action","controlleradmin?page=updateProduit");

					            } else {
					            	$("#oStock").val(0);
					            	$("#imageUpdate").attr("hidden",true);
					            	$("#inputUploadImage").attr("hidden",false);
					                $("#ModalLabel").html("Ajouter un produit");
					                $("#editModelSubmit").html("Ajouter");
					                $("#editModelSubmit").attr("data-acionType", "add");
					                $("#oNom").val("");
					                $("#oPrix").val("");
					                $("#editModelSubmit").attr("data-acionType", "add");
					                $("#formProduit").attr("action","controlleradmin?page=ajoutProduit");
					            }
					            $("#exampleModals").modal("show");

					        });
						$('#myTable').DataTable(
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
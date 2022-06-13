
<%@ include file="HeaderAdmin.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ajout produit</title>


</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<form method="post" action="controlleradmin?page=ajoutProduit" enctype="multipart/form-data">
					<div class="form-group">
						<label for="formGroupExampleInput">Nom du Produit</label> <input
							type="text" class="form-control" name="nomProduit"
							placeholder="nom">
					</div>
					<div class="form-group">
						<label for="formGroupExampleInput2">Prix unitaire</label> <input
							type="text" class="form-control" name="prixProduit"
							placeholder="prix">
					</div>
					<br>
					<div class="form-group">
						<label for="exampleFormControlFile1">Ajouter une image</label> <input
							type="file" class="form-control-file" name="imageProduit">
					</div>
					<br>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
			<div class="col-2"></div>
		</div>
	</div>

	<%@
   include file="footer.jsp"%>
</body>
</html>

 $(document).ready(function() {
	
	$("#status").change(function(){
		var idCommande = $(this).attr("data-idCommande");
		location.href="controlleradmin?page=AdminShowCommande&id="+idCommande+"&etat="+$(this).val();
	});
});
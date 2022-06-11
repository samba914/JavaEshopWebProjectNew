/**
 * 
 */
$(document).ready(function() {
	/*var idCommande=$("#selectedCommande").val();
	$("#produit_list").val(idCommande);*/
	$("#produit_list").change(function(){
		location.href="controller?page=MesCommandes&idCommande="+$(this).val();
	});
	
});
 
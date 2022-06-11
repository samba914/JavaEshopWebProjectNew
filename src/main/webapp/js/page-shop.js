 $(document).ready(function() {
	
	$("#filterInput").keyup(function(){
		 var input, filter;
	    input = document.getElementById("filterInput");
	    filter = input.value.toUpperCase();
	    article = $(".article");
	    $(".nomProduit").each(function(){
			if($(this).text().toUpperCase().indexOf(filter) > -1){
				$(this).parent().parent().parent().parent().parent().show();
			}else{
				$(this).parent().parent().parent().parent().parent().hide();
			}
		});

	});
	
});
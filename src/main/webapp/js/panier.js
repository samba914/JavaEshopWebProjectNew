
 $(document).ready(function() {
	function getXMLHttpRequest() {
	var xmlHttpReq = false;
	// to create XMLHttpRequest object in non-Microsoft browsers
	if (window.XMLHttpRequest) {
		xmlHttpReq = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		try {
			// to create XMLHttpRequest object in later versions
			// of Internet Explorer
			xmlHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (exp1) {
			try {
				// to create XMLHttpRequest object in older versions
				// of Internet Explorer
				xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (exp2) {
				xmlHttpReq = false;
			}
		}
	}
	return xmlHttpReq;
  }
  /*
 * AJAX call starts with this function
 */
function makeRequest(id,qte) {
	var xmlHttpRequest = getXMLHttpRequest();
	xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest);
	xmlHttpRequest.open("POST", "controller?page=updateQte&id="+id+"&qte="+qte, true);
	xmlHttpRequest.setRequestHeader("Content-Type",
			"application/x-www-form-urlencoded");
	xmlHttpRequest.send(null);
}

/*
 * Returns a function that waits for the state change in XMLHttpRequest
 */
	function getReadyStateHandler(xmlHttpRequest) {
	
		// an anonymous function returned
		// it listens to the XMLHttpRequest instance
		return function() {
			if (xmlHttpRequest.readyState == 4) {
				if (xmlHttpRequest.status == 200) {
					//
				} else {
					alert("HTTP error " + xmlHttpRequest.status + ": " + xmlHttpRequest.statusText);
				}
			}
		};
	}

  $('.qte_product').change(function(event) {
	
    var id = $(this).attr("data-id");
    var qte = $(this).val();
    var price =  Number($(this).attr("data-price"));
    $("#montant_produit_"+id).text(qte*price+"$");
    $(this).parent().parent().attr("data-total",qte*price)
    var somme =0;
    $(".product_line").each(function(e) {
        somme+= Number($(this).attr("data-total"));
	});
	$("#p-total").text(somme+"$");
	makeRequest(id,qte);
    
  });
});
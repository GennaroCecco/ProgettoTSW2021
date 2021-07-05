	$.ajax({
		type: 'GET',
		url: 'cartCount',
		success: function(result){
			$('#cont').html(result);
		}
	})

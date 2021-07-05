function addTocart(i){
					var op = "aggC";
					var id = i;
					$.ajax({
						type: 'GET',
						data:{op:op,id:id},
						url: 'carrello',
					})
					
				}
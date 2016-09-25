$(document).ready( function() {
done();

});

function done(){
	setTimeout( function() {
	 updates(); 
	 done();
	}, 200);
}

function updates(){

	$.getJSON("fetch.php", function(data){
		$("ul").empty();

		$.each(data.result, function(){

			$("ul").append("Fecha: "+this['FechaGPS']+"</br>");
		});		
});
}
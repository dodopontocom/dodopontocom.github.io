$(document).ready(function() {
    $('select').material_select();
    $('ul.tabs').tabs();

	$('.carousel.carousel-slider').carousel({full_width: true});
	$("#idVoltarCarousel").hide();
	$("#idPesquisar").hide();
	$("#restaurantes").hide();

});
    
setInterval(function(){
  $('.carousel').carousel('next');
}, 1000);

function showToast(){
	//console.log('test');
//	Materialize.toast('Mensagem enviada', 4000);
 	
	console.log('chamando ajax');
 	$.ajax({
 		
		url: 'http://localhost:8080/selectProduto',

		success: function (resposta){
			Materialize.toast(resposta, 2000);
			console.log(resposta);
		},

		error: function(erro){
			Materialize.toast(erro.resposeText, 3000, 'red-text');
			console.log(erro.resposeText);
		}

	});
}

function hideCarousel(){

	$("#idCarousel").fadeOut();
	$("#idVoltarCarousel").show();

}

function showCarousel(){

	$("#idCarousel").fadeIn();
	$("#idPesquisar").fadeOut();
	$("#restaurantes").fadeOut();
	
}

function hideHome(){

	$("#idCarousel").fadeOut();
	$("#idPesquisar").fadeIn();
	$("#restaurantes").fadeout();


}

function showRest(){

	$("#idCarousel").fadeOut();
	$("#idPesquisar").fadeOut();
	$("#restaurantes").fadeIn();

}

function goPedidos(){

	
	$('ul.tabs').tabs('select_tab', 'pedidos');

}





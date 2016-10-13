$( document ).ready(function() {

	var principal = "";
	var mistura = "";
	var guarnicao = "";
	var extra = "";
	var bebida = "";
	var tamanho = "";
	var preco = $(".itensPreco option:selected").val();;
	// criar as demais variavies...

	// change principal
	$("select.itensPrincipal").change(function(){
		principal = $(".itensPrincipal option:selected").val();
	});

	// change mistura
	$("select.itensMistura").change(function(){
		mistura = $(".itensMistura option:selected").val();
	});

		// change guarnição
	$("select.itensGuarnicao").change(function(){
		guarnicao = $(".itensGuarnicao option:selected").val();
	});

	// change extra
	$("select.itensExtra").change(function(){
		extra = $(".itensExtra option:selected").val();
	});

		// change bebida
	$("select.itensBebida").change(function(){
		bebida = $(".itensBebida option:selected").val();
	});

		// change tamanho
	$("select.itensTamanho").change(function(){
		tamanho = $(".itensTamanho option:selected").val();

	});

	// change preço
	/*$("select.itensPreco").change(function(){
		preco = $(".itensPreco option:selected").val();
	});*/

	// popula modal
	$(".btn-confirma").click(function(){
		$("#principalLinha").text(principal);
		$("#misturaLinha").text(mistura);
		$("#guarnicaoLinha").text(guarnicao);
		$("#extraLinha").text(extra);
		$("#bebidaLinha").text(bebida);
		$("#tamanhoLinha").text(tamanho);
		$("#precoLinha").text(preco);
	});

});

function habilitaCidade() {
	$("#selCidade").removeClass('hidden');
	$("#img01").hide();
	$("#img02").show();
	
  }

function habilitaEncontrar() {
	$("#btnEncontrar").removeClass('hidden');
	$("#img02").hide();
	$("#img03").show();
	
  }

function paginaPedido() {
	$("#idCarousel").addClass('hidden');
	$("#idPedidos").removeClass('hidden');
	$("#img03").hide();


	var restaurante = "Restaurante A Fome Ataca";
    document.getElementById("idRestaurante").innerHTML = restaurante;
    
    //var vendas = "36";
    //document.getElementById("idVendasRealizadas").innerHTML = vendas;
	
}

function reloadPagina() {
	location.reload();
}	 



/*para cada opcao que vier do servidor faça isso
{

 var option = '<option> ' + valor + '</option>'; 
 $("#minhaDiv").append(option);
	
} */
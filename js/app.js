// A $( document ).ready() block.
$( document ).ready(function() {




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
	
  }

function reloadPagina() {
	location.reload();
}


function pegaPrincipal(){
	$("select.itensPrincipais").change(function(){
	var itemSelecionado = $(".itensPrincipais option:selected").val();
    document.getElementById("principalLinha").innerHTML = itemSelecionado;
});
}





    
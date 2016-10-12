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



$("#selPrincipal").change(function(){
	var selected = $("#selPrincipal option:selected").val();
    alert("You have selected the country - " + selected);
});
    
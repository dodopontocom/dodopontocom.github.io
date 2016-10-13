$( document ).ready(function() {


alert("as");

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
	$("select.itensPrincipal").change(function(){
	var itemSelecionado = $(".itensPrincipal option:selected").val();
    document.getElementById("principalLinha").innerHTML = itemSelecionado;

});
}

function pegaMistura(){
	$("select.itensMistura").change(function(){
	var itemSelecionado = $(".itensMistura option:selected").val();
    document.getElementById("misturaLinha").innerHTML = itemSelecionado;

});
}

function pegaExtra(){
	$("select.itensExtra").change(function(){
	var itemSelecionado = $(".itensExtra option:selected").val();
    document.getElementById("extraLinha").innerHTML = itemSelecionado;

});
}

function pegaBebida(){
	$("select.itensBebida").change(function(){
	var itemSelecionado = $(".itensBebida option:selected").val();
    document.getElementById("bebidaLinha").innerHTML = itemSelecionado;

});
}

function pegaTamanho(){
	$("select.itensTamanho").change(function(){
	var itemSelecionado = $(".itensTamanho option:selected").val();
    document.getElementById("tamanhoLinha").innerHTML = itemSelecionado;

});
}
function pegaPreco(){
	$("select.itensPreco").change(function(){
	var itemSelecionado = $(".itensPreco option:selected").val();
    document.getElementById("precoLinha").innerHTML = itemSelecionado;

});
}




    

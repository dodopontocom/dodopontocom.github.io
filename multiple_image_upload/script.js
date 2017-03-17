var abc = 0; //Declaring and defining global increement variable

$(document).ready(function() {

//To add new input file field dynamically, on click of "Add More Files" button below function will be executed
    $('#add_more').click(function() {
        $(this).before($("<div/>", {id: 'filediv'}).fadeIn('slow').append(
                $("<input/>", {name: 'file[]', type: 'file', id: 'file'}),        
                $("<br/><br/>")
                ));
    });

//following function will executes on change event of file input to select different file	
$('body').on('change', '#file', function(){
            if (this.files && this.files[0]) {
                 abc += 1; //increementing global variable by 1
				
				var z = abc - 1;
                var x = $(this).parent().find('#previewimg' + z).remove();
                $(this).before("<div id='abcd"+ abc +"' class='abcd'><img id='previewimg" + abc + "' src=''/></div>");
               
			    var reader = new FileReader();
                reader.onload = imageIsLoaded;
                reader.readAsDataURL(this.files[0]);
               
			    $(this).hide();
                $("#abcd"+ abc).append($("<img/>", {id: 'img', src: 'x.png', alt: 'delete'}).click(function() {
                $(this).parent().parent().remove();
                }));
            }
        });

//To preview image     
    /*function imageIsLoaded(e) {
        $('#previewimg' + abc).attr('src', e.target.result);
    }*/

    $('#upload').click(function(e) {

        if($('#codigod').val() == "redemptionsong")
        {
            swal({
                title: "Está tudo correto?",
                    text: "Podemos enviar todas as informações?!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "Sim, Pode!",
                    cancelButtonText: "Não, vou revisar!",
                    closeOnConfirm: false,
                    closeOnCancel: false
                },
                function(isConfirm){
                    if (isConfirm) {
                        swal("Enviado!", "As informações foram enviadas.", "success");
                    } else {
                        swal("Cancelado!", " :)", "error");
                    }
            });

            swal("Ótimo!","Música correta!", "success");

        }else {
            swal("Oops...","Música inválida!", "error");
            e.preventDefault();
        }


        var name = $(":file").val();
        if (!name)
        {
            swal("Oops...","Pelo menos uma imagem deve ser escolhida","error");
            e.preventDefault();
        }




    });
    
});
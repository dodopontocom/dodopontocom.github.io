<!DOCTYPE html>
<html>
    <head>
		<title>Cadastar Imóvel</title>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

		<!-------Including jQuery from google------>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="script.js"></script>
		
		<!-------Including CSS File------>
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="../../css/bootstrap.css">
    <body>
        <div id="maindiv">

            <div id="formdiv">
                <h2>Subir informações do novo imóvel a ser cadastrado</h2>
                <form enctype="multipart/form-data" action="" method="post">
                    Upload de arquivos apenas nesses formatos jpeg,jpg,png,txt
                    <hr/>
                    <div id="filediv"><input name="files[]" type="file" multiple="multiple" id="file"/></div><br/>
           
                    <input type="button" id="add_more" class="upload" value="Adicione mais"/>
                    <input type="submit" value="Submeter!!!" name="submit" id="upload" class="upload"/>
                </form>
                <br/>
                <br/>
<!-- 
                <p><b>Informações do imóvel</b></p>
                <p class="text-right">número referência: <input name="ref" type="text"></p>
                <p class="text-right">número alternativo de referência: <input name="eref" type="text"></p>
                <p class="text-right">preço: <input name="preco" type="text"></p>
                <p class="text-right">metragem total: <input name="metro" type="text"></p>
                <p class="text-right">número de dormitórios: <input name="dormi" type="text"></p>
                <p class="text-right">número de banheiros: <input name="banho" type="text"></p>
                <p class="text-right">título para o anúncio: <input name="titulo" type="text"></p>
                <p class="text-right">descrição para o anúncio: <textarea name="descri" type="text"></textarea></p>
                <p class="text-right">nome para contato 01: <input name="contato1" type="text"></p>
                <p class="text-right">telefone 01: <input name="telefone1" type="text"></p>
                <p class="text-right">nome para contato 02: <input name="contato2" type="text"></p>
                <p class="text-right">telefone 02:<input name="telefone2" type="text"></p>
                <p class="text-right">pode financiamento: <input name="financiamento" type="text"></p>
                <p class="text-right">metragem total da área construída: <input name="mconstru" type="text"></p>
                <p class="text-right">item 01: <input name="item1" type="text"></p>
                <p class="text-right">item 02: <input name="item2" type="text"></p>
                <p class="text-right">item 03: <input name="item3" type="text"></p>
                <p class="text-right">item 04: <input name="item4" type="text"></p>
                <p class="text-right">item 05: <input name="item5" type="text"></p>
                <p class="text-right">item 06: <input name="item6" type="text"></p>
                <p class="text-right">deseja que o anúncio vá para os destaques: <input name="destaque" type="text"></p>
                <p class="text-right">se for para locação qual o valor: (deixar em branco caso não seja para alugar)<input name="locacao" type="text"></p>
                <p class="text-right">contato do captador do imóvel: <input name="captacao" type="text"></p>
                <p class="text-right">nome do proprietário: <input name="prop" type="text"></p>
                <p class="text-right">bairro/condomínio - cidade/ESTADO: <input name="local" type="text"></p> -->
                <hr></hr>


				<!-------Including PHP Script here------>
                <?php include "upload.php"; ?>
            </div>
           
		   <!-- Right side div -->
<!--            <div id="formget"><a href=http://www.formget.com/app><img src="formget.jpg" alt="Online Form Builder"/></a>
            </div> -->
        </div>
    </body>
</html>
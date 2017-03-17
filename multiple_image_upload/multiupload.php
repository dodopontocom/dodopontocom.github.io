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
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <body>
        <div id="maindiv">

            <div id="formdiv">
                <h2>Subir informações do novo imóvel a ser cadastrado</h2>
                <form enctype="multipart/form-data" action="" method="post">
                    Upload de arquivos apenas nesses formatos jpeg,jpg
                    <hr/>
                    <div id="filediv"><input name="file[]" type="file" multiple="multiple" id="file"/>
                        
                    </div>
                    
                    <hr/>
                    <!-- <input type="button" id="add_more" class="upload" value="Adicione mais"/> -->
                
                    <!-- 
                    <p><b>Informações do imóvel</b></p>
                    <p class="text-right">número referência: <input name="ref" type="text"></p>
                    <p class="text-right">número alternativo de referência: <input name="eref" type="text"></p> -->

                    <div class="container-fluid">
                        <h2>Informações (obrigatório *)</h2>

                        <p class="text-right">Preço*: <input name="preco" type="number" required="true" placeholder="1.500.000"></p>
                        <p class="text-right">Metragem total*: <input name="metro" type="number" required="true" placeholder="1.450"></p>
                        <p class="text-right">Número de dormitórios*: <input name="dormi" type="number" required="true"></p>
                        <p class="text-right">Número de banheiros*: <input name="banho" type="number" required="true"></p>
                        <p class="text-right">Título para o anúncio*: <input name="titulo" type="text" required="true"></p>
                        <p class="text-right">Descrição para o anúncio*: <textarea name="descri" type="text" required="true"></textarea></p>
                        <p class="text-right">Nome para contato 01*: <input name="contato1" type="text" required="true"></p>
                        <p class="text-right">Telefone 01* (sem espaços): <input name="telefone1" type="number" required="true"placeholder="15999999999"></p>
                        <p class="text-right">Nome para contato 02: <input name="contato2" type="text"></p>
                        <p class="text-right">Telefone 02 (sem espaços):<input name="telefone2" type="number" placeholder="15990564699"></p>

                        <p class="text-right">Pode financiamento*:
                            <select name="financiamento">
                                <option value=""></option>
                                <option value="sim">sim</option>
                                <option value="nao">não</option>
                            </select>
                        </p>
                        
                        <p class="text-right">Metragem total da área construída: <input name="mconstru" type="number" placeholder="132"></p>
                        <p class="text-right">Item 01: <input name="item1" type="text" placeholder="informação relevante"></p>
                        <p class="text-right">Item 02: <input name="item2" type="text" placeholder="informação relevante"></p>
                        <p class="text-right">Item 03: <input name="item3" type="text" placeholder="informação relevante"></p>
                        <p class="text-right">Item 04: <input name="item4" type="text" placeholder="informação relevante"></p>
                        <p class="text-right">Item 05: <input name="item5" type="text" placeholder="informação relevante"></p>
                        <p class="text-right">Item 06: <input name="item6" type="text" placeholder="informação relevante"></p>

                        <p class="text-right">Deseja que o anúncio vá para os destaques da página*:
                            <select name="destaque">
                                <option value=""></option>
                                <option value="sim">sim</option>
                                <option value="nao">não</option>
                            </select>
                        </p>

                        <p class="text-right">Se for para locação qual o valor: (deixar em branco caso não seja para alugar)<input name="locacao" type="number" placeholder="500"></p>
                        <p class="text-right">Contato do captador do imóvel: <input name="captacao" type="text"></p>
                        <p class="text-right">Nome do proprietário: <input name="prop" type="text"></p>
                        <p class="text-right">Bairro/condomínio - cidade/ESTADO*: <input name="local" type="text" required="true"placeholder="Porta do Sol - Mairinque / SP"></p>
                        <p class="text-right"><b>Música do desenvolvedor*:</b> <input name="codigod" id="codigod" type="text" required="true"></p>
                        <hr/>
                        <input type="submit" value="Submeter!!!" name="submit" id="upload" class="upload"/>
                    </div>


                </form>


				<!-------Including PHP Script here------>
                <?php include "upload.php"; ?>
            </div>
           
		   <!-- Right side div -->
           <div id="formget"><a href=http://www.construtoracarvalhopereira.com.br><img src="../images/logo_menor.png" alt="Nosso Site"/></a>
            </div>
        </div>
    </body>
</html>

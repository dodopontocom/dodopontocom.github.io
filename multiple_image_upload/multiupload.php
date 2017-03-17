<!DOCTYPE html>
<html>
    <head>
		<title>Cadastar Imóvel</title>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">

		<!-------Including jQuery from google------>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="script.js"></script>
		
		<!-------Including CSS File
        <link rel="stylesheet" type="text/css" href="style.css"> -->
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">


        <link rel="stylesheet" href="icons/material.css">
        <link rel="stylesheet" href="css/materialize.min.css">
        <link rel="stylesheet" href="css/estilo.css"/>
        <script src="js/jquery.min.js"></script>
        <script src="js/materialize.min.js"></script>
        <script src="js/app.js"></script>


    <body>

        <!--header tabs inicio-->
        <div class=" z-depth-2 topo-fixo r">
            <ul class="tabs red darken-1">
                <li class="tab waves-effect waves-light">
                    <font class="white-text" size="1.8em">Cadastrar um novo anúncio</font>
                </li>
            </ul>
        </div>
        <!--header tabs fim -->

        <div class="container" id="maindiv">

            <div class="section" id="formdiv">
                <h2></h2>
                <form enctype="multipart/form-data" action="" method="post">
                    <h5>
                        <p>Subir informações do novo imóvel a ser cadastrado</p>
                        <p>Upload de arquivos apenas nesses formatos jpeg,jpg</p>
                    </h5>
                    <hr/>
                    <div id="filediv"><input name="file[]" type="file" multiple="multiple" id="file"/>
                        
                    </div>
                    
                    <hr/>
                    <!-- <input type="button" id="add_more" class="upload" value="Adicione mais"/> -->
                
                    <!-- 
                    <p><b>Informações do imóvel</b></p>
                    <p >número referência: <input name="ref" type="text"></p>
                    <p >número alternativo de referência: <input name="eref" type="text"></p> -->

                    <div class="container-fluid">
                        <h2>Informações (obrigatório *)</h2>

                        <p>Preço*: <input name="preco" type="number" required="true" placeholder="1.500.000,00"></p>
                        <p >Metragem total: <input name="metro" type="number" placeholder="1.450"></p>
                        <p >Número de dormitórios*: <input name="dormi" type="number"></p>
                        <p >Número de banheiros*: <input name="banho" type="number"></p>
                        <p >Título para o anúncio*: <input name="titulo" type="text"></p>
                        <p >Descrição para o anúncio*: <textarea name="descri" type="text"></textarea></p>
                        <p >Nome para contato 01*: <input name="contato1" type="text"></p>
                        <p >Telefone 01* (sem espaços): <input name="telefone1" type="number" placeholder="15990564699"></p>
                        <p >Nome para contato 02: <input name="contato2" type="text"></p>
                        <p >Telefone 02 (sem espaços):<input name="telefone2" type="number" placeholder="15990564699"></p>

                        <p >Pode financiamento*:
                            <select name="financiamento">
                                <option value=""></option>
                                <option value="sim">sim</option>
                                <option value="nao">não</option>
                            </select>
                        </p>
                        
                        <p >Metragem total da área construída: <input name="mconstru" type="number" placeholder="132"></p>
                        <p >Item 01: <input name="item1" type="text" placeholder="informação relevante"></p>
                        <p >Item 02: <input name="item2" type="text" placeholder="informação relevante"></p>
                        <p >Item 03: <input name="item3" type="text" placeholder="informação relevante"></p>
                        <p >Item 04: <input name="item4" type="text" placeholder="informação relevante"></p>
                        <p >Item 05: <input name="item5" type="text" placeholder="informação relevante"></p>
                        <p >Item 06: <input name="item6" type="text" placeholder="informação relevante"></p>

                        <p >Deseja que o anúncio vá para os destaques da página*:
                            <select name="destaque">
                                <option value=""></option>
                                <option value="sim">sim</option>
                                <option value="nao">não</option>
                            </select>
                        </p>

                        <p >Se for para locação qual o valor: (deixar em branco caso não seja para alugar)<input name="locacao" type="number" placeholder="500,00"></p>
                        <p >Contato do captador do imóvel: <input name="captacao" type="text"></p>
                        <p >Nome do proprietário: <input name="prop" type="text"></p>
                        <p >Bairro/condomínio - cidade/ESTADO*: <input name="local" type="text" placeholder="Porta do Sol - Mairinque / SP"></p>
                        <p ><b>Música do desenvolvedor*:</b> <input name="codigod" id="codigod" type="text"></p>
                        <hr/>

                        <div class="carousel-fixed-item center">
                            <input type="submit" value="Submeter!!!" name="submit" id="upload" class="btn waves-light waves-light darken-text-2"/>
                        </div>
                        
                    </div>


                </form>


				<!-------Including PHP Script here------>
                <?php include "upload.php"; ?>
            </div>
           
		   <!-- Right side div -->
           <!-- <div id="formget"><a href=http://www.construtoracarvalhopereira.com.br><img src="../images/logo_menor.png" alt="Nosso Site"/></a> -->
            </div>
        </div>

        <div class="row rodape-fixo z-depth-3 red darken-3">
            <div class="col s12">
                <p class="white-text center-align"><font size="1.8em">CARVALHO PEREIRA IMÓVEIS</font></p>
            </div>
        </div>

    </body>
</html>

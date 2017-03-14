<html>
<head>
<script language="JavaScript">
<!--
function teste(){
if (document.upload.arquivo.value=="") {
alert("Arquivo para upload não informado!")
document.upload.arquivo.focus()
return false
}
}
//-->
</script>
<title>Upload simples (copy e move_uploaded_file)</title>
</head>
<body>
<?
/*
INICIO DO CODIGO PHP
NA METADE DE BAIXO (SEGUNDA METADE) HA SOMENTE HTML (FORMULARIO DE UPLOAD)
*/
 
if (isset($_FILES[arquivo])) {
	if ($_FILES[arquivo][size] > 1024 * 1024) {
		$tamanho = round(($_FILES[arquivo][size] / 1024 / 1024), 2);
		$med = "MB";
	} else if ($_FILES[arquivo][size] > 1024) {
		$tamanho = round(($_FILES[arquivo][size] / 1024), 2);
		$med = "KB";
	} else {
		$tamanho = $_FILES[arquivo][size];
		$med = "Bytes";
	}
 
	/* Defina aqui o tamanho máximo do arquivo em bytes: */
 
	#if($_FILES[arquivo][size] > 5242880) { //Limite: 5MB
	#	print "<script> alert('Tamanho: $tamanho $med! Seu arquivo não poderá ser maior que 5MB!'); window.history.go(-1); </script>\n";
	#	exit;
#	}
	
	/* Defina aqui o diretório destino do upload */
 
	if (is_file($_FILES[arquivo][tmp_name])) {
		$arquivo = $_FILES[arquivo][tmp_name];
		$caminho="../../";
		$caminho=$caminho.$_FILES[arquivo][name];
 
		/* Defina aqui o tipo de arquivo suportado */
		if (!(eregi(".php$", $_FILES[arquivo][name]))) {
			if ($_POST['radio'] == "copy") {
				copy($arquivo,$caminho) or
					die("<p>Erro durante a manipula&ccedil;&atilde;o do arquivo '$arquivo'</p>".'<p><a href="'.$_SERVER["PHP_SELF"].'">Voltar</a></p>');
			} else if ($_POST['radio'] == "move_uploaded_file") {
				move_uploaded_file($arquivo,$caminho) or
					die("<p>Erro durante a manipula&ccedil;&atilde;o do arquivo '$arquivo'</p>".'<p><a href="'.$_SERVER["PHP_SELF"].'">Voltar</a></p>');
			}
			print "<h3><center>Arquivo enviado com sucesso usando " . $_POST['radio'] . "(), " . $tamanho . ' ' . $med . "!</center></h3>";
		} else {
			print "<h3><center>Arquivo n&atilde;o enviado!</center></h3>\n";
			print "<h4><font color='#FF0000'><center>Caminho ou nome de arquivo Inv&aacute;lido!</center></font></h4>";
		}
	}
	echo("De: $arquivo<br>\nPara: $caminho [<a href='$caminho'>download</a>]");
}
?>
<h2>Upload Simples</h2><br>
 
<p>
<form name="upload" action="" method="post" enctype="multipart/form-data" onsubmit="return teste()">
<input type="file" name="arquivo" size="60">
</p>
 
<p>
Fun&ccedil;&atilde;o a ser usada para fazer o upload do arquivo:<br>
<input type="radio" name="radio" value="copy" checked>copy();<br>
<input type="radio" name="radio" value="move_uploaded_file">move_uploaded_file();
</p>
 
<p>
<input type="submit" name="enviar" value="Upload!"><br>
Não envie arquivos do tipo .php<br>
</p>
 
</form>
</body>
</html>
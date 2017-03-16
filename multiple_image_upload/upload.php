<?php
if (isset($_POST['submit'])) {
    $j = 0; //Variable for indexing uploaded image 
    
	$target_path = "uploads/"; //Declaring Path for uploaded images
    for ($i = 0; $i < count($_FILES['file']['name']); $i++) {//loop to get individual element from the array

        $validextensions = array("txt", "jpeg", "jpg", "png");  //Extensions which are allowed
        $ext = explode('.', basename($_FILES['file']['name'][$i]));//explode file name from dot(.) 
        $file_extension = end($ext); //store extensions in the variable
        /*echo $_FILES['file']['type'];
        */
        
		$target_path = $target_path . md5(uniqid()) . "." . $ext[count($ext) - 1];//set the target path with a new name of image

        $j = $j + 1;//increment the number of uploaded images according to the files in array

      
	  if (($_FILES["file"]["size"][$i] < 10000000) //Approx. 10000kb files can be uploaded.
                && in_array($file_extension, $validextensions)) {
            if (move_uploaded_file($_FILES['file']['tmp_name'][$i], $target_path)) {//if file moved to uploads folder
                echo $j. ').<span id="noerror">Image uploaded successfully!.</span><br/><br/>';
            } else {//if file was not moved.
                echo $j. ').<span id="error">please try again!.</span><br/><br/>';
            }
        } else {//if file size and file type was incorrect.
            echo $j. ').<span id="error">***Invalid file Size or Type***</span><br/><br/>';
        }
    }

    echo $_POST["preco"];

    $infotxt = fopen("uploads/newinfo.txt", w) or die("não conseguiu criar arquivo!");


    fwrite($infotxt, "\nref:");

    $preco = $_POST['preco'];
    fwrite($infotxt, "\npreco:" . $preco);

    $metro = $_POST['metro'];
    fwrite($infotxt, "\nmetro:" . $metro);

    $dormi = $_POST['dormi'];
    fwrite($infotxt, "\ndormi:" . $dormi);

    $banho = $_POST['banho'];
    fwrite($infotxt, "\nbanho:" . $banho);

    $titulo = $_POST['titulo'];
    fwrite($infotxt, "\ntitulo:" . $titulo);

    $descri = $_POST['descri'];
    fwrite($infotxt, "\ndescri:" . $descri);

    $contato1 = $_POST['contato1'];
    fwrite($infotxt, "\ncontato1:" . $contato1);

    $telefone1 = $_POST['telefone1'];
    fwrite($infotxt, "\ntelefone1:" . $telefone1);

    $contato2 = $_POST['contato2'];
    fwrite($infotxt, "\ncontato2:" . $contato2);

    $telefone2 = $_POST['telefone2'];
    fwrite($infotxt, "\ntelefone2:" . $telefone2);

    $financiamento = $_POST['financiamento'];
    fwrite($infotxt, "\nfinanciamento:" . $financiamento);

    $mconstru = $_POST['mconstru'];
    fwrite($infotxt, "\nmconstru:" . $mconstru);

    $item1 = $_POST['item1'];
    fwrite($infotxt, "\nitem1:" . $item1);

    $item2 = $_POST['item2'];
    fwrite($infotxt, "\nitem2:" . $item2);

    $item3 = $_POST['item3'];
    fwrite($infotxt, "\nitem3:" . $item3);

    $item4 = $_POST['item4'];
    fwrite($infotxt, "\nitem4:" . $item4);

    $item5 = $_POST['item5'];
    fwrite($infotxt, "\nitem5:" . $item5);

    $item6 = $_POST['item6'];
    fwrite($infotxt, "\nitem6:" . $item6);

    $destaque = $_POST['destaque'];
    fwrite($infotxt, "\ndestaque:" . $destaque);

    $locacao = $_POST['locacao'];
    fwrite($infotxt, "\nlocacao:" . $locacao);

    $captacao = $_POST['captacao'];
    fwrite($infotxt, "\ncaptacao:" . $captacao);

    $prop = $_POST['prop'];
    fwrite($infotxt, "\nprop:" . $prop);

    $local = $_POST['local'];
    fwrite($infotxt, "\nlocal:" . $local);

    fwrite($infotxt, "\n");
    fclose($infotxt);
}
?>
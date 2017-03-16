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

    $preco = $_POST['preco'];
    fwrite($infotxt, "\n" . $preco);

    $metro = $_POST['metro'];
    fwrite($infotxt, "\n" . $metro);

    $dormi = $_POST['dormi'];
    fwrite($infotxt, "\n" . $dormi);

    $banho = $_POST['banho'];
    fwrite($infotxt, "\n" . $banho);

    $titulo = $_POST['titulo'];
    fwrite($infotxt, "\n" . $titulo);

    $descri = $_POST['descri'];
    fwrite($infotxt, "\n" . $descri);

    $contato1 = $_POST['contato1'];
    fwrite($infotxt, "\n" . $contato1);

    $telefone1 = $_POST['telefone1'];
    fwrite($infotxt, "\n" . $telefone1);

    $contato2 = $_POST['contato2'];
    fwrite($infotxt, "\n" . $contato2);

    $financiamento = $_POST['financiamento'];
    fwrite($infotxt, "\n" . $financiamento);

    $mconstru = $_POST['mconstru'];
    fwrite($infotxt, "\n" . $mconstru);

    $item1 = $_POST['item1'];
    fwrite($infotxt, "\n" . $item1);

    $item2 = $_POST['item2'];
    fwrite($infotxt, "\n" . $item2);

    $item3 = $_POST['item3'];
    fwrite($infotxt, "\n" . $item3);

    $item4 = $_POST['item4'];
    fwrite($infotxt, "\n" . $item4);

    $item5 = $_POST['item5'];
    fwrite($infotxt, "\n" . $item5);

    $item6 = $_POST['item6'];
    fwrite($infotxt, "\n" . $item6);

    $destaque = $_POST['destaque'];
    fwrite($infotxt, "\n" . $destaque);

    $destaque = $_POST['destaque'];
    fwrite($infotxt, "\n" . $destaque);

    $locacao = $_POST['locacao'];
    fwrite($infotxt, "\n" . $locacao);

    $captacao = $_POST['captacao'];
    fwrite($infotxt, "\n" . $captacao);

    $prop = $_POST['prop'];
    fwrite($infotxt, "\n" . $prop);

    $local = $_POST['local'];
    fwrite($infotxt, "\n" . $local);

    fwrite($infotxt, "\n");
    fclose($infotxt);
}
?>
<?php
/*
*  Cria uma sessão ou resume uma sesão atual baseada em um id de sessão passado
*  via GET ou POST, ou passaso via $_COOKIE.
*/session_start();

//valida se está logado
//if ($_COOKIE["name"] and $_POST['email'] ){

//Persiste em banco
if ($_POST['email'] ){
	$email = $_POST['email'];
	$senha = $_POST['senha'];

	include "../config/conexao.php";
	include "../model/loginM.php";	

}else {
	echo "Dados incompletos";
}

?>

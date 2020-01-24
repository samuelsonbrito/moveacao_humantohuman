<?php
/*
*  Cria uma sessão ou resume uma sesão atual baseada em um id de sessão passado
*  via GET ou POST, ou passaso via $_COOKIE.
*/session_start();

//valida se está logado
//if ($_COOKIE["name"] and $_POST['email'] ){

//Persiste em banco
if ($_POST['email'] ){
	$nome = $_POST['nome'];
	$email = $_POST['email'];
	$dd = $_POST['dd'];
	$foneComercial = $_POST['foneComercial'];
	$celular = $_POST['celular'];

	include "../config/conexao.php";
	include "../model/contatosCadastroM.php";
}else {
	echo "Dados incompletos";
}

?>

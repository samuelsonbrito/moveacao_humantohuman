
<?php

$sql = "select fCadastrarContato('$nome','{$email}',
'{$dd}','{$foneComercial}','{$celular}')";

if($retorno = mysqli_query($conexao, $sql)){

	$qntdRegistros = mysqli_num_rows($retorno);

	if ($qntdRegistros > 0)
	{
		include_once "../sucessoContatosCadastro.php";
	}else{
		echo "<pid='pMsg'> Falha na inserção de dados. </p>";
	}
}else{
	echo "Erro! Verifique se os dados foram preenchidos.";
}

?>

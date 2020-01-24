		<?php
		#include_once(!conexao.php);
		//include "../model/funcValidaLoginRetornaNomeId.php";

		## ok

		//	$selecaoBd = mysqli_select_db($conexao, "pibec");

		/*
		*Valida e retorna um registro (arrey) com o Nome e Id do Usuário.
		*/
		//	$retorno = validarLoginRetornaNomeId($conexao, $login, $senha);

		// $arrayName = array('' => , );

		//$qntdRegistros = sizeof($retorno);
		/*
		$sql = "select idPessoa, nome from pessoa
		inner join usuario on (pessoa.idpessoa = usuario.Pessoa_IdPessoa)
		where login = '{$login}' and senha =md5('{$senha}')";
		*/
		$sql = "select validarLogin('$email', '$senha')";

		$retorno = mysqli_query($conexao, $sql);
		mysqli_close($conexao);
		$qntdRegistros = mysqli_num_rows($retorno);
		// echo ". Quantidade Registros: $qntdRegistros";

		if ($qntdRegistros > 0)
		{
			while ($exibiRegistros = mysqli_fetch_array($retorno)) {
				$idPessoa = $exibiRegistros[0];
				$nome = $exibiRegistros[1];

				setcookie ("idUsuario", $idPessoa,time()+4600);  /* 3600 expire in 1 hour */
				setcookie ("nomeUsuario", $nome,time()+4600);  /* 3600 expire in 1 hour */
			}
			include "../prospectosAcolhido.php";
		}
		else{
			// unset($_SESSION['login']);
			// unset($_SESSION['senha']);
			echo "Usuario ou senha incorreto.";
		}

		?>

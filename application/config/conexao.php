<?php

			$hostname="localhost";
			$username="root";
			$password="root";
			$database="moveacao";
			$conexao = mysqli_connect($hostname, $username, $password, $database);


			//tratativas de erros
			if (!$conexao) {
				print "Erro de conexao com o banco de dados!";
			}else{
				//print("<h1>ok</h1>");
			}
		?>

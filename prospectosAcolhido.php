<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Contatos</title>
  <meta name="description" content="Sufee Admin - HTML5 Admin Template">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="assets/css/reset.css">


  <link rel="shortcut icon" href="favicon.ico">

  <link rel="stylesheet" href="assets/css/normalize.css">
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/font-awesome.min.css">
  <link rel="stylesheet" href="assets/css/themify-icons.css">
  <link rel="stylesheet" href="assets/css/flag-icon.min.css">
<!--
  <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
-->
  <link rel="stylesheet" href="assets/css/principal.css">
  <link rel="stylesheet" href="assets/css/consultarCurso.css">
  <link rel="stylesheet" type="text/css" href="assets/css/rodape.css"/>
  <!--<link rel="stylesheet" type="text/css" href="../../assets/css/rodape.css"/> -->
  <!-- <link rel="stylesheet" href="assets/css/bootstrap-select.less"> -->

  <link rel="stylesheet" href="assets/scss/style.css">
  <link rel="stylesheet" href="assets/css/contatos.css">
<!--
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
-->
  <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

</head>
<body>
  <!--
  **** Valida login
  --> <?php
  //include "../../loginCtrl.php";
  ?>
  <!-- Left Panel -->
  <aside id="left-panel" class="left-panel">
    <?php
    include "includes/navMenu.php";
    ?>
  </aside><!-- /#left-panel -->

  <!-- Left Panel -->

  <!-- Right Panel -->
  <div id="right-panel" class="right-panel">

    <div class="breadcrumbs">

      <div class="content mt-3">
        <div class="animated fadeIn">
          <div class="col-lg-6">
                <!-- *** ---->
                <!-- Bloco Filtro -->
                <!-- *** -->
                <div class="row col-md-8">

                  <div class="form-group">
                  <div> <i class="fa fa-search"></i></div>
                   <div>
                    <input type="text" name="curso" placeholder="Pesquisar"
                    id="idInputFormFiltrar" class="form-control">
                    </div>

                </div>
                <!-- Fim Bloco Filtro-->


                <!-- *** ---->
                <!-- Bloco de Resultados de Busca-->
                <div class="row col-md-8 blocoTabelaResultado">

                  <?php
                  include "application/config/conexao.php";
                  if ($conexao) {
                    /*
                    *  Seleciona o banco
                    */
                    $selecaoBd = mysqli_select_db($conexao, "moveacao");

                    if ($selecaoBd) {
                      // $nomeCurso = isset($_POST['nomeCurso']);

                      $comandoSql = "select * from pessoa";

                      $retornoConsulta = mysqli_query($conexao, $comandoSql);

                      $qntdRegistros = mysqli_num_rows($retornoConsulta);

                      if ($retornoConsulta){

                    ?>

                        <table id="idTabCurso" class="table table-striped">
                          <caption>
                            <?php print("$qntdRegistros")?> encontrado(s)!!
                          </caption>
                          <thead>
                            <tr>
                              <th scope="col">Tipo</th>
                              <th scope="col">Ajudador</th>
                              <th scope="col">Descrição</th>
                              <th scope="col">Telefone</th>                              

                            </tr>
                          </thead>
                          <tbody id="idTbody" class="tBody">
                            <?php
                            //  $listarRegistros = mysqli_fetch_array($retornoConsulta);
                            //mysqli_close($conexao);

                            //  while ($qntdRegistros) {
                            while ($listarRegistros = mysqli_fetch_array($retornoConsulta)) {
                              $nome = $listarRegistros[0];
                              $telefone = $listarRegistros[1];
                              $comercial = $listarRegistros[2];
                              $modulo = $listarRegistros[3];
                              $turno = $listarRegistros[4];
                              ?>
                              <tr class="linhaTbl">
                                <?php

                                echo "  <td class='td1'>$nome</td>";
                                echo "  <td class='td2'>$telefone</td>";
                                echo "  <td class='td3'>$comercial</td>";
                                //echo "  <td class='td4'>"<a href="../contatosCadastro.ph"><li>Cadastro Contatos</li></a>"><li>Cadastro Contatos</li></a> </td>";
                                // <img src="../sync.ico" width="225" height="225" alt=""> </td>";
                                echo "  <td class='td5'> X </td>";
                                echo "</tr>";

                              }
                              mysqli_close($conexao);
                              ?>

                            </tbody>
                          </table>

                          <?php
                        }
                        /*Msg se erro de consulta
                        echo "Erro de retorno de consulta dados.";
                        */
                      }
                    }

                    ?>

                  </div>
                  <!--Fim Bloco de Resultados de Busca -->

            </div><!-- .content -->

        </div>
      </div>
      </div>
    </div><!-- /#right-panel -->

  </div><!-- Right Panel -->


  <script src="assets/js/vendor/jquery-2.1.4.min.js"></script>
  <script src="assets/js/popper.min.js"></script>
  <script src="assets/js/plugins.js"></script>
  <script src="assets/js/main.js"></script>

	<script src="assets/js/jquery.js"></script>
    <script src="assets/js/scripts.js"></script>
    <script src="assets/js/selecionarCursoDaLista.js"></script>
    <script src="assets/js/filtra.js"></script>

</body>
</html>

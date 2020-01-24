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

  <link rel="apple-touch-icon" href="apple-icon.png">
  <link rel="shortcut icon" href="favicon.ico">

  <link rel="stylesheet" href="assets/css/normalize.css">
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/font-awesome.min.css">
  <link rel="stylesheet" href="assets/css/themify-icons.css">
  <link rel="stylesheet" href="assets/css/flag-icon.min.css">
  <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
  <!-- <link rel="stylesheet" href="assets/css/bootstrap-select.less"> -->

  <link rel="stylesheet" href="assets/scss/style.css">
  <link rel="stylesheet" href="assets/css/contatos.css">
  <link rel="stylesheet" type="text/css" href="assets/css/rodape.css"/>
<!--
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
-->
  <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

</head>
<body>
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
            <div class="card">
              <div class="card-header"><strong>Cadastro</strong></div>

              <div class="card-body card-block">
                <!--Foto Perfil -->
                <div class="form-group">
                  <div class="feed-box text-center">
                    <section class="card">
                      <div class="card-body">
                        <div class="gb_db">
                          <div class="gb_Ja gbip gb_hb" title="Perfil" aria-hidden="true"></div>
                          <div class="gb_lb gb_hb">
                            <a class="gb_mb gb_4f gb_hb gb_9f" aria-label="Alterar foto do perfil" href="https://myaccount.google.com/?utm_source=OGB&amp;tab=mk" target="_blank">
                              <svg
                              class="gb_nb align-self-center rounded-circle mr-3"
                              enable-background="new 0 0 24 24"
                              focusable="false"
                              height="30"
                              viewBox="0 0 24 24"
                              width="22"
                              xml:space="preserve"
                              xmlns="http://www.w3.org/2000/svg"
                              xmlns:xlink="http://www.w3.org/1999/xlink">
                              <img class="align-self-center rounded-circle mr-3" style="width:50px; height:50px;" alt="Foto" src="images/user.png">
                            </svg>
                          </a>
                        </div>
                      </section>
                    </div>
                  </div> <!--Fim foto Perfil-->
                <form action="application/controller/contatosCadastroCtrl.php" method="post" class="">

                    <div class="form-group">
                      <label for="company" class="form-control-label">Nome</label>
                      <input type="text" id="nome" name="nome"placeholder="Informe seu nome" class="form-control">
                    </div>
						
                    <div class="form-group">
                      	<label for="company" class="form-control-label">E-mail</label>
                        <div class="input-group">
                        <input type="email" id="email" name="email" required placeholder="Email" class="form-control">
                         
                        <div class="input-group-addon"><i class="fa fa-envelope"></i></div>
                      </div>
                    </div>

                        <div class="form-group">
                          <label for="foneComercial" class=" form-control-label">Telefone Comercial</label>
                          <div><input type="text" id="dd" name="dd" placeholder="DD" class="form-control col-4"></div>
                          <div><input type="text" id="foneComercial" name="foneComercial" placeholder="99999-9999" class="form-control"></div>
                        </div>

                        <div class="form-group">
                          <label for="celular" class=" form-control-label">Celular</label>
                          <input type="text" id="celular" name="celular" placeholder="99999-9999" class="form-control">
                        </div>

                      <div class="form-actions form-group">
                        <button type="submit" class="btn btn-secondary btn-sm col-5">Submit</button>
                      </div>

                    </div>
                  </div>
                </form>
              </div>
              <!-- .animated -->
            </div><!-- .content -->
          </div>
        </div><!-- /#right-panel -->
        <footer>
          <address>
            <script src="assets/js/texto-rodape.js"></script>
          </address>
        </footer>
      </div>
    </div>
  </div><!-- Right Panel -->


  <script src="assets/js/vendor/jquery-2.1.4.min.js"></script>
  <script src="assets/js/popper.min.js"></script>
  <script src="assets/js/plugins.js"></script>
  <script src="assets/js/main.js"></script>


</body>
</html>

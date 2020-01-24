
use moveacao;
DELIMITER $$
CREATE FUNCTION `fCadastrarContato`(
	nome varchar(45),
    email varchar(45),
    dd int,
    telefoneComercial varchar(15), 
    celular varchar(15))
    RETURNs int
begin
	declare ultimoIdGerado int;
    
    /*Gera novo Id.*/
    set ultimoIdGerado = (select ultimoIdPessoa from moveacao.ultimoid);  
    set ultimoIdGerado = ultimoIdGerado +1;
     
    insert 
		into moveacao.pessoa 
			(`idPessoa`,`nome`,`empresa_idEmpresa`,`login_idLogin`,`endereco_idEndereco`, `fone_idFone_idPessoa`)
        values
			(ultimoIdGerado, nome, ultimoIdGerado, ultimoIdGerado, ultimoIdGerado, ultimoIdGerado);
                            
    insert 
		into moveacao.fone 
			(`idFone_idPessoa`, `dd`,`comercial`,`celular`)
        values
			(ultimoIdGerado, dd, telefoneComercial, celular); 
              
	insert 
		into moveacao.login 
			(`idLogin_idPessoa`, `email`)
        values
			(ultimoIdGerado, email);
	   
     insert 
		into moveacao.empresa 
			(`idEmpresa_idPessoa`)
        values
			(ultimoIdGerado);
    
	insert 
		into  moveacao.endereco
			(`idEndereco_idPessoa`)
        values
			(ultimoIdGerado);
    
    -- Atualiza Tabela UltimoId.    
    update ultimoid as u
		set 
			u.ultimoIdPessoa =  ultimoIdGerado
        WHERE idUltimoId = 1;    
    
		return ultimoIdGerado;           
end$$
DELIMITER ;
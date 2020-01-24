use moveacao;

delimiter $$
/*
* Verifica se login e senha existem; se sim tetorna o idUsuario.
*/create function validarLogin(
	login varchar(45),
    senha	varchar(15))
returns int 
begin
	declare id int (11);
	
    set id = (select idLogin_idPessoa from moveacao.login as l
		inner join pessoa as p on (p.idpessoa = l.idLogin_idPessoa)
		where (l.email = login and l.senha = senha));
    
    		return id;
   
end$$
delimiter ;
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema moveAcao
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `moveAcao` ;

-- -----------------------------------------------------
-- Schema moveAcao
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `moveAcao` DEFAULT CHARACTER SET utf8 ;
USE `moveAcao` ;

-- -----------------------------------------------------
-- Table `moveAcao`.`tipoCapacitacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moveAcao`.`tipoCapacitacao` ;

CREATE TABLE IF NOT EXISTS `moveAcao`.`tipoCapacitacao` (
  `idTipoCapacitacao` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipoCapacitacao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moveAcao`.`produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moveAcao`.`produto` ;

CREATE TABLE IF NOT EXISTS `moveAcao`.`produto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NULL,
  `nome` VARCHAR(45) NULL,
  `valor` DECIMAL NULL,
  `und` VARCHAR(5) NULL,
  `marca` VARCHAR(20) NULL,
  PRIMARY KEY (`idProduto`),
  UNIQUE INDEX `idProduto_UNIQUE` (`idProduto` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moveAcao`.`endereco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moveAcao`.`endereco` ;

CREATE TABLE IF NOT EXISTS `moveAcao`.`endereco` (
  `idEndereco_idPessoa` INT NULL,
  `cep` VARCHAR(10) NULL,
  `numero` INT NULL,
  `bairo` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  `logradouro` VARCHAR(45) NULL,
  `pais_idPais` INT NULL,
  `estado_idEstado` INT NULL,
  PRIMARY KEY (`idEndereco_idPessoa`, `pais_idPais`, `estado_idEstado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `moveAcao`.`capacitacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moveAcao`.`capacitacao` ;

CREATE TABLE IF NOT EXISTS `moveAcao`.`capacitacao` (
  `TipoCapacitacao_idTipoCapacitacao` INT NOT NULL,
  `idCapacitacao_idProduto` INT NULL,
  `CargaHoraria` INT NULL,
  `DataInicio` VARCHAR(45) NULL,
  `DataFim` VARCHAR(45) NULL,
  `Local` VARCHAR(45) NULL,
  `Tipo` INT NULL,
  `endereco_idEndereco_idPessoa` INT NOT NULL,
  `endereco_pais_idPais` INT NOT NULL,
  `endereco_estado_idEstado` INT NOT NULL,
  PRIMARY KEY (`TipoCapacitacao_idTipoCapacitacao`, `idCapacitacao_idProduto`),
  INDEX `fk_Capacitacao_TipoCapacitacao_idx` (`TipoCapacitacao_idTipoCapacitacao` ASC),
  INDEX `fk_Capacitacao_Produto1_idx` (`idCapacitacao_idProduto` ASC),
  INDEX `fk_capacitacao_endereco1_idx` (`endereco_idEndereco_idPessoa` ASC, `endereco_pais_idPais` ASC, `endereco_estado_idEstado` ASC),
  CONSTRAINT `fk_Capacitacao_TipoCapacitacao`
    FOREIGN KEY (`TipoCapacitacao_idTipoCapacitacao`)
    REFERENCES `moveAcao`.`tipoCapacitacao` (`idTipoCapacitacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Capacitacao_Produto1`
    FOREIGN KEY (`idCapacitacao_idProduto`)
    REFERENCES `moveAcao`.`produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_capacitacao_endereco1`
    FOREIGN KEY (`endereco_idEndereco_idPessoa` , `endereco_pais_idPais` , `endereco_estado_idEstado`)
    REFERENCES `moveAcao`.`endereco` (`idEndereco_idPessoa` , `pais_idPais` , `estado_idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moveAcao`.`servicos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moveAcao`.`servicos` ;

CREATE TABLE IF NOT EXISTS `moveAcao`.`servicos` (
  `idServicos_idProduto` INT NULL,
  `dataLimite` VARCHAR(45) NULL,
  `foneAlternativo` VARCHAR(45) NULL,
  `observacoes` VARCHAR(45) NULL,
  PRIMARY KEY (`idServicos_idProduto`),
  INDEX `fk_Servicos_Produto1_idx` (`idServicos_idProduto` ASC),
  CONSTRAINT `fk_Servicos_Produto1`
    FOREIGN KEY (`idServicos_idProduto`)
    REFERENCES `moveAcao`.`produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moveAcao`.`doacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moveAcao`.`doacao` ;

CREATE TABLE IF NOT EXISTS `moveAcao`.`doacao` (
  `idDoacao` INT NULL,
  `valor` VARCHAR(45) NULL,
  `observacoes` VARCHAR(45) NULL,
  PRIMARY KEY (`idDoacao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moveAcao`.`pessoa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moveAcao`.`pessoa` ;

CREATE TABLE IF NOT EXISTS `moveAcao`.`pessoa` (
  `idPessoa` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `cpfCnpj` VARCHAR(45) NULL,
  `rg` VARCHAR(45) NULL,
  `nascimento` VARCHAR(45) NULL,
  `tipoPessoa` TINYINT(4) NULL,
  `empresa_idEmpresa` INT NULL,
  `login_idLogin` INT NULL,
  `endereco_idEndereco` INT NULL,
  `fone_idFone_idPessoa` INT NULL,
  PRIMARY KEY (`idPessoa`, `empresa_idEmpresa`, `login_idLogin`, `endereco_idEndereco`, `fone_idFone_idPessoa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `moveAcao`.`recursos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moveAcao`.`recursos` ;

CREATE TABLE IF NOT EXISTS `moveAcao`.`recursos` (
  `idRecursos` INT NOT NULL AUTO_INCREMENT,
  `dataInicio` VARCHAR(45) NULL,
  `dataFim` VARCHAR(45) NULL,
  `descricao` VARCHAR(45) NULL,
  `produto_idProduto` INT NULL,
  `doacao_idDoacao` INT NULL,
  `pessoa_idPessoa` INT NOT NULL,
  PRIMARY KEY (`idRecursos`),
  UNIQUE INDEX `idDoacao_UNIQUE` (`idRecursos` ASC),
  INDEX `fk_doacao_produto1_idx` (`produto_idProduto` ASC),
  INDEX `fk_recursos_doacao1_idx` (`doacao_idDoacao` ASC),
  INDEX `fk_recursos_pessoa1_idx` (`pessoa_idPessoa` ASC),
  CONSTRAINT `fk_doacao_produto1`
    FOREIGN KEY (`produto_idProduto`)
    REFERENCES `moveAcao`.`produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recursos_doacao1`
    FOREIGN KEY (`doacao_idDoacao`)
    REFERENCES `moveAcao`.`doacao` (`idDoacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recursos_pessoa1`
    FOREIGN KEY (`pessoa_idPessoa`)
    REFERENCES `moveAcao`.`pessoa` (`idPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `moveAcao`.`empresa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moveAcao`.`empresa` ;

CREATE TABLE IF NOT EXISTS `moveAcao`.`empresa` (
  `idEmpresa_idPessoa` INT NULL,
  `razaoSocial` VARCHAR(45) CHARACTER SET 'utf8' NULL,
  PRIMARY KEY (`idEmpresa_idPessoa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `moveAcao`.`login`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moveAcao`.`login` ;

CREATE TABLE IF NOT EXISTS `moveAcao`.`login` (
  `idLogin_idPessoa` INT NULL,
  `email` VARCHAR(45) NULL,
  `senha` VARCHAR(45) NULL,
  PRIMARY KEY (`idLogin_idPessoa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `moveAcao`.`pais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moveAcao`.`pais` ;

CREATE TABLE IF NOT EXISTS `moveAcao`.`pais` (
  `idPais` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(30) NULL,
  PRIMARY KEY (`idPais`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `moveAcao`.`estado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moveAcao`.`estado` ;

CREATE TABLE IF NOT EXISTS `moveAcao`.`estado` (
  `idEstado` INT NOT NULL AUTO_INCREMENT,
  `uf` VARCHAR(3) NULL,
  PRIMARY KEY (`idEstado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `moveAcao`.`empresa_has_produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moveAcao`.`empresa_has_produto` ;

CREATE TABLE IF NOT EXISTS `moveAcao`.`empresa_has_produto` (
  `empresa_idEmpresa_idPessoa` INT NOT NULL,
  `produto_idProduto` INT NOT NULL,
  PRIMARY KEY (`empresa_idEmpresa_idPessoa`, `produto_idProduto`),
  INDEX `fk_empresa_has_produto_produto1_idx` (`produto_idProduto` ASC),
  INDEX `fk_empresa_has_produto_empresa1_idx` (`empresa_idEmpresa_idPessoa` ASC),
  CONSTRAINT `fk_empresa_has_produto_empresa1`
    FOREIGN KEY (`empresa_idEmpresa_idPessoa`)
    REFERENCES `moveAcao`.`empresa` (`idEmpresa_idPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empresa_has_produto_produto1`
    FOREIGN KEY (`produto_idProduto`)
    REFERENCES `moveAcao`.`produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moveAcao`.`experiencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moveAcao`.`experiencia` ;

CREATE TABLE IF NOT EXISTS `moveAcao`.`experiencia` (
  `idExperiencia` INT NOT NULL,
  `empresa` VARCHAR(45) NULL,
  `dataEmissao` VARCHAR(45) NULL,
  `dataDemissao` VARCHAR(45) NULL,
  `cargo` VARCHAR(45) NULL,
  `atividades` VARCHAR(45) NULL,
  PRIMARY KEY (`idExperiencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moveAcao`.`curriculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moveAcao`.`curriculo` ;

CREATE TABLE IF NOT EXISTS `moveAcao`.`curriculo` (
  `capacitacao_TipoCapacitacao_idTipoCapacitacao` INT NOT NULL,
  `capacitacao_idCapacitacao_idProduto` INT NOT NULL,
  `experiencia_idExperiencia` INT NOT NULL,
  `objetivo` VARCHAR(45) NULL,
  `resumoQualificacoes` VARCHAR(45) NULL,
  `infoAdicionais` VARCHAR(45) NULL,
  PRIMARY KEY (`capacitacao_TipoCapacitacao_idTipoCapacitacao`, `capacitacao_idCapacitacao_idProduto`, `experiencia_idExperiencia`),
  INDEX `fk_capacitacao_has_experiencia_experiencia1_idx` (`experiencia_idExperiencia` ASC),
  INDEX `fk_capacitacao_has_experiencia_capacitacao1_idx` (`capacitacao_TipoCapacitacao_idTipoCapacitacao` ASC, `capacitacao_idCapacitacao_idProduto` ASC),
  CONSTRAINT `fk_capacitacao_has_experiencia_capacitacao1`
    FOREIGN KEY (`capacitacao_TipoCapacitacao_idTipoCapacitacao` , `capacitacao_idCapacitacao_idProduto`)
    REFERENCES `moveAcao`.`capacitacao` (`TipoCapacitacao_idTipoCapacitacao` , `idCapacitacao_idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_capacitacao_has_experiencia_experiencia1`
    FOREIGN KEY (`experiencia_idExperiencia`)
    REFERENCES `moveAcao`.`experiencia` (`idExperiencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moveAcao`.`fone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moveAcao`.`fone` ;

CREATE TABLE IF NOT EXISTS `moveAcao`.`fone` (
  `idFone_idPessoa` INT NULL,
  `dd` INT NULL,
  `comercial` VARCHAR(15) NULL,
  `residencial` VARCHAR(15) NULL,
  `celular` VARCHAR(15) NULL,
  `outro` VARCHAR(15) NULL,
  PRIMARY KEY (`idFone_idPessoa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `moveAcao`.`ultimoId`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moveAcao`.`ultimoId` ;

CREATE TABLE IF NOT EXISTS `moveAcao`.`ultimoId` (
  `idUltimoId` INT NOT NULL,
  `ultimoIdPessoa` INT NULL,
  PRIMARY KEY (`idUltimoId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

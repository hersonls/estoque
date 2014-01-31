/* SQL Manager 2005 for InterBase and Firebird 4.3.0.1 */
/* --------------------------------------------------- */
/* Host     : localhost1                               */
/* Database : C:\LABORATORIO\BANCO\LABORATORIO.GDB     */


/* Definition for the `CATEGORIA_CODIGO_GEN` generator :  */

CREATE GENERATOR CATEGORIA_CODIGO_GEN;

/* Definition for the `GPRODUTOS` generator :  */

CREATE GENERATOR GPRODUTOS;

/* Definition for the `HESTOQUE_CODIGO_GEN` generator :  */

CREATE GENERATOR HESTOQUE_CODIGO_GEN;

/* Definition for the `LOTE_CODIGO_GEN` generator :  */

CREATE GENERATOR LOTE_CODIGO_GEN;

/* Definition for the `MARCA_CODIGO_GEN` generator :  */

CREATE GENERATOR MARCA_CODIGO_GEN;

/* Definition for the `USUARIO_CODIGO_GEN` generator :  */

CREATE GENERATOR USUARIO_CODIGO_GEN;


/* Structure for the `CATEGORIA` table :  */

CREATE TABLE CATEGORIA (
  CODIGO INTEGER NOT NULL,
  NOME VARCHAR(50) CHARACTER SET WIN1251 COLLATE WIN1251);


ALTER TABLE CATEGORIA ADD PRIMARY KEY (CODIGO);


/* Structure for the `HESTOQUE` table :  */

CREATE TABLE HESTOQUE (
  CODIGO INTEGER NOT NULL,
  DATA DATE DEFAULT CURRENT_DATE,
  PRODUTO INTEGER,
  QUANTIDADE NUMERIC(18, 3),
  OPERACAO SMALLINT DEFAULT 0);


ALTER TABLE HESTOQUE ADD PRIMARY KEY (CODIGO);


/* Structure for the `LOTE` table :  */

CREATE TABLE LOTE (
  CODIGO INTEGER NOT NULL,
  VALIDADE DATE,
  USUARIO SMALLINT);


ALTER TABLE LOTE ADD PRIMARY KEY (CODIGO);


/* Structure for the `MARCA` table :  */

CREATE TABLE MARCA (
  CODIGO INTEGER NOT NULL,
  NOME VARCHAR(50) CHARACTER SET WIN1251 COLLATE WIN1251);


ALTER TABLE MARCA ADD PRIMARY KEY (CODIGO);


/* Structure for the `PRODUTOS` table :  */

CREATE TABLE PRODUTOS (
  CODIGO INTEGER NOT NULL,
  NOME VARCHAR(100) CHARACTER SET WIN1251 COLLATE WIN1251,
  CATEGORIA INTEGER,
  CODBARRAS VARCHAR(50) CHARACTER SET WIN1251 COLLATE WIN1251,
  MARCA SMALLINT,
  PCUSTO NUMERIC(18, 2),
  PVENDA NUMERIC(18, 2),
  LOTE INTEGER,
  RUA VARCHAR(50) CHARACTER SET WIN1251 COLLATE WIN1251,
  PRATELEIRA VARCHAR(50) CHARACTER SET WIN1251 COLLATE WIN1251,
  SECAO VARCHAR(50) CHARACTER SET WIN1251 COLLATE WIN1251,
  ESTOQUE NUMERIC(18, 3),
  ESTOQUE_MIN NUMERIC(12, 3));


ALTER TABLE PRODUTOS ADD PRIMARY KEY (CODIGO);


/* Structure for the `USUARIO` table :  */

CREATE TABLE USUARIO (
  CODIGO INTEGER NOT NULL,
  LOGIN VARCHAR(20) CHARACTER SET WIN1251 NOT NULL COLLATE WIN1251,
  SENHA VARCHAR(50) CHARACTER SET WIN1251 NOT NULL COLLATE WIN1251,
  STATUS SMALLINT DEFAULT 1,
  ADMINISTRADOR SMALLINT DEFAULT 0);


ALTER TABLE USUARIO ADD PRIMARY KEY (CODIGO);


/* Definition for the `FK_HESTOQUE_PRODUTO` foreign key :  */

ALTER TABLE HESTOQUE ADD CONSTRAINT FK_HESTOQUE_PRODUTO FOREIGN KEY (PRODUTO) REFERENCES PRODUTOS(CODIGO);


/* Definition for the `BI_CATEGORIA_CODIGO` trigger :  */

SET TERM ^ ;

CREATE TRIGGER BI_CATEGORIA_CODIGO FOR CATEGORIA
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
  IF (NEW.CODIGO IS NULL) THEN
      NEW.CODIGO = GEN_ID(CATEGORIA_CODIGO_GEN, 1);
END^

SET TERM ; ^

/* Definition for the `BI_HESTOQUE_CODIGO` trigger :  */

SET TERM ^ ;

CREATE TRIGGER BI_HESTOQUE_CODIGO FOR HESTOQUE
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
  IF (NEW.CODIGO IS NULL) THEN
      NEW.CODIGO = GEN_ID(HESTOQUE_CODIGO_GEN, 1);
END^

SET TERM ; ^

/* Definition for the `BI_LOTE_CODIGO` trigger :  */

SET TERM ^ ;

CREATE TRIGGER BI_LOTE_CODIGO FOR LOTE
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
  IF (NEW.CODIGO IS NULL) THEN
      NEW.CODIGO = GEN_ID(LOTE_CODIGO_GEN, 1);
END^

SET TERM ; ^

/* Definition for the `BI_MARCA_CODIGO` trigger :  */

SET TERM ^ ;

CREATE TRIGGER BI_MARCA_CODIGO FOR MARCA
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
  IF (NEW.CODIGO IS NULL) THEN
      NEW.CODIGO = GEN_ID(MARCA_CODIGO_GEN, 1);
END^

SET TERM ; ^

/* Definition for the `BI_USUARIO_CODIGO` trigger :  */

SET TERM ^ ;

CREATE TRIGGER BI_USUARIO_CODIGO FOR USUARIO
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
  IF (NEW.CODIGO IS NULL) THEN
      NEW.CODIGO = GEN_ID(USUARIO_CODIGO_GEN, 1);
END^

SET TERM ; ^

/* Definition for the `TRPRODUTOS` trigger :  */

SET TERM ^ ;

CREATE TRIGGER TRPRODUTOS FOR PRODUTOS
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
  IF (NEW.CODIGO IS NULL) THEN
      NEW.CODIGO = GEN_ID(GPRODUTOS, 1);
END^

SET TERM ; ^


/* Definition for the `RDB$ADMIN` role :  */

CREATE ROLE RDB$ADMIN;


/* Privilegies for the `CATEGORIA` :  */

GRANT SELECT, INSERT, DELETE, REFERENCES, UPDATE ON CATEGORIA TO SYSDBA WITH GRANT OPTION;


/* Privilegies for the `HESTOQUE` :  */

GRANT SELECT, INSERT, DELETE, REFERENCES, UPDATE ON HESTOQUE TO SYSDBA WITH GRANT OPTION;


/* Privilegies for the `LOTE` :  */

GRANT SELECT, INSERT, DELETE, REFERENCES, UPDATE ON LOTE TO SYSDBA WITH GRANT OPTION;


/* Privilegies for the `MARCA` :  */

GRANT SELECT, INSERT, DELETE, REFERENCES, UPDATE ON MARCA TO SYSDBA WITH GRANT OPTION;


/* Privilegies for the `PRODUTOS` :  */

GRANT SELECT, INSERT, DELETE, REFERENCES, UPDATE ON PRODUTOS TO SYSDBA WITH GRANT OPTION;


/* Privilegies for the `USUARIO` :  */

GRANT SELECT, INSERT, DELETE, REFERENCES, UPDATE ON USUARIO TO SYSDBA WITH GRANT OPTION;




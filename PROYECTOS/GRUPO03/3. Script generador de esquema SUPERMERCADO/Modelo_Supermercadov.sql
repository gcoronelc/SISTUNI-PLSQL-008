/*
 *
 * DBMS           :  ORACLE
 * Esquema        :  SUPERMERCADO
 * Descripción    :  Modelo de Base de Datos de Supermecado
 * Script         :  Crea el esquema y sus respectivas tablas
 * Creado por     :  Carlos Zapata/ Giovann/ Eder
 * Email          :  carlos.zapata.tixi@gmail.com/
 * Fecha          :  24-03-2019
 * 
*/
-- =============================================
-- CRACIÓN DEL USUARIO
-- =============================================

DECLARE
	N INT;
	COMMAND VARCHAR2(200);
BEGIN
	COMMAND := 'DROP USER SUPERMERCADO CASCADE';
	SELECT COUNT(*) INTO N
	FROM DBA_USERS
	WHERE USERNAME = 'SUPERMERCADO';
	IF ( N = 1 ) THEN
		EXECUTE IMMEDIATE COMMAND;
	END IF;
END;
/


CREATE USER SUPERMERCADO IDENTIFIED BY admin;

GRANT CONNECT, RESOURCE TO SUPERMERCADO;

ALTER USER SUPERMERCADO
QUOTA UNLIMITED ON USERS;

GRANT CREATE VIEW TO SUPERMERCADO;

-- =============================================
-- CONECTARSE A LA APLICACIÓN
-- =============================================

CONNECT SUPERMERCADO/admin

-- ======================================================
-- TABLA DISTRITO
-- ======================================================

CREATE TABLE DISTRITOS (
CODDIS CHAR(4) ,
NOMDIS VARCHAR2(25),
CONSTRAINT DISTRITO_PK PRIMARY KEY (CODDIS)
);

-- ======================================================
-- TABLA CARGOS
-- ======================================================

CREATE TABLE CARGOS (
CODCAR CHAR(4),
NOMCAR VARCHAR2(30),
CONSTRAINT CARGOS_PK PRIMARY KEY (CODCAR)
);

-- ======================================================
-- TABLA MARCAS
-- ======================================================

CREATE TABLE MARCAS (
CODMAR CHAR(4),
NOMMAR VARCHAR2(30),
CONSTRAINT MARCAS_PK PRIMARY KEY (CODMAR)
);
-- ======================================================
-- TABLA CATEGORIAS
-- ======================================================

CREATE TABLE CATEGORIAS (
CODCAT CHAR(4) ,
NOMCAT VARCHAR2(30),
CONSTRAINT CATEGORIAS_PK PRIMARY KEY (CODCAT)
);
-- ======================================================
-- TABLA FORMAS DE PAGO
-- ======================================================

CREATE TABLE FORMAS_PAGO(
CODFOR CHAR(4),
NOMFOR VARCHAR2(25),
CONSTRAINT FORMAS_PAGO_PK PRIMARY KEY (CODFOR)
);

-- ======================================================
-- TABLA LOCALES
-- ======================================================

CREATE TABLE LOCALES (
CODLOC CHAR(4) ,
NOMLOC VARCHAR2(30),
DIREC VARCHAR2(40),
CODDIS CHAR(4) ,
TELEF VARCHAR2(9),
EMAIL VARCHAR2(30),
CONSTRAINT LOCALES_PK PRIMARY KEY (CODLOC),
CONSTRAINT LOCALES_DISTRITOS_FK FOREIGN KEY (CODDIS) REFERENCES DISTRITOS(CODDIS)
);

-- ======================================================
-- TABLA CLIENTES
-- ======================================================

CREATE TABLE CLIENTES (
CODCLI CHAR(4)  ,
NOMCLI VARCHAR2(40)  ,
DIREC VARCHAR2(40) ,
CODDIS CHAR(4) ,
FNAC DATE  ,
SEXO CHAR(1)  ,
TELEF VARCHAR2(9) , 
CONSTRAINT CLIENTES_PK PRIMARY KEY (CODCLI),
CONSTRAINT CLIENTES_DISTRITOS_FK FOREIGN KEY (CODDIS) REFERENCES DISTRITOS(CODDIS)
 );
 
-- ======================================================
-- TABLA PERSONAL
-- ======================================================
CREATE TABLE PERSONAL (
CODPER CHAR(4)  ,
NOMPER VARCHAR(40)  ,
DIREC VARCHAR(40)  ,
CODDIS CHAR(4) ,
FNAC DATE  ,
SEXO CHAR(1)  ,
CODCAR CHAR(4)  ,
SUELDO DECIMAL(7,2),
CONSTRAINT PERSONAL_PK PRIMARY KEY (CODPER),
CONSTRAINT PERSONAL_DISTRITOS_FK FOREIGN KEY (CODDIS) REFERENCES DISTRITOS(CODDIS),
CONSTRAINT PERSONAL_CARGOS_FK FOREIGN KEY (CODCAR) REFERENCES CARGOS(CODCAR)
 );
 
-- ======================================================
-- TABLA PRODUCTOS
-- ======================================================

CREATE TABLE PRODUCTOS (
CODPROD CHAR(6)  ,
NOMPROD VARCHAR(40)  ,
CODMAR CHAR(4)  ,
CODCAT CHAR(4)  ,
PRECIO NUMBER(7,2) ,
STOCK NUMBER(5),
CONSTRAINT PRODUCTOS_PK PRIMARY KEY (CODPROD),
CONSTRAINT PRODUCTOS_MARCAS_FK FOREIGN KEY (CODMAR) REFERENCES MARCAS(CODMAR),  
CONSTRAINT PRODUCTOS_CATEGORIAS_FK FOREIGN KEY (CODCAT) REFERENCES CATEGORIAS(CODCAT)
);

-- ======================================================
-- TABLA COMPROBANTE CABECERA
-- ======================================================
CREATE TABLE COMP_CABECERA (
CODCOM CHAR(6) ,
CODCLI CHAR(4) ,
CODPER CHAR(4),
CODLOC CHAR(4) ,
CODFOR CHAR(4) ,
TIPO_COM CHAR(1) ,
FECHA DATE , 
CONSTRAINT COMP_CABECERA_PK PRIMARY KEY (CODCOM),
CONSTRAINT COMP_CABECERA_CLIENTES_FK FOREIGN KEY (CODCLI) REFERENCES CLIENTES(CODCLI),
CONSTRAINT COMP_CABECERA_PERSONAL_FK FOREIGN KEY (CODPER) REFERENCES PERSONAL(CODPER),
CONSTRAINT COMP_CABECERA_FORMAS_PAGO_FK FOREIGN KEY (CODFOR) REFERENCES FORMAS_PAGO(CODFOR),
CONSTRAINT COMP_CABECERA_LOCALES_FK FOREIGN KEY (CODLOC)  REFERENCES LOCALES(CODLOC)
);


-- ======================================================
-- TABLA COMPROBANTE DETALLE
-- ======================================================

CREATE TABLE COMP_DETALLE (
CODCOM CHAR(6),
CODPROD CHAR(6) ,
CANTIDAD NUMBER(3),
PRECIO NUMBER(7,2) ,
DCTO NUMBER(6,2),
CONSTRAINT COMP_DETALLE_COMP_CABECERA_FK FOREIGN KEY (CODCOM) REFERENCES COMP_CABECERA(CODCOM),
CONSTRAINT COMP_DETALLE_PRODUCTOS_FK 	 FOREIGN KEY (CODPROD) REFERENCES PRODUCTOS(CODPROD)
);
-- ======================================================
-- FIN
-- ======================================================

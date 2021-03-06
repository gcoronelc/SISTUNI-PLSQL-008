
--CREACION DE PACKAGES
-----------------------------------------------------------------------
-- SUPERMERCADO 
-----------------------------------------------------------------------


CREATE OR REPLACE PACKAGE SUPERMERCADO.PKG_CRUD_SUPERMERCADO AS 

--INSERTAR DISTRITO NUEVO --

PROCEDURE INSERTA_DISTRITO (
P_CODDIS IN DISTRITOS.CODDIS%TYPE,
P_NOMBRE IN DISTRITOS.NOMDIS%TYPE,
P_MENSAJE OUT VARCHAR2
);

--INSERTAR NUEVO CLIENTE 
PROCEDURE INSERTA_CLIENTE (
P_CODCLI IN CLIENTES.CODCLI%TYPE,
P_NOMCLI IN CLIENTES.NOMCLI%TYPE,
P_DIREC IN 	CLIENTES.DIREC%TYPE,
P_CODDIS IN CLIENTES.CODDIS%TYPE,
P_FNAC IN 	CLIENTES.FNAC%TYPE,
P_SEXO IN 	CLIENTES.SEXO%TYPE,
P_TELEF IN 	CLIENTES.TELEF%TYPE,
P_MENSAJE OUT VARCHAR2
);


END PKG_CRUD_SUPERMERCADO;
/

--BODY 




CREATE OR REPLACE PACKAGE BODY SUPERMERCADO.PKG_CRUD_SUPERMERCADO as

PROCEDURE INSERTA_CLIENTE (
P_CODCLI IN CLIENTES.CODCLI%TYPE,
P_NOMCLI IN CLIENTES.NOMCLI%TYPE,
P_DIREC IN 	CLIENTES.DIREC%TYPE,
P_CODDIS IN CLIENTES.CODDIS%TYPE,
P_FNAC IN 	CLIENTES.FNAC%TYPE,
P_SEXO IN 	CLIENTES.SEXO%TYPE,
P_TELEF IN 	CLIENTES.TELEF%TYPE,
P_MENSAJE OUT VARCHAR2
)
IS 
V_CONTA NUMBER:=0;
BEGIN
		--EXISTENCIA DE CODIGO DE CLIENTE
	SELECT COUNT(1) INTO V_CONTA 
	FROM  SUPERMERCADO.CLIENTES  
	WHERE  CODCLI=P_CODCLI ;
	--ASIGNANDO VALOR 
	IF V_CONTA > 0 THEN 	
    RAISE_APPLICATION_ERROR(-20001, 'EL CLIENTE YA SE ENCUENTRA REGISTRADO ');
	END IF;
	--PROCESO
	INSERT INTO SUPERMERCADO.CLIENTES(CODCLI,NOMCLI,DIREC,CODDIS,FNAC,SEXO,TELEF)  
	VALUES (P_CODCLI,P_NOMCLI,P_DIREC,P_CODDIS,P_FNAC,P_SEXO,P_TELEF);
	commit;
    EXCEPTION 
	WHEN OTHERS THEN 
	P_MENSAJE := TO_CHAR(sqlcode) || ' - ' || SQLERRM;
    
    
END INSERTA_CLIENTE;

--DISTRITO - OK 


PROCEDURE INSERTA_DISTRITO (
P_CODDIS IN DISTRITOS.CODDIS%TYPE,
P_NOMBRE IN DISTRITOS.NOMDIS%TYPE,
P_MENSAJE OUT VARCHAR2 )
IS
V_CONTA NUMBER:=0;
BEGIN
	--EXISTENCIA DE CODIGO DE DISTRITO
	SELECT COUNT(1) INTO V_CONTA 
	FROM  SUPERMERCADO.DISTRITOS
	WHERE CODDIS=P_CODDIS;
	
	--ASIGNANDO VALOR 
	IF V_CONTA > 0 THEN 	
    RAISE_APPLICATION_ERROR(-20001, 'CODIGO DE DISTRITO YA EXISTE');
	END IF;
	
	--PROCESO
    INSERT INTO SUPERMERCADO.DISTRITOS(CODDIS,NOMDIS) VALUES (P_CODDIS,P_NOMBRE);
    commit;
    EXCEPTION 
	WHEN OTHERS THEN 
	P_MENSAJE := TO_CHAR(sqlcode) || ' - ' || SQLERRM;
END INSERTA_DISTRITO;

END PKG_CRUD_SUPERMERCADO;

/*

   select * from SUPERMERCADO.DISTRITOS
   
   
DECLARE
  p_mensaje VARCHAR2(100);
BEGIN
  SUPERMERCADO.PKG_CRUD_SUPERMERCADO.INSERTA_DISTRITO ('D007', 'VILLA2',p_mensaje);
  DBMS_OUTPUT.PUT_LINE(p_mensaje);
END;


*/

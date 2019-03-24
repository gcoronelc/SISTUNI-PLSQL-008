CREATE OR REPLACE PACKAGE HOTEL.PKG_CRUD_CLIENTE AS
  
  PROCEDURE INSERTAR_CLI(
    P_NOMBRES       IN HOTEL.CLIENTE.NOMBRES%TYPE,
    P_APP           IN HOTEL.CLIENTE.APP%TYPE,
    P_APM           IN HOTEL.CLIENTE.APM%TYPE,
    P_DNI           IN HOTEL.CLIENTE.DNI%TYPE,
    P_RUC           IN HOTEL.CLIENTE.RUC%TYPE,
    P_RAZONSOCIAL   IN HOTEL.CLIENTE.RAZONSOCIAL%TYPE,
    P_CELULAR       IN HOTEL.CLIENTE.CELULAR%TYPE,
    P_CORREO        IN HOTEL.CLIENTE.CORREO%TYPE,
    P_PASSWORD      IN HOTEL.CLIENTE.PASSWORD%TYPE
  );
  
  PROCEDURE ACTUALIZAR_CLI(
    P_CODIGO        IN HOTEL.CLIENTE.ID%TYPE,
    P_NOMBRES       IN HOTEL.CLIENTE.NOMBRES%TYPE,
    P_APP           IN HOTEL.CLIENTE.APP%TYPE,
    P_APM           IN HOTEL.CLIENTE.APM%TYPE,
    P_DNI           IN HOTEL.CLIENTE.DNI%TYPE,
    P_RUC           IN HOTEL.CLIENTE.RUC%TYPE,
    P_RAZONSOCIAL   IN HOTEL.CLIENTE.RAZONSOCIAL%TYPE,
    P_CELULAR       IN HOTEL.CLIENTE.CELULAR%TYPE,
    P_CORREO        IN HOTEL.CLIENTE.CORREO%TYPE,
    P_PASSWORD      IN HOTEL.CLIENTE.PASSWORD%TYPE
  );
  
  PROCEDURE ELIMINAR_CLI(
    P_CODIGO IN HOTEL.CLIENTE.ID%TYPE
  );
  
  PROCEDURE LISTAR_CLIS(
    P_NOMBRES       IN HOTEL.CLIENTE.NOMBRES%TYPE,
    P_APP           IN HOTEL.CLIENTE.APP%TYPE,
    P_APM           IN HOTEL.CLIENTE.APM%TYPE,
    P_DNI           IN HOTEL.CLIENTE.DNI%TYPE,
    P_CORREO        IN HOTEL.CLIENTE.CORREO%TYPE,
    P_CURSOR OUT NOCOPY SYS_REFCURSOR
  );
  
END PKG_CRUD_CLIENTE;
/

CREATE OR REPLACE PACKAGE BODY HOTEL.PKG_CRUD_CLIENTE AS 

  PROCEDURE INSERTAR_CLI(
    P_NOMBRES       IN HOTEL.CLIENTE.NOMBRES%TYPE,
    P_APP           IN HOTEL.CLIENTE.APP%TYPE,
    P_APM           IN HOTEL.CLIENTE.APM%TYPE,
    P_DNI           IN HOTEL.CLIENTE.DNI%TYPE,
    P_RUC           IN HOTEL.CLIENTE.RUC%TYPE,
    P_RAZONSOCIAL   IN HOTEL.CLIENTE.RAZONSOCIAL%TYPE,
    P_CELULAR       IN HOTEL.CLIENTE.CELULAR%TYPE,
    P_CORREO        IN HOTEL.CLIENTE.CORREO%TYPE,
    P_PASSWORD      IN HOTEL.CLIENTE.PASSWORD%TYPE
  )
  AS
    v_cont number;
    v_exception1 EXCEPTION;
  BEGIN
  
    --consultar DNI
    
    SELECT count(1) INTO v_cont
        FROM HOTEL.CLIENTE
        WHERE DNI = P_DNI;
    
    IF v_cont =1 then
        RAISE v_exception1;
    END IF;
  
    INSERT INTO HOTEL.CLIENTE(NOMBRES, APP, APM, DNI, RUC, RAZONSOCIAL, CELULAR, CORREO, PASSWORD)  
    VALUES (P_NOMBRES, P_APP, P_APM, P_DNI, P_RUC, P_RAZONSOCIAL, P_CELULAR, P_CORREO, P_PASSWORD);
    
  EXCEPTION
  
    WHEN v_exception1 THEN
        RAISE_APPLICATION_ERROR(-20000, 'YA EXISTE DNI');
  
    WHEN OTHERS THEN 
        DBMS_OUTPUT.put_line(SQLERRM);
        
    COMMIT;  
  
  END INSERTAR_CLI;

  
  PROCEDURE ACTUALIZAR_CLI(
    P_CODIGO        IN HOTEL.CLIENTE.ID%TYPE,
    P_NOMBRES       IN HOTEL.CLIENTE.NOMBRES%TYPE,
    P_APP           IN HOTEL.CLIENTE.APP%TYPE,
    P_APM           IN HOTEL.CLIENTE.APM%TYPE,
    P_DNI           IN HOTEL.CLIENTE.DNI%TYPE,
    P_RUC           IN HOTEL.CLIENTE.RUC%TYPE,
    P_RAZONSOCIAL   IN HOTEL.CLIENTE.RAZONSOCIAL%TYPE,
    P_CELULAR       IN HOTEL.CLIENTE.CELULAR%TYPE,
    P_CORREO        IN HOTEL.CLIENTE.CORREO%TYPE,
    P_PASSWORD      IN HOTEL.CLIENTE.PASSWORD%TYPE
  )
  AS
  BEGIN
  
	UPDATE HOTEL.CLIENTE
    SET
      NOMBRES=P_NOMBRES, 
      APP=P_APP, 
      APM=P_APM, 
      DNI=P_DNI,
      RUC=P_RUC,
      RAZONSOCIAL=P_RAZONSOCIAL,
      CELULAR=P_CELULAR,
      CORREO=P_CORREO,
      PASSWORD=P_PASSWORD
    WHERE ID=P_CODIGO; 
    
  EXCEPTION
  
    WHEN OTHERS THEN 
        DBMS_OUTPUT.put_line(SQLERRM);
        
    COMMIT;  
    
  END ACTUALIZAR_CLI;
  
  PROCEDURE ELIMINAR_CLI(
    P_CODIGO IN HOTEL.CLIENTE.ID%TYPE
  )
  AS
  BEGIN
  
	UPDATE HOTEL.CLIENTE SET ESTADO=0 WHERE ID=P_CODIGO;
    
  EXCEPTION
  
    WHEN OTHERS THEN 
        DBMS_OUTPUT.put_line(SQLERRM);
        
    COMMIT; 
    
  END ELIMINAR_CLI;
  
  PROCEDURE LISTAR_CLIS(
    P_NOMBRES       IN HOTEL.CLIENTE.NOMBRES%TYPE,
    P_APP           IN HOTEL.CLIENTE.APP%TYPE,
    P_APM           IN HOTEL.CLIENTE.APM%TYPE,
    P_DNI           IN HOTEL.CLIENTE.DNI%TYPE,
    P_CORREO        IN HOTEL.CLIENTE.CORREO%TYPE,
    P_CURSOR        OUT NOCOPY SYS_REFCURSOR
  )
  AS
    V_APP     VARCHAR2(100);
    V_APM     VARCHAR2(100);
    V_NOMBRE  VARCHAR2(100);
    V_RUC  VARCHAR2(100);
    V_RAZONSOCIAL  VARCHAR2(100);
    V_CORREO  VARCHAR2(100);
  BEGIN
    -- Preparando Variables
    V_APP       := '%' || P_APP || '%';
    V_APM       := '%' || P_APM || '%';
    V_NOMBRE    := '%' || P_NOMBRES   || '%';
    V_CORREO       := '%' || P_CORREO   || '%';
    
    OPEN P_CURSOR FOR
    SELECT *  
    FROM HOTEL.CLIENTE
    WHERE APP       LIKE NVL2(P_APP,V_APP,APP)
    AND   APM       LIKE NVL2(P_APM,V_APM,APM) 
    AND   NOMBRES   LIKE NVL2(P_NOMBRES,V_NOMBRE,NOMBRES)
    AND   DNI   = NVL2(P_DNI,P_DNI,DNI)
    AND   CORREO   LIKE NVL2(P_CORREO,V_CORREO,CORREO);

  END LISTAR_CLIS;
  
END PKG_CRUD_CLIENTE;


DECLARE
v_nombre varchar2(45);
v_app varchar2(45);
v_apm varchar2(45);
v_dni number;
v_ruc varchar2(45);
v_razonsocial varchar2(45);
v_celular varchar2(45);
v_correo varchar2(45);
v_pass varchar2(45);
BEGIN

    v_nombre := 'test';
    v_app := 'test';
    v_apm := 'test';
    v_dni := 48299677;
    v_ruc := null;
    v_razonsocial := null;
    v_celular := '999999991'; 
    v_correo := 'example@gmail.com';
    v_pass := '12345'; 
    
    HOTEL.PKG_CRUD_CLIENTE.INSERTAR_CLI(v_nombre,v_app,v_apm,v_dni,v_ruc,v_razonsocial,v_celular,v_correo,v_pass);
END;
/

DECLARE
v_id number;
v_nombre varchar2(45);
v_app varchar2(45);
v_apm varchar2(45);
v_dni number;
v_ruc varchar2(45);
v_razonsocial varchar2(45);
v_celular varchar2(45);
v_correo varchar2(45);
v_pass varchar2(45);
BEGIN
    v_id :=4;
    v_nombre := 'test';
    v_app := 'test';
    v_apm := 'test';
    v_dni := 48299677;
    v_ruc := null;
    v_razonsocial := null;
    v_celular := '999999999'; 
    v_correo := 'example2@gmail.com';
    v_pass := 'EEEE'; 
    
    HOTEL.PKG_CRUD_CLIENTE.ACTUALIZAR_CLI(v_id,v_nombre,v_app,v_apm,v_dni,v_ruc,v_razonsocial,v_celular,v_correo,v_pass);
END;
/

DECLARE
v_id number;
BEGIN
    v_id :=1;
    HOTEL.PKG_CRUD_CLIENTE.ELIMINAR_CLI(v_id);
END;
/



declare
  c_clis        SYS_REFCURSOR;
  v_nombres     number(5);
  v_app         varchar2(50);
  v_apm         varchar2(50);
  v_dni         number;
  v_correo      varchar2(50);
  reg           hotel.cliente%rowtype;
begin
  -- datos
  v_nombres     := null;
  v_app         := 't';
  v_apm         := null;
  v_dni         := null;
  v_correo      := null;
  
  
  -- Proceso
  HOTEL.PKG_CRUD_CLIENTE.LISTAR_CLIS(v_nombres,v_app,v_apm,v_dni,v_correo,c_clis);
  
  -- Mostrar cursor
  LOOP
    -- Leer fila
    FETCH c_clis INTO reg;
    EXIT WHEN c_clis%NOTFOUND;
    -- Mostrar fila
    dbms_output.put_line(reg.nombres || ', ' || reg.dni);
  END LOOP;
  
end;
/
SELECT * FROM HOTEL.CLIENTE;


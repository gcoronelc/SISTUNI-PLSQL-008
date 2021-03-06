
CREATE OR REPLACE PROCEDURE RECURSOS.SP_GET_DEPARTAMENTO
(
  P_CODDEP IN  NUMBER,
  P_NOMBRE OUT NOCOPY VARCHAR2,
  P_CIUDAD OUT NOCOPY VARCHAR2
)
IS
  V_EXCEPTION1  EXCEPTION;
  V_EXCEPTION2  EXCEPTION;
  V_CONTA       NUMBER(5);
  V_UBICACION   CHAR(3);
BEGIN

  -- Leer nombre de departamento y la ubicacion
  SELECT COUNT(1) INTO V_CONTA
  FROM   RECURSOS.DEPARTAMENTO
  WHERE  IDDEPARTAMENTO = P_CODDEP;
  
  IF V_CONTA = 0 THEN
    RAISE V_EXCEPTION1;
  END IF;
  
  SELECT NOMBRE,    IDUBICACION 
  INTO   P_NOMBRE, V_UBICACION
  FROM   RECURSOS.DEPARTAMENTO
  WHERE  IDDEPARTAMENTO = P_CODDEP;
  
  -- Leer la ciudad
  SELECT COUNT(1) INTO V_CONTA
  FROM   RECURSOS.UBICACION
  WHERE  IDUBICACION = V_UBICACION;
  
  IF V_CONTA = 0 THEN
    RAISE V_EXCEPTION2;
  END IF;
  
  SELECT CIUDAD INTO P_CIUDAD
  FROM   RECURSOS.UBICACION
  WHERE  IDUBICACION = V_UBICACION;
  
EXCEPTION

  WHEN V_EXCEPTION1 THEN
    RAISE_APPLICATION_ERROR(-20000, 'No existe el codigo del departamento.');
    
  WHEN V_EXCEPTION2 THEN
    RAISE_APPLICATION_ERROR(-20001, 'No se encontro su ubicacion.');

END;
/


insert into recursos.departamento
values(200,'algo',null);

commit;


DECLARE
  V_CODDEP   NUMBER(6);
  V_NOMBRE   VARCHAR2(100);
  V_CIUDAD   VARCHAR2(100);  
BEGIN
  -- Dato
  V_CODDEP := 100;
  -- Proceso
  RECURSOS.SP_GET_DEPARTAMENTO(V_CODDEP,V_NOMBRE,V_CIUDAD);
  -- Reporte
  DBMS_OUTPUT.PUT_LINE('NOMBRE: ' || V_NOMBRE);
  DBMS_OUTPUT.PUT_LINE('CIUDAD: ' || V_CIUDAD);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/



DECLARE
  V_CODDEP   NUMBER(6);
  V_NOMBRE   VARCHAR2(100);
  V_CIUDAD   VARCHAR2(100);  
BEGIN
  -- Dato
  V_CODDEP := 43567;
  -- Proceso
  RECURSOS.SP_GET_DEPARTAMENTO(V_CODDEP,V_NOMBRE,V_CIUDAD);
  -- Reporte
  DBMS_OUTPUT.PUT_LINE('NOMBRE: ' || V_NOMBRE);
  DBMS_OUTPUT.PUT_LINE('CIUDAD: ' || V_CIUDAD);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/



DECLARE
  V_CODDEP   NUMBER(6);
  V_NOMBRE   VARCHAR2(100);
  V_CIUDAD   VARCHAR2(100);  
BEGIN
  -- Dato
  V_CODDEP := 200;
  -- Proceso
  RECURSOS.SP_GET_DEPARTAMENTO(V_CODDEP,V_NOMBRE,V_CIUDAD);
  -- Reporte
  DBMS_OUTPUT.PUT_LINE('NOMBRE: ' || V_NOMBRE);
  DBMS_OUTPUT.PUT_LINE('CIUDAD: ' || V_CIUDAD);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/










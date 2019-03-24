
CREATE OR REPLACE PACKAGE RECURSOS.PKG_EGCC_UTIL IS

TYPE T_ARRAY_STRING IS TABLE OF VARCHAR2(1000)INDEX BY BINARY_INTEGER;

FUNCTION SPLIT(P_DATA VARCHAR2, P_DELIMITADOR VARCHAR2 ) RETURN T_ARRAY_STRING;

FUNCTION IS_DATE(P_FECHA IN VARCHAR2) 
RETURN NUMBER;

END;
/


CREATE OR REPLACE PACKAGE BODY recursos.pkg_egcc_util IS

FUNCTION SPLIT(p_data VARCHAR2, p_delimitador VARCHAR2 ) RETURN t_array_string
IS
    I        NUMBER   := 0;
    pos      NUMBER   := 0;
    v_data   CLOB     := p_data;
    strings  t_array_string;
BEGIN
  v_data := TRIM( v_data );
  pos := instr( v_data, p_delimitador, 1, 1 );
  WHILE ( pos != 0) LOOP
      I := I + 1;
      strings(I) := substr( v_data, 1, pos - 1 );
      v_data :=  substr( v_data, pos + 1, LENGTH(v_data) );
      pos := instr(v_data, p_delimitador, 1, 1);
      IF pos = 0 THEN
          strings( I + 1 ) := v_data;
      END IF;    
  END LOOP;
  IF I = 0 AND LENGTH( v_data ) > 0 THEN
    strings( I + 1 ) := v_data;
  END IF;
  RETURN strings;
END SPLIT;


FUNCTION is_date(p_fecha IN VARCHAR2) 
RETURN NUMBER 
IS
    v_fecha DATE;
BEGIN
  v_fecha := TO_DATE(p_fecha,'DD/MM/YYYY');
  RETURN 1;
EXCEPTION
  WHEN OTHERS THEN
    RETURN -1;
END;

END;
/


create or replace PROCEDURE recursos.SP_INSERTA_EMPS
( P_DATOS IN VARCHAR2 )
AS
  V_FILAS    recursos.PKG_EGCC_UTIL.T_ARRAY_STRING;
  V_CAMPOS   recursos.PKG_EGCC_UTIL.T_ARRAY_STRING;
  V_SAL_PROM NUMBER(7,2);
BEGIN
  DBMS_OUTPUT.PUT_LINE('INICIO DEL PROCESO');
  V_FILAS := recursos.PKG_EGCC_UTIL.SPLIT(P_DATOS,'¬');
  FOR I in 1 .. V_FILAS.COUNT LOOP 

    V_CAMPOS := recursos.PKG_EGCC_UTIL.SPLIT(V_FILAS(I),'|');

    SELECT  ((max(sueldo) + min(sueldo))/2) INTO V_SAL_PROM
    FROM recursos.EMPLEADO WHERE idcargo = V_CAMPOS(3);  


    INSERT INTO RECURSOS.EMPLEADO(IDEMPLEADO,apellido, NOMBRE,FECINGRESO, IDCARGO, SUELDO,IDDEPARTAMENTO )
    VALUES(V_CAMPOS(1),'prueba', V_CAMPOS(2),sysdate(), V_CAMPOS(3), V_SAL_PROM, 100);


    DBMS_OUTPUT.PUT_LINE(V_CAMPOS(1) || ' - ' || V_SAL_PROM);

  END LOOP;

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('PROCESO OK');

EXCEPTION

  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    ROLLBACK;
END;
/


DECLARE
  V_DATOS VARCHAR2(6000);
BEGIN
  V_DATOS := '1174|KARLA|C05¬1175|LEONOR|C05¬1176|DELIA|C05';
  recursos.SP_INSERTA_EMPS (V_DATOS);
END;


SELECT * FROM RECURSOS.EMPLEADO;



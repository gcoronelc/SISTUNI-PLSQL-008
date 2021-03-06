
/*
ACTUALIZAR EL SALARIO DE UN EMPLEADO
*/

CREATE OR REPLACE PROCEDURE SCOTT.PR_ACTUALIZA_SALARIO
(
  P_CODIGO    IN NUMBER,
  P_PORC_INC  IN NUMBER,
  P_NUEVO_SAL OUT NOCOPY NUMBER
)
AS
BEGIN
  
  UPDATE SCOTT.EMP
  SET SAL = SAL * ( 1 + P_PORC_INC / 100 )
  WHERE EMPNO = P_CODIGO
  RETURNING SAL INTO P_NUEVO_SAL;
  
  COMMIT;
  
END;

DECLARE
  V_CODIGO    NUMBER;
  V_PORC_INC  NUMBER;
  V_NUEVO_SAL NUMBER;
BEGIN
  -- DATO
  V_CODIGO   := 7369;
  V_PORC_INC := 10;
  -- PROCESO
  SCOTT.PR_ACTUALIZA_SALARIO(V_CODIGO,V_PORC_INC,V_NUEVO_SAL);
  -- REPORTE
  DBMS_OUTPUT.PUT_LINE('NUEVO SALARIO: ' || V_NUEVO_SAL);
END;
/






CREATE OR REPLACE PROCEDURE SCOTT.REGISTRO2
(
	P_COD DEPT.DEPTNO%TYPE
)
IS
	R DEPT%ROWTYPE;
BEGIN
  SELECT * INTO R
  FROM DEPT
  WHERE DEPTNO = P_COD;
  dbms_output.PUT_LINE('C�digo: ' || R.DEPTNO);
  dbms_output.PUT_LINE('Nombre: ' || R.DNAME);
  dbms_output.PUT_LINE('Localizaci�n: ' || R.LOC);
END;

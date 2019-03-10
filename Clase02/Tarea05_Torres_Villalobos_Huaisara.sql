CREATE OR REPLACE PROCEDURE SCOTT.REGISTRO
(
	P_COD EMP.EMPNO%TYPE
)
IS
	TYPE reg IS RECORD(
		NOMBRE EMP.ENAME%TYPE,
		SALARIO EMP.SAL%TYPE
	);
	R reg;
BEGIN
  SELECT ENAME, SAL INTO R
  FROM EMP 
  WHERE EMPNO = P_COD;
  dbms_output.PUT_LINE('Nombre: ' || R.NOMBRE);
  dbms_output.PUT_LINE('Salario: ' || R.SALARIO);
END;


call SCOTT.REGISTRO(7369);


select * from scott.emp;




CREATE OR REPLACE PROCEDURE scott.pr106( cod dept.deptno%type)
IS
	r dept%ROWTYPE;
BEGIN
	
	SELECT * INTO r
		FROM dept WHERE deptno = cod;
	
	DBMS_OUTPUT.PUT_LINE('Codigo: ' || r.deptno);
	DBMS_OUTPUT.PUT_LINE('Nombre: ' || r.dname);
	DBMS_OUTPUT.PUT_LINE('Localización: ' || r.loc);
	
END;


call scott.pr106(10);


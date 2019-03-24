-- =======================================================
-- DEFINICION DEL PAQUETE
-- =======================================================

CREATE OR REPLACE PACKAGE SCOTT.UTIL2 IS

  TYPE GENCUR IS REF CURSOR;
  
  REC_EMP SCOTT.EMP%ROWTYPE; 

  FUNCTION F_EMP_X_DEP( P_DEPTNO NUMBER ) RETURN GENCUR;

END UTIL2;
/

-- =======================================================
-- IMPLEMENTACION DEL PAQUETE
-- =======================================================
CREATE OR REPLACE PACKAGE BODY SCOTT.UTIL2 AS

  FUNCTION F_EMP_X_DEP( P_DEPTNO NUMBER ) RETURN GENCUR
  IS
    V_RETURNCURSOR GENCUR;
    V_SELECT VARCHAR(500);
  BEGIN
    
    V_SELECT := 'SELECT * FROM SCOTT.EMP WHERE DEPTNO = :CODIGO';
    
    OPEN V_RETURNCURSOR 
    FOR V_SELECT
    USING P_DEPTNO;
    
    RETURN V_RETURNCURSOR;
    
  END;

END UTIL2;
/



declare
  v_cur util2.gencur;
  r     scott.emp%rowtype;
begin
  v_cur := scott.util2.f_emp_x_dep(30);
  fetch v_cur into r;
  dbms_output.put_line( to_char(v_cur%rowcount) || ' ' || r.ename );
  close v_cur;
end;
/


declare
  v_cur util2.gencur;
  r     emp%rowtype;
begin
  v_cur := util2.f_emp_x_dep(30);
  fetch v_cur into r;
  while v_cur%found loop
    dbms_output.put_line( to_char(v_cur%rowcount) || ' ' || r.ename );
    fetch v_cur into r;
  end loop;
  close v_cur;
end;
/

GRANT EXECUTE ON SCOTT.UTIL2 TO APPSCOTT;




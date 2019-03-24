
-- PRUEBA DE UTIL

declare
  v_cur scott.util.gencur;
  --r     SCOTT.emp%rowtype;
begin
  V_CUR := SCOTT.UTIL.F_EMP_X_DEP(20);
  fetch v_cur into SCOTT.UTIL.REC_EMP;
  while v_cur%found loop
    dbms_output.put_line( to_char(v_cur%rowcount) || ' ' || SCOTT.UTIL.REC_EMP.ename );
    fetch v_cur into SCOTT.UTIL.REC_EMP;
  end loop;
  close v_cur;
end;
/

-- PRUEBA DE UTIL2

declare
  V_CUR SCOTT.UTIL2.GENCUR;
begin
  V_CUR := SCOTT.UTIL2.F_EMP_X_DEP(20);
  fetch v_cur into SCOTT.UTIL2.REC_EMP;
  while v_cur%found loop
    dbms_output.put_line( to_char(v_cur%rowcount) || ' ' || SCOTT.UTIL2.REC_EMP.ename );
    fetch v_cur into SCOTT.UTIL2.REC_EMP;
  end loop;
  close v_cur;
end;
/


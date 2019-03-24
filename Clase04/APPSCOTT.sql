

declare
  v_cur scott.util.gencur;
  --r     SCOTT.emp%rowtype;
begin
  v_cur := scott.util.f_emp_x_dep(20);
  fetch v_cur into SCOTT.UTIL.REC_EMP;
  while v_cur%found loop
    dbms_output.put_line( to_char(v_cur%rowcount) || ' ' || SCOTT.UTIL.REC_EMP.ename );
    fetch v_cur into SCOTT.UTIL.REC_EMP;
  end loop;
  close v_cur;
end;
/



declare
  -- 1.- declarar cursor
  cursor c_emps is select * from scott.emp;
  reg    scott.emp%rowtype;
begin
  -- 2.- Abrir cursor
  open c_emps;
  -- 3.- extraer el primer registro
  fetch c_emps into reg;
  dbms_output.put_line('Registro: ' || c_emps%rowcount);
  dbms_output.put_line(reg.ename);
  -- 3.- extraer el segundo registro
  fetch c_emps into reg;
  dbms_output.put_line('Registro: ' || c_emps%rowcount);
  dbms_output.put_line(reg.ename);  
  -- 4.- Cerrar el cursor
  close c_emps;
end;
/


declare
  -- 1.- declarar cursor
  cursor c_emps is select * from scott.emp;
  reg    scott.emp%rowtype;
begin
  -- 2.- Abrir cursor
  open c_emps;
  -- 3.- extraer el primer registro
  LOOP
    -- Leer una fila
    FETCH c_emps INTO reg;
    EXIT WHEN c_emps%NOTFOUND;
    -- Mostrar la fila
    dbms_output.put_line('Registro: ' || c_emps%rowcount || '.- ' || reg.ename);
  END LOOP;
  -- 4.- Cerrar el cursor
  close c_emps;
end;
/


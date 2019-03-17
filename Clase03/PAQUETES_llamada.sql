

declare
  c_emps SYS_REFCURSOR;
  v_ape  varchar2(50);
  v_nom  varchar2(50);
  v_dep  number(5);
  v_car  varchar2(50);
  reg    recursos.empleado%rowtype;
begin
  -- datos
  v_ape := 'a';
  v_nom := null;
  v_dep := null;
  v_car := null;
  
  -- Proceso
  RECURSOS.PKG_CRUD_EMPLEADOS.GET_EMPS(v_ape, v_nom, v_dep, v_car, c_emps);
  
  -- Mostrar cursor
  LOOP
    -- Leer fila
    FETCH c_emps INTO reg;
    EXIT WHEN c_emps%NOTFOUND;
    -- Mostrar fila
    dbms_output.put_line(reg.apellido || ', ' || reg.nombre);
  END LOOP;
  
end;
/


-- Insertar un Tipo de Convocatoria
declare
  V_DESCRIPCION   varchar2(50);
  V_CO_REG        varchar2(50);
  V_DE_REG        varchar2(50);
  V_ES_REG        char(1);
  V_CONT          number;
begin
  -- Datos
  V_DESCRIPCION := 'PRUEBA';

  -- Proceso
  PK_TIPO_CONVOCATORIA.AGREGAR(V_DESCRIPCION, V_CO_REG, V_DE_REG, V_ES_REG, V_CONT);
  -- Mostrar datos registro insertado
  if V_CONT != 0 then
     dbms_output.put_line('REGISTRO INSERTADO - CÓDIGO: ' || V_CO_REG || '  DESCRIPCIÓN: ' || V_DE_REG || '  ESTADO: ' || V_ES_REG);
  end if;
end;

/*
	    select SQ_TIPO_CONVOCATORIA.NEXTVAL
        from   dual;
*/

-- Modificar un Tipo de Convocatoria
declare
  V_CODIGO        integer;
  V_DESCRIPCION   varchar2(50);
  V_ESTADO        char(1);
  V_CO_REG        varchar2(50);
  V_DE_REG        varchar2(50);
  V_ES_REG        char(1);
  V_CONT          number;
begin
  -- Datos
  V_CODIGO      := 3;
  V_DESCRIPCION := 'CAPA';
  V_ESTADO      := '1';

  -- Proceso
  PK_TIPO_CONVOCATORIA.MODIFICAR(V_CODIGO, V_DESCRIPCION, V_ESTADO, V_CO_REG, V_DE_REG, V_ES_REG, V_CONT);
  -- Mostrar datos registro modificado
  if V_CONT = 0 then
     dbms_output.put_line('NO SE PUDO MODIFICAR');
  else
     dbms_output.put_line('REGISTRO MODIFICADO - CÓDIGO: ' || V_CO_REG || '  DESCRIPCIÓN: ' || V_DE_REG || '  ESTADO: ' || V_ES_REG);
  end if;
end;


-- Eliminado lógico de un Tipo de Convocatoria
declare
  V_CODIGO        integer;
  V_CO_REG        varchar2(50);
  V_DE_REG        varchar2(50);
  V_ES_REG        char;
  V_CONT          number;
begin
  -- Datos
  V_CODIGO := 25;

  -- Proceso
  PK_TIPO_CONVOCATORIA.ELIMINAR_LOGICO(V_CODIGO, V_CO_REG, V_DE_REG, V_ES_REG, V_CONT);
  -- Mostrar datos eliminados lógicamente
  if V_CONT = 0 then
       dbms_output.put_line('NO SE PUDO ELIMINAR');
  else
       dbms_output.put_line('REGISTRO ELIMINADO LÓGICAMENTE - CÓDIGO: ' || V_CO_REG || '  DESCRIPCIÓN: ' || V_DE_REG || '  ESTADO: ' || V_ES_REG);
  end if;
end;


-- Eliminado físico de un Tipo de Convocatoria
declare
  V_CODIGO        integer;
  V_CO_REG        varchar2(50);
  V_DE_REG        varchar2(50);
  V_ES_REG        char;
  V_CONT          number;
begin
  -- Datos
  V_CODIGO := 24;

  -- Proceso
  PK_TIPO_CONVOCATORIA.ELIMINAR_FISICO(V_CODIGO, V_CO_REG, V_DE_REG, V_ES_REG, V_CONT);
  -- Mostrar datos eliminados fíicamente
  if V_CONT = 0 then
       dbms_output.put_line('NO SE PUDO ELIMINAR');
  else
       dbms_output.put_line('REGISTRO ELIMINADO FÍSICAMENTE - CÓDIGO: ' || V_CO_REG || '  DESCRIPCIÓN: ' || V_DE_REG || '  ESTADO: ' || V_ES_REG);
  end if;
end;


-- Consulta con filtro de Tipo de Convocatoria
declare
  C_TC            sys_refcursor;
  V_CODIGO        integer;
  V_DESCRIPCION   varchar2(50);
  V_ESTADO        char(1);
  V_CONT          number;
  REG             TIPO_CONVOCATORIA%rowtype;
begin
  -- Datos
  V_CODIGO      := null;
  V_DESCRIPCION := 'PRO';
  V_ESTADO      := null;
  V_CONT        := 0;
  -- Proceso
  PK_TIPO_CONVOCATORIA.CONSULTAR_REGISTRO(V_CODIGO, V_DESCRIPCION, V_ESTADO, C_TC);
  
  -- Mostrar cursor
  loop
    -- Leer fila
    fetch C_TC into REG;
    exit when C_TC%notfound;
    V_CONT := V_CONT + 1;
    -- Mostrar fila
    dbms_output.put_line(REG.CO_TIPO || ' - ' || REG.DE_TIPO || ' - ' || REG.IN_ESTADO);
  end loop;
  
  if V_CONT = 0 then
     dbms_output.put_line('NO EXISTEN REGISTROS');
  end if;
end;


-- Consultar los Tipos de Convocatoria
declare
  C_TC    sys_refcursor;
  V_CONT  number;
  REG     TIPO_CONVOCATORIA%rowtype;
begin
  -- Datos
  V_CONT        := 0;
  -- Proceso
  PK_TIPO_CONVOCATORIA.CONSULTAR_TODOS(C_TC);
  
  -- Mostrar cursor
  loop
    -- Leer fila
    fetch C_TC into REG;
    exit when C_TC%notfound;
    V_CONT := V_CONT + 1;
    -- Mostrar fila
    dbms_output.put_line(REG.CO_TIPO || ' - ' || REG.DE_TIPO || ' - ' || REG.IN_ESTADO);
  end loop;
  
  if V_CONT = 0 then
     dbms_output.put_line('NO EXISTEN REGISTROS');
  end if;
end;

SELECT * FROM TIPO_CONVOCATORIA

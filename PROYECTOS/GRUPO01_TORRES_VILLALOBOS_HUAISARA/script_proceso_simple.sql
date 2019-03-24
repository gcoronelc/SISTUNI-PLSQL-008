-- ASIGNAR UNA CONVOCATORIA A UN ASISTENTE

create or replace procedure SP_ASIGNAR_CONVOCATORIA(
  P_CO_ASISTENTE in integer,
  P_NU_CONV in char,
  P_AN_CONV in char,
  P_CO_TIPO_CONV in integer,
  P_MENSAJE out nocopy varchar2
)
is
  V_CONT_ASIS       number := 0;
  V_CONT_CONV       number := 0;
  V_CONT_CONV_ASIG  number := 0;
  V_OK              number := 0;
begin
  -- Verificar el asistente
  select count(CO_ASISTENTE)
  into   V_CONT_ASIS
  from   ASISTENTE
  where  CO_ASISTENTE = P_CO_ASISTENTE
  and    IN_ESTADO = '1';
  
  if V_CONT_ASIS = 0 then
     P_MENSAJE := 'EL ASISTENTE NO SE ENCUENTRA REGISTRADO';
     return;
  end if;
  
  -- Verificar la convocatoria
  select count(NU_CONV)
  into   V_CONT_CONV
  from   CONVOCATORIA
  where  NU_CONV   = P_NU_CONV
  and    AN_CONV   = P_AN_CONV
  and    CO_TIPO   = P_CO_TIPO_CONV
  and    IN_ESTADO = '1';
  
  if V_CONT_CONV = 0 then
     P_MENSAJE := 'LA CONVOCATORIA NO SE ENCUENTRA REGISTRADA';
     return;
  end if;
  
  -- Proceso
  select count(CO_ASISTENTE)
  into   V_CONT_CONV_ASIG
  from   ASIGNA_CONVOCATORIA
  where  CO_ASISTENTE = P_CO_ASISTENTE
  and    NU_CONV      = P_NU_CONV
  and    AN_CONV      = P_AN_CONV
  and    CO_TIPO      = P_CO_TIPO_CONV
  and    IN_ESTADO    = '1';
  
  if V_CONT_CONV_ASIG > 0 then
     P_MENSAJE := 'LA CONVOCATORIA YA SE ENCUENTRA ASIGNADA A ESE ASISTENTE';
     return;
  end if;
  
  insert into ASIGNA_CONVOCATORIA
  values (P_CO_ASISTENTE, P_NU_CONV, P_AN_CONV, P_CO_TIPO_CONV, '1',SYSDATE);
  V_OK := sql%rowcount;
  commit;
  if V_OK = 0 then
     P_MENSAJE := 'CONVOCATORIA NO ASISGNADA';
  else
     P_MENSAJE := 'CONVOCATORIA ASISGNADA CORRECTAMENTE';
  end if;

exception
   when OTHERS then
        dbms_output.put_line(SQLERRM);
end SP_ASIGNAR_CONVOCATORIA;

  
-- Prueba del SP_ASIGNAR_CONVOCATORIA

declare
  V_CO_ASISTENTE integer;
  V_NU_CONV      char(5);
  V_AN_CONV      char(4);
  V_CO_TIPO_CONV integer;
  V_MENSAJE      varchar2(100);
begin
  -- Datos
  V_CO_ASISTENTE := 8;
  V_NU_CONV      := '00001';
  V_AN_CONV      := '2019';
  V_CO_TIPO_CONV := 2;

  -- Proceso
  SP_ASIGNAR_CONVOCATORIA(V_CO_ASISTENTE, V_NU_CONV, V_AN_CONV, V_CO_TIPO_CONV, V_MENSAJE);
  
  -- Mostrar mensaje
  dbms_output.put_line(V_MENSAJE);
end;

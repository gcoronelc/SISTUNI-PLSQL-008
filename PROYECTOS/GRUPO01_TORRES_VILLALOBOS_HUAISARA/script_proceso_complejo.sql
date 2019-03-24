-- ======================================================
-- Camiar el estado de varias convocatorias a Inactivo
-- ======================================================
create or replace type v_nuConv_Array       as varray(5) of char(5);
create or replace type v_anConv_Array       as varray(5) of char(4);
create or replace type v_coTipoConv_Array   as varray(5) of integer;

create or replace procedure SP_DESACTIVAR_CONVOCATORIAS(
       p_nuConv     in v_nuConv_Array,
       p_anConv     in v_anConv_Array,
       p_coTipoConv in v_coTipoConv_Array
)
is
  v_cont    number;
  v_mensaje varchar(100);
  v_ok      number;
begin 
  -- Proceso
  for i in 1 .. p_nuConv.count loop
    v_cont    := 0;
    v_mensaje := '';
    v_ok      := 0;
    -- Verificar la convocatoria
    select count(NU_CONV)
    into   v_cont
    from   CONVOCATORIA
    where  NU_CONV   = p_nuConv(i)
    and    AN_CONV   = p_anConv(i)
    and    CO_TIPO   = p_coTipoConv(i)
    and    IN_ESTADO = '1';
    
    if v_cont = 0 then
       v_mensaje := 'LA CONVOCATORIA DE NÚMERO: ' || p_nuConv(i) || ', AÑO: ' || p_anConv(i) || ', Y TIPO: ' || p_coTipoConv(i) || ', NO SE ENCUENTRA REGISTRADA';
    else
       update CONVOCATORIA
       set    IN_ESTADO = '0'
       where  NU_CONV   = p_nuConv(i)
       and    AN_CONV   = p_anConv(i)
       and    CO_TIPO   = p_coTipoConv(i)
       and    IN_ESTADO = '1';
       v_ok := sql%rowcount;
       commit;
       
       if v_ok = 0 then
           v_mensaje := 'LA CONVOCATORIA DE NÚMERO: ' || p_nuConv(i) || ', AÑO: ' || p_anConv(i) || ', Y TIPO: ' || p_coTipoConv(i) || ', NO SE PUDO MODIFICAR';
       else
           v_mensaje := 'LA CONVOCATORIA DE NÚMERO: ' || p_nuConv(i) || ', AÑO: ' || p_anConv(i) || ', Y TIPO: ' || p_coTipoConv(i) || ', SE CAMBIÓ A INACTIVA';
       end if;
    end if;
    
		dbms_output.put_line(v_mensaje);
	end loop; 

exception
   when OTHERS then
        rollback;
        dbms_output.put_line(SQLERRM);
end;


declare 
  -- Definiendo las variables
  nuConv        v_nuConv_Array;
  anConv        v_anConv_Array;
  coTipoConv    v_coTipoConv_Array;
begin
    -- Creando los arreglos
  nuConv     := v_nuConv_Array('00001','00009','00003','00004','00008');
  anConv     := v_anConv_Array('2019','2019','2019','2019','2019');
  coTipoConv := v_coTipoConv_Array(2,2,2,2,2);
  
  SP_DESACTIVAR_CONVOCATORIAS(nuConv, anConv, coTipoConv);
end;

--select * from convocatoria for update

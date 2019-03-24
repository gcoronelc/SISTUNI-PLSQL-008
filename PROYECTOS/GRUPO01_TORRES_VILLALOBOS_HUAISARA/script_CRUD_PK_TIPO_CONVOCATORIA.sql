-- ==========================================================
-- PACKAGE CRUD TIPO_CONVOCATORIA
-- ==========================================================
-- Nombre         : PK_TIPO_CONVOCATORIA
-- Autores        : Karen Huaisara Olarte
--                  Giovanni Torres Villalobos                 
-- Descripcion    : Package que contiene las funciones del CRUD de la tabla TIPO_CONVOCATORIA.


create sequence SQ_TIPO_CONVOCATORIA;

create or replace package PK_TIPO_CONVOCATORIA as
       procedure AGREGAR(
                 P_DESCRIPCION in varchar2,
                 P_CO_REG      out nocopy integer,
                 P_DE_REG      out nocopy varchar2,
                 P_ES_REG      out nocopy char,
                 P_CONT        out nocopy number
       );
       
       procedure MODIFICAR(
                 P_CODIGO      in integer,
                 P_DESCRIPCION in varchar2,
                 P_ESTADO      in char,
                 P_CO_REG      out nocopy integer,
                 P_DE_REG      out nocopy varchar2,
                 P_ES_REG      out nocopy char,
                 P_CONT        out nocopy number
       );
       
       procedure ELIMINAR_LOGICO(
                 P_CODIGO in integer,
                 P_CO_REG out nocopy integer,
                 P_DE_REG out nocopy varchar2,
                 P_ES_REG out nocopy char,
                 P_CONT   out nocopy number
       );

       procedure ELIMINAR_FISICO(
                 P_CODIGO in integer,
                 P_CO_REG out nocopy integer,
                 P_DE_REG out nocopy varchar2,
                 P_ES_REG out nocopy char,
                 P_CONT   out nocopy number
       );

       procedure CONSULTAR_REGISTRO(
                 P_CODIGO       in integer,
                 P_DESCRIPCION  in varchar2,
                 P_ESTADO       in char,
                 C_REG          out nocopy sys_refcursor
       );

       procedure CONSULTAR_TODOS(C_TC out nocopy sys_refcursor);
end PK_TIPO_CONVOCATORIA;



create or replace package body PK_TIPO_CONVOCATORIA as
      -- AGREGAR TIPO DE CONVOCATORIA
      procedure AGREGAR(
        P_DESCRIPCION in varchar2,
        P_CO_REG out nocopy integer,
        P_DE_REG out nocopy varchar2,
        P_ES_REG out nocopy char,
        P_CONT out nocopy number
      )
      is
        V_SECUENCIA  number := 0;
      begin
      -- Obtención del codigo primario a partir de la secuencia
        select SQ_TIPO_CONVOCATORIA.NEXTVAL
        into   V_SECUENCIA
        from   dual;
      -- Inserción del registro
        insert into TIPO_CONVOCATORIA
        values (V_SECUENCIA,P_DESCRIPCION,'1')
        returning CO_TIPO, DE_TIPO, IN_ESTADO into P_CO_REG, P_DE_REG, P_ES_REG;
        P_CONT := SQL%ROWCOUNT;
        commit;

      exception
         when OTHERS then
              dbms_output.put_line(SQLERRM);
      end AGREGAR;

	  
      -- MODIFICAR TIPO DE CONVOCATORIA
      procedure MODIFICAR(
        P_CODIGO in integer,
        P_DESCRIPCION in varchar2,
        P_ESTADO in char,
        P_CO_REG out nocopy integer,
        P_DE_REG out nocopy varchar2,
        P_ES_REG out nocopy char,
        P_CONT out nocopy number
      )
      as
      begin
      -- Actualización del registro
        update TIPO_CONVOCATORIA
        set DE_TIPO = P_DESCRIPCION, IN_ESTADO = P_ESTADO
        where CO_TIPO = P_CODIGO
        returning CO_TIPO, DE_TIPO, IN_ESTADO into P_CO_REG, P_DE_REG, P_ES_REG;
        P_CONT := SQL%ROWCOUNT;
        commit;
      exception
         when OTHERS then
              dbms_output.put_line(SQLERRM);
      end MODIFICAR;


      -- ELIMINADO LOGICO DE TIPO DE CONVOCATORIA
      procedure ELIMINAR_LOGICO(
        P_CODIGO in integer,
        P_CO_REG out nocopy integer,
        P_DE_REG out nocopy varchar2,
        P_ES_REG out nocopy char,
        P_CONT out nocopy number
      )
      as
      begin
      -- Actualización del registro
        update TIPO_CONVOCATORIA
        set IN_ESTADO = '0'
        where CO_TIPO = P_CODIGO
        returning CO_TIPO, DE_TIPO, IN_ESTADO into P_CO_REG, P_DE_REG, P_ES_REG;
        P_CONT := SQL%ROWCOUNT;
        commit;

      exception
         when OTHERS then
              dbms_output.put_line(SQLERRM);
      end ELIMINAR_LOGICO;


      -- ELIMINADO FISICO DE TIPO DE CONVOCATORIA
      procedure ELIMINAR_FISICO(
        P_CODIGO in integer,
        P_CO_REG out nocopy integer,
        P_DE_REG out nocopy varchar2,
        P_ES_REG out nocopy char,
        P_CONT out nocopy number
      )
      as
      begin
      -- Elminación del registro
        delete from TIPO_CONVOCATORIA
        where CO_TIPO = P_CODIGO
        returning CO_TIPO, DE_TIPO, IN_ESTADO into P_CO_REG, P_DE_REG, P_ES_REG;
        P_CONT := SQL%ROWCOUNT;
        commit;

      exception
         when OTHERS then
              dbms_output.put_line(SQLERRM);
      end ELIMINAR_FISICO;


      -- CONSULTAR CON FILTRO TIPO DE CONVOCATORIA
      procedure CONSULTAR_REGISTRO(
        P_CODIGO       in integer,
        P_DESCRIPCION  in varchar2,
        P_ESTADO       in char,
        C_REG          out nocopy sys_refcursor
      )
      as
        V_DESCRIPCION  varchar2(50);
      begin
        V_DESCRIPCION := '%' || P_DESCRIPCION || '%';

        open C_REG for
        select CO_TIPO, DE_TIPO, IN_ESTADO from TIPO_CONVOCATORIA
        where CO_TIPO = nvl2(P_CODIGO, P_CODIGO, CO_TIPO)
        and DE_TIPO like nvl2(P_DESCRIPCION, V_DESCRIPCION, DE_TIPO)
        and IN_ESTADO = nvl2(P_ESTADO, P_ESTADO, IN_ESTADO);

      exception
         when OTHERS then
              dbms_output.put_line(SQLERRM);
      end CONSULTAR_REGISTRO;


      -- CONSULTAR LOS TIPOS DE CONVOCATORIA
      procedure CONSULTAR_TODOS(
        C_TC out nocopy sys_refcursor
      )
      as
      begin
        open C_TC for
        select CO_TIPO, DE_TIPO, IN_ESTADO from TIPO_CONVOCATORIA;

      exception
         when OTHERS then
              dbms_output.put_line(SQLERRM);
      end CONSULTAR_TODOS;

end PK_TIPO_CONVOCATORIA;
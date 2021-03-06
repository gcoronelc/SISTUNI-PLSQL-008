--CRUD PAQUETE CLIENTE
CREATE OR REPLACE 
PACKAGE PACK_CLIENTE AS 
--CREAR
 PROCEDURE INSERTAR_CLIENTE(

    p_TIPO_DOCUMENTO  IN CLIENTE.TIPO_DOCUMENTO%TYPE,
    p_NRO_DOCUMENTO IN CLIENTE.NRO_DOCUMENTO%TYPE,
    p_NOMBRES IN CLIENTE.NOMBRES%TYPE,
    p_APELLIDOS IN CLIENTE.APELLIDOS%TYPE,
    p_SEXO IN CLIENTE.SEXO%TYPE,
    p_FECHA_NACIMIENTO IN CLIENTE.FECHA_NACIMIENTO%TYPE,
    p_CELULAR IN CLIENTE.CELULAR%TYPE,
    p_DIRECCION IN CLIENTE.DIRECCION%TYPE,
    p_DISTRITO IN CLIENTE.DISTRITO%TYPE,
    p_PROVINCIA IN CLIENTE.PROVINCIA%TYPE,
    p_DEPARTAMENTO IN CLIENTE.DEPARTAMENTO%TYPE,
    P_COD_RESPUESTA       OUT NOCOPY  NUMBER,
    P_MENSAJE OUT NOCOPY  VARCHAR2
  );
  ---ACTUALIZAR
   PROCEDURE MODIFICAR_CLIENTE(

    p_ID_CLIENTE  IN CLIENTE.ID_CLIENTE%TYPE,
    p_NOMBRES IN CLIENTE.NOMBRES%TYPE,
    p_APELLIDOS IN CLIENTE.APELLIDOS%TYPE,
    p_SEXO IN CLIENTE.SEXO%TYPE,
    p_FECHA_NACIMIENTO IN CLIENTE.FECHA_NACIMIENTO%TYPE,
    p_CELULAR IN CLIENTE.CELULAR%TYPE,
    p_DIRECCION IN CLIENTE.DIRECCION%TYPE,
    p_DISTRITO IN CLIENTE.DISTRITO%TYPE,
    p_PROVINCIA IN CLIENTE.PROVINCIA%TYPE,
    p_DEPARTAMENTO IN CLIENTE.DEPARTAMENTO%TYPE,
    P_COD_RESPUESTA       OUT NOCOPY  NUMBER,
    P_MENSAJE OUT NOCOPY  VARCHAR2
  );
--ELIMINAR
   PROCEDURE ELIMINAR_CLIENTE(
    p_ID_CLIENTE  IN CLIENTE.ID_CLIENTE%TYPE, 
    P_COD_RESPUESTA       OUT NOCOPY  NUMBER,
    P_MENSAJE OUT NOCOPY  VARCHAR2
  );
  --LEER VARIOS REGISTROS
   PROCEDURE OBTENER_CLIENTES(
    p_ID_CLIENTE  IN CLIENTE.ID_CLIENTE%TYPE, 
    p_TIPO_DOCUMENTO  IN CLIENTE.TIPO_DOCUMENTO%TYPE,
    p_NRO_DOCUMENTO IN CLIENTE.NRO_DOCUMENTO%TYPE,
    P_CURSOR OUT NOCOPY SYS_REFCURSOR,
    P_COD_RESPUESTA       OUT NOCOPY  NUMBER,
    P_MENSAJE OUT NOCOPY  VARCHAR2
  );
  --LEER SOLO REGISTRO
  PROCEDURE OBTENER_CLIENTE_ID(
    p_ID_CLIENTE  IN CLIENTE.ID_CLIENTE%TYPE,    
    P_CURSOR OUT NOCOPY SYS_REFCURSOR,
    P_COD_RESPUESTA       OUT NOCOPY  NUMBER,
    P_MENSAJE OUT NOCOPY  VARCHAR2
  );

END PACK_CLIENTE;
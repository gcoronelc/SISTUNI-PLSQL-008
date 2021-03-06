create or replace PACKAGE                      CRUD_PRODUCTO AS TYPE REF_TYPE IS REF CURSOR;
   PROCEDURE SP_INSERTAR_PROD (
        P_NOMBRE IN VARCHAR2,
        P_DESCRIPCION IN VARCHAR2,
        P_PRECIO IN NUMBER,
        P_MENSAJE OUT VARCHAR2,
        R_RESULTADO out number
    );
    PROCEDURE SP_ELIMINAR_PROD(
    P_IDPRODUCTO IN NUMBER,
    P_MENSAJE OUT VARCHAR2
    );
    PROCEDURE SP_ACTUALIZAR_PROD(
    P_IDPRODUCTO IN NUMBER,
     P_NOMBRE IN VARCHAR2,
     P_DESCRIPCION IN VARCHAR2,
     P_PRECIO IN DECIMAL,
    P_MENSAJE OUT VARCHAR2
    );
    PROCEDURE SP_BUSCAR_PROD(
        P_IDPRODUCTO IN NUMBER,
        P_NOMBRE IN VARCHAR2,
        VC_RESULTADO OUT SYS_REFCURSOR
    );
END CRUD_PRODUCTO;

CREATE GLOBAL TEMPORARY TABLE HOTEL.REPORTE_RESERVA(
    CLIENTE VARCHAR2(50),
    CELULAR VARCHAR2(50),
    HABITACION VARCHAR2(50),
    CHECK_IN VARCHAR2(50),
    CHECK_OUT VARCHAR2(50),
    PROMOCION VARCHAR2(50),
    PRECIOREAL NUMBER,
    DESCUENTO NUMBER,
    PRECIOFINAL NUMBER
    
)ON COMMIT PRESERVE ROWS; 

INSERT INTO HOTEL.REPORTE_RESERVA

SELECT 
	NVL(CLI.NOMBRES,CLI.RAZONSOCIAL) AS CLIENTE,
	CLI.CELULAR,
	THAB.NOMBRE,
	TO_CHAR(REV.FECHAINCIO, 'YYYY-MM-DD') AS CHECK_IN, 
	TO_CHAR(REV.FECHAFIN, 'YYYY-MM-DD') AS CHECK_OUT,
	TPROM.DESCRIPCION,
	THAB.PRECIO,
	REV.TOTALDESCUENTO,
	REV.TOTALPRECIO
	
FROM HOTEL.CLIENTE CLI
INNER JOIN HOTEL.RESERVA REV ON REV.IDCLIENTE=CLI.ID
INNER JOIN HOTEL.DETALLERESERVA DREV ON DREV.IDRESERVA=REV.ID
INNER JOIN HOTEL.HABITACION HAB ON HAB.ID=DREV.IDHABITACION
INNER JOIN HOTEL.TIPOHABITACION THAB ON THAB.ID=HAB.IDTIPOHABITACION
LEFT JOIN HOTEL.PROMOCION PROM ON PROM.ID=REV.IDPROMOCION
LEFT JOIN HOTEL.TIPOPROMOCION TPROM ON TPROM.ID=PROM.IDTIPOPROMOCION;

--SELECT * FROM HOTEL.REPORTE_RESERVA;



CREATE GLOBAL TEMPORARY TABLE HOTEL.REPORTE_DISPONIBILIDAD(
    NRO_HABITACION VARCHAR2(50),
    HABITACION VARCHAR2(50),
    PRECIOREAL NUMBER,
    CLIENTE VARCHAR2(50),
    CELULAR VARCHAR2(50),    
    CHECK_IN VARCHAR2(50),
    CHECK_OUT VARCHAR2(50)
    
)ON COMMIT PRESERVE ROWS; 

INSERT INTO HOTEL.REPORTE_DISPONIBILIDAD

SELECT 
HAB.DESCRIPCION AS NRO_HABITACION, 
THAB.NOMBRE, 
THAB.PRECIO,
NVL(CLI.NOMBRES,CLI.RAZONSOCIAL) AS CLIENTE, 
CLI.CELULAR,
TO_CHAR(REV.FECHAINCIO, 'YYYY-MM-DD') AS CHECK_IN, 
TO_CHAR(REV.FECHAFIN, 'YYYY-MM-DD') AS CHECK_OUT
FROM HOTEL.TIPOHABITACION THAB
LEFT JOIN HOTEL.HABITACION HAB ON THAB.ID=HAB.IDTIPOHABITACION
LEFT JOIN HOTEL.DETALLERESERVA DREV ON HAB.ID=DREV.IDHABITACION
LEFT JOIN HOTEL.RESERVA REV ON DREV.IDRESERVA=REV.ID
LEFT JOIN HOTEL.CLIENTE CLI ON REV.IDCLIENTE=CLI.ID
ORDER BY HAB.DESCRIPCION;

--SELECT * FROM REPORTE_DISPONIBILIDAD;


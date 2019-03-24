-- Caso: Gesti�n de cobranza en un banco
-- Curso: PLSQL Oracle 19-02
-- Profesor: Ing. Eric Gustavo Coronel Castillo
-- Integrantes: M�nica Huertas, Oscar Z��iga, Hern�n 

-- ==================================================================================
-- PROCESO COMPLEJO. Transaccion para procesar varias filas:
-- Actualizaci�n de descuento de los pagos realizados el �ltimo d�a del mes 28/02/2019
-- Aplicar m�ximo descuento.
-- ===================================================================================

CREATE OR REPLACE PROCEDURE COBRANZA.PR_DSCTO_PAGO (FECHA IN DATE, DESCUENT OUT NUMBER)
AS
DSCTO NUMBER;
ID_DSCTO VARCHAR(2);
BEGIN
SELECT MAX(DSCTO_PORCENTAJE) INTO DSCTO FROM COBRANZA.DESCUENTO;
SELECT ID_DESCUENTO INTO ID_DSCTO FROM COBRANZA.DESCUENTO WHERE DSCTO_PORCENTAJE = DSCTO;
  UPDATE COBRANZA.PAGO 
  SET ID_DESCUENTO = ID_DSCTO  
  WHERE FECHA_PAGO = FECHA
  RETURNING MAX(DSCTO) INTO DESCUENT;
COMMIT;
END;

DECLARE
  V_FECHA DATE;
  V_DESCUENTO NUMBER;
BEGIN
  -- DATO
  V_FECHA := TO_DATE('20190228','YYYYMMDD');
  -- PROCESO
  COBRANZA.PR_DSCTO_PAGO (V_FECHA, V_DESCUENTO);
  -- REPORTE
  DBMS_OUTPUT.PUT_LINE('NUEVO DESCUENTO: ' || V_DESCUENTO);
END;


-- PRUEBAS PRELIMINARES A LA EJECUCION DEL PROCESO COMPLEJO

SELECT * FROM COBRANZA.PAGO WHERE FECHA_PAGO = '28/02/2019'

UPDATE COBRANZA.PAGO SET ID_DESCUENTO = '01' WHERE FECHA_PAGO = '28/02/2019';



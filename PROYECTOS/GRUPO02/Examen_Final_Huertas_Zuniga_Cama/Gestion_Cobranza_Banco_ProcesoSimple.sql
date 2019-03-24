-- Caso: Gesti�n de cobranza en un banco
-- Curso: PLSQL Oracle 19-02
-- Profesor: Ing. Eric Gustavo Coronel Castillo
-- Integrantes: M�nica Huertas, Oscar Z��iga, Hern�n 

-- ============================================================================================================================
-- PROCESO SIMPLE. Transaccion para procesar un registro.
-- Aplicaci�n del tipo de descuento que corresponde a una cuenta por el pago de la cuota realizado dias antes de su vencimiento
-- ============================================================================================================================

CREATE OR REPLACE PROCEDURE COBRANZA.PR_DSCTO_MES 
(CUENTA IN VARCHAR, FECHAPAG IN DATE, FECHAVENC IN DATE, 
DESCUENT OUT NUMBER)
AS
DIFDIAS NUMBER;
VALORPORC NUMBER;
ID_DSCTO VARCHAR(2);
BEGIN
DIFDIAS := FECHAVENC - FECHAPAG;
IF DIFDIAS > 0 and DIFDIAS <= 8 THEN 
    VALORPORC := DIFDIAS * 0.5;
END IF;
IF DIFDIAS > 8 THEN 
    VALORPORC := 4;
END IF;
IF DIFDIAS <= 0 THEN 
    VALORPORC := 0;
END IF;

SELECT ID_DESCUENTO INTO ID_DSCTO FROM COBRANZA.DESCUENTO WHERE DSCTO_PORCENTAJE = VALORPORC;
  UPDATE COBRANZA.PAGO 
  SET ID_DESCUENTO = ID_DSCTO  
  WHERE ID_CUENTA = CUENTA and FECHA_PAGO = FECHAPAG
  RETURNING VALORPORC INTO DESCUENT;
COMMIT;
END;

-- ===========================
-- EJECUTANDO EL PROCESO
-- ==========================

--  ACTIVAR 
    --SET SERVEROUTPUT ON

--  EJECUTAR
DECLARE
  V_CUENTA VARCHAR(2);
  V_FECHAPAG DATE;
  V_FECHAVENC DATE;
  V_DESCUENTO NUMBER;
BEGIN
  -- DATOS
  V_CUENTA := '11';
  V_FECHAPAG := TO_DATE('20190225','YYYYMMDD');
  V_FECHAVENC := TO_DATE('20190228','YYYYMMDD');
  -- PROCESO
  COBRANZA.PR_DSCTO_MES (V_CUENTA,V_FECHAPAG, V_FECHAVENC, V_DESCUENTO);
  -- RESULTADO
  DBMS_OUTPUT.PUT_LINE('HA OBTENIDO UN DESCUENTO DE: ' || V_DESCUENTO || '% SOBRE EL VALOR DE SU CUOTA DEL MES' );
END;




-- pruebas preliminares a la ejecucion del procedimiento

SELECT * FROM COBRANZA.DESCUENTO;

SELECT * FROM COBRANZA.PAGO;

SELECT * FROM COBRANZA.PAGO WHERE ID_CUENTA = '11' and FECHA_PAGO = '25/02/2019'

UPDATE COBRANZA.PAGO SET ID_DESCUENTO = '01' WHERE ID_CUENTA = '11' and FECHA_PAGO = '25/02/2019';



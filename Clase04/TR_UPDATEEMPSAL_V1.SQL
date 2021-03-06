
CREATE TABLE SCOTT.SAL_HISTORY( 
  EMPNO NUMBER(4) NOT NULL, 
  SALOLD NUMBER(7,2) NULL, 
  SALNEW NUMBER(7,2) NULL, 
  STARTDATE DATE NOT NULL,
  SETUSER VARCHAR2(30) NOT NULL
);


CREATE OR REPLACE TRIGGER SCOTT.TR_UPDATEEMPSAL 
AFTER INSERT OR UPDATE ON SCOTT.EMP
FOR EACH ROW 
BEGIN

  INSERT INTO SCOTT.SAL_HISTORY
  (EMPNO, SALOLD, SALNEW, STARTDATE, SETUSER)
  VALUES( :NEW.EMPNO, :OLD.SAL, :NEW.SAL, SYSDATE, USER );

END TR_UPDATEEMPSAL;



INSERT INTO SCOTT.EMP( EMPNO, ENAME, SAL )
VALUES( 8989, 'KARLA', 3689 );

UPDATE SCOTT.EMP
SET SAL = 4000
WHERE EMPNO = 8989;

UPDATE SCOTT.EMP
SET ENAME = 'LEONOR'
WHERE EMPNO = 8989;

SELECT * FROM SCOTT.SAL_HISTORY;

ROLLBACK;

ALTER TRIGGER TR_TEST_EMP3 DISABLE; 

/*
TAREA 02
HACER LAS CAMBIOS NECESARIOS PARA QUE EN LA TABLA
"SAL_HISTORY" SE REQUISTRE EL NOMBRE DEL EQUIPO Y 
EL IP DESDE DONDE SE HACE EL CAMBIO DEL SALARIO.
*/




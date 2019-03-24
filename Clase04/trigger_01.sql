CREATE OR REPLACE TRIGGER SCOTT.TR_TEST_EMP
AFTER INSERT OR DELETE OR UPDATE ON SCOTT.EMP
BEGIN
  IF INSERTING THEN
	  DBMS_OUTPUT.PUT_LINE('NUEVO EMPLEADO SE HA REGISTRADO');
  ELSIF UPDATING THEN
	  DBMS_OUTPUT.PUT_LINE('UN EMPLEADO SE HA MODIFICADO');
  ELSIF DELETING THEN
	  DBMS_OUTPUT.PUT_LINE('UN EMPLEADO SE HA ELIMINADO');
  END IF;
END;

insert into scott.emp(empno, ename) 
values(5555,'yo');

update scott.emp 
set ename = 'tu'
where empno = 5555;

update scott.emp 
set ename = 'tu';

select * from scott.emp;

DELETE FROM scott.emp 
where empno = 5555;



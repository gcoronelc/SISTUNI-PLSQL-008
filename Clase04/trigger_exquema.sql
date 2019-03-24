CREATE OR REPLACE TRIGGER SCOTT.TR_DENY_DROP
BEFORE DROP ON SCHEMA
BEGIN
  RAISE_APPLICATION_ERROR(-20000, 'Jejejeje, No puedes eliminar objetos.');
END;

drop table scott.emp;
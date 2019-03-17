
-- COMO USUARIO SYSTEM

GRANT CREATE TABLE TO SCOTT;

-- COMO USUARIO SCOTT

create table scott.algo( dato varchar2(200) );

create or replace procedure scott.sp_demo100
( p_sentencia in varchar2 )
as
begin
  execute immediate (p_sentencia);
end;
/


call scott.sp_demo100('create table SCOTT.alfa( dato varchar2(100) )');

select * from tab;

/*
TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
ALFA                           TABLE             
ALGO                           TABLE             
BONUS                          TABLE             
DEMO1                          TABLE             
DEMO2                          TABLE             
DEPT                           TABLE             
EMP                            TABLE             
SALGRADE                       TABLE             

8 filas seleccionadas. 

*/


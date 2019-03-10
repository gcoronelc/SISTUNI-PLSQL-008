
-- tablas temporales

CREATE GLOBAL TEMPORARY table scott.demo1
( 
  id number primary key,
  dato varchar2(100) 
) on commit preserve rows;

insert into scott.demo1
select scott.sq_demo.nextval, ename
from scott.emp;

select * from scott.demo1;


CREATE GLOBAL TEMPORARY table scott.demo2
( 
  id number primary key,
  dato varchar2(100) 
) on commit delete rows;

insert into scott.demo2
select scott.sq_demo.nextval, ename
from scott.emp;

select * from scott.demo2;


commit;

select * from scott.demo1;

select * from scott.demo2;



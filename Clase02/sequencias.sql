
-- Creación de la sequencia
create sequence scott.sq_demo;


-- El siguiente valor
select scott.sq_demo.nextval from dual;


-- El valor actual
select scott.sq_demo.currval from dual;


/*
TAREA 04
Hacer una función que permita calcular el MCD
de dos números enteros.
*/


CREATE OR REPLACE FUNCTION SCOTT.FN_MCD
(P_N1 IN NUMBER, P_N2 IN NUMBER) RETURN NUMBER
IS
  V_N1 NUMBER;
  V_N2 NUMBER;
BEGIN
  -- Partida
  v_n1 := p_n1;
  v_n2 := p_n2;
  -- Proceso
  while( v_n1 <> v_n2 ) loop
    if ( v_n1 > v_n2 ) then
      v_n1 := v_n1 - v_n2;
    else 
      v_n2 := v_n2 - v_n1;
    end if;
  end loop;
  -- Resultado
  return v_n1;
END;
/


select SCOTT.FN_MCD(15,20) from dual;



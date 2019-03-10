
-- Tarea 01
-- DEesarrollar una función que retorne el
-- mayor de 3 números.


CREATE OR REPLACE FUNCTION 
scott.F_MAYOR( NUM1 NUMBER, NUM2 NUMBER, NUM3 NUMBER)
RETURN NUMBER 
IS
    mayor NUMBER;
BEGIN
    -- Punto de apoyo
	mayor := num1;
		
	IF(NUM2>mayor)THEN
		mayor :=NUM2;
	END IF;
	
	IF(NUM3>mayor)THEN
		mayor :=NUM3;
	END IF;
	
	RETURN mayor;
	
END;


SELECT scott.F_MAYOR(-10000,-20000,-50000) FROM DUAL;





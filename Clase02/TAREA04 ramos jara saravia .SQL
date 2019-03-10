CREATE OR REPLACE FUNCTION SCOTT.fnMCD (a NUMBER, b NUMBER)
RETURN NUMBER
IS 
	divisor NUMBER;
BEGIN

	IF (a > b) THEN
		divisor := b;
	ELSE	
		divisor := a;
	END IF;
	
	WHILE ( (MOD(a,divisor) !=0) or (MOD(b,divisor) !=0)  and divisor>1 ) LOOP
	    divisor := divisor-1;
	END LOOP;
	
	RETURN divisor;
	
END;

SELECT SCOTT.fnMCD(6,4) FROM DUAL;
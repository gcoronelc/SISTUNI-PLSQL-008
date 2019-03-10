create or replace FUNCTION SCOTT.mayorNumeroTres
(n1 number, n2 number, n3 number)
RETURN number
IS
m number;
mayor number;
BEGIN

IF n1>=n2
    THEN
        m:=n1;
    ELSE
        m:=n2;
END IF;

IF m>=n3
    THEN
        mayor:=m;
    ELSE
    mayor:=n3;
END IF;

RETURN mayor;

END;


SELECT scott.mayorNumeroTres(-10000,-2000,-500) FROM DUAL;




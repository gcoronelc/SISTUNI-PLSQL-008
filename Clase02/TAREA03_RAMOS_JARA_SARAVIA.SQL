CREATE OR REPLACE FUNCTION SCOTT.fnFactorial (n NUMBER)
RETURN NUMBER
IS 
  temp number;
  fact number := 1;
BEGIN  
  temp := n;
  WHILE temp>0 LOOP
    fact := temp*fact;
    temp := temp-1;
  END LOOP;
  RETURN fact;  
END;

SELECT SCOTT.fnFactorial(5) FROM DUAL;
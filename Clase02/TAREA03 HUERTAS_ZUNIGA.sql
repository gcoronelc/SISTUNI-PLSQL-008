CREATE OR REPLACE FUNCTION 
SCOTT.FN_FACTORIAL (N NUMBER)
RETURN NUMBER
IS 
    FACTORIAL NUMBER;
BEGIN
    FACTORIAL := 1;
    FOR K IN 2 .. N LOOP
        FACTORIAL := FACTORIAL * K;
    END LOOP;
    RETURN FACTORIAL;
END;

SELECT SCOTT.FN_FACTORIAL(5) FROM DUAL;


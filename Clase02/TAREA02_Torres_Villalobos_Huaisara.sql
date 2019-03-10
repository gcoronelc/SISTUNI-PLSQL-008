CREATE OR REPLACE PROCEDURE SCOTT.MENSAJE
(
	P_N IN NUMBER
)
IS
    v_cont NUMBER;
BEGIN
    v_cont := 0;
    LOOP 
        v_cont:=v_cont+1;
        dbms_output.PUT_LINE('Alianza Lima campeón');
        EXIT WHEN v_cont = P_N;
    END LOOP;
END;
/

CALL SCOTT.MENSAJE(1000);


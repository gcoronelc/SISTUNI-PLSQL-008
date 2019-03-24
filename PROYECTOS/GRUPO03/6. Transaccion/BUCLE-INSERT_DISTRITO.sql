select * from SUPERMERCADO.DISTRITOS;

CREATE OR REPLACE TYPE MyType AS VARRAY(200) OF VARCHAR2(50);

    CREATE OR REPLACE PROCEDURE testing (t_in MyType) 
    IS
    V_ARREGLO  SUPERMERCADO.PKG_EGCC_UTIL.T_ARRAY_STRING;
    BEGIN
      
      FOR i IN 1..t_in.count LOOP
        V_ARREGLO := SUPERMERCADO.PKG_EGCC_UTIL.SPLIT(t_in(i),'|'); 
        INSERT INTO SUPERMERCADO.DISTRITOS(CODDIS,NOMDIS) VALUES (V_ARREGLO(1),V_ARREGLO(2));
      END LOOP;
      commit;
    END;
    /
     select * from SUPERMERCADO.DISTRITOS;
    
    DECLARE
      v_t MyType;
      
    BEGIN
      v_t := MyType();
      v_t.EXTEND(3);
      v_t(1) := 'D014|JESUS MARIA2';
      v_t(2) := 'D015|CHORRILLOS2';
      v_t(3) := 'D016|PUENTE PIEDRA';
      testing(v_t);

    END;
   /
   
   select * from SUPERMERCADO.DISTRITOS
 
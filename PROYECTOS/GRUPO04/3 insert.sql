
-- SELECT ID, DESCRIPCION FROM HOTEL.TIPOPROMOCION;
INSERT INTO HOTEL.TIPOPROMOCION (ID, DESCRIPCION)
VALUES (1, '10% descuento de Luner a Viernes');
commit;
-- SELECT ID, DESCRIPCION, DESCUENTO, IDTIPOPROMOCION, FECHAINICIO, FECHAFIN FROM HOTEL.PROMOCION
INSERT INTO HOTEL.PROMOCION (ID, DESCRIPCION, DESCUENTO, IDTIPOPROMOCION, FECHAINICIO, FECHAFIN)
SELECT 1, 'Descuento','10',1,TO_DATE('2019-03-01', 'YYYY-MM-DD'), TO_DATE('2019-03-31', 'YYYY-MM-DD') FROM DUAL;
commit;

-- SELECT ID, NOMBRES, APP, APM, DNI, RUC, RAZONSOCIAL, CELULAR, CORREO, PASSWORD FROM HOTEL.CLIENTE;
INSERT INTO HOTEL.CLIENTE (NOMBRES, APP, APM, DNI, RUC, RAZONSOCIAL, CELULAR, CORREO, PASSWORD)
SELECT 'Luis','Ramos','Cueva','42684024',NULL,NULL,998886686,'luis1000@hotmail.com', 'abc123' FROM DUAL UNION ALL
SELECT 'Silvia','Medrano','Pulido','42424242',NULL,NULL,999888666,'silviaxy@hotmail.com', 'abc456' FROM DUAL UNION ALL
SELECT NULL,NULL,NULL,NULL,10426840249,'elmundotec',52345678,'contabilidad@elmundotec.com', 'abc789' FROM DUAL;
commit;

-- SELECT * FROM HOTEL.TIPOHABITACION;
INSERT INTO HOTEL.TIPOHABITACION (nombre,vista,descripcion,precio,imagen,tamanio,cantPersonas,numCamas) 
  SELECT 'Suite','Vista al mar','Cuando llegó a las primeras colinas de las Montañas Itálicas, tuvo una última vista en el horizonte de su ciudad natal, Bookmarksgrove, el titular de Alphabet Village y la sublínea de su propia carretera, Line Lane. Lástima de una pregunta retórica corrió por su mejilla, luego ella continuó su camino.',120.00,'suite.jpg','42 m2',2,1 FROM dual UNION ALL 
  SELECT 'Cuarto familiar','Vista interior','Cuando llegó a las primeras colinas de las Montañas Itálicas, tuvo una última vista en el horizonte de su ciudad natal, Bookmarksgrove, el titular de Alphabet Village y la sublínea de su propia carretera, Line Lane. Lástima de una pregunta retórica corrió por su mejilla, luego ella continuó su camino.',140.00,'cuarto_familiar.jpg','50 m2',4,2 FROM dual UNION ALL 
  SELECT 'Habitación familiar','Vista al mar','Cuando llegó a las primeras colinas de las Montañas Itálicas, tuvo una última vista en el horizonte de su ciudad natal, Bookmarksgrove, el titular de Alphabet Village y la sublínea de su propia carretera, Line Lane. Lástima de una pregunta retórica corrió por su mejilla, luego ella continuó su camino.',150.00,'habitacion_familiar.jpg','40 m2',6,3 FROM dual UNION ALL 
  SELECT 'Habitacion clasica','Vista interior','Cuando llegó a las primeras colinas de las Montañas Itálicas, tuvo una última vista en el horizonte de su ciudad natal, Bookmarksgrove, el titular de Alphabet Village y la sublínea de su propia carretera, Line Lane. Lástima de una pregunta retórica corrió por su mejilla, luego ella continuó su camino.',180.00,'habitacion_clasica.jpg','55 m2',2,1 FROM dual UNION ALL 
  SELECT 'Habitación superior','Vista al mar','Cuando llegó a las primeras colinas de las Montañas Itálicas, tuvo una última vista en el horizonte de su ciudad natal, Bookmarksgrove, el titular de Alphabet Village y la sublínea de su propia carretera, Line Lane. Lástima de una pregunta retórica corrió por su mejilla, luego ella continuó su camino.',200.00,'habitacion_superior.jpg','60 m2',2,1 FROM dual UNION ALL 
  SELECT 'Habitacion de lujo','Vista interior','Cuando llegó a las primeras colinas de las Montañas Itálicas, tuvo una última vista en el horizonte de su ciudad natal, Bookmarksgrove, el titular de Alphabet Village y la sublínea de su propia carretera, Line Lane. Lástima de una pregunta retórica corrió por su mejilla, luego ella continuó su camino.',240.00,'habitacion_lujo.jpg','65 m2',2,1 FROM dual;
commit;  
  
-- SELECT ID, DESCRIPCION, ESTADO, IDTIPOHABITACION HOTEL.FROM HABITACION;
INSERT INTO HOTEL.HABITACION ( ID, DESCRIPCION, ESTADO, IDTIPOHABITACION)
SELECT 1, '101',1,1 FROM DUAL UNION ALL
SELECT 2, '102',1,1 FROM DUAL UNION ALL
SELECT 3, '201',1,2 FROM DUAL UNION ALL
SELECT 4, '202',1,2 FROM DUAL UNION ALL
SELECT 5, '301',1,3 FROM DUAL UNION ALL
SELECT 6, '302',1,3 FROM DUAL UNION ALL
SELECT 7, '401',1,4 FROM DUAL UNION ALL
SELECT 8, '402',1,4 FROM DUAL UNION ALL
SELECT 9, '501',1,5 FROM DUAL UNION ALL
SELECT 10, '502',1,5 FROM DUAL UNION ALL
SELECT 11, '601',1,6 FROM DUAL UNION ALL
SELECT 12, '602',1,6 FROM dual;
commit;


INSERT INTO HOTEL.RESERVA (FECHA, ESTADO, IDCLIENTE, FECHAINCIO, FECHAFIN, IDPROMOCION, TOTALDESCUENTO, TOTALPRECIO)
SELECT TO_DATE('2019-03-24', 'YYYY-MM-DD') ,1,1,TO_DATE('2019-03-24', 'YYYY-MM-DD') ,TO_DATE('2019-03-25', 'YYYY-MM-DD') , NULL, 0, 120.00  FROM DUAL UNION ALL
SELECT TO_DATE('2019-03-24', 'YYYY-MM-DD') ,1,2, TO_DATE('2019-03-24', 'YYYY-MM-DD') , TO_DATE('2019-03-25', 'YYYY-MM-DD') , NULL, 0, 140.00  FROM DUAL UNION ALL
SELECT TO_DATE('2019-03-24', 'YYYY-MM-DD') ,1,3,TO_DATE('2019-03-25', 'YYYY-MM-DD') ,TO_DATE('2019-03-26', 'YYYY-MM-DD') , 1, 12.00, 108.00  FROM DUAL UNION ALL
SELECT TO_DATE('2019-03-24', 'YYYY-MM-DD') ,1,3, TO_DATE('2019-03-27', 'YYYY-MM-DD') , TO_DATE('2019-03-29', 'YYYY-MM-DD') , 1, 28.00, 252.00  FROM DUAL;
commit;

INSERT INTO HOTEL.DETALLERESERVA (IDRESERVA, IDHABITACION, SUBTOTALDESCUENTO, SUBTOTALPRECIO)
SELECT 1, 1, 0.00, 120.00 FROM DUAL UNION ALL
SELECT 2, 3, 0.00, 140.00  FROM DUAL UNION ALL
SELECT 3, 1, 12.00, 108.00  FROM DUAL UNION ALL
SELECT 4, 3, 28.00, 252.00  FROM DUAL;
commit;

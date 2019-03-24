-- ==========================================================
-- Cargar datos de prueba
-- ==========================================================

-- Tabla TIPO_CONVOCATORIA
insert into TIPO_CONVOCATORIA values(1,'CAP','1');
insert into TIPO_CONVOCATORIA values(2,'CAS','1');
insert into TIPO_CONVOCATORIA values(3,'PRÁCTICAS PREPROFESIONALES','1');
insert into TIPO_CONVOCATORIA values(4,'PRÁCTICAS PROFESIONALES','1');

-- Tabla ETAPA_CONVOCATORIA
insert into ETAPA_CONVOCATORIA values(1,'NUEVA','1');
insert into ETAPA_CONVOCATORIA values(2,'EN PROCESO','1');
insert into ETAPA_CONVOCATORIA values(3,'FINALIZADA','1');

-- Tabla CONVOCATORIA
insert into CONVOCATORIA values('00001','2019','ESPECIALISTA EN GESTIÓN DE SEGURIDAD DE LA INFORMACIÓN','GERENCIA DE SEGURIDAD DE LA INFORMACIÓN','LIMA','18/03/2019','25/03/2019','1',2,1);
insert into CONVOCATORIA values('00002','2019','ESPECIALISTA EN PROGRAMACIÓN JAVA','SUB GERENCIA DE INGENIERÍA DE SOTFWARE','LIMA','18/03/2019','25/03/2019','1',2,1);
insert into CONVOCATORIA values('00003','2019','ESPECIALISTA EN BASE DE DATOS','SUB GERENCIA DE BASE DE DATOS','LIMA','18/03/2019','25/03/2019','1',2,1);
insert into convocatoria values('00004', '2019', 'ABOGADO(A)', 'GERENCIA DE ASESORÍA LEGAL', 'LAMBAYEQUE', '22/03/2019','29/03/2019', '1', 2, 1);
insert into convocatoria values('00005', '2019', 'ASISTENTE REGISTRAL', 'GERENCIA DE OFICINAS REGISTRALES', 'LAMBAYEQUE', '22/03/2019','29/03/2019', '1', 2, 1);


-- Tabla ESTADO_CIVIL
insert into ESTADO_CIVIL values(1,'SOLTERO(A)','1');
insert into ESTADO_CIVIL values(2,'CASADO(A)','1');
insert into ESTADO_CIVIL values(3,'DIVORCIADO(A)','1');
insert into ESTADO_CIVIL values(4,'VIUDO(A)','1');

-- Tabla POSTULANTE
insert into POSTULANTE values('42524869','00001','2019','2','TORRES','VILLALOBOS','GIOVANNI','1',1,'12/04/1984','10425248691','giomatovi@hotmail.com','','JR. MILLER 953 - LINCE','','','971842369','1');
insert into POSTULANTE values('40283839','00001','2019','2','HUAISARA','OLARTE','KAREN','2',1,'23/05/1980','10402838393','kahualor@hotmail.com','','CAL. LAS GAVIOTAS 1036 - JESUS MARIA','01','4235698','','1');
insert into POSTULANTE values('16548297','00002','2019','2','SUAREZ','MALDONADO','SABRINA','2',1,'12/08/1978','1065482972','sasuai@gmail.com','','AV. SAN BORJA SUR 2054 - SAN BORJA','','','990350246','1');
insert into POSTULANTE values('16547896','00002','2019','2','OLANO','RIOJA','ALONSO','1',1,'20/08/1983','10165478963','lolano@gmail.com','','AV. SAN JOSÉ 755 - CHICLAYO','074','235049','','1');
insert into POSTULANTE values('44156398','00003','2019','2','TORRES','VILLALOBOS','JUAN','1',1,'12/04/1989','10441563987','jtorres@hotmail.com','','JR. MILLER 953 - LINCE','','','971842369','1');
insert into POSTULANTE values('40283838','00003','2019','2','HUAISARA','OLARTE','ROXANA','2',1,'03/02/1990','10402838383','rhuaisara@hotmail.com','','CAL. LAS GAVIOTAS 1036 - JESUS MARIA','01','4235698','','1');
insert into POSTULANTE values('16548290','00003','2019','2','MONTALVO','MALDONADO','CARLA','2',1,'12/08/1978','1165482904','cmontalvo@gmail.com','','AV. SAN LUI 1054 - SAN BORJA','','','987632587','1');
insert into POSTULANTE values('42169824','00003','2019','2','SOLANO','MENDOZA','LUIS','1',1,'20/08/1983','10421698240','lmendozaso@gmail.com','','AV. SAN JOSÉ 565 - CHICLAYO','074','221335','','1');

-- Tabla PERFIL
insert into PERFIL values(1,'ADMINISTRADOR','1');
insert into PERFIL values(2,'SUPERVISOR','1');
insert into PERFIL values(3,'OPERADOR','1');

-- Tabla ASISTENTE
insert into ASISTENTE values(1,'ARTURO CASTRO BECERRA',1,'1');
insert into ASISTENTE values(2,'JORGE LLONTOP HUATAY',2,'1');
insert into ASISTENTE values(3,'JOSÉ ESTEVES GONZALES',3,'1');
insert into ASISTENTE values(4,'CRISTIAN CABRERA GIL',3,'1');
insert into ASISTENTE values(5,'OLGA CARRANZA BERNILLA',3,'1');
insert into ASISTENTE values(6,'DIANA VÁSQUEZ URBIETA',3,'1');
insert into ASISTENTE values(7,'JOSÉ FERNÁNDEZ DEL RÍO',3,'1');
insert into ASISTENTE values(8,'ADOLFO VILLANUEVA AGUILAR',3,'1');

-- Tabla ASIGNA_CONVOCATORIA
insert into ASIGNA_CONVOCATORIA values(3,'00001','2019','2','1',SYSDATE);
insert into ASIGNA_CONVOCATORIA values(4,'00001','2019','2','1',SYSDATE);
insert into ASIGNA_CONVOCATORIA values(5,'00001','2019','2','1',SYSDATE);
insert into ASIGNA_CONVOCATORIA values(3,'00002','2019','2','1',SYSDATE);
insert into ASIGNA_CONVOCATORIA values(6,'00002','2019','2','1',SYSDATE);
insert into ASIGNA_CONVOCATORIA values(8,'00002','2019','2','1',SYSDATE);
insert into ASIGNA_CONVOCATORIA values(3,'00003','2019','2','1',SYSDATE);
insert into ASIGNA_CONVOCATORIA values(6,'00003','2019','2','1',SYSDATE);

commit;






select * from asigna_convocatoria

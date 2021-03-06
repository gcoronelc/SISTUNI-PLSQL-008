--------------------------------------------------------
-- Archivo creado  - domingo-marzo-24-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence CLIENTE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HOTEL"."CLIENTE_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence DETALLERESERVA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HOTEL"."DETALLERESERVA_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence HABITACION_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HOTEL"."HABITACION_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PROMOCION_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HOTEL"."PROMOCION_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence RESERVA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HOTEL"."RESERVA_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TIPOHABITACION_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HOTEL"."TIPOHABITACION_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TIPOPROMOCION_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HOTEL"."TIPOPROMOCION_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table CLIENTE
--------------------------------------------------------

  CREATE TABLE "HOTEL"."CLIENTE" 
   (	"ID" NUMBER(10,0), 
	"NOMBRES" VARCHAR2(45 BYTE) DEFAULT NULL, 
	"APP" VARCHAR2(45 BYTE) DEFAULT NULL, 
	"APM" VARCHAR2(45 BYTE) DEFAULT NULL, 
	"DNI" NUMBER(10,0) DEFAULT NULL, 
	"RUC" VARCHAR2(11 BYTE) DEFAULT NULL, 
	"RAZONSOCIAL" VARCHAR2(45 BYTE) DEFAULT NULL, 
	"CELULAR" VARCHAR2(9 BYTE), 
	"CORREO" VARCHAR2(45 BYTE), 
	"PASSWORD" VARCHAR2(255 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table HABITACION
--------------------------------------------------------

  CREATE TABLE "HOTEL"."HABITACION" 
   (	"ID" NUMBER(10,0), 
	"DESCRIPCION" VARCHAR2(45 BYTE), 
	"ESTADO" VARCHAR2(45 BYTE), 
	"IDTIPOHABITACION" NUMBER(10,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PROMOCION
--------------------------------------------------------

  CREATE TABLE "HOTEL"."PROMOCION" 
   (	"ID" NUMBER(10,0), 
	"DESCRIPCION" VARCHAR2(45 BYTE), 
	"DESCUENTO" NUMBER(10,0), 
	"IDTIPOPROMOCION" NUMBER(10,0), 
	"FECHAINICIO" DATE, 
	"FECHAFIN" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table RESERVA
--------------------------------------------------------

  CREATE TABLE "HOTEL"."RESERVA" 
   (	"ID" NUMBER(10,0), 
	"FECHA" DATE, 
	"ESTADO" VARCHAR2(45 BYTE), 
	"IDCLIENTE" NUMBER(10,0), 
	"FECHAINCIO" DATE, 
	"FECHAFIN" DATE, 
	"IDPROMOCION" NUMBER(10,0) DEFAULT NULL, 
	"TOTALDESCUENTO" NUMBER(8,2), 
	"TOTALPRECIO" NUMBER(8,2)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TIPOHABITACION
--------------------------------------------------------

  CREATE TABLE "HOTEL"."TIPOHABITACION" 
   (	"ID" NUMBER(10,0), 
	"NOMBRE" VARCHAR2(45 BYTE), 
	"VISTA" VARCHAR2(45 BYTE), 
	"DESCRIPCION" CLOB, 
	"PRECIO" NUMBER(8,2), 
	"IMAGEN" VARCHAR2(45 BYTE), 
	"TAMANIO" VARCHAR2(45 BYTE), 
	"CANTPERSONAS" NUMBER(10,0), 
	"NUMCAMAS" NUMBER(10,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" 
 LOB ("DESCRIPCION") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table TIPOPROMOCION
--------------------------------------------------------

  CREATE TABLE "HOTEL"."TIPOPROMOCION" 
   (	"ID" NUMBER(10,0), 
	"DESCRIPCION" VARCHAR2(45 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into HOTEL.CLIENTE
SET DEFINE OFF;
REM INSERTING into HOTEL.HABITACION
SET DEFINE OFF;
REM INSERTING into HOTEL.PROMOCION
SET DEFINE OFF;
REM INSERTING into HOTEL.RESERVA
SET DEFINE OFF;
REM INSERTING into HOTEL.TIPOHABITACION
SET DEFINE OFF;
REM INSERTING into HOTEL.TIPOPROMOCION
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index FK_HABITACION_TIPO_IDX
--------------------------------------------------------

  CREATE INDEX "HOTEL"."FK_HABITACION_TIPO_IDX" ON "HOTEL"."HABITACION" ("IDTIPOHABITACION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index FK_RESERVA_CLIENTE1_IDX
--------------------------------------------------------

  CREATE INDEX "HOTEL"."FK_RESERVA_CLIENTE1_IDX" ON "HOTEL"."RESERVA" ("IDCLIENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index FK_RESERVA_PROMOCION1_IDX
--------------------------------------------------------

  CREATE INDEX "HOTEL"."FK_RESERVA_PROMOCION1_IDX" ON "HOTEL"."RESERVA" ("IDPROMOCION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010821
--------------------------------------------------------

  CREATE UNIQUE INDEX "HOTEL"."SYS_C0010821" ON "HOTEL"."TIPOHABITACION" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010824
--------------------------------------------------------

  CREATE UNIQUE INDEX "HOTEL"."SYS_C0010824" ON "HOTEL"."TIPOPROMOCION" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010829
--------------------------------------------------------

  CREATE UNIQUE INDEX "HOTEL"."SYS_C0010829" ON "HOTEL"."CLIENTE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010834
--------------------------------------------------------

  CREATE UNIQUE INDEX "HOTEL"."SYS_C0010834" ON "HOTEL"."HABITACION" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010842
--------------------------------------------------------

  CREATE UNIQUE INDEX "HOTEL"."SYS_C0010842" ON "HOTEL"."PROMOCION" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010852
--------------------------------------------------------

  CREATE UNIQUE INDEX "HOTEL"."SYS_C0010852" ON "HOTEL"."RESERVA" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger CLIENTE_SEQ_TR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HOTEL"."CLIENTE_SEQ_TR" 
 BEFORE INSERT ON cliente FOR EACH ROW
  WHEN (NEW.id IS NULL) BEGIN
 SELECT cliente_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/
ALTER TRIGGER "HOTEL"."CLIENTE_SEQ_TR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger HABITACION_SEQ_TR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HOTEL"."HABITACION_SEQ_TR" 
 BEFORE INSERT ON habitacion FOR EACH ROW
  WHEN (NEW.id IS NULL) BEGIN
 SELECT habitacion_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/
ALTER TRIGGER "HOTEL"."HABITACION_SEQ_TR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PROMOCION_SEQ_TR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HOTEL"."PROMOCION_SEQ_TR" 
 BEFORE INSERT ON promocion FOR EACH ROW
  WHEN (NEW.id IS NULL) BEGIN
 SELECT promocion_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/
ALTER TRIGGER "HOTEL"."PROMOCION_SEQ_TR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RESERVA_SEQ_TR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HOTEL"."RESERVA_SEQ_TR" 
 BEFORE INSERT ON reserva FOR EACH ROW
  WHEN (NEW.id IS NULL) BEGIN
 SELECT reserva_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/
ALTER TRIGGER "HOTEL"."RESERVA_SEQ_TR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TIPOHABITACION_SEQ_TR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HOTEL"."TIPOHABITACION_SEQ_TR" 
 BEFORE INSERT ON tipohabitacion FOR EACH ROW
  WHEN (NEW.id IS NULL) BEGIN
 SELECT tipohabitacion_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/
ALTER TRIGGER "HOTEL"."TIPOHABITACION_SEQ_TR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TIPOPROMOCION_SEQ_TR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HOTEL"."TIPOPROMOCION_SEQ_TR" 
 BEFORE INSERT ON tipopromocion FOR EACH ROW
  WHEN (NEW.id IS NULL) BEGIN
 SELECT tipopromocion_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/
ALTER TRIGGER "HOTEL"."TIPOPROMOCION_SEQ_TR" ENABLE;
--------------------------------------------------------
--  Constraints for Table CLIENTE
--------------------------------------------------------

  ALTER TABLE "HOTEL"."CLIENTE" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."CLIENTE" MODIFY ("CELULAR" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."CLIENTE" MODIFY ("CORREO" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."CLIENTE" MODIFY ("PASSWORD" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."CLIENTE" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table HABITACION
--------------------------------------------------------

  ALTER TABLE "HOTEL"."HABITACION" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."HABITACION" MODIFY ("DESCRIPCION" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."HABITACION" MODIFY ("ESTADO" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."HABITACION" MODIFY ("IDTIPOHABITACION" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."HABITACION" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PROMOCION
--------------------------------------------------------

  ALTER TABLE "HOTEL"."PROMOCION" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."PROMOCION" MODIFY ("DESCRIPCION" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."PROMOCION" MODIFY ("DESCUENTO" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."PROMOCION" MODIFY ("IDTIPOPROMOCION" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."PROMOCION" MODIFY ("FECHAINICIO" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."PROMOCION" MODIFY ("FECHAFIN" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."PROMOCION" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table RESERVA
--------------------------------------------------------

  ALTER TABLE "HOTEL"."RESERVA" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."RESERVA" MODIFY ("FECHA" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."RESERVA" MODIFY ("ESTADO" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."RESERVA" MODIFY ("IDCLIENTE" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."RESERVA" MODIFY ("FECHAINCIO" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."RESERVA" MODIFY ("FECHAFIN" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."RESERVA" MODIFY ("TOTALDESCUENTO" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."RESERVA" MODIFY ("TOTALPRECIO" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."RESERVA" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TIPOHABITACION
--------------------------------------------------------

  ALTER TABLE "HOTEL"."TIPOHABITACION" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."TIPOHABITACION" MODIFY ("NOMBRE" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."TIPOHABITACION" MODIFY ("VISTA" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."TIPOHABITACION" MODIFY ("DESCRIPCION" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."TIPOHABITACION" MODIFY ("PRECIO" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."TIPOHABITACION" MODIFY ("IMAGEN" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."TIPOHABITACION" MODIFY ("TAMANIO" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."TIPOHABITACION" MODIFY ("CANTPERSONAS" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."TIPOHABITACION" MODIFY ("NUMCAMAS" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."TIPOHABITACION" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TIPOPROMOCION
--------------------------------------------------------

  ALTER TABLE "HOTEL"."TIPOPROMOCION" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."TIPOPROMOCION" MODIFY ("DESCRIPCION" NOT NULL ENABLE);
 
  ALTER TABLE "HOTEL"."TIPOPROMOCION" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HABITACION
--------------------------------------------------------

  ALTER TABLE "HOTEL"."HABITACION" ADD CONSTRAINT "FK_HABITACION_TIPO" FOREIGN KEY ("IDTIPOHABITACION")
	  REFERENCES "HOTEL"."TIPOHABITACION" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PROMOCION
--------------------------------------------------------

  ALTER TABLE "HOTEL"."PROMOCION" ADD CONSTRAINT "FK_PROMOCION_TIPOPROMOCION1" FOREIGN KEY ("IDTIPOPROMOCION")
	  REFERENCES "HOTEL"."TIPOPROMOCION" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RESERVA
--------------------------------------------------------

  ALTER TABLE "HOTEL"."RESERVA" ADD CONSTRAINT "FK_RESERVA_CLIENTE1" FOREIGN KEY ("IDCLIENTE")
	  REFERENCES "HOTEL"."CLIENTE" ("ID") ENABLE;
 
  ALTER TABLE "HOTEL"."RESERVA" ADD CONSTRAINT "FK_RESERVA_PROMOCION1" FOREIGN KEY ("IDPROMOCION")
	  REFERENCES "HOTEL"."PROMOCION" ("ID") ENABLE;


ALTER TABLE HOTEL.CLIENTE ADD estado NUMBER DEFAULT 1 NOT NULL;

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE detallereserva';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE detallereserva (
  id int NOT NULL,
  idReserva int NOT NULL,
  idHabitacion int NOT NULL,
  subTotalDescuento decimal(8,2) NOT NULL,
  subTotalPrecio decimal(8,2) NOT NULL,
  PRIMARY KEY (id),  
  CONSTRAINT fk_reserva_has_habitacion1 FOREIGN KEY (idHabitacion) REFERENCES habitacion (id),
  CONSTRAINT fk_reserva_has_reserva1 FOREIGN KEY (idReserva) REFERENCES reserva (id)
);

CREATE OR REPLACE TRIGGER detallereserva_seq_tr
 BEFORE INSERT ON detallereserva FOR EACH ROW
 WHEN (NEW.id IS NULL)
BEGIN
 SELECT detallereserva_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/ 
-- =============================================
-- CONECTARSE A LA APLICACIÓN
-- =============================================
CONNECT VENTAS/admin

--select * from VENTAS.TipoDocumento;
insert into TipoDocumento(IDTIPODOCUMENTO,DESCRIPCION,ESTADO) values(1,'DNI',1);
insert into TipoDocumento(IDTIPODOCUMENTO,DESCRIPCION,ESTADO) values(2,'RUC',1);
insert into TipoDocumento(IDTIPODOCUMENTO,DESCRIPCION,ESTADO) values(3,'CE',1);
insert into TipoDocumento(IDTIPODOCUMENTO,DESCRIPCION,ESTADO) values(4,'PAS',1);

COMMIT;
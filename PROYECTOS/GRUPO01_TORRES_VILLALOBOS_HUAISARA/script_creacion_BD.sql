-- ==========================================================
-- Crear la Tabla TIPO_CONVOCATORIA
-- ==========================================================

create table TIPO_CONVOCATORIA
(
  CO_TIPO     INTEGER not null,
  DE_TIPO     VARCHAR2(50) not null,
  IN_ESTADO   CHAR(1) not null,
  constraint PK_TIPO_CONVOCATORIA primary key (CO_TIPO)
);
-- Adicionar comentarios a las columnas
comment on column TIPO_CONVOCATORIA.CO_TIPO
  is 'CODIGO DEL TIPO DE CONVOCATORIA';
comment on column TIPO_CONVOCATORIA.DE_TIPO
  is 'DESCRIPCION DEL TIPO DE CONVOCATORIA';
comment on column TIPO_CONVOCATORIA.IN_ESTADO
  is 'ESTADO DEL TIPO DE CONVOCATORIA (1 ACTIVO  0 INACTIVO)';


-- ==========================================================
-- Crear la Tabla ETAPA_CONVOCATORIA
-- ==========================================================
create table ETAPA_CONVOCATORIA
(
  CO_ETAPA    INTEGER not null,
  DE_ETAPA    VARCHAR2(50) not null,
  IN_ESTADO   CHAR(1) not null,
  constraint PK_ETAPA_CONVOCATORIA primary key (CO_ETAPA)
);
-- Adicionar comentarios a las columnas
comment on column ETAPA_CONVOCATORIA.CO_ETAPA
  is 'CODIGO DE LA ETAPA';
comment on column ETAPA_CONVOCATORIA.DE_ETAPA
  is 'DESCRIPCION DE LA ETAPA';
comment on column ETAPA_CONVOCATORIA.IN_ESTADO
  is 'INDICADOR DE ESTADO (1 ACTIVA  2 INACTIVA)';


-- ==========================================================
-- Crear la Tabla CONVOCATORIA
-- ==========================================================
create table CONVOCATORIA
(
  NU_CONV         CHAR(5) not null,
  AN_CONV         CHAR(4) not null,
  DE_CONV         VARCHAR2(100) not null,
  DE_UUOO         VARCHAR2(50),
  DE_UBICACION    VARCHAR2(80),
  FE_INI_CONV     DATE not null,
  FE_FIN_CONV     DATE not null,
  IN_ESTADO       CHAR(1) not null,
  CO_TIPO         INTEGER not null,
  CO_ETAPA        INTEGER not null,
  constraint PK_CONVOCATORIA primary key (NU_CONV, AN_CONV, CO_TIPO),
  constraint FK_CONVOCATORIA_TIPO foreign key (CO_TIPO) references TIPO_CONVOCATORIA (CO_TIPO),
  constraint FK_CONVOCATORIA_ETAPA foreign key (CO_ETAPA) references ETAPA_CONVOCATORIA (CO_ETAPA)
);
-- Adicionar comentarios a las columnas
comment on column CONVOCATORIA.NU_CONV
  is 'NUMERO DE CONVOCATORIA';
comment on column CONVOCATORIA.AN_CONV
  is 'AÑO DE CONVOCATORIA';
comment on column CONVOCATORIA.DE_CONV
  is 'DESCRIPCION DE LA CONVOCATORIA';
comment on column CONVOCATORIA.DE_UUOO
  is 'DESCRIPCION DE LA UUOO(GERENCIA) SELECCIONADA';
comment on column CONVOCATORIA.DE_UBICACION
  is 'DESCRIPCION DEL UBIGEO SELECCIONADO PARA LA CONVOCATORIA';
comment on column CONVOCATORIA.FE_INI_CONV
  is 'FECHA INICIO DE LA CONVOCATORIA';
comment on column CONVOCATORIA.FE_FIN_CONV
  is 'FECHA FIN DE LA CONVOCATORIA';
comment on column CONVOCATORIA.IN_ESTADO
  is 'INDICADOR DE ESTADO (1 ACTIVA  0 INACTIVA)';
comment on column CONVOCATORIA.CO_TIPO
  is 'CODIGO DE TIPO DE CONVOCATORIA';
comment on column CONVOCATORIA.CO_ETAPA
  is 'CODIGO DE ETAPA DE CONVOCATORIA';


-- ==========================================================
-- Crear la Tabla ESTADO_CIVIL
-- ==========================================================
create table ESTADO_CIVIL
(
  CO_ESTADO_CIVIL INTEGER not null,
  DE_ESTADO_CIVIL VARCHAR2(50) not null,
  IN_ESTADO       CHAR(1) not null,
  constraint PK_ESTADO_CIVIL primary key (CO_ESTADO_CIVIL)
);
-- Adicionar comentarios a las columnas
comment on column ESTADO_CIVIL.CO_ESTADO_CIVIL
  is 'CODIGO DE ESTADO CIVIL';
comment on column ESTADO_CIVIL.DE_ESTADO_CIVIL
  is 'DESCRIPCION DE ESTADO CIVIL';
comment on column ESTADO_CIVIL.IN_ESTADO
  is 'INDICADOR DE ESTADO (1 ACTIVO  0 INACTIVO)';


-- ==========================================================
-- Crear la Tabla POSTULANTE
-- ==========================================================
create table POSTULANTE
(
  NU_DNI           CHAR(8) not null,
  NU_CONV          CHAR(5) not null,
  AN_CONV          CHAR(4) not null,
  CO_TIPO          INTEGER not null,
  AP_PATERNO       VARCHAR2(50) not null,
  AP_MATERNO       VARCHAR2(50) not null,
  NO_PRENOMBRE     VARCHAR2(50) not null,
  IN_GENERO        CHAR(1) not null,
  CO_ESTADO_CIVIL  INTEGER not null,
  FE_NAC           DATE not null,
  NU_RUC           CHAR(11),
  DE_EMAIL         VARCHAR2(100) not null,
  DE_EMAIL_ALTER   VARCHAR2(100),
  DE_DIRECCION     VARCHAR2(100) not null,
  CO_TELEFONO      VARCHAR2(3),
  NU_TELEFONO      VARCHAR2(25),
  NU_CELULAR       VARCHAR2(25),
  IN_ESTADO        CHAR(1) not null,
  constraint PK_POSTULANTE primary key (NU_DNI, NU_CONV, AN_CONV, CO_TIPO),
  constraint FK_POSTULANTE_CONVOCATORIA foreign key (NU_CONV, AN_CONV, CO_TIPO) references CONVOCATORIA (NU_CONV, AN_CONV, CO_TIPO),
  constraint FK_POSTULANTE_ESTADO_CIVIL foreign key (CO_ESTADO_CIVIL) references ESTADO_CIVIL (CO_ESTADO_CIVIL)
);
-- Adicionar comentarios a las columnas
comment on column POSTULANTE.NU_DNI
  is 'NUMERO DE DNI DE POSTULANTE';
comment on column POSTULANTE.NU_CONV
  is 'NUMERO DE CONVOCATORIA';
comment on column POSTULANTE.AN_CONV
  is 'AÑO DE CONVOCATORIA';
comment on column POSTULANTE.CO_TIPO
  is 'CODIGO DE TIPO DE CONVOCATORIA';
comment on column POSTULANTE.AP_PATERNO
  is 'APELLIDO PATERNO DEL POSTULANTE';
comment on column POSTULANTE.AP_MATERNO
  is 'APELLIDO MATERNO DEL POSTULANTE';
comment on column POSTULANTE.NO_PRENOMBRE
  is 'NOMBRE DEL POSTULANTE';
comment on column POSTULANTE.IN_GENERO
  is 'INDICADOR DEL GENERO (1 MASCULINO  2 FEMENINO)';
comment on column POSTULANTE.CO_ESTADO_CIVIL
  is 'CODIGO DE ESTADO CIVIL';
comment on column POSTULANTE.FE_NAC
  is 'FECHA DE NACIMIENTO DEL POSTULANTE';
comment on column POSTULANTE.NU_RUC
  is 'NUMERO DE RUC';
comment on column POSTULANTE.DE_EMAIL
  is 'CORREO ELECTRONICO';
comment on column POSTULANTE.DE_EMAIL_ALTER
  is 'CORREO ELECTRONICO ALTERNATVO';
comment on column POSTULANTE.DE_DIRECCION
  is 'DIRECCION';
comment on column POSTULANTE.CO_TELEFONO
  is 'CODIGO DE TELEFONO';
comment on column POSTULANTE.NU_TELEFONO
  is 'NUMERO DE TELEFONO';
comment on column POSTULANTE.NU_CELULAR
  is 'NUMERO DE CELULAR';
comment on column POSTULANTE.IN_ESTADO
  is 'INDICADOR DE ESTADO DEL POSTULANTE EN LA CONVOCATORIA (1 REGISTRO WEB  2 CV RECEPCIONADO)';


-- ==========================================================
-- Crear la Tabla PERFIL
-- ==========================================================
create table PERFIL
(
  CO_PERFIL INTEGER not null,
  DE_PERFIL VARCHAR2(50) not null,
  IN_ESTADO CHAR(1) not null,
  constraint PK_PERFIL primary key (CO_PERFIL)
);
-- Adicionar comentarios a las columnas
comment on column PERFIL.CO_PERFIL
  is 'CODIGO DE PERFIL';
comment on column PERFIL.DE_PERFIL
  is 'DESCRIPCION DE PERFIL';
comment on column PERFIL.IN_ESTADO
  is 'INDICADOR DE ESTADO (1 ACTIVO  0 INACTIVO)';


-- ==========================================================
-- Crear la Tabla ASISTENTE
-- ==========================================================
create table ASISTENTE
(
  CO_ASISTENTE  INTEGER not null,
  NO_ASISTENTE  VARCHAR2(100),
  CO_PERFIL     INTEGER,
  IN_ESTADO     CHAR(1) not null,
  constraint PK_ASISTENTE primary key (CO_ASISTENTE),
  constraint FK_ASISTENTE_PERFIL foreign key (CO_PERFIL) references PERFIL (CO_PERFIL)
);
-- Adicionar comentarios a las columnas
comment on column ASISTENTE.CO_ASISTENTE
  is 'CODIGO DEL ASISTENTE ';
comment on column ASISTENTE.NO_ASISTENTE
  is 'NOMBRE COMPLETO DE ASISTENTE';
comment on column ASISTENTE.CO_PERFIL
  is 'CODIGO DE PERFIL';
comment on column ASISTENTE.IN_ESTADO
  is 'INDICADOR DE ESTADO (1 ACTIVO  0 INACTIVO)';


-- ==========================================================
-- Crear la Tabla ASIGNA_CONVOCATORIA
-- ==========================================================
create table ASIGNA_CONVOCATORIA
(
  CO_ASISTENTE INTEGER not null,
  NU_CONV      CHAR(5) not null,
  AN_CONV      CHAR(4) not null,
  CO_TIPO      INTEGER not null,
  IN_ESTADO    CHAR(1) not null,
  FE_ASIGNA    DATE    not null,
  constraint PK_ASIGNA_CONVOCATORIA primary key (CO_ASISTENTE, NU_CONV, AN_CONV, CO_TIPO),
  constraint FK_ASIGNA_CONV_ASISTENTE foreign key (CO_ASISTENTE) references ASISTENTE (CO_ASISTENTE),
  constraint FK_ASIGNA_CONV_CONVOCATORIA foreign key (NU_CONV, AN_CONV, CO_TIPO) references CONVOCATORIA (NU_CONV, AN_CONV, CO_TIPO)
);
-- Adicionar comentarios a las columnas 
comment on column ASIGNA_CONVOCATORIA.CO_ASISTENTE
  is 'CODIGO DEL ASISTENTE (CODIGO DE EMPLEADO)';
comment on column ASIGNA_CONVOCATORIA.NU_CONV
  is 'NUMERO DE LA CONVOCATORIA';
comment on column ASIGNA_CONVOCATORIA.AN_CONV
  is 'AÑO DE LA CONVOCATORIA';
comment on column ASIGNA_CONVOCATORIA.CO_TIPO
  is 'CODIGO DEL TIPO DE CONVOCATORIA';
comment on column ASIGNA_CONVOCATORIA.IN_ESTADO
  is 'INDICADOR DE ESTADO (1 ACTIVO  0 INACTIVO)';
comment on column ASIGNA_CONVOCATORIA.FE_ASIGNA
  is 'FECHA DE ASIGNACIÓN DE LA CONVOCATORIA';


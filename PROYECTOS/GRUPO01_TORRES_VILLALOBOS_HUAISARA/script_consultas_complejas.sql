-- ==========================================================
-- Consultas Complejas
-- ==========================================================

-- Mostrar todas las convocatorias (número, año, tipo y escripción de la convocatoria), 
-- ¿Cuántos asistentes tienen a cargo cada convocatoria?, y el número de postulantes por convocatoria.
select C.NU_CONV NUMERO, 
       C.AN_CONV AÑO, 
       (select TC.DE_TIPO
        from TIPO_CONVOCATORIA TC
        where TC.CO_TIPO = C.CO_TIPO) TIPO,
       C.DE_CONV DESCRIPCION,
       (select count(AC.CO_ASISTENTE)
        from ASIGNA_CONVOCATORIA AC
        where AC.NU_CONV = C.NU_CONV 
        and AC.AN_CONV = C.AN_CONV 
        and AC.CO_TIPO = C.CO_TIPO) ASISTENTES,
       (select count(P.NU_DNI)
        from POSTULANTE P 
        where P.NU_CONV = C.NU_CONV 
        and P.AN_CONV = C.AN_CONV 
        and P.CO_TIPO = C.CO_TIPO) POSTULANTES
from CONVOCATORIA C 
order by C.NU_CONV, C.AN_CONV

-- Mostrar a todos los asistentes (Código, nombre, perfil) y el número de convocatorias asignadas
select A.CO_ASISTENTE, 
       A.NO_ASISTENTE,
       (select P.DE_PERFIL
        from PERFIL P 
        where P.CO_PERFIL = A.CO_PERFIL) PERFIL,
       (select count(AC.CO_ASISTENTE)
        from ASIGNA_CONVOCATORIA AC
        where AC.CO_ASISTENTE = A.CO_ASISTENTE) CONVOCATORIAS
from ASISTENTE A 
order by A.CO_ASISTENTE


-- ============================================================
-- ARCHIVO: 03_consultas.sql
-- PROYECTO: Análisis de Rendimiento Liga BetPlay 2025
-- EQUIPO: 3 — Bootcamp AVD Talento Tech Valle
-- FECHA: 2026
-- HERRAMIENTA: SQLite (compatible con sqliteonline.com)
-- ============================================================
-- TABLA FUENTE: betplay_2025_eda
-- Origen: 02_datos/02_Procesados/betplay_2025_eda.csv
-- ============================================================


-- ============================================================
-- CONSULTA 1: Ranking de Riesgo de Descenso
-- ¿Qué equipos tienen mayor riesgo de descenso?
-- Ordena los 20 equipos de mayor a menor riesgo usando
-- el índice compuesto calculado en el EDA (Notebook 02).
-- ============================================================

SELECT
    Posicion,
    Club,
    Puntos,
    Ganados,
    Perdidos,
    Diferencia_gol,
    ROUND(indice_riesgo, 3)     AS indice_riesgo,
    zona_riesgo
FROM betplay_2025_eda
ORDER BY indice_riesgo DESC;


-- ============================================================
-- CONSULTA 2: Promedio de Indicadores por Zona de Riesgo
-- ¿Cómo se comportan los equipos según su zona?
-- Agrupa y compara victorias, derrotas, goles y diferencia
-- de gol promedio para cada zona de riesgo.
-- ============================================================

SELECT
    zona_riesgo,
    COUNT(*)                        AS equipos,
    ROUND(AVG(Puntos), 1)           AS puntos_promedio,
    ROUND(AVG(Ganados), 1)          AS victorias_promedio,
    ROUND(AVG(Perdidos), 1)         AS derrotas_promedio,
    ROUND(AVG(Goles_favor), 1)      AS goles_favor_prom,
    ROUND(AVG(Goles_en_contra), 1)  AS goles_contra_prom,
    ROUND(AVG(Diferencia_gol), 1)   AS diff_gol_promedio
FROM betplay_2025_eda
GROUP BY zona_riesgo
ORDER BY MIN(indice_riesgo) DESC;


-- ============================================================
-- CONSULTA 3: Equipos Sobre y Bajo el Promedio de la Liga
-- ¿Quién está por encima y por debajo de la media?
-- Usa funciones de ventana (OVER) para comparar cada equipo
-- contra el promedio general sin agrupar filas.
-- ============================================================

SELECT
    Club,
    Puntos,
    ROUND(AVG(Puntos) OVER (), 1)               AS promedio_liga,
    ROUND(Puntos - AVG(Puntos) OVER (), 1)      AS diferencia_vs_promedio,
    CASE
        WHEN Puntos >= AVG(Puntos) OVER ()
        THEN '⬆ Sobre promedio'
        ELSE '⬇ Bajo promedio'
    END                                          AS vs_promedio,
    zona_riesgo
FROM betplay_2025_eda
ORDER BY Puntos DESC;


-- ============================================================
-- CONSULTA 4: Tabla Resumen Final para el Dashboard
-- KPIs completos por equipo listos para Power BI / Looker
-- Incluye eficiencia ofensiva, defensiva y % de victorias.
-- CAST convierte enteros a decimales para evitar división
-- entera en SQLite.
-- ============================================================

SELECT
    Posicion                                    AS pos,
    Club,
    Puntos,
    Ganados                                     AS PG,
    Empatados                                   AS PE,
    Perdidos                                    AS PP,
    Goles_favor                                 AS GF,
    Goles_en_contra                             AS GC,
    Diferencia_gol                              AS DG,
    ROUND(indice_riesgo, 3)                     AS indice_riesgo,
    zona_riesgo,
    -- Eficiencia ofensiva: goles anotados por partido
    ROUND(CAST(Goles_favor AS FLOAT)
          / Partidos_jugados, 2)                AS goles_x_partido,
    -- Eficiencia defensiva: goles recibidos por partido
    ROUND(CAST(Goles_en_contra AS FLOAT)
          / Partidos_jugados, 2)                AS goles_recibidos_x_partido,
    -- Porcentaje de partidos ganados
    ROUND(CAST(Ganados AS FLOAT)
          / Partidos_jugados * 100, 1)          AS pct_victorias
FROM betplay_2025_eda
ORDER BY Posicion ASC;

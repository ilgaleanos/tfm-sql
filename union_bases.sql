SELECT  
    m.DPTO, m.MPIO, NOMBRE_DPT, NOMBRE_MPI,
    -- URIEL
    u.YYYY AS YYYY, 
        u.CENSO_HAB AS CENSO_HAB, 
        u.CENSO_ELECT AS CENSO_ELECT,
        u.DEL_ELECT AS URIEL_DEL_ELECT, 
    -- SPOA
        s.DEL_ELECT AS SPOA_DEL_ELECT,
    -- SUMA EN PROMEDIO DE BASES
        CASE 
            WHEN u.DEL_ELECT IS NULL THEN IFNULL(s.DEL_ELECT,0)
            WHEN s.DEL_ELECT IS NULL THEN IFNULL(u.DEL_ELECT,0)
            ELSE (IFNULL(u.DEL_ELECT, 0) + IFNULL(s.DEL_ELECT,0))/2 
        END AS TOTAL_DEL_PROM,
    -- SUMA DIRECTA
        (IFNULL(u.DEL_ELECT, 0) + IFNULL(s.DEL_ELECT,0)) AS TOTAL_DEL
FROM municipios m
LEFT JOIN uriel u ON ( m.MPIO = u.MPIO AND m.DPTO = u.DPTO)
LEFT JOIN spoa s ON ( m.MPIO = s.MPIO AND m.DPTO = s.DPTO AND u.YYYY = s.YYYY)
WHERE u.DEL_ELECT IS NOT NULL OR s.DEL_ELECT IS NOT NULL;


SELECT 
    BASE.*,
    m.NOMBRE_DPT,
    m.NOMBRE_MPI,
    m.LAT,
    m.LON,
    p.PIB,
    p2.VALOR AS PARTICIPACIONES,
    r.VALOR AS REGALIAS,
    IFNULL(u2.CENSO_HAB, s2.CENSO_HAB) AS CENSO_HAB,
    IFNULL(u2.CENSO_ELECT, s2.CENSO_ELECT) AS CENSO_ELECT,
    h.HOMx100K_HAB ,
    IFNULL(u2.DEL_ELECT, s2.DEL_ELECT) AS DEL_ELECT 
FROM (
    SELECT DISTINCT * FROM (
        SELECT u.DPTO, u.MPIO, u.YYYY  FROM uriel u
        UNION ALL 
        SELECT s.DPTO, s.MPIO, s.YYYY  FROM spoa s
    ) B
) BASE
LEFT JOIN municipios m ON (m.DPTO, m.MPIO) = (BASE.DPTO, BASE.MPIO)
LEFT JOIN pib p ON (p.DPTO,p.MPIO,p.YYYY) = (BASE.DPTO, BASE.MPIO, BASE.YYYY)
LEFT JOIN participaciones p2 ON (p2.DPTO,p2.MPIO,p2.YYYY) = (BASE.DPTO, BASE.MPIO, BASE.YYYY)
LEFT JOIN regalias r ON (r.DPTO,r.MPIO,r.YYYY) = (BASE.DPTO, BASE.MPIO, BASE.YYYY)
LEFT JOIN uriel u2 ON (u2.DPTO,u2.MPIO,u2.YYYY) = (BASE.DPTO, BASE.MPIO, BASE.YYYY)
LEFT JOIN spoa s2 ON (s2.DPTO,s2.MPIO,s2.YYYY) = (BASE.DPTO, BASE.MPIO, BASE.YYYY)
LEFT JOIN homicidios h ON (h.DPTO,h.MPIO,h.YYYY) = (BASE.DPTO, BASE.MPIO, BASE.YYYY)
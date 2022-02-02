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
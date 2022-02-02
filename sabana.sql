SELECT  
    m.DPTO, m.MPIO, NOMBRE_DPT, NOMBRE_MPI,
    -- URIEL
    u.YYYY AS URIEL_YYYY, 
        u.CENSO_HAB AS URIEL_CENSO_HAB, 
        u.DEL_ELECT AS URIEL_DEL_ELECT, 
        u.CENSO_ELECT AS URIEL_CENSO_ELECT, 
        u.DENUN_DEL_ELECTx100K_HAB_CENSO_ELECT AS URIEL_DENUN_DEL_ELECTx100K_HAB_CENSO_ELECT, 
        u.DENUN_DEL_ELECTx100K_HAB AS URIEL_DENUN_DEL_ELECTx100K_HAB,
    -- SPOA
        s.CENSO_HAB AS SPOA_CENSO_HAB, 
        s.DEL_ELECT AS SPOA_DEL_ELECT, 
        s.CENSO_ELECT AS SPOA_CENSO_ELECT, 
        s.DENUN_DEL_ELECTx100K_CENSO_ELECT AS SPOA_DENUN_DEL_ELECTx100K_HAB_CENSO_ELECT, 
        s.DENUN_DEL_ELECTx100K_HAB AS SPOA_DENUN_DEL_ELECTx100K_HAB,
    -- REGALIAS
        r.VALOR AS REGALIAS,
    -- PARTICIPACIONES
        p.VALOR AS PARTICIPACIONES,
    -- PRODUCTO INTERNO BRUTO
        pib.PIB as PIB,
    -- MINAS
        mi.CANT_SUM AS MINAS,
    -- MEDIO_AMBIENTE
        ma.CANT_SUM AS MEDIO_AMBIENTE,
    -- HOMICIDIOS
        h.HOMx100K_HAB AS HOMICIDIOSx100K_HAB,
    -- HECHOS VICTIMIZANTES
        hv.HECHOS AS HECHOS_VICTIMIZANTES,
    -- CULTIVOS ILICITOS
        ci.COCA_HA AS COCA_HA,
        ci.AMAPOLA_HA AS AMAPOLA,
        IFNULL(ci.COCA_HA, 0) +  IFNULL(ci.AMAPOLA_HA, 0) AS CULTIVOS_TOTAL_HA
FROM municipios m
LEFT JOIN uriel u ON ( m.MPIO = u.MPIO AND m.DPTO = u.DPTO)
LEFT JOIN spoa s ON ( m.MPIO = s.MPIO AND m.DPTO = s.DPTO AND u.YYYY = s.YYYY)
LEFT JOIN regalias r ON ( m.MPIO = r.MPIO AND m.DPTO = r.DPTO AND u.YYYY = r.YYYY)
LEFT JOIN pib ON ( m.MPIO = pib.MPIO AND m.DPTO = pib.DPTO AND u.YYYY = pib.YYYY)
LEFT JOIN participaciones p ON ( m.MPIO = p.MPIO AND m.DPTO = p.DPTO AND u.YYYY = p.YYYY)
LEFT JOIN minas mi ON ( m.MPIO = mi.MPIO AND m.DPTO = mi.DPTO AND u.YYYY = mi.YYYY)
LEFT JOIN medio_ambiente ma ON ( m.MPIO = ma.MPIO AND m.DPTO = ma.DPTO AND u.YYYY = ma.YYYY)
LEFT JOIN homicidios h ON ( m.MPIO = h.MPIO AND m.DPTO = h.DPTO AND u.YYYY = h.YYYY)
LEFT JOIN hechos_victimizantes hv ON ( m.MPIO = hv.MPIO AND m.DPTO = hv.DPTO AND u.YYYY = hv.YYYY)
LEFT JOIN cultivos_ilicitos ci ON ( m.MPIO = ci.MPIO AND m.DPTO = ci.DPTO AND u.YYYY = ci.YYYY)

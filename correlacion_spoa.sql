SELECT s.YYYY,
    (
        AVG(p.PIB * s.DEL_ELECT) - (AVG(p.PIB) * AVG(s.DEL_ELECT))
    ) / (STD(p.PIB) * STD(s.DEL_ELECT)) AS 'Pearson'
FROM spoa s
    LEFT JOIN pib p ON (
        s.DPTO = p.DPTO
        AND s.MPIO = p.MPIO
        AND s.YYYY = p.YYYY
    )
GROUP BY s.YYYY
ORDER BY YYYY ASC;
/* RESULTADOS
 2014	0.7097184615637677
 2015	0.45553856417744143
 2016	0.7278026521036194
 2017	0.843253925629688
 2018	0.7768824998883901
 2019	0.5775903862616389
 */
SELECT s.YYYY,
    (
        AVG(p.VALOR * s.DEL_ELECT) - (AVG(p.VALOR) * AVG(s.DEL_ELECT))
    ) / (STD(p.VALOR) * STD(s.DEL_ELECT)) AS 'Pearson'
FROM spoa s
    LEFT JOIN participaciones p ON (
        s.DPTO = p.DPTO
        AND s.MPIO = p.MPIO
        AND s.YYYY = p.YYYY
    )
GROUP BY s.YYYY
ORDER BY YYYY ASC;
/* RESULTADOS
 2014	0.8127419461343527
 2015	0.6249995192246983
 2016	0.8099461095397107
 2017	0.8479282424074357
 2018	0.8813935685228645
 2019	0.6777740978839926
 */
SELECT s.YYYY,
    (
        AVG(r.VALOR * s.DEL_ELECT) - (AVG(r.VALOR) * AVG(s.DEL_ELECT))
    ) / (STD(r.VALOR) * STD(s.DEL_ELECT)) AS 'Pearson'
FROM spoa s
    LEFT JOIN regalias r ON (
        s.DPTO = r.DPTO
        AND s.MPIO = r.MPIO
        AND s.YYYY = r.YYYY
    )
GROUP BY s.YYYY
ORDER BY YYYY ASC;
/* RESULTADOS
 2014	0.2759701920218405
 2015	0.16430510971655599
 2016	0.032653218402376026
 2017	0.3286917301772868
 2018	0.17246106700490335
 2019	0.179521553639943
 */
SELECT
  u.YYYY,
  (
    AVG(p.PIB * u.TOTAL_DEL) - (AVG(p.PIB) * AVG(u.TOTAL_DEL))
  ) / (STD(p.PIB) * STD(u.TOTAL_DEL)) AS 'Pearson'
FROM
  uriel_spoa u
  LEFT JOIN pib p ON (
    u.DPTO = p.DPTO
    AND u.MPIO = p.MPIO
    AND u.YYYY = p.YYYY
  )
GROUP BY
  u.YYYY
ORDER BY
  YYYY ASC;
  /* RESULTADOS
   2014	0.8920586126700298
   2015	0.7844082959247217
   2016	0.40043281030476857
   2017	0.3215342506594094
   2018	0.9509631468190446
   2019	0.8931737325444469
   */
SELECT
  u.YYYY,
  (
    AVG(p.VALOR * u.TOTAL_DEL) - (AVG(p.VALOR) * AVG(u.TOTAL_DEL))
  ) / (STD(p.VALOR) * STD(u.TOTAL_DEL)) AS 'Pearson'
FROM
  uriel_spoa u
  LEFT JOIN participaciones p ON (
    u.DPTO = p.DPTO
    AND u.MPIO = p.MPIO
    AND u.YYYY = p.YYYY
  )
GROUP BY
  u.YYYY
ORDER BY
  YYYY ASC;
  /* RESULTADOS
  2014	0.9211760881750235
  2015	0.8252843322125731
  2016	0.41684602213849054
  2017	0.32075853738459204
  2018	0.9654043268992285
  2019	0.8731228546449974
   */
SELECT
  u.YYYY,
  (
    AVG(r.VALOR * u.TOTAL_DEL) - (AVG(r.VALOR) * AVG(u.TOTAL_DEL))
  ) / (STD(r.VALOR) * STD(u.TOTAL_DEL)) AS 'Pearson'
FROM
  uriel_spoa u
  LEFT JOIN regalias r ON (
    u.DPTO = r.DPTO
    AND u.MPIO = r.MPIO
    AND u.YYYY = r.YYYY
  )
GROUP BY
  u.YYYY
ORDER BY
  YYYY ASC;
  /* RESULTADOS
  2014	0.08694950076240116
  2015	0.14935082670667907
  2016	0.04644303325420226
  2017	0.08708023509261599
  2018	0.14459921065158565
  2019	0.16086136424319314
   */
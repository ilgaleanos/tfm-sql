-- URIEL
SELECT
  SUM(uno) AS uno,
  SUM(dos) AS dos,
  SUM(tres) AS tres,
  SUM(cuatro) AS cuatro,
  SUM(cinco) AS cinco,
  SUM(seis) AS seis,
  SUM(siete) AS siete,
  SUM(ocho) AS ocho,
  SUM(nueve) AS nueve,
  SUM(cero) AS cero
FROM
  (
    SELECT
      n,
      (LENGTH(n) - LENGTH(REPLACE(n, '1', ''))) AS uno,
      (LENGTH(n) - LENGTH(REPLACE(n, '2', ''))) AS dos,
      (LENGTH(n) - LENGTH(REPLACE(n, '3', ''))) AS tres,
      (LENGTH(n) - LENGTH(REPLACE(n, '4', ''))) AS cuatro,
      (LENGTH(n) - LENGTH(REPLACE(n, '5', ''))) AS cinco,
      (LENGTH(n) - LENGTH(REPLACE(n, '6', ''))) AS seis,
      (LENGTH(n) - LENGTH(REPLACE(n, '7', ''))) AS siete,
      (LENGTH(n) - LENGTH(REPLACE(n, '8', ''))) AS ocho,
      (LENGTH(n) - LENGTH(REPLACE(n, '9', ''))) AS nueve,
      (LENGTH(n) - LENGTH(REPLACE(n, '0', ''))) AS cero
    FROM
      (
        SELECT
          CAST(DEL_ELECT AS CHAR) AS n
        FROM
          uriel u
      ) cast_
  ) conteo_digitos;
-- SPOA
SELECT
  SUM(uno) AS uno,
  SUM(dos) AS dos,
  SUM(tres) AS tres,
  SUM(cuatro) AS cuatro,
  SUM(cinco) AS cinco,
  SUM(seis) AS seis,
  SUM(siete) AS siete,
  SUM(ocho) AS ocho,
  SUM(nueve) AS nueve,
  SUM(cero) AS cero
FROM
  (
    SELECT
      n,
      (LENGTH(n) - LENGTH(REPLACE(n, '1', ''))) AS uno,
      (LENGTH(n) - LENGTH(REPLACE(n, '2', ''))) AS dos,
      (LENGTH(n) - LENGTH(REPLACE(n, '3', ''))) AS tres,
      (LENGTH(n) - LENGTH(REPLACE(n, '4', ''))) AS cuatro,
      (LENGTH(n) - LENGTH(REPLACE(n, '5', ''))) AS cinco,
      (LENGTH(n) - LENGTH(REPLACE(n, '6', ''))) AS seis,
      (LENGTH(n) - LENGTH(REPLACE(n, '7', ''))) AS siete,
      (LENGTH(n) - LENGTH(REPLACE(n, '8', ''))) AS ocho,
      (LENGTH(n) - LENGTH(REPLACE(n, '9', ''))) AS nueve,
      (LENGTH(n) - LENGTH(REPLACE(n, '0', ''))) AS cero
    FROM
      (
        SELECT
          CAST(DEL_ELECT AS CHAR) AS n
        FROM
          spoa s
      ) cast_
  ) conteo_digitos;
-- PIB
SELECT
  SUM(uno) AS uno,
  SUM(dos) AS dos,
  SUM(tres) AS tres,
  SUM(cuatro) AS cuatro,
  SUM(cinco) AS cinco,
  SUM(seis) AS seis,
  SUM(siete) AS siete,
  SUM(ocho) AS ocho,
  SUM(nueve) AS nueve,
  SUM(cero) AS cero
FROM
  (
    SELECT
      n,
      (LENGTH(n) - LENGTH(REPLACE(n, '1', ''))) AS uno,
      (LENGTH(n) - LENGTH(REPLACE(n, '2', ''))) AS dos,
      (LENGTH(n) - LENGTH(REPLACE(n, '3', ''))) AS tres,
      (LENGTH(n) - LENGTH(REPLACE(n, '4', ''))) AS cuatro,
      (LENGTH(n) - LENGTH(REPLACE(n, '5', ''))) AS cinco,
      (LENGTH(n) - LENGTH(REPLACE(n, '6', ''))) AS seis,
      (LENGTH(n) - LENGTH(REPLACE(n, '7', ''))) AS siete,
      (LENGTH(n) - LENGTH(REPLACE(n, '8', ''))) AS ocho,
      (LENGTH(n) - LENGTH(REPLACE(n, '9', ''))) AS nueve,
      (LENGTH(n) - LENGTH(REPLACE(n, '0', ''))) AS cero
    FROM
      (
        SELECT
          CAST(PIB AS CHAR) AS n
        FROM
          pib p
      ) cast_
  ) conteo_digitos;
-- PARTICIPACIONES
SELECT
  SUM(uno) AS uno,
  SUM(dos) AS dos,
  SUM(tres) AS tres,
  SUM(cuatro) AS cuatro,
  SUM(cinco) AS cinco,
  SUM(seis) AS seis,
  SUM(siete) AS siete,
  SUM(ocho) AS ocho,
  SUM(nueve) AS nueve,
  SUM(cero) AS cero
FROM
  (
    SELECT
      n,
      (LENGTH(n) - LENGTH(REPLACE(n, '1', ''))) AS uno,
      (LENGTH(n) - LENGTH(REPLACE(n, '2', ''))) AS dos,
      (LENGTH(n) - LENGTH(REPLACE(n, '3', ''))) AS tres,
      (LENGTH(n) - LENGTH(REPLACE(n, '4', ''))) AS cuatro,
      (LENGTH(n) - LENGTH(REPLACE(n, '5', ''))) AS cinco,
      (LENGTH(n) - LENGTH(REPLACE(n, '6', ''))) AS seis,
      (LENGTH(n) - LENGTH(REPLACE(n, '7', ''))) AS siete,
      (LENGTH(n) - LENGTH(REPLACE(n, '8', ''))) AS ocho,
      (LENGTH(n) - LENGTH(REPLACE(n, '9', ''))) AS nueve,
      (LENGTH(n) - LENGTH(REPLACE(n, '0', ''))) AS cero
    FROM
      (
        SELECT
          CAST(valor AS CHAR) AS n
        FROM
          participaciones p
      ) cast_
  ) conteo_digitos;
-- REGALIAS
SELECT
  SUM(uno) AS uno,
  SUM(dos) AS dos,
  SUM(tres) AS tres,
  SUM(cuatro) AS cuatro,
  SUM(cinco) AS cinco,
  SUM(seis) AS seis,
  SUM(siete) AS siete,
  SUM(ocho) AS ocho,
  SUM(nueve) AS nueve,
  SUM(cero) AS cero
FROM
  (
    SELECT
      n,
      (LENGTH(n) - LENGTH(REPLACE(n, '1', ''))) AS uno,
      (LENGTH(n) - LENGTH(REPLACE(n, '2', ''))) AS dos,
      (LENGTH(n) - LENGTH(REPLACE(n, '3', ''))) AS tres,
      (LENGTH(n) - LENGTH(REPLACE(n, '4', ''))) AS cuatro,
      (LENGTH(n) - LENGTH(REPLACE(n, '5', ''))) AS cinco,
      (LENGTH(n) - LENGTH(REPLACE(n, '6', ''))) AS seis,
      (LENGTH(n) - LENGTH(REPLACE(n, '7', ''))) AS siete,
      (LENGTH(n) - LENGTH(REPLACE(n, '8', ''))) AS ocho,
      (LENGTH(n) - LENGTH(REPLACE(n, '9', ''))) AS nueve,
      (LENGTH(n) - LENGTH(REPLACE(n, '0', ''))) AS cero
    FROM
      (
        SELECT
          CAST(VALOR AS CHAR) AS n
        FROM
          regalias r
      ) cast_
  ) conteo_digitos;
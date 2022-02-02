SELECT
  *
FROM
  (
    SELECT
      todos.*,
      u2.MPIO AS existe
    FROM
      (
        SELECT
          filtrado.*,
          u.YYYY
        FROM
          (
            SELECT
              m.DPTO,
              m.MPIO,
              m.NOMBRE_DPT,
              m.NOMBRE_MPI
            FROM
              municipios m
            WHERE
              CONCAT(m.DPTO, '-', m.MPIO) IN (
                SELECT
                  DISTINCT CONCAT(uu.DPTO, '-', uu.MPIO)
                FROM
                  uriel uu
              )
          ) filtrado
          CROSS JOIN (
            SELECT
              DISTINCT YYYY
            FROM
              uriel
          ) u
      ) AS todos
      LEFT JOIN uriel u2 ON (
        todos.DPTO = u2.DPTO
        AND todos.MPIO = u2.MPIO
        AND todos.YYYY = u2.YYYY
      )
  ) total
WHERE
  existe IS null
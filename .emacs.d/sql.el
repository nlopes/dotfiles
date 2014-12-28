;; sql
(if (eq system-type 'darwin)
    (setq sql-postgres-program "/usr/local/bin/psql")
  )

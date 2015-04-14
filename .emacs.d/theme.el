(if (display-graphic-p)
    (progn
      ;; if graphic
      (load-theme 'material t))
  ;; else (optional)
  (load-theme 'wombat t))

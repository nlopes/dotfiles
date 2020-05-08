(setq multi-term-program "/bin/zsh")
(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 10000)))
(add-hook 'term-mode-hook
          (lambda ()
            (define-key term-raw-map (kbd "C-y") 'term-paste)))
(add-hook 'term-mode-hook
          (lambda ()
            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))))

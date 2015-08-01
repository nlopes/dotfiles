(use-package magit-filenotify
  :ensure t)
(use-package magit
  :ensure t
  :init
  (custom-add-option 'magit-status-mode-hook #'magit-filenotify-mode)
  (setq magit-last-seen-setup-instructions "1.4.0")
  :bind ("C-c m" . magit-status)
  )

;;(use-package magit-gh-pulls
;;  :ensure t
;;  :config)
;;  (add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls))

;; (use-package git-gutter
;;   :ensure t
;;   :init
;;   ;; If you enable global minor mode
;;   (global-git-gutter-mode t)
;;   ;; If you would like to use git-gutter.el and linum-mode
;;   (git-gutter:linum-setup)
;;   (add-hook 'git-gutter:update-hooks 'magit-revert-buffer-hook)
;;   (custom-set-variables
;;    '(git-gutter:update-interval 1)))

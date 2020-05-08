(use-package helm
  :ensure t
  :bind (("C-c h" . helm-mini)
         ("M-x" . helm-M-x)
         ("M-y" . helm-show-kill-ring)
         ("C-c f" . helm-recentf)
         ("C-x C-f" . helm-find-files)
         ("C-c <SPC>" . helm-all-mark-rings)
         ("C-s" . helm-occur)
         ("C-h C-f" . helm-apropos)
         ("C-c w" . helm-man-woman)
         ("M-g a" . helm-do-grep-ag)
         )
  :config
  ;; See https://github.com/bbatsov/prelude/pull/670 for a detailed
  ;; discussion of these options.
  (setq helm-display-header-line              nil
        helm-split-window-in-side-p           t
        helm-buffers-fuzzy-matching           t
        helm-move-to-line-cycle-in-source     t
        helm-ff-search-library-in-sexp        t
        helm-ff-file-name-history-use-recentf t
  )
  (set-face-attribute 'helm-source-header nil :height 0.1)
  (require 'helm-config)
  (helm-mode 1)
  (helm-autoresize-mode 1)
)

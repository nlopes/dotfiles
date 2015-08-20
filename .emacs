(load "~/.emacs.d/base.el")
(load-theme 'wombat t)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(load "~/.emacs.d/flycheck.el")
(load "~/.emacs.d/powerline.el")
(load "~/.emacs.d/idle-highlight.el")
(load "~/.emacs.d/c.el")
(load "~/.emacs.d/company.el")

(if window-system
    (load "~/.emacs.d/desktop.el"))

(load "~/.emacs.d/dired.el")
(load "~/.emacs.d/exec-path.el")
(load "~/.emacs.d/helm.el")
(load "~/.emacs.d/magit.el")
(load "~/.emacs.d/projectile.el")
(load "~/.emacs.d/go.el")
(load "~/.emacs.d/python.el")
(load "~/.emacs.d/ruby.el")
(load "~/.emacs.d/rust.el")
(load "~/.emacs.d/deft.el")

(load "~/.emacs.d/hooks.el")
(load "~/.emacs.d/keybindings.el")

(use-package autopair
  :ensure t
  :init)

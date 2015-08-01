(setq initial-scratch-message "")
(setq inhibit-startup-message t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; highlight my fonts
(global-font-lock-mode t)

;; no beeping
(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)

;; match parenthesis (I like it)
(show-paren-mode t)

;; highlight the region when marking is active
(transient-mark-mode 't)
(delete-selection-mode t)
(setq x-select-enable-clipboard t)

;; I like to have the column number
(setq column-number-mode t)

;; y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; stop at 120
(set-default 'fill-column 120)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default py-indent-offset 4)
(c-set-offset 'innamespace 0)

;; have all files in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/file-backups")))

;; line numbers on the left
(global-linum-mode 1)

;; follow output
(setq compilation-scroll-output t)

(setq truncate-lines t)
(setq truncate-partial-width-windows nil)

(setq user-mail-address "nlopes.ml@gmail.com")

;; taking the plunge
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; http://debbugs.gnu.org/cgi/bugreport.cgi?bug=16737
(setq x-selection-timeout 10)

;; much larger cons threshold
(setq gc-cons-threshold (* 20 1024 1024))
;; ignore redef warnings from 3rd party packages
(setq ad-redefinition-action 'accept)

(setq display-time-24hr-format t)
(setq display-time-default-load-average nil)
(setq display-time-format "")

;; If you use helm you need this or session abbreviates long variables as '...'
(setq session-save-print-spec '(t nil 40000))

;; ido
(ido-mode t)
(setq ido-enable-flex-matching t ; fuzzy matching is a must have
      ido-use-virtual-buffers t)

(setq-default show-trailing-whitespace t)

;; defaults for various file types
(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.gitconfig$" . conf-mode))

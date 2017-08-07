(setq initial-scratch-message "")
(setq inhibit-startup-message t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode t)

;; highlight my fonts
(global-font-lock-mode t)

;; no beeping
(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)

;; match parenthesis (I like it)
(show-paren-mode t)
;; highlight between parenthesis
(defvar show-paren-style)
(setq show-paren-style 'expression)

;; highlight the region when marking is active
(transient-mark-mode 't)
(delete-selection-mode t)
(setq x-select-enable-clipboard t)

;; I like to have the column number
(column-number-mode t)

;; y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

(set-default 'fill-column 80)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default py-indent-offset 4)
(setq-default python-indent 4)
(c-set-offset 'innamespace 0)

;; have all files in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/file-backups")))

;; line numbers on the left
(global-linum-mode 1)

;; follow output
(defvar compilation-scroll-output)
(setq compilation-scroll-output t)

(setq truncate-lines t)
(setq truncate-partial-width-windows nil)

(setq user-mail-address "nlopes.ml@gmail.com")

;; taking the plunge
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; http://debbugs.gnu.org/cgi/bugreport.cgi?bug=16737
(defvar x-selection-timeout)
(setq x-selection-timeout 10)

;; much larger cons threshold
(setq gc-cons-threshold (* 20 1024 1024))
;; ignore redef warnings from 3rd party packages
(setq ad-redefinition-action 'accept)

(defvar display-time-24hr-format)
(defvar display-time-default-load-average)
(defvar display-time-format)
(setq display-time-24hr-format t)
(setq display-time-default-load-average nil)
(setq display-time-format "")

;; If you use helm you need this or session abbreviates long variables as '...'
(defvar session-save-print-spec)
(setq session-save-print-spec '(t nil 40000))

;; ido
(ido-mode t)
(defvar ido-enable-flex-matching)
(defvar ido-use-virtual-buffers)
(setq ido-enable-flex-matching t ; fuzzy matching is a must have
      ido-use-virtual-buffers t)

(setq-default show-trailing-whitespace t)

;; defaults for various file types
(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.gitconfig$" . conf-mode))

(set-frame-font "Ubuntu Mono derivative Powerline 14")

;; calendar stuff
(defvar european-calendar-style)
(defvar calendar-week-start-day)
(defvar view-diary-entries-initially)
(defvar mark-diary-entries-in-calendar)
(defvar number-of-diary-entries)
(setq european-calendar-style 't
      calendar-week-start-day 1
      view-diary-entries-initially t
      mark-diary-entries-in-calendar t
      number-of-diary-entries 7
      ps-paper-type 'a4)
(add-hook 'list-diary-entries-hook 'sort-diary-entries t)
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)

;; presentations
;;(use-package ox-reveal
;;  :ensure t)

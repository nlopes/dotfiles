(setq
    initial-scratch-message ""
    inhibit-startup-message t

    ;; tags question is annoying
    tags-revert-without-query 1

    ;; no beeping
    echo-keystrokes 0.1
    use-dialog-box nil
    visible-bell t)

;; font
(set-default-font "MesloLGS NF")
(set-face-attribute 'default nil :font "MesloLGS NF")
(set-frame-font "MesloLGS NF" nil t)

(menu-bar-mode -1)
;;(toggle-scroll-bar -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)

(global-hl-line-mode +1)
(line-number-mode +1)
;; line numbers on the left
(global-display-line-numbers-mode 1)
(column-number-mode t)
(size-indication-mode t)

;; highlight my fonts
(global-font-lock-mode t)

;; match parenthesis (I like it)
(show-paren-mode t)
;; highlight between parenthesis
(defvar show-paren-style)
(setq show-paren-style 'expression)

;; highlight the region when marking is active
(transient-mark-mode 't)
(delete-selection-mode t)
(setq x-select-enable-clipboard t)

;; y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

(set-default 'fill-column 80)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default show-trailing-whitespace t)

;; have all files in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/file-backups")))

;; http://debbugs.gnu.org/cgi/bugreport.cgi?bug=16737
(defvar x-selection-timeout)
(setq x-selection-timeout 10)

;; much larger cons threshold, around 100MiB
(setq gc-cons-threshold (* 100 1024 1024))
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

;; follow output
(defvar compilation-scroll-output)
(setq compilation-scroll-output t)

;; scroll with mouse
(xterm-mouse-mode t)
(global-set-key   [mouse-4] '(lambda () (interactive) (scroll-down 1)))
(global-set-key   [mouse-5] '(lambda () (interactive) (scroll-up   1)))

;; ansi colors!
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)
;; taken from https://endlessparentheses.com/ansi-colors-in-the-compilation-buffer-output.html
(defun endless/colorize-compilation ()
  "Colorize from `compilation-filter-start' to `point'."
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region
     compilation-filter-start (point))))
(add-hook 'compilation-filter-hook #'endless/colorize-compilation)

;; manage org-mode
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

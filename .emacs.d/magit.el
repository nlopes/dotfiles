(require 'magit)
;; requires magit-filenotify
(custom-add-option 'magit-status-mode-hook #'magit-filenotify-mode)
(require 'magit-gh-pulls)
(add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)

(require 'git-gutter)
;; If you enable global minor mode
(global-git-gutter-mode t)
;; If you would like to use git-gutter.el and linum-mode
(git-gutter:linum-setup)

(add-hook 'git-gutter:update-hooks 'magit-revert-buffer-hook)

(custom-set-variables
 '(git-gutter:update-interval 1))

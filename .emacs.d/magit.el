(require 'magit)
;; requires magit-filenotify
(custom-add-option 'magit-status-mode-hook #'magit-filenotify-mode)
(require 'magit-gh-pulls)
(add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)

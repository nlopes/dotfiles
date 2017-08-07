(use-package ruby-mode
  :ensure t
  :defer t
  :mode (("\\.\\(gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|thor\\)" . ruby-mode)
         ("Gemfile\\(\\.lock\\)?\\|\\(Cap\\|Guard\\|[rR]ake\\|Vagrant\\)file" . ruby-mode))
  :config (progn
	    (global-set-key (kbd "C-c r a") 'rvm-activate-corresponding-ruby)
	    (add-hook 'ruby-mode-hook 'projectile-on)
            (use-package robe
              :ensure t
              :diminish robe-mode)
            (use-package yard-mode
              :ensure t
              :diminish yard-mode)
            (use-package ruby-block
              :ensure t
              :diminish ruby-block-mode)
            (use-package ruby-electric
              :ensure t)
            (use-package ruby-interpolation
              :ensure t
              :diminish ruby-interpolation-mode)
            (setq robe-highlight-capf-candidates nil)
            (add-hook 'ruby-mode-hook
                      (lambda ()
                        (abbrev-mode -1) ; buggy with enh-ruby-mode, used to indent after `end`
                        (ruby-block-mode)
                        (ruby-interpolation-mode)
                        (ruby-electric-mode)
                        (yard-mode)
                        (robe-mode)))
            (eval-after-load 'company
              '(push 'company-robe company-backends))
            ;; to get rbenv to pick up the correct ruby version for the project
            (defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
              (rbenv-use-corresponding))
            ))

(use-package rbenv
  :ensure t
  :defer t)

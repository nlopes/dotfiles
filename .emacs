(setq config-files '(;; basics
                     "vars"
                     "base"
                     "packages"
                     "theme"
                     "ido"
                     "font"
                     ;; 3rd party
                     "apache"
                     "auctex"
                     "c"
                     "company"
                     "desktop"
                     "dired"
                     "exec-path"
                     "helm"
                     "go"
                     "magit"
                     "powerline"
                     "python"
                     "sql"
                     "web"
                     ;; below files must load last
                     "hooks"
                     "keybindings" ;; global keybindings
                     ))

(dolist (element config-files)
  (load (concat "~/.emacs.d/" element)))

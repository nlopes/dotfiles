(setq config-files '(;; basics
                     "vars"
                     "base"
                     "packages"
                     "theme"
                     "ido"
                     "font"
                     ;; 3rd party
                     "idle-highlight" ;; comes first because code hooks will use it
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
                     "projectile"
                     "python"
                     "rust"
                     "sql"
                     "term"
                     "web"
                     ;; below files must load last
                     "hooks"
                     "keybindings" ;; global keybindings
                     ))

(dolist (element config-files)
  (load (concat "~/.emacs.d/" element)))

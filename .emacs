(add-to-list 'load-path "/home/drenning/Downloads/org-mode/lisp")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(background-color "#002b36")
 '(background-mode dark)
 '(backup-by-copying t)
 '(backup-directory-alist (quote (("." . "~/.saves"))))
 '(cursor-color "#839496")
 '(custom-safe-themes (quote ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "a71be4e5e9e418025daea651f8a1628953abb7af505da5e556e95061b6a6e389" default)))
 '(custom-theme-load-path (quote (custom-theme-directory t "~/.emacs.d/themes/")))
 '(foreground-color "#839496")
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(kept-new-versions 6)
 '(menu-bar-mode nil)
 '(org-agenda-files (quote ("~/org/general.org" "~/org/private.org" "~/org/tut.org" "~/org/journal.org" "~/org/gtd.org" "~/org/misc.org")))
 '(org-attach-method (quote cp))
 '(org-babel-load-languages (quote ((emacs-lisp . t) (gnuplot . t) (plantuml . t))))
 '(org-export-default-language "de")
 '(org-export-html-style "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\">")
 '(org-export-with-priority t)
 '(org-log-done (quote time))
 '(org-mobile-directory "/home/drenning/tmp/orgmobile")
 '(org-modules (quote (org-bbdb org-bibtex org-crypt org-gnus org-info org-jsinfo org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m)))
 '(org-plantuml-jar-path "/home/drenning/Downloads/plantuml.jar")
 '(org-publish-project-alist (quote (("org-notes" :base-directory "~/org/" :base-extension "org" :publishing-directory "~/public_html/" :recursive t :publishing-function org-html-publish-to-html :headline-levels 4 :auto-preamble t :style "<link rel=\"stylesheet\" type=\"text/css\" href=\"./css/style.css\" />") ("org-static" :base-directory "~/org/" :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf" :publishing-directory "~/public_html/" :recursive t :publishing-function org-publish-attachment) ("org" :components ("org-notes" "org-static")))))
 '(org-publish-use-timestamps-flag nil)
 '(org-startup-folded (quote content))
 '(org-todo-keyword-faces (quote (("TODO" :foreground "red" :weight bold) ("FEEDBACK" :foreground "yellow" :weight bold) ("VERIFY" :foreground "red" :weight bold) ("WAITING" :foreground "yellow" :weight bold) ("DONE" :foreground "green" :weight bold) ("CANCELED" :foreground "green" :weight bold))))
 '(org-todo-keywords (quote ((sequence "TODO(t)" "FEEDBACK(f@/!)" "VERIFY(v!)" "WAITING(w@/!)" "|" "DONE(d@)" "CANCELED(c@)"))))
 '(read-mail-command (quote gnus))
 '(tool-bar-mode nil)
 '(tramp-default-method "ssh")
 '(tramp-default-user "root")
 '(tramp-encoding-shell "/bin/bash")
 '(user-mail-address "denis@devtty.de"))

(fset 'yes-or-no-p 'y-or-n-p)
(load-theme 'solarized-dark t)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cc" 'org-capture)

(progn
 (setq org-capture-templates
  '(("t" "Aufgabe" entry (file+headline "~/org/gtd.org" "Inbox")
      "* TODO %?")
    ("z" "Zeiteintrag" entry (file+headline "~/org/gtd.org" "Inbox")
      "* ZKTO %? \n %i" :clock-in t :clock-resume t)
    ("j" "Journal" entry (file+datetree "~/org/journal.org")
      "* %?\nEntered on %U\n %i"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "unknown" :slant normal :weight normal :height 113 :width normal)))))

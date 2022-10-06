
;; Dirs and Files variables
;;(setq EMACS_DIR "~/.emacs.d/")
;;(setq EMACS_INIT "~/.emacs.d/init.el")
;;(setq PROJECTS_DIR "~/projects")

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/ShinkEmacs")
(require 'SE-essentials)
(require 'SE-cleanUI)
(require 'SE-visuals)
(require 'SE-keybinds)
(require 'SE-ide)


(provide 'SE-init)

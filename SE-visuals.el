
;; Some cool icons
(use-package all-the-icons
  :if (display-graphic-p))

;; Vscode style icons
(use-package vscode-icon
  :ensure t
  :commands (vscode-icon-for-file))

;; Init DOOMEmacs Modeline cause I find it cool
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 25)))

;;highlight active window !
(use-package dimmer)
(dimmer-mode t)

;; A simple Emacs cheatsheet, may be useful to remember some kb
(use-package cheatsheet)

(cheatsheet-add :group 'Common
                :key "C-x C-c"
                :description "leave Emacs.")
(cheatsheet-add :group 'Common
                :key "C-c c"
                :description "Copy selected text in current buffer")
(cheatsheet-add :group 'Common
                :key "C-x v"
                :description "Paste selected text in current buffer")
(cheatsheet-add :group 'Common
                :key "C-x x"
                :description "Kill selected text in currend buffer and paste it in clipboard")
(cheatsheet-add :group 'Yafolding
                :key "C-1"
                :description "fold actual element")
(cheatsheet-add :group 'Yafolding
                :key "C-2"
                :description "unfold actual element")
(cheatsheet-add :group 'Treemacs
                :key "C-x t t"
                :description "Hide/Show treemacs buffer's")
(cheatsheet-add :group 'Treemacs
                :key "c f"
                :description "create new file")
(cheatsheet-add :group 'Treemacs
                :key "c d"
                :description "create new directory")
(cheatsheet-add :group 'Treemacs
                :key "C-c C-w s"
                :description "change workspace")

(setq all-the-icons-extension-icon-alist
      '())

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-vibrant t)
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
;;  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
;;  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

'(highlight-numbers-number ((t (:foreground "#fb8807"))))

;; Allow you to put emojis in buffers
(use-package emojify
  :hook (erc-mode . emojify-mode)
  :commands emojify-mode)
(emojify-mode t)

;; Change the bottom miniframe in a separate miniframe you can move
(use-package mini-frame)
(mini-frame-mode)

;; Fill column at 80
(setq fill-column 80)

;; A better dashboard with recent files and projects
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-center-content t)
  (setq dashboard-banner-logo-title "Welcome to ShinkEmacs")
  (setq dashboard-startup-banner "~/.emacs.d/emacs-logo.png")
  (setq dashboard-items '((recents  . 5)
                          (projects . 10)
                          )
        )
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  )
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

(provide 'SE-visuals)

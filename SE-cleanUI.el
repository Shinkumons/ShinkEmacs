
;; No startup message
(setq inhibit-startup-message t)

;; No startup screen
(setq inhibit-startup-screen)

;; Set font to th JetBrains font suit (this require you to have the font file in your /.emacs.d/ directory)
(set-frame-font "JetBrains Mono")

;; Make the cursor blink to be more visible
(blink-cursor-mode 1)

;; display th time in h12 in bottom right of the screen (modeline)
(display-time)

;; set the cursor to a bar
(setq-default cursor-type 'bar)

;; disble scrolling bar
(scroll-bar-mode -1)

;; symbols on the left of the buffer
(set-fringe-mode 10)

;; disable toolbar
(tool-bar-mode -1)

;; Disable tooltip
(tooltip-mode -1)

;; Show the number of the column in the bottom ot the buffer
(column-number-mode t)

;; Put Emacs in fullscreen
(set-frame-parameter (selected-frame) 'fullscreen 'fullscreen)
(add-to-list 'default-frame-alist '(fullscreen . maximized))(toggle-frame-maximized)

;; Create backups in the ./.emacs.d/backup/ directory instead of the file directory, disable it at your own risk
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying      t  ; Don't de-link hard links
      version-control        t  ; Use version numbers on backups
      delete-old-versions    t  ; Automatically delete excess backups:
      kept-new-versions      20 ; how many of the newest versions to keep
      kept-old-versions      5) ; and how many of the old

;; Disable autosave, I want to control my saves even if I can loose hours of work
(setq auto-save-default nil)

;; Set fundamental-mode to the main major mode
(setq initial-major-mode (quote fundamental-mode))

;; Make escape disable command entry
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Show what shortcut I'm typing 
(use-package command-log-mode)


(provide 'SE-cleanUI)

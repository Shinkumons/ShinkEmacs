
;; No startup message
(setq inhibit-startup-message t)

;; No startup screen
(setq inhibit-startup-screen t)

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

;; hightlight current line
(global-hl-line-mode t)

;; disable toolbar
(tool-bar-mode -1)

;; Disable tooltip
(tooltip-mode -1)

;; Show the number of the column in the bottom ot the buffer
(column-number-mode t)

;; No message in scratch buffer
(setq initial-scratch-message nil)

;; Initial buffer
(setq initial-buffer-choice nil)
;; For some reason the scratch buffer keep opening so time to load the big artillery to make it go away
(add-hook 'emacs-startup-hook (lambda ()
                                (when (get-buffer "*scratch*")
                                  (delete-windows-on "*scratch*"))))
;; No frame title
(setq frame-title-format nil)

;; No file dialog
(setq use-file-dialog nil)

;; No dialog box
(setq use-dialog-box nil)

;; No popup windows
(setq pop-up-windows nil)

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

;;--'UTF-8'--
(set-language-environment "UTF-8")

;;setup tabs for indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Disable menu bar
(menu-bar-mode -1)

;; Allow me to change transparency as I want
(defun change-transparency (n)
  "change transparency to a given value between 0 and 100"
  (interactive "nValue: ")
  (set-frame-parameter nil 'alpha `(,n . ,n))
  (add-to-list 'default-frame-alist `(alpha . (,n . ,n))))

(change-transparency 98)

;; Function for switching from fullscreen to windowed
(defun my-fs ()
    (interactive)
  (set-frame-parameter nil 'fullscreen 'fullboth))

(defun my-not-fs ()
    (interactive)
    (set-frame-parameter nil 'fullscreen 'maximized))

(defun toggle-fullscreen ()
    (interactive)
  (if (eq (frame-parameter nil 'fullscreen) 'fullboth)
      (my-not-fs)
    (my-fs)))

(global-set-key (kbd "M-RET") 'toggle-fullscreen)

;; Change the colors of numbers
'(highlight-numbers-number ((t (:foreground "#fb8807"))))

;; Show what shortcut I'm typing 
(use-package command-log-mode)


(provide 'SE-cleanUI)

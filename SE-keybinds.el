(global-set-key (kbd "C-x j s") 'run-js-code)
(global-set-key (kbd "C-x p y") 'execute-python-program)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-c c") 'kill-ring-save)
(global-set-key (kbd "C-c x") 'kill-region)
(global-set-key (kbd "C-c v") 'yank)

;;keybinding for window deplacement

(global-set-key (kbd "<M-right>") 'windmove-right)
(global-set-key (kbd "<M-left>") 'windmove-left)
(global-set-key (kbd "<M-up>") 'windmove-up)
(global-set-key (kbd "<M-down>") 'windmove-down)

;; Org refresh latex
(global-set-key (kbd "C-=") 'org-latex-preview)

(provide 'SE-keybinds)

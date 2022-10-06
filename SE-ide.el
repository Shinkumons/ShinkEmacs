;;Setup the on mouse fly to display errors and warning
(use-package flycheck)
(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))


;;Setup the auto completion for () {} [] ""
(electric-pair-mode 1)


(use-package quickrun)
(global-set-key (kbd "C-c C-r") 'quickrun-shell)
(global-set-key (kbd "C-c C-q") 'quickrun)

(setq lsp-keymap-prefix "C-c l")

;; Language Server Protocol this allow you to see code doc from standards libs and your own code
(use-package lsp-mode
  :init
  :hook (
         (java-mode . lsp)
         (python-mode . lsp))
  :commands (lsp lsp-deferred)
  :init (setq lsp-keymap-prefix "C-c l"))

(use-package lsp-jedi
  :ensure t
  :config
  (with-eval-after-load "lsp-mode"
    (add-to-list 'lsp-disabled-clients 'pyls)
    (add-to-list 'lsp-enabled-clients 'jedi)))

;; Add a cool UI to LSP
(use-package lsp-ui)
(lsp-ui-peek-enable t)
(setq lsp-java-server-install-dir "C:\\Users\\shinke\\AppData\\Roaming\\.emacs.d\\jdt-language-server-1.10.0-202203040350")
(setq lsp-java-java-path "c:/Program Files/Java/jdk-17.0.1/bin/java.exe")
(setq lsp-completion-provider :company-lsp)
(setq lsp-completion-show-detail t)
(setq lsp-completion-show-kind t)

;; Interactive ivy interface for LSP
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)

;; Add a methods and class hierarchy in the treemacs buffer
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)
(lsp-treemacs-sync-mode 1)


;; Let you implement snippets so you can code better and faster
(use-package yasnippet :config (yas-global-mode))

(setq yas-snippet-dirs '("~emacs.d/snippets"))

;; Auto completion Module
(use-package company)
(global-company-mode t)
(add-hook 'after-init-hook 'global-company-mode)

;; Java setup
(use-package lsp-java
    :config
    (with-eval-after-load "lsp-mode"
      (add-to-list 'lsp-enabled-clients 'jdtls)))
(require 'dap-java)
(add-hook 'java-mode-hook #'lsp)
(use-package gradle-mode)
(defun build-and-run()
  "Build and run a gradle project"
  (interactive)
  (gradle-run "build run"))
(define-key gradle-mode-map (kbd "C-c C-p") 'build-and-run)

(global-set-key (kbd "C-c C-v") 'lsp-execute-code-action)

;; allow to fold some part of code
(yafolding-mode 1)

(global-set-key (kbd "C-1") 'yafolding-toggle-element)
(global-set-key (kbd "C-2") 'yafolding-toggle-all)


;; Let you refactor multiple occurence of a variable and function
(require 'iedit)

;; Mobile App dev

(use-package dart-mode
  ;; Optional
  :hook (dart-mode . flutter-test-mode))

(use-package flutter
  :after dart-mode
  :bind (:map dart-mode-map
              ("C-M-x" . #'flutter-run-or-hot-reload))
  :custom
  (flutter-sdk-path "D:/flutter/"))


;; Nice synthax color
(require 'tree-sitter)
(require 'tree-sitter-langs)
(global-tree-sitter-mode)
(tree-sitter-require 'python)
(add-hook 'prog-mode 'tree-sitter-hl-mode)

(latex-preview-pane-enable)
(setq exec-path (append exec-path '("C:\Users\shinke\AppData\Local\Programs\MiKTeX\miktex\bin\x64")))


(global-hl-line-mode t)

(color-identifiers-mode 1)

(provide 'SE-ide)

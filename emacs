(global-font-lock-mode t)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(winner-mode 1)
(set-background-color "black")
(set-foreground-color "white")
(set-cursor-color "white")

;; Highlite current line.
; (global-hl-line-mode 1)
; (set-face-background 'hl-line "#302226")

;; Cursor
; (set-cursor-color "#FFFF33")

;; Gid
(autoload 'gid "gid" nil t)

;; Save hist
(require 'savehist)
(savehist-load)

;; Strokes
(load "strokes")
(require 'strokes)

(add-hook 'c++-mode-hook 
          (lambda () (setq show-trailing-whitespace t)))

(add-hook 'c++-mode-hook 
          (lambda () (set-variable 'tab-width 4 nil)))

(defun my-debugger-mode ()
  (interactive)
  (tool-bar-mode 1)
  (menu-bar-mode 1)  
  )

;;(setq-default indent-tabs-mode nil)
(setq mark-even-if-inactive t)


(show-paren-mode 1)

(setq display-time-day-and-date t)
(display-time)

(append 'path )

(global-set-key "" (quote goto-line))
;; (global-set-key "" (quote edition-special-past-incrementing-integer))
;; (global-set-key "" 'std-file-header)
;; (global-set-key "" (quote insert-current-date))
;; (global-set-key "ad" (quote insert-current-date))
;; (global-set-key "m" (quote c++-builder-insert-main-body))
;; (global-set-key "c" (quote c++-builder-insert-class))
;; (global-set-key "n" (quote c++-builder-insert-name-space))
;; (global-set-key "d" (quote c++-builder-insert-debug-macro))
;; (global-set-key "o" (quote c++-builder-insert-getopt-body))
;; (global-set-key "i" (quote c++-builder-insert-if-then-else))
;; (global-set-key "" (quote find-file-at-point))

(desktop-load-default)
(desktop-read)

(column-number-mode 1)

(setq overflow-newline-into-fringe t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("09cadcc2784baa744c6a7c5ebf2a30df59c275414768b0719b800cabd8d1b842" "a2cde79e4cc8dc9a03e7d9a42fabf8928720d420034b66aecc5b665bbf05d4e9" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" default)))
 '(desktop-save-mode t)
 '(dired-kept-versions 5)
 '(gdb-many-windows t)
 '(gdb-max-frames 1500)
 '(gdb-use-separate-io-buffer t)
 '(global-mark-ring-max 32)
 '(indent-tabs-mode nil)
 '(kept-new-versions 10)
 '(kept-old-versions 10)
 '(large-file-warning-threshold 50000000)
 '(mark-ring-max 32)
 '(open-paren-in-column-0-is-defun-start nil)
 '(package-selected-packages
   (quote
    (racer flycheck-rust lsp-ui monokai-pro-theme rainbow-delimiters monokai-theme material-theme spacemacs-theme cargo rust-mode)))
 '(read-file-name-completion-ignore-case t)
 '(remote-shell-program "/usr/bin/ssh")
 '(standard-indent 4)
 '(tab-width 4)
 '(vc-make-backup-files t)
 '(version-control t))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)

(add-to-list 'load-path "/usr/share/emacs/site-list")
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

; Add cmake listfile names to the mode list.
(autoload 'cmake-mode "cmake-mode" nil t)
(setq auto-mode-alist
	  (append
	   '(("CMakeLists\\.txt\\'" . cmake-mode))
	   '(("\\.cmake\\'" . cmake-mode))
	   auto-mode-alist))

; (autoload 'cmake-mode "/usr/share/emacs/site-lisp/cmake-mode.el" t)
; (autoload 'rust-mode "/usr/share/emacs/site-list/rust-mode.el" t)

(load "/usr/share/clang/clang-format.el")
(global-set-key [C-M-tab] 'clang-format-region)

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

; (require 'eglot)
; (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
; (add-hook 'c-mode-hook 'eglot-ensure)
; (add-hook 'c++-mode-hook 'eglot-ensure)

(load-theme 'monokai-pro t)

(use-package rust-mode
    :mode "\\.rs\\'"
    :init
    (setq rust-format-on-save t))
;; (use-package lsp-mode
;;     :init
;;     (add-hook 'prog-mode-hook 'lsp-mode)
;;     :config
;;     (use-package lsp-flycheck
;;         :ensure f ; comes with lsp-mode
;;         :after flycheck))
;; (use-package lsp-rust
;;     :after lsp-mode)

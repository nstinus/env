(set-default-font "6x12")

(global-font-lock-mode t)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(winner-mode 1)
(set-background-color "black")
(set-foreground-color "white")
(set-cursor-color "white")

;; Highlite current line.
(global-hl-line-mode 1)
(set-face-background 'hl-line "#302226")

; ;; Select stuff holding <Shift>
; (pc-selection-mode 1)

; (find-file "~/projects/dev/nfp/src/BROWSE")

;; Cursor
(set-cursor-color "#FFFF33")

(add-to-list 'load-path "~/tools/cedet-1.0pre4/")
(add-to-list 'load-path "~/tools/ecb-2.32")
(add-to-list 'load-path "~/.emacs-conf")
;(add-to-list 'load-path "~/usr/share/emacs/site-lisp/w3m")
(add-to-list 'load-path "~/.emacs-conf/git-emacs-1.1")
(add-to-list 'load-path "~/.emacs-conf/Pymacs")


(setq exec-path (cons "~/usr/share/xref" exec-path))
(setq load-path (cons "~/usr/share/xref/emacs" load-path))

;;(load "xrefactory")

; (load "/usr/local/share/emacs/23.1/lisp/haskell-mode/haskell-site-file")
; (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
; (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;;(toggle-highlight-paren-mode)

;; Load CEDET
;;(load-file "~/tools/cedet-1.0pre4/common/cedet.el")

;; Some funciton of mine
;;(load "functions")
;;(load "std_comment")
;;(load "div")
;;(load "create-accessors")
;(load "revive")

(global-set-key [f4] 'kill-this-buffer)
(global-set-key [f12] (lambda () (interactive) (electric-buffer-list t)))


;; Git is nativelly managed with emacs 22.2
; site-start script for Emacs, initializes git and vc-git
; Evgenii Terechkov, Octember 2006
;(require 'git)
;(add-to-list 'vc-handled-backends 'GIT)

;; W3m config
;(require 'w3m-load)
;(setq w3m-command-arguments
;      '("-o" "http_proxy=http://proxyarbitrage4:8080"))
;(setq w3m-use-cookies t)
;(setq w3m-home-page "http://www.google.com")

;; Gid
(autoload 'gid "gid" nil t)

;; Save hist
(require 'savehist)
(savehist-load)

;; Strokes
(load "strokes")
(require 'strokes)

;; flymake
(require 'flymake)

(defun flymake-get-make-cmdline (source base-dir)
  (list "gmake"
        (list "-s" "-C" base-dir
	      (concat "CHK_SOURCES=" source)
	      "SYNTAX_CHECK_MODE=1"
	      "check-syntax")))

;;;;

(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
            ;; Set dired-x global variables here.  For example:
            (setq dired-guess-shell-gnutar "gtar")
            (setq dired-x-hands-off-my-keys nil)
            ))
(add-hook 'dired-mode-hook
          (lambda ()            
            ;; Set dired-x buffer-local variables here.  For example:
            ;; (dired-omit-mode 1)
            ;;(setq dired-x-hands-off-my-keys nil)
            ))

(add-hook 'c++-mode-hook 
          (lambda () (setq show-trailing-whitespace t)))

(add-hook 'c++-mode-hook 
          (lambda () (set-variable 'tab-width 4 nil)))

;;(setq c-mode-hook
;;    (function (lambda ()
;;                (setq indent-tabs-mode nil)
;;                (setq c-indent-level 4))))
;;(setq objc-mode-hook
;;    (function (lambda ()
;;                (setq indent-tabs-mode nil)
;;                (setq c-indent-level 4))))
;;(setq c++-mode-hook
;;    (function (lambda ()
;;                (setq indent-tabs-mode nil)
;;                (setq c-indent-level 4))))
;;

;; git
;(load "git-emacs")
;(require 'git-emacs)
;(require 'git-blame)

;;(require 'ecb)

;; Enabling various SEMANTIC minor modes.  See semantic/INSTALL for more ideas.
;; Select one of the following:

;; * This enables the database and idle reparse engines
;;(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
;;(semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as the nascent intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-guady-code-helpers)

;; * This turns on which-func support (Plus all other code helpers)
;; (semantic-load-enable-excessive-code-helpers)

;; This turns on modes that aid in grammar writing and semantic tool
;; development.  It does not enable any other features such as code
;; helpers above.
;; (semantic-load-enable-semantic-debugging-helpers)

;; (defun my-ps-print-region ()
;;   "Print the current region as ps"
;;   (interactive)
;;   (let* ((res nil)
;;         (file-name "~/tmp/file.ps")
;;         (cmd (concat "ssh user@host lpr -P printer_adress " file-name))
;;         (command cmd))
;;     (ps-print-region (point) (mark) file-name)
;;     (set 'res (call-process-shell-command command))
;;     (message (format "Exit status : %d" res))
;;     ))

(defun my-debugger-mode ()
  (interactive)
  (tool-bar-mode 1)
  (menu-bar-mode 1)  
  )

;;(setq-default indent-tabs-mode nil)
(setq mark-even-if-inactive t)

(setq my-c++-helper-verb-string "#define DOVERB(STR) std::cout << __PRETTY_FUNCTION__ << \" this = \" << (void*)this << STR << std::endl
#define VERB DOVERB(\"\")
")

(defun my-c++-helper-insert-verb-string ()
  (interactive)
  (insert-string my-c++-helper-verb-string)
  )

(defun my-create-compilation-frame (tn)
  "Create a frame to host compile buffer."
  (let ((params '((visibility . t) 
		  (unsplittable . t)
		  (modeline . t) 
		  (width . 130) 
		  (height . 30) 
		  (background-mode . dark) 
		  (display-type . color) 
		  (scroll-bar-width . 0) (cursor-type . box) 
		  (auto-lower) (auto-raise) (icon-type . t) 
		  (wait-for-wm . t) 
		  (tool-bar-lines . 0) 
		  (menu-bar-lines . 0) 
		  (scroll-bar-background) 
		  (scroll-bar-foreground) 
		  (right-fringe . 11) 
		  (left-fringe . 10) 
		  (line-spacing) 
		  (screen-gamma) 
		  ))
;;	(f (make-frame (frame-parameters (selected-frame)))))
        (f (make-frame)))
    (modify-frame-parameters f params)
    (modify-frame-parameters f (list (cons 'title tn)))
    (modify-frame-parameters f (list (cons 'name tn)))
    (modify-frame-parameters 
     f (assoc 'minibuffers (frame-parameters (selected-frame))))
    f
    ))


(defun find-or-create-compile-frame (name)
  (let ((fl (frame-list))
	(cf nil))
    (while fl
      (if (equal name (frame-parameter (car (frame-list)) 'name))
	  (progn (set 'cf (car (frame-list)))
		 (set 'fl nil))
	(set 'fl (cdr fl))))
    (if (not cf) (set 'cf (my-create-compilation-frame name)))
    cf ))


(defun my-goto-end-of-window-in-frame (frame buffer-name)
  (save-excursion
    (select-frame my-compile-frame)
    (set-window-buffer (selected-window) (get-buffer buffer-name))
    (set-window-point (selected-window) (point-max))
    ))


(defvar my-compile-remote-cmd "ssh " 
  "Compilation remote shell")

(defvar my-compile-machine "dev1" 
  "Compilation machine")

(defvar my-compile-make-bin "gmake test -j8"
  "Make command to launch")

(defvar my-compile-changedir-bin "cd "
  "cd command ...")

(defvar my-compile-cmd-separator " ; "
  "Command separator.")

(defun my-compile-current-path ()
  "find path on current machine to be cd'ed onto the remote machine before compiling"
  (if (file-directory-p (buffer-file-name)) 
      (buffer-file-name)
    (file-name-directory (buffer-file-name))))

(defun my-compile-cmd () 
  "Compile comand on remote host"
  (let* ((cmpcmd (concat my-compile-changedir-bin (my-compile-current-path) 
                         my-compile-cmd-separator
                         my-compile-make-bin) )
         (cmd (concat my-compile-remote-cmd my-compile-machine 
                      " \"" cmpcmd  "\"")))
    cmd))

(defun my-compile (command &optional comint)
  "Compile in a separate frame"
  (interactive
   (list
    (let ((command (eval compile-command)))
      (if (or compilation-read-command current-prefix-arg)
	  (read-from-minibuffer "Compile command: "
				command nil nil
				(if (equal (car compile-history) command)
				    '(compile-history . 1)
				  'compile-history))
	command))
    (consp current-prefix-arg)))
  (compile command)
  (if (not (boundp 'my-compile-frame))
      (setq my-compile-frame (find-or-create-compile-frame "*compilation*")))
  (raise-frame my-compile-frame)
  (my-goto-end-of-window-in-frame my-compile-frame "*compilation*")
)

(defun my-remote-compile (command &optional comint)
  "Compile in a separate frame on a remote machine"
  (interactive
   (list
    (let ((command (eval compile-command)))
      (if (or compilation-read-command current-prefix-arg)
	  (read-from-minibuffer "Compile command: "
				command nil nil
				(if (equal (car compile-history) command)
				    '(compile-history . 1)
				  'compile-history))
	command))
    (consp current-prefix-arg)))
  (compile (concat  my-compile-remote-cmd my-compile-machine " \""
                    my-compile-changedir-bin (my-compile-current-path) 
                    my-compile-cmd-separator command "\""))
  (if (not (boundp 'my-compile-frame))
      (setq my-compile-frame (find-or-create-compile-frame "*compilation*")))
  (raise-frame my-compile-frame)
  (my-goto-end-of-window-in-frame my-compile-frame "*compilation*")
)


(defun my-find-file-upper-tree-dir (filename)
  (let ((full-dir-name (expand-file-name ".")))
    (while (and 
            (not (equal full-dir-name "/"))
            (not (file-exists-p (concat full-dir-name "/" filename)))
            )
      (setq full-dir-name (expand-file-name (concat full-dir-name "/.."))))
    (if (equal full-dir-name "/")
        nil
      full-dir-name)
    ))

;;
;; find words function helpers
;; FIXME the following lines could be in a separate file.
;;
(defvar my-find-in-project-history nil)

(setq my-find-in-project-history-cmd-prefix "find ")
(setq my-find-in-project-history-cmd-inffix " -type f -regex \".*\\.\\(h\\|c\\|H\\|C\\|hh\\|cc\\|hpp\\|cpp\\|hxx\\|cxx\\)\" -print0 | xargs -0 grep -nH ")
(setq my-find-in-project-history-cmd-suffix "")

(defun my-find-in-project (args)
  "Search for expression in file with grep.
The search start in the first upper directory where .project file exists or in \".\" if not .project file found.
- look for .project if not found search in current directory
- search in c/c++ file using grep"
  (interactive 
   (list 
    (let ((args (current-word))) 
      (read-from-minibuffer 
       "String to search (grep arguments) : "
       (current-word) nil nil (if (and args (equal (car my-find-in-project-history) args))
                                  '(my-find-in-project-history . 1)
                                'my-find-in-project-history) ))))
  (let* ((pre-dir-from (my-find-file-upper-tree-dir ".project"))
         (dir-from (if pre-dir-from pre-dir-from "."))
         (cmd (concat my-find-in-project-history-cmd-prefix dir-from
                      my-find-in-project-history-cmd-inffix args 
                      my-find-in-project-history-cmd-suffix)))
    (grep-find cmd)))

;;
;; Emacs save layout
;;

(defun emacs-save-layout ();TODO: handle eshell
  "save the frame and window layout to ~/.emacs-layout. Requires revive.el."
(interactive)
 (let ((out-name (concat "~/.emacs-layout"))
      (frames (frame-list))
      (configs nil)
      (buffs (sorted-buffer-list))
      (filtered-buffs nil)
      (s-buffs nil))
  (dolist (b buffs)    
      (let ((file-name (buffer-file-name b)))
        (when (and file-name
                   (> (length file-name) 0))
          (setq filtered-buffs (cons file-name filtered-buffs)))))
  (when filtered-buffs (setq filtered-buffs (reverse filtered-buffs)))
  (dolist (frame frames)
    (select-frame frame)
    (setq configs (cons (current-window-configuration-printable) configs)))
  (setq configs (cons filtered-buffs configs))
  (write-region (with-output-to-string (prin1 configs)) nil out-name)))

(defun emacs-load-layout ();TODO: handle eshell buffers.
  "Load the layout saved by emacs-save-layout. Requires revive.el."
(interactive)
(let* ((in-name (concat "~/.emacs-layout"))
      (config-count 0)
      (frames (frame-list))
      (configs nil)
      (frame-count (length frames))
      (buffs nil))
  (with-temp-buffer
    (insert-file-contents-literally in-name)
    (setq buffs (read (current-buffer)))
    (setq configs (rest buffs))
    (setq buffs (first buffs)))
  (dolist (b buffs)
    (find-file-noselect b)
    (message "Loading buffer %s" b))
  (setq config-count (length configs))
  (message "Config count is %s" config-count)
  (unless (>= frame-count config-count)
    (dotimes (i (- config-count frame-count))
      (make-frame))
    (setq frames (frame-list))
    (setq frame-count (length frames))
    (message "frame-count is %s" frame-count))
  (defun it (lconfigs lframes)
            (when (and lconfigs lframes)
              (select-frame (first lframes))
              (restore-window-configuration (first lconfigs))
              (it (rest lconfigs) (rest lframes))))
  (it configs frames)))


;;(defun my-remote-compile ()
;;  "remote compile in the current directory in a separate frame"
;;  (interactive)
;;  (let ((cmd (my-compile-cmd)))
;;    (message cmd)
;;    (my-compile cmd)))

(show-paren-mode 1)

(setq display-time-day-and-date t)
(setq grep-find-command "find . -type f -regex \".*\\.\\(h\\|c\\|H\\|C\\|hh\\|cc\\|hpp\\|cpp\\|hxx\\|cxx\\)\" -print0 | xargs -0 grep -nH -e ")

(display-time)

(append 'path )

(setq load-path (append load-path (list (concat (getenv "HOME") "/.emacs-conf"))))
;;(load "c++-sugar")

(defun insert-current-date ()
  (interactive)
  (insert-string (current-time-string)))

(defun my-previous-window () (interactive) (other-window -1))

(global-set-key "" (quote goto-line))
(global-set-key "" (quote edition-special-past-incrementing-integer))
(global-set-key "" 'std-file-header)
(global-set-key "" (quote insert-current-date))
(global-set-key "ad" (quote insert-current-date))
(global-set-key "p"  (quote my-previous-window))
(global-set-key "m" (quote c++-builder-insert-main-body))
(global-set-key "c" (quote c++-builder-insert-class))
(global-set-key "n" (quote c++-builder-insert-name-space))
(global-set-key "d" (quote c++-builder-insert-debug-macro))
(global-set-key "o" (quote c++-builder-insert-getopt-body))
(global-set-key "i" (quote c++-builder-insert-if-then-else))
(global-set-key "" (quote find-file-at-point))
(global-set-key "\347\367" (quote my-find-in-project)) ; M-g M-w


(desktop-load-default)
(desktop-read)

(column-number-mode 1)

;;(require 'frame-restore)

;; simple functions
(defun my-simple-inster-char-a () (interactive) (insert-string "a"))
(defun my-simple-inster-char-b () (interactive) (insert-string "b"))
(defun my-simple-inster-char-c () (interactive) (insert-string "c"))
(defun my-simple-inster-char-d () (interactive) (insert-string "d"))
(defun my-simple-inster-char-e () (interactive) (insert-string "e"))
(defun my-simple-inster-char-f () (interactive) (insert-string "f"))
(defun my-simple-inster-char-g () (interactive) (insert-string "g"))
(defun my-simple-inster-char-h () (interactive) (insert-string "h"))
(defun my-simple-inster-char-i () (interactive) (insert-string "i"))
(defun my-simple-inster-char-j () (interactive) (insert-string "j"))
(defun my-simple-inster-char-k () (interactive) (insert-string "k"))
(defun my-simple-inster-char-l () (interactive) (insert-string "l"))
(defun my-simple-inster-char-m () (interactive) (insert-string "m"))
(defun my-simple-inster-char-n () (interactive) (insert-string "n"))
(defun my-simple-inster-char-o () (interactive) (insert-string "o"))
(defun my-simple-inster-char-p () (interactive) (insert-string "p"))
(defun my-simple-inster-char-q () (interactive) (insert-string "q"))
(defun my-simple-inster-char-r () (interactive) (insert-string "r"))
(defun my-simple-inster-char-s () (interactive) (insert-string "s"))
(defun my-simple-inster-char-t () (interactive) (insert-string "t"))
(defun my-simple-inster-char-u () (interactive) (insert-string "u"))
(defun my-simple-inster-char-v () (interactive) (insert-string "v"))
(defun my-simple-inster-char-w () (interactive) (insert-string "w"))
(defun my-simple-inster-char-x () (interactive) (insert-string "x"))
(defun my-simple-inster-char-y () (interactive) (insert-string "y"))
(defun my-simple-inster-char-z () (interactive) (insert-string "z"))


(setq overflow-newline-into-fringe t)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(desktop-save-mode t)
 '(dired-kept-versions 5)
 '(flymake-allowed-file-name-masks (quote (("\\.c\\'" flymake-simple-make-init) ("\\.C\\'" flymake-simple-make-init) ("\\.cpp\\'" flymake-simple-make-init) ("\\.xml\\'" flymake-xml-init) ("\\.html?\\'" flymake-xml-init) ("\\.cs\\'" flymake-simple-make-init) ("\\.pl\\'" flymake-perl-init) ("\\.h\\'" flymake-master-make-header-init flymake-master-cleanup) ("\\.java\\'" flymake-simple-make-java-init flymake-simple-java-cleanup) ("[0-9]+\\.tex\\'" flymake-master-tex-init flymake-master-cleanup) ("\\.tex\\'" flymake-simple-tex-init) ("\\.idl\\'" flymake-simple-make-init))))
 '(flymake-log-level -1)
 '(gdb-many-windows t)
 '(gdb-max-frames 1500)
 '(gdb-use-separate-io-buffer t)
 '(global-mark-ring-max 32)
 '(indent-tabs-mode nil)
 '(kept-new-versions 10)
 '(kept-old-versions 10)
 '(large-file-warning-threshold 50000000)
;;  '(lpr-command "ssh user@host lpr -P printer")
 '(lpr-printer-switch nil)
 '(mark-ring-max 32)
 '(open-paren-in-column-0-is-defun-start nil)
 '(read-file-name-completion-ignore-case t)
 '(remote-shell-program "/usr/bin/ssh")
 '(standard-indent 2)
 '(tab-width 8)
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

; Add cmake listfile names to the mode list.
(setq auto-mode-alist
	  (append
	   '(("CMakeLists\\.txt\\'" . cmake-mode))
	   '(("\\.cmake\\'" . cmake-mode))
	   auto-mode-alist))

(autoload 'cmake-mode "~/usr/share/emacs/site-lisp/cmake-mode.el" t)
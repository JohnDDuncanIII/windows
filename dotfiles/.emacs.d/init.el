;; use the Melpa package repo
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
(package-initialize))

(when (eq system-type 'windows-nt)
  (load-theme 'leuven t)
  ;; replace highlighted text with what I type
  (delete-selection-mode 1)
  ;; highlight the current line. emacs 21+ compat
  (global-hl-line-mode)

  (set-face-background 'fringe "#F6F6F6")
  (setq-default scroll-bar-width 5)
  ;;(add-to-list 'default-frame-alist '(scroll-bar-width  . 90))

  (custom-set-faces
   '(show-paren-match ((t (:background "#00ff00"))))
   '(show-paren-mismatch ((((class color)) (:background "red" :foreground "white")))))

  ;; enable parenthesis highlighting
  (show-paren-mode t)
  (setq show-paren-delay 0) ; disable delay
  ;; enable line nums
  (global-linum-mode t)

  ;; save desktop session on exit
  (desktop-save-mode 1)

  ;; Set tabs
  (setq-default indent-tabs-mode t)
  (setq standard-indent 4)
  (setq tab-width 4)
  (setq sgml-basic-offset 4)
  ;; Display tabs and trailing spaces
  (global-whitespace-mode t)
  (setq-default whitespace-style '(face tab trailing))

  ;; Electric
  (electric-indent-mode -1)
  (electric-pair-mode -1)

  ;; Save command history across sessions
  (savehist-mode)
  ;; Display column number
  (column-number-mode)

  ;; scrollers - scroll buffer not point
  (global-set-key "\M-n" "\C-u1\C-v")
  (global-set-key "\M-p" "\C-u1\M-v")

  ;; Display file path in the title bar
  (setq frame-title-format
		'((:eval (if (buffer-file-name)
					 (abbreviate-file-name (buffer-file-name))
				   "%b"
				   ))))

  ;; (setq tramp-default-method "plinkx")
  ;; make tramp work on windows w/ cywgin (requires https://github.com/d5884/fakecygpty)
  (eval-after-load "tramp"
	'(progn
	   (add-to-list 'tramp-methods
					(mapcar
					 (lambda (x)
					   (cond
						((equal x "sshx") "cygssh")
						((eq (car x) 'tramp-login-program) (list 'tramp-login-program "fakecygpty.exe ssh"))
						(t x)))
					 (assoc "sshx" tramp-methods)))
	   (setq tramp-default-method "cygssh")))

  ;; show line matching paren
  (defadvice show-paren-function
	  (after show-matching-paren-offscreen activate)
	"If the matching paren is offscreen, show the matching line in the
    echo area. Has no effect if the character before point is not of
    the syntax class ')'."
	(interactive)
	(let* ((cb (char-before (point)))
		   (matching-text (and cb
							   (char-equal (char-syntax cb) ?\) )
							   (blink-matching-open))))))
  ;; set Font, Scrollbar, and Menubar faces
  (custom-set-faces
   '(default ((t (:family "Fixedsys" :foundry "raster" :slant normal :weight normal :height 113 :width normal))))
   '(scroll-bar ((t (:background "white" :foreground "lavender"))))
   '(tool-bar ((t (:background "white" :foreground "black" :box (:line-width 1 :style released-button))))))
  )

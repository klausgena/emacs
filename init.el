;; ====
;; Melpa
;; ====

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;; ========
;; PACKAGES
;; ========

(defvar myPackages
  '(better-defaults
    material-theme
    elpy                  ;; python development
    flycheck              ;; on-the-fly syntax checking
    py-autopep8           ;; run autopep8 on save
    blacken               ;; black formatting on save
    magit                 ;; git integration
    )
  )

(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      myPackages)

;; ===================
;; BASIC CUSTOMISATION
;; ===================

(setq inhibit-startup-message t)
(load-theme 'material t)
(global-linum-mode t)


;; =================
;; DEVELOPMENT SETUP
;; =================

(elpy-enable)

;; Enable flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Enable autopep
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; Enable ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-file-extensions-order '(".org" ".txt" ".py" ".js" ".html" ".md")')

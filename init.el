;; ====
;; MELPA
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(magit blacken py-autopep8 flycheck material-theme elpy better-defaults)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

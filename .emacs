(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(dta-default-cfg "default.conf"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; Load paths
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/themes/")
;; If version 24.*:
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; Generics
(require 'cl-lib)

;; Windows
(setq inhibit-splash-screen t)
(require 'windows)
(win:startup-with-window)
(define-key ctl-x-map "C" 'see-you-again)
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe Emacs" t)
(add-hook 'after-init-hook 'resume)
(add-hook 'kill-emacs-hook 'save-current-configuration)

;; Comments
(defun toggle-comment-on-line()
  "Comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-,") 'toggle-comment-on-line)

;; Parenthesis
(show-paren-mode 1)
(setq show-paren-delay 0)
(require 'autopair)
(autopair-global-mode)

;; Indenting
(setq-default indent-tabs-mode nil)
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Line-numbering
(global-linum-mode t)

;; Ctrl-x, ctrl-v, ctrl-c + system clipboard
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
(cua-mode t)
(setq cua-auto-tabify-rectangles nil)
(transient-mark-mode 1)
(setq cua-keep-region-after-copy t)

;; Move to the first char of line
(defun smart-beginning-of-line()
  "Move point to first non-whitespace character or begining-of-line.

Move point to the first non-whitespace character on this line.
If point was already at that position, move point to beginning of line."
  (interactive) ; Use (interactive "^") in Emacs 23 to make shift-select work
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))
(global-set-key [home] 'smart-beginning-of-line)

;; Start server
(and window-system (server-start))

;; Theme
(defun zenburn-init()
  (load-theme 'zenburn))
(add-hook 'after-init-hook 'zenburn-init)
(when window-system (set-frame-size (selected-frame) 100 25))

;; Modes
(require 'php-mode)
(require 'js2-mode)
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(defun web-mode-hook()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-indent-style 4)
  (setq web-mode-style-padding 4)
  (setq web-mode-script-padding 4)
  (setq web-mode-block-padding 0)
  (setq web-mode-enable-current-element-highlight t)
)
(add-hook 'web-mode-hook 'web-mode-hook)
(setq scss-compile-at-save nil)
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(require 'puppet-mode)
(add-to-list 'auto-mode-alist '("\\.pp" . puppet-mode))

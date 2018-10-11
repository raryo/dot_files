(setq redisplay-dont-pause nil)
(keyboard-translate ?\C-h ?\C-?)
(defun backward-kill-line ()
  "Kill text between line beginning and point"
  (interactive)
  (kill-region (line-beginning-position) (point)))
(defun kill-word-or-region ()
  "Kill word backwards, kill region if there is an active one"
  (interactive)
  (if (use-region-p)
      (kill-region (region-beginning) (region-end))
    (backward-kill-word 1)))
(global-set-key (kbd "\C-u") 'backward-kill-line)
(global-set-key (kbd "\C-w") 'kill-word-or-region)
; 元のキーバインドを C-c に追いやる
(global-set-key (kbd "\C-c\C-u") 'universal-argument)
(global-set-key (kbd "\C-c\C-w") 'kill-region)
; 文字数カウントの設定
(global-set-key "\M-c" 'count-words)


(setq scroll-conservatively 1)





;package 
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)




; theme
(load-theme 'sanityinc-tomorrow-night t)
(if window-system (progn
    (set-frame-parameter nil 'alpha 90)
    ))





;markdown mode setting
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
;;(set-face-attribute 'markdown-code-face nil
;                    :inherit 'default)
;(set-face-attribute 'markdown-inline-code-face nil
;                    :inherit 'default
;                    :foreground (face-attribute font-lock-type-face :foreground))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-code-face ((t (:inherit default))))
 '(markdown-pre-face ((t (:inherit font-lock-constant-face)))))




; font
(set-default-font "Source Han Code JP N-13")

(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq make-backup-files nil)

(setq-default tab-width 4 indent-tabs-mode nil)

(global-linum-mode t)
(setq linum-format "%3d")
(global-hl-line-mode t)
(show-paren-mode 1)





;; japan env
(set-locale-environment nil)
(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-systems 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company yatex mozc markdown-mode+ dash color-theme-sanityinc-tomorrow 0blayout)))
 '(show-paren-mode t))



;; complete
(require 'company)
(global-company-mode) ; 全バッファで有効にする 
(setq company-idle-delay 0) ; デフォルトは0.5
(setq company-minimum-prefix-length 2) ; デフォルトは4
(setq company-selection-wrap-around t) 
(define-key company-active-map (kbd "M-n") nil)
(define-key company-active-map (kbd "M-p") nil)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-h") nil)
(defun company--insert-candidate2 (candidate)
  (when (> (length candidate) 0)
    (setq candidate (substring-no-properties candidate))
    (if (eq (company-call-backend 'ignore-case) 'keep-prefix)
        (insert (company-strip-prefix candidate))
      (if (equal company-prefix candidate)
          (company-select-next)
          (delete-region (- (point) (length company-prefix)) (point))
        (insert candidate))
      )))

(defun company-complete-common2 ()
  (interactive)
  (when (company-manual-begin)
    (if (and (not (cdr company-candidates))
             (equal company-common (car company-candidates)))
        (company-complete-selection)
      (company--insert-candidate2 company-common))))

(define-key company-active-map [tab] 'company-complete-common2)
(define-key company-active-map [backtab] 'company-select-previous) ; おまけ

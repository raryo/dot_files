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

; font
(add-to-list 'default-frame-alist
             '(font . "firacode-12"))
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  (font-spec :family "IPAexGothic" :size 12))

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

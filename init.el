;;; -*- lexical-binding: t -*-

;; Author:  yangxue <yangxue.cs@foxmail.com>
;; Created: 2024-07-05 11:18:22
;; License: GPLv3

;;; Commentary:

;;

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Basic Settings
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst IS-MAC (eq system-type 'darwin))
(defconst IS-WIN (eq system-type 'windows-nt))

(set-language-environment "UTF-8")

(setopt system-time-locale "C")
(setopt custom-file "~/.emacs.d/custom.el")

(setopt word-wrap t)
(setopt word-wrap-by-category t)
(setopt require-final-newline t)
(setopt sentence-end-double-space nil)

(setopt use-short-answers t)
(setopt use-dialog-box nil)
(setopt inhibit-splash-screen t)
(setopt inhibit-startup-message t)
(setopt initial-scratch-message nil)

(setopt bidi-inhibit-bpa t)
(setopt bidi-paragraph-direction 'left-to-right)
(setopt inhibit-compacting-font-caches t)
(setopt read-process-output-max (* 1024 1024))
(setopt scroll-conservatively 101)

(setopt tab-always-indent 'complete)
(setopt set-mark-command-repeat-pop t)
(setopt mouse-wheel-tilt-scroll t)
(setopt recentf-max-saved-items 100)
(setopt electric-pair-preserve-balance nil)
(setopt backward-delete-char-untabify-method 'hungry)
(setopt cua-rectangle-mark-key [C-S-return])

(setopt isearch-lazy-count t)
(setopt isearch-yank-on-move 'shift)

(setopt auto-save-visited-interval 10)
(setopt auto-revert-verbose nil)
(setopt auto-revert-avoid-polling t)
(setopt global-auto-revert-non-file-buffers t)

(setopt use-package-always-defer t)
(setopt use-package-always-ensure t)
(setopt use-package-compute-statistics t)

(setopt epg-pinentry-mode 'loopback)
(setopt epa-file-encrypt-to user-mail-address)

(setopt switch-to-prev-buffer-skip 'this)
(setopt switch-to-buffer-obey-display-actions t)

(setopt minibuffer-visible-completions t)
(setopt enable-recursive-minibuffers t)
(setopt completions-sort 'historical)
(setopt completion-auto-select 'second-tab)
(setopt read-extended-command-predicate #'command-completion-default-include-p)

(setopt user-mail-address "yangxue.cs@foxmail.com")
(setopt smtpmail-smtp-server "smtp.qq.com")
(setopt gnus-select-method '(nnimap "foxmail.cs" (nnimap-address "imap.qq.com")))

(setopt dired-dwim-target t)
(setopt dired-mouse-drag-files t)
(setopt dired-kill-when-opening-new-dired-buffer t)

(setopt imenu-flatten 'prefix)
(setopt reb-re-syntax 'string)
(setopt bookmark-save-flag t)
(setopt calendar-date-style 'iso)
(setopt dictionary-server "dict.org")
(setopt browse-url-browser-function #'eww-browse-url)
(setopt project-vc-extra-root-markers '(".dir-locals.el"))
(setopt show-paren-context-when-offscreen t)

(setopt tab-bar-show 1)
(setopt tab-bar-close-button-show nil)
(setopt tab-line-close-button-show 'selected)

(add-to-list 'display-buffer-alist
	     '("\\`\\*\\(Warnings\\|Compile-Log\\|Org Links\\)\\*\\'"
	       (display-buffer-no-window)
	       (allow-no-window . t)))

(windmove-default-keybindings 'control)
(windmove-swap-states-default-keybindings '(control shift))

(with-eval-after-load 'esh-module
  (add-to-list 'eshell-modules-list 'eshell-rebind))

(defun yx/eshell-setup ()
  (eshell-hist-mode +1)
  (keymap-local-set "C-l" #'eshell/clear))

(add-hook 'eshell-mode-hook #'yx/eshell-setup)

(add-hook 'text-mode-hook #'abbrev-mode)
(add-hook 'text-mode-hook #'visual-line-mode)

(add-hook 'eww-mode-hook #'variable-pitch-mode)
(add-hook 'eww-after-render-hook #'eww-readable)

(add-hook 'after-save-hook #'whitespace-cleanup)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Global Mirror Mode
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(which-key-mode +1)
(global-completion-preview-mode +1)

(repeat-mode +1)
(winner-mode +1)
(save-place-mode +1)
(auto-save-visited-mode +1)
(global-auto-revert-mode +1)

(cua-selection-mode +1)
(window-divider-mode +1)
(global-hl-line-mode +1)
(pixel-scroll-precision-mode +1)

(add-hook 'after-init-hook #'recentf-mode)
(add-hook 'after-init-hook #'savehist-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Ui
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(set-face-attribute 'fixed-pitch nil :family "Iosevka")

(dolist (charset '(han cjk-misc))
  (set-fontset-font t charset (font-spec :family "LXGW WenKai Mono")))

(setopt project-mode-line t)

(setopt modus-themes-mixed-fonts t)
(setopt modus-themes-variable-pitch-ui t)
(setopt modus-themes-org-blocks 'gray-background)

(setopt modus-themes-headings '((1 . (overline background 1.25))
				(2 . (1.15))
				(t . (1.1))))

(load-theme 'modus-operandi t)

(setopt nobreak-char-display nil)
(setopt mode-line-end-spaces '(:eval (if (display-graphic-p) " 　" "-%-")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Keybindings
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(keymap-global-unset "C-z")
(keymap-global-unset "<pinch>")
(keymap-global-unset "C-<wheel-up>")
(keymap-global-unset "C-<wheel-down>")

(keymap-global-set "C-^"      #'raise-sexp)
(keymap-global-set "C-/"      #'undo-only)
(keymap-global-set "M-`"      #'other-frame)
(keymap-global-set "M-0"      #'delete-window)

(keymap-global-set "C-M-/"    #'hippie-expand)
(keymap-global-set "C-c a"    #'org-agenda)
(keymap-global-set "C-c c"    #'org-capture)
(keymap-global-set "C-c l"    #'org-store-link)
(keymap-global-set "C-c d"    #'duplicate-dwim)
(keymap-global-set "C-c s"    #'scratch-buffer)
(keymap-global-set "C-c h"    #'hs-toggle-hiding)
(keymap-global-set "C-c 3"    #'follow-delete-other-windows-and-split)

(keymap-global-set "C-x C-b"  #'ibuffer)

(keymap-global-set "M-s d"    #'dictionary-lookup-definition)
(keymap-global-set "M-s M-d"  #'dictionary-search)

(with-eval-after-load 'isearch
  (keymap-substitute isearch-mode-map #'isearch-delete-char #'isearch-del-char))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   System
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'server)
(or (server-running-p) (server-start))

(setenv "HTTP_PROXY"  "http://localhost:7890")
(setenv "HTTPS_PROXY" "http://localhost:7890")

(when IS-MAC
  (setenv "PATH" (concat "~/.local/bin:/Library/TeX/texbin:" (getenv "PATH")))
  (setopt exec-path (split-string (getenv "PATH") path-separator)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Core Extras
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(require 'use-package-ensure)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(add-to-list 'load-path "~/.emacs.d/extras")

(require 'init-util)

(require 'init-base)

(require 'init-org+)

(require 'init-dev+)

(require 'init-misc)

(require 'init-blog)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load custom-file :noerror)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

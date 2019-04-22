;;;
;;; General
;;;
(setq inhibit-startup-message t)
(mouse-wheel-mode)
(if (not window-system) (menu-bar-mode 0))
(tool-bar-mode -1)
(menu-bar-mode -1)

;;; show line number
(global-linum-mode t)
  (setq linum-format "%3d| ")

;;;
;;; Verilog Mode
;;;
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
(setq auto-mode-alist (cons  '("\\.v\\'" . verilog-mode) auto-mode-alist))

;;;
;;; SFL Mode
;;;
(add-hook 'sfl-mode-hook 'turn-on-font-lock)
(autoload 'sfl-mode "sfl-mode-c" "SFL editing mode" t)
(setq auto-mode-alist (cons (cons "\\.sfl" 'sfl-mode) auto-mode-alist))

;;; ;;; Anthy on Emacs
;;;
(setq default-input-method "japanese-egg-anthy")
(global-set-key "\C-o" 'toggle-input-method)
(put 'upcase-region 'disabled nil)

(if window-system (progn
(set-foreground-color "white")
(set-background-color "black")
))
(put 'scroll-left 'disabled nil)

(add-to-list 'load-path "~/.emacs.d/popup-el")
(load "popup")

(add-to-list 'load-path "~/.emacs.d/auto-complete")
(load "auto-complete") ;; (require 'popup)
(require 'auto-complete-config)
(ac-config-default)
(ac-set-trigger-key "TAB")
(setq ac-use-menu-map t)
(setq ac-delay 0.05)
(setq ac-auto-show-menu 0.05)

;;;(load "~/.drill_instructor/drill_instructor.emacs")

;;;; Basic setup: colors, modifier keys, builtin behaviors, etc.
(setq kill-whole-line t)
(setq confirm-kill-emacs 'yes-or-no-p)
(random t)                              ; reseed
(server-start)
(global-auto-revert-mode 1)
(set-cursor-color "black")

;; Mac-isms. They do no harm on non-macs.
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

;; don't iconify on C-z when running in X
;; or exit emacs (!) when running in Emacs.app
(when window-system (global-unset-key "\C-z"))

;; while I <square box> Unicode as much as the next guy,
;; I want my lambdas left alone.
(remove-hook 'coding-hook 'pretty-lambdas)

;; just nice to have everywhere; my screen is only so wide
(add-hook 'coding-hook (lambda () (setq tab-width 2)))

;; bar cursor makes it easier to see what delete-(backward-)char are going to hit
(add-to-list 'load-path "~/.emacs.d/vendor/bar-cursor")
(require 'bar-cursor)
(bar-cursor-mode 1)

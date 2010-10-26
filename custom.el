;;;; Basic setup: colors, modifier keys, builtin behaviors, etc.
(setq kill-whole-line t)
(setq confirm-kill-emacs 'yes-or-no-p)
(random t)                              ; reseed
(server-start)
(global-auto-revert-mode 1)

;; bar cursor makes it easier to see what delete-(backward-)char are going to hit
(add-to-list 'load-path "~/.emacs.d/vendor/bar-cursor")
(require 'bar-cursor)
(bar-cursor-mode 1)

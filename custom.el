;;;; Basic setup: colors, modifier keys, builtin behaviors, etc.
(setq kill-whole-line t)
(setq confirm-kill-emacs 'yes-or-no-p)
(random t)                              ; reseed
(server-start)
(global-auto-revert-mode 1)
(set-cursor-color "black")

(global-set-key [(f6)] 'next-error)
(global-set-key [(shift f6)] 'previous-error)
;; on kinesis freestyle, 'Delete' sends kp-delete
(global-set-key [(control kp-delete)] 'kill-word)

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

;;;; line numbers on the left in a gui
(when window-system
  (add-to-list 'load-path "~/.emacs.d/vendor/linum")
  (require 'linum)
  (global-linum-mode 1))

;;;; Extra packages that the starter kit doesn't give us
(setq starter-kit-packages
      (append starter-kit-packages (list 'yasnippet-bundle
                                         'clojure-mode
                                         'paredit
                                         'haml-mode
                                         'sass-mode)))
(starter-kit-elpa-install)

(add-hook 'haml-mode-hook
          (lambda ()
            (run-hooks 'coding-hook)))

;;;; tab-completion configuration (hooray hippie-expand)
(setq hippie-expand-try-functions-list (cons 'yas/hippie-try-expand hippie-expand-try-functions-list))
(global-set-key [(shift tab)] 'hippie-expand)
(global-set-key [(control tab)] 'hippie-expand)


(require 'custom-ruby)

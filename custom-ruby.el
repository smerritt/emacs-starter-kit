(provide 'custom-ruby)

;;;; ruby-mode customizations
(setq ruby-deep-arglist nil)
(setq ruby-deep-indent-paren nil)

(defun d-and-autoindent-end (times)
  (interactive "p")
  (insert "d")
  (if (and
       (>= (point)
           (+ 4 (point-min)))
       (looking-back "[[:space:]]end" 4))
      (indent-according-to-mode))
  (if (> times 1)
      (d-and-autoindent-end (1- times))))

(add-hook 'ruby-mode-hook (lambda ()
                            (local-set-key [(?d)] 'd-and-autoindent-end)))

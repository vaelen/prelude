(prelude-require-packages '(rainbow-delimiters))

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'show-paren-mode)

(setq lisp-indent-function 'common-lisp-indent-function)

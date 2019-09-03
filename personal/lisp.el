(prelude-require-packages '(ac-sly sly-repl-ansi-color sly-asdf rainbow-delimiters))

(add-hook 'sly-mode-hook 'set-up-sly-ac)
(add-hook 'sly-repl-mode-hook 'set-up-sly-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'sly-repl-mode))

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'show-paren-mode)

(setq lisp-indent-function 'common-lisp-indent-function)

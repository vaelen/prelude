(prelude-require-packages '(auto-complete sly ac-sly sly-repl-ansi-color sly-quicklisp))

(ac-config-default)

(add-hook 'sly-mode-hook 'set-up-sly-ac)
(add-hook 'sly-repl-mode-hook 'set-up-sly-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'sly-repl-mode))

(defun add-auto-mode (mode &rest patterns)
  "Add entries to `auto-mode-alist' to use `MODE' for all given file `PATTERNS'."
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

(defun user/asm-mode-hook ()
  "Assembly mode hook."
  ;; Indent using tabs by default.
  ;; (setq indent-tabs-mode t)
  (setq indent-tabs-mode nil)
  (setq tab-width 4)

  ;; Use smart tabs instead of always inserting a tab
  ;;(setq tab-always-indent (default-value 'tab-always-indent))

  (user/gnu-global-enable))


(define-derived-mode arm-mode asm-mode "ARM"
  "Major mode for editing ARM assembler code."
  ;; Unset ; key.
  (local-unset-key (vector asm-comment-char))
  (set (make-local-variable 'asm-comment-char) ?@)
  (local-set-key (vector asm-comment-char) 'asm-comment)
  ;; Update syntax for new comment char.
  (set-syntax-table (make-syntax-table asm-mode-syntax-table))
  (modify-syntax-entry asm-comment-char "< b")
  ;; Fix one level comments.
  (set (make-local-variable 'comment-start) (string asm-comment-char)))


(define-derived-mode mips-mode asm-mode "MIPS"
  "Major mode for editing MIPS assembler code."
  ;; Unset ; key.
  (local-unset-key (vector asm-comment-char))
  (set (make-local-variable 'asm-comment-char) ?#)
  (local-set-key (vector asm-comment-char) 'asm-comment)
  ;; Update syntax for new comment char.
  (set-syntax-table (make-syntax-table asm-mode-syntax-table))
  (modify-syntax-entry asm-comment-char "< b")
  ;; Fix one level comments.
  (set (make-local-variable 'comment-start) (string asm-comment-char)))


(defun user/iasm-mode-init ()
  "Initialize interactive assmelby mode."
  ;;; (Bindings) ;;;
  (user/bind-key-global :code :library-list 'iasm-ldd)
  (user/bind-key-global :code :disassemble 'iasm-disasm))


(defun user/asm-mode-init ()
  "Initialize assembly mode."
  (add-hook 'asm-mode-hook 'user/asm-mode-hook)
  (add-auto-mode 'asm-mode "\\.[ia]65$")

  ;;; (Packages) ;;;
  ;;(require-package '(:name iasm-mode :after (user/iasm-mode-init)))
  )

(user/asm-mode-init)


(provide 'modes/asm)
;;; asm.el ends here

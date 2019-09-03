(prelude-require-packages '(easy-hugo))

(setq easy-hugo-basedir "~/vaelen.org/")
;;(setq easy-hugo-url "https://alpha.vaelen.org")
(setq easy-hugo-google-cloud-storage-bucket-name "alpha.vaelen.org")
(setq easy-hugo-previewtime "300")
(setq easy-hugo-postdir "content/posts")
(define-key global-map (kbd "C-c C-e") 'easy-hugo)

(defun update-gnu-elpa-key ()
  (interactive)
  "Update the GPG key used for accessing the GNU ELPA package archive."
  (shell-command "gpg --homedir ~/.emacs.d/elpa/gnupg --receive-keys 066DAFCB81E42C40"))

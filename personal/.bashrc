export PATH=/Applications/Emacs.app/Contents/MacOS/:/Applications/Emacs.app/Contents/MacOS/bin:$PATH

export EMACS_CMD="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient --alternate-editor='' -c"
export EDITOR="$EMACS_CMD"
#alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
alias emacs="$EMACS_CMD -n"
alias emacsclient='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient'

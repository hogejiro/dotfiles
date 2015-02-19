write .emacs as below:

```lisp
;; load dotfiles
(load (expand-file-name (concat (getenv "HOME") "/dotfiles/.emacs.d/init")))
```

;; Keymaps for evil mode

;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

;; Escape should quit wherever you go
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;; Custom movement
(define-key evil-normal-state-map "\C-e" 'move-end-of-line)
(define-key evil-normal-state-map "\C-j" 'forward-paragraph)
(define-key evil-normal-state-map "\C-k" 'backward-paragraph)
(define-key evil-normal-state-map "\S-j" 'windmove-left)
(define-key evil-normal-state-map "\S-k" 'windmove-right)

(define-key evil-normal-state-map "q" 'evil-backward-word-begin)
;; (define-key evil-normal-state-map "q" 'evil-backward-word-begin)
;; (define-key evil-normal-state-map "\C-l" 'move-end-of-line)

(define-key evil-normal-state-map "\M-j" 'cm-fast-step-downward)
(define-key evil-normal-state-map "\M-k" 'cm-fast-step-upward)
;; (define-key evil-normal-state-map "\M-h" 'move-end-of-line)
;; (define-key evil-normal-state-map "\M-l" 'move-end-of-line)

(define-key evil-insert-state-map "\C-j" 'forward-paragraph)
(define-key evil-insert-state-map "\C-k" 'backward-paragraph)
;; (define-key evil-insert-state-map "\C-h" 'move-end-of-line)
;; (define-key evil-insert-state-map "\C-l" 'move-end-of-line)

;; (define-key evil-insert-state-map "\S-j" 'windmove-left)
;; (define-key evil-insert-state-map "\S-k" 'windmove-right)
(define-key evil-insert-state-map "\C-e" 'move-end-of-line)

;; (define-key evil-normal-state-map "\S-left" 'windmove-left)
;; (define-key evil-normal-State-map "\S-right" 'windmove-right)

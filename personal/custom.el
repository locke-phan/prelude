;; Customization
(disable-theme 'zenburn)

;; Display Mark
(transient-mark-mode)

;; Auto Revert/Update buffer
(global-auto-revert-mode)

;; Comment or uncomment region or line with Meta-;
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the current line or region."
  (interactive)
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    )
  )

(global-set-key "\M-;" 'comment-or-uncomment-region-or-line)
;; (global-set-key "\M-;" )
;; =================================================================

;; Move by defun with meta-up and meta-down
(define-key input-decode-map "\e\eOA" [(meta up)])
(define-key input-decode-map "\e\eOB" [(meta down)])

(defun cm-fast-step-upward ()
  "Step 3 lines up, recenteres the screen."
  (interactive)
  (forward-line -3))

(defun cm-fast-step-downward ()
  "Step 3 lines down, recenteres the screen."
  (interactive)
  (forward-line 3))

(global-set-key [(meta up)] 'cm-fast-step-upward)
(global-set-key [(meta down)] 'cm-fast-step-downward)

;; =================================================================

(global-linum-mode 1)
(global-whitespace-mode 1)

(show-paren-mode)

;; ==== Ediff stuff
(setq ediff-split-window-function 'split-window-horizontally)

;; If in graphics mode
(if (display-graphic-p)
    (progn
      ;; if graphic mode
      (server-start)
      (setq linum-format "%5d ")
      ;; make the modeline high contrast
      (setq solarized-high-contrast-mode-line t)
      ;; make the fringe stand out from the background
      (setq solarized-distinct-fringe-background t)

      ;; load the awesome theme
      (load-theme 'solarized-light t)

      ;; ==== Nuke the ugly scroll bar
      (scroll-bar-mode -1)
      (fringe-mode '(2 . 0))
      (set-face-attribute 'default nil :font "Consolas")
      (set-face-attribute 'default nil :height 165)
      ;; (set-fringe-style 'left-only t)
      )
  ;; else if terminal mode
  (setq linum-format "%5d\u2503  ")

  )

;; Custom packages
(prelude-require-packages
 '(
   ;; solarized-theme
   cmake-mode
   flycheck
   ))

;; Customization
(disable-theme 'zenburn)

;; Display Mark
(transient-mark-mode)

;; Use wombat theme
(load-theme 'wombat)


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

;; =================================================================
(global-set-key (kbd "<f2>") 'undo-tree-undo)
(global-set-key (kbd "<f3>") 'undo-tree-redo)

;; (global-set-key (kbd "C-u") 'left-char)
;; (global-set-key (kbd "C-o") 'right-char)

;; (global-set-key (kbd "M-u") 'left-word)
;; (global-set-key (kbd "M-o") 'right-word)

(global-set-key (kbd "<menu>") 'nil)

(setq prelude-guru nil)

;; (global-set-key (kbd "M") 'right-word)

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
;; ==================== Unset key-bindings =========================
;; (global-set-key (kbd "<up>") 'nil)
;; (global-set-key (kbd "<down>") 'nil)
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
      (setq linum-format "%5d")
      ;; make the modeline high contrast
      (setq solarized-high-contrast-mode-line t)
      ;; make the fringe stand out from the background
      (setq solarized-distinct-fringe-background t)

      ;; load the awesome theme
      (load-theme 'solarized-light t)

      ;; ==== Nuke the ugly scroll bar
      (scroll-bar-mode -1)
      (fringe-mode '(2 . 0))
      ;; (set-face-attribute 'default nil :font "Consolas")
      (set-face-attribute 'default nil :height 70)
      ;; (set-fringe-style 'left-only t)
      ;; Full-screen
      (custom-set-variables
       '(initial-frame-alist (quote ((fullscreen . maximized)))))
      )

  ;; else if terminal mode
  (setq linum-format "%5d| ")
  )

;; (load "~/.emacs.d/personal/packages/powerline/powerline.el")
;; (load "~/.emacs.d/personal/packages/powerline/powerline-separators.el")
;; (load "~/.emacs.d/personal/packages/powerline/powerline-themes.el")

;; Disable prelude key-chord
;; (key-chord-mode -1)

;; (require 'evil)
;; (evil-mode 1)

;; (require 'powerline)
;; (powerline-evil-theme)

;; (load "~/.emacs.d/personal/keymaps.el")
;; (evil-mode -1)

;==== Spaces only indentation =====================================
(setq c-default-style "linux"
      c-basic-offset 4)
(setq-default tab-width 4)
;; (custom-set-variables '(tab-width 4))
(setq sgml-basic-offset 4)
(setq-default indent-tabs-mode nil)
;==================================================================

;; Enable global flycheck mode
(add-hook 'after-init-hook #'global-flycheck-mode)

;==== Don't indent if we're in a c++ namespace ====================
(defconst my-cc-style
  '("cc-mode"
    (c-offsets-alist . ((innamespace . [0])))))

(c-add-style "my-cc-mode" my-cc-style)
;==================================================================

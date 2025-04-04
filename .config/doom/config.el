;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "DankMono Nerd Font" :size 17 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "DankMono Nerd Font" :size 17))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'catppuccin)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(use-package treemacs-nerd-icons
  :after treemacs
  :config
  (treemacs-load-theme "nerd-icons"))

(use-package treemacs
  :config
  (progn
    (setq treemacs-position 'right)))

;; places the git gutter outside the margins.
(setq-default fringes-outside-margins t)

(require 'git-gutter)

;; If you enable global minor mode
(global-git-gutter-mode +1)

;; Config for fish
(setq shell-file-name (executable-find "bash"))


;; git gutter fringe
(use-package! git-gutter-fringe
  :hook (prog-mode . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 2))

;; Save to focus out
(add-hook 'focus-out-hook (lambda () (save-some-buffers t)))

;; Duplicar lineas
(defun duplicate-line-or-region (&optional n)
  "Duplica la línea actual o la región si está activa N veces."
  (interactive "p")
  (if (region-active-p)
      (let ((region (buffer-substring-no-properties (region-beginning) (region-end))))
        (goto-char (region-end))
        (dotimes (_ (or n 1)) (insert "\n" region)))
    (let ((line (buffer-substring-no-properties (line-beginning-position) (line-end-position))))
      (end-of-line)
      (dotimes (_ (or n 1)) (insert "\n" line)))))

;; Asignar la función a un atajo de teclado, por ejemplo `SPC d l`
(map! :leader
      :desc "Duplicate line or region"
      "d l" #'duplicate-line-or-region)

;; deshacer granular
(setq evil-want-fine-undo t)

;; Cambiar de buffers con Shift + H y Shift + L
(map! :n "H" #'previous-buffer)
(map! :n "L" #'next-buffer)

;; Remover las tildes ~
(remove-hook 'text-mode-hook #'vi-tilde-fringe-mode)
(global-vi-tilde-fringe-mode -1)


;; Temporal, solo para pruebas
(after! lsp-mode
  (setq lsp-java-server-install-dir "~/.emacs.d/eclipse.jdt.ls/"))


;; org
(after! org
  (setq org-directory "~/workspace/org/"
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-ellipsis " ▼ "
        org-superstar-headline-bullets-list '("◉" "●" "○" "◆" "●" "○" "◆")
        org-superstar-itembullet-alist '((?+ . ?➤) (?- . ?✦)) ; changes +/- symbols in item lists
        org-log-done 'time
        org-hide-emphasis-markers t
        ;; ex. of org-link-abbrev-alist in action
        ;; [[arch-wiki:Name_of_Page][Description]]
        org-link-abbrev-alist    ; This overwrites the default Doom org-link-abbrev-list
          '(("google" . "http://www.google.com/search?q=")
            ("arch-wiki" . "https://wiki.archlinux.org/index.php/")
            ("ddg" . "https://duckduckgo.com/?q=")
            ("wiki" . "https://en.wikipedia.org/wiki/"))
        org-table-convert-region-max-lines 20000
          )) ; Task has been cancelled

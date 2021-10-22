(require 'use-package-ensure)
(setq use-package-always-ensure t)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(use-package doom-themes)
(setq doom-themes-enable-bold t
    doom-themes-enable-italics t)
(load-theme 'doom-outrun-electric t)

(use-package doom-modeline)
(doom-modeline-mode 1)

(global-display-line-numbers-mode)

(dolist (mode '(term-mode-hook
        eshell-mode-hook))
    (add-hook mode (lambda() (display-line-numbers-mode 0))))

(set-default 'truncate-lines t)

(setq indent-tabs-mode t)
(setq tab-stop-list (number-sequence 8 200 8))
(setq tab-width 4)
(setq indent-line-function 'insert-tab)

(global-hl-line-mode +1)
(use-package hlinum)
(hlinum-activate)

(use-package rainbow-delimiters
:hook (prog-mode . rainbow-delimiters-mode))

(setq scroll-step 1)
(setq scroll-conservatively 10000)

(set-face-attribute 'default nil
    :font "Noto Sans Mono 11"
    :weight 'medium)
(set-face-attribute 'variable-pitch nil
	:font "Noto Sans Mono 11"
    :weight 'medium)
(set-face-attribute 'fixed-pitch nil
    :font "Noto Sans Mono 11"
    :weight 'medium)
;;(setq-default line-spacing 0.10)
(add-to-list 'default-frame-alist '(font . "Noto Sans Mono 11"))

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

(setq org-pretty-entities t)

(use-package key-chord)

(use-package which-key)
(which-key-mode)

(use-package general
     :config
(general-evil-setup t))

(general-create-definer space-leader
    :states '(normal visual emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "C-SPC"
)

(use-package ivy
    :diminish
    :bind (("C-s" . swiper)
            :map ivy-minibuffer-map
            ("TAB" . ivy-alt-done)
            ("C-l" . ivy-alt-done)
            ("C-j" . ivy-next-line)
            ("C-k" . ivy-previous-line)
            :map ivy-switch-buffer-map
            ("C-k" . ivy-previous-line)
            ("C-l" . ivy-done)
            ("C-d" . ivy-switch-buffer-kill)
            :map ivy-reverse-i-search-map
            ("C-k" . ivy-previous-line)
            ("C-d" . ivy-reverse-i-search-kill))
    :config
    (ivy-mode 1))

(use-package ivy-rich
    :init
    (ivy-rich-mode 1))

(use-package counsel
:bind (("M-x" . counsel-M-x)
        ("C-x b" . counsel-ibuffer)
        ("C-x C-f" . counsel-find-file)
        :map minibuffer-local-map
        ("C-r" . 'counsel-minibuffer-history)))

(use-package company)
(add-hook 'after-init-hook 'global-company-mode)

(add-hook 'after-init-hook 'electric-indent-mode)

(add-hook 'after-init-hook 'electric-pair-mode)
(setq electric-pair-preserve t)
(show-paren-mode 1)
(setq show-paren-delay 0)

(setq default-input-method "japanese")

(use-package dashboard
  :init      ;; tweak dashboard config before loading it
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-banner-logo-title "Emacs Is More Than A Text Editor!")
  ;;(setq dashboard-startup-banner 'logo) ;; use standard emacs logo as bannerj
  (setq dashboard-startup-banner "~/.config/emacs/emacs-dash.png")  ;; use custom image as banner
  (setq dashboard-center-content nil) ;; set to 't' for centered content
  (setq dashboard-items '((recents . 5)
                          (agenda . 5 )
                          (bookmarks . 3)
                          (projects . 3)
                          (registers . 3)))
  :config
  (dashboard-setup-startup-hook)
  (dashboard-modify-heading-icons '((recents . "file-text")
			      (bookmarks . "book"))))

(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

(use-package perspective
:bind
("C-x C-b" . persp-list-buffers)
:config
(persp-mode)
)

(add-hook 'dired-mode-hook 'auto-revert-mode)

(use-package all-the-icons-dired)
(use-package dired-open)
(use-package peep-dired)

(space-leader
    "d d" '(dired :which-key "Open dired")
    "d j" '(dired-jump :which-key "Dired jump to current")
    "d p" '(peep-dired :which-key "Peep-dired"))

(defun fix-peep-dired-next-file()
(interactive)
(delete-other-windows)
(peep-dired-next-file))

(defun fix-peep-dired-prev-file()
(interactive)
(delete-other-windows)
(peep-dired-prev-file))

(with-eval-after-load 'dired
(general-define-key
:states '(normal, visual)
:keymaps 'dired-mode-map
"h" 'dired-up-directory
"l" 'dired-find-file)

(general-define-key
:states '(normal, visual)
:keymaps 'peep-dired-mode-map
"j" 'fix-peep-dired-next-file
"k" 'fix-peep-dired-prev-file))

(add-hook 'peep-dired-hook 'evil-normalize-keymaps)
;; Get file icons in dired
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
;; With dired-open plugin, you can launch external programs for certain extensions
;; For example, I set all .png files to open in 'sxiv' and all .mp4 files to open in 'mpv'
(setq dired-open-extensions '(("gif" . "sxiv")
                              ("jpg" . "sxiv")
                              ("png" . "sxiv")
                              ("mkv" . "mpv")
                              ("pdf" . "zathura")
                              ("mp4" . "mpv")))

(use-package rainbow-mode)

(use-package pdf-tools
    :defer t
    :config
    (pdf-tools-install)
    (setq-default pdf-view-display-size 'fit-page)
)

(use-package projectile)

(use-package all-the-icons)

(use-package emacs-everywhere)

(use-package sudo-edit)

(space-leader
    "."     '(find-file :which-key "Find file")
    "f f"   '(find-file :which-key "Find file")
    "f r"   '(counsel-recentf :which-key "Recent files")
    "f s"   '(save-buffer :which-key "Save file")
    "f u"   '(sudo-edit-find-file :which-key "Sudo find file")
    "f y"   '(dt/show-and-copy-buffer-path :which-key "Yank file path")
    "f C"   '(copy-file :which-key "Copy file")
    "f D"   '(delete-file :which-key "Delete file")
    "f R"   '(rename-file :which-key "Rename file")
    "f S"   '(write-file :which-key "Save file as...")
    "f U"   '(sudo-edit :which-key "Sudo edit file"))

(space-leader
  "- a" '(lambda () (interactive)(find-file "~/orgfiles/agenda.org") :which-key "Org agenda")
  "- e" '(lambda () (interactive)(find-file "~/.config/doom/config.org") :which-key "Emacs Configuration")
  "- p" '(lambda () (interactive)(find-file "~/Documents/Projects") :which-key "Project Folder")
  "- c" '(lambda () (interactive)(find-file "~/Documents/Class/2021/fall/") :which-key "current class folder")
)

(add-hook 'org-mode-hook 'org-indent-mode)
(setq org-src-tab-acts-natively t
    org-src-preserve-indentation nil
    org-edit-src-content-indentation 0)

(use-package org-bullets)
(add-hook 'org-mode-hook (lambda() (org-bullets-mode 1)))

(setq org-startup-folded t)

(setq org-src-fontify-natively t
    org-confirm-babel-evaluate nil)

(use-package toc-org
    :commands toc-org-enable
    :init (add-hook 'org-mode-hook 'toc-org-enable))

(space-leader
       "m *"   '(org-ctrl-c-star :which-key "Org-ctrl-c-star")
       "m +"   '(org-ctrl-c-minus :which-key "Org-ctrl-c-minus")
       "m ."   '(counsel-org-goto :which-key "Counsel org goto")
       "m e"   '(org-export-dispatch :which-key "Org export dispatch")
       "m f"   '(org-footnote-new :which-key "Org footnote new")
       "m h"   '(org-toggle-heading :which-key "Org toggle heading")
       "m i"   '(org-toggle-item :which-key "Org toggle item")
       "m n"   '(org-store-link :which-key "Org store link")
       "m o"   '(org-set-property :which-key "Org set property")
       "m t"   '(org-todo :which-key "Org todo")
       "m x"   '(org-toggle-checkbox :which-key "Org toggle checkbox")
       "m B"   '(org-babel-tangle :which-key "Org babel tangle")
       "m I"   '(org-toggle-inline-images :which-key "Org toggle inline imager")
       "m T"   '(org-todo-list :which-key "Org todo list")
       "o a"   '(org-agenda :which-key "Org agenda")
       )

(require 'org)
(setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

;; (defun efs/org-mode-visual-fill ()
;; (setq visual-fill-column-width 100
;; visual-fill-column-center-text t)
;; (visual-fill-column-mode 1))

;; (
;; use-package visual-fill-column
;; :hook (org-mode . efs/org-mode-visual-fill)
;; )

(setq org-startup-with-inline-images t)



(use-package yasnippet)
(yas-global-mode 1)

(setq yas-indent-line nil)

(use-package haskell-mode)

(use-package auctex
:defer t)

(setq shell-file-name "/usr/bin/zsh"
      vterm-max-scrollback 5000)

(use-package emojify
    :hook (after-init . global-emojify-mode))

(setq split-height-threshold nil)
(setq split-width-threshold 0)

(winner-mode 1)
(space-leader
       ;; Window splits
       "w c"   '(evil-window-delete :which-key "Close window")
       "w d"   '(evil-window-delete :which-key "Close window")
       "w o"   '(delete-other-windows :which-key "Delete other windows")
       "w n"   '(evil-window-new :which-key "New window")
       "w s"   '(evil-window-split :which-key "Horizontal split window")
       "w v"   '(evil-window-vsplit :which-key "Vertical split window")
       "w _"   '(evil-window-set-height :which-key "evil-window-set-height")
       "w |"   '(evil-window-set-width :which-key "evil-window-set-width")

       ;; Window motions
       "w h"   '(evil-window-left :which-key "Window left")
       "w j"   '(evil-window-down :which-key "Window down")
       "w k"   '(evil-window-up :which-key "Window up")
       "w l"   '(evil-window-right :which-key "Window right")
       "w w"   '(evil-window-next :which-key "Goto next window")
       ;; winner mode
       "w <left>"  '(winner-undo :which-key "Winner undo")
       "w <right>" '(winner-redo :which-key "Winner redo"))

(space-leader
       "r c"   '(copy-to-register :which-key "Copy to register")
       "r f"   '(frameset-to-register :which-key "Frameset to register")
       "r i"   '(insert-register :which-key "Insert register")
       "r j"   '(jump-to-register :which-key "Jump to register")
       "r l"   '(list-registers :which-key "List registers")
       "r n"   '(number-to-register :which-key "Number to register")
       "r r"   '(counsel-register :which-key "Choose a register")
       "r v"   '(view-register :which-key "View a register")
       "r w"   '(window-configuration-to-register :which-key "Window configuration to register")
       "r +"   '(increment-register :which-key "Increment register")
       "r SPC" '(point-to-register :which-key "Point to register"))

(space-leader
  "SPC"   '(counsel-M-x :which-key "M-x")
  "c c"   '(compile :which-key "Compile")
  "c C"   '(recompile :which-key "Recompile")
  "t t"   '(toggle-truncate-lines :which-key "Toggle truncate lines"))

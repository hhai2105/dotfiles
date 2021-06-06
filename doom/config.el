;; (map! :leader
;;       (:prefix ("b". "buffer")
;;        :desc "List bookmarks" "L" #'list-bookmarks
;;        :desc "Save current bookmarks to bookmark file" "w" #'bookmark-save))

;; (use-package dashboard
;;   :init      ;; tweak dashboard config before loading it
;;   (setq dashboard-set-heading-icons t)
;;   (setq dashboard-set-file-icons t)
;;   (setq dashboard-banner-logo-title "Emacs Is More Than A Text Editor!")
;;   ;;(setq dashboard-startup-banner 'logo) ;; use standard emacs logo as banner
;;   (setq dashboard-startup-banner "~/.config/doom/banner.png")  ;; use custom image as banner
;;   (setq dashboard-center-content nil) ;; set to 't' for centered content
;;   (setq dashboard-items '((recents . 3)
;;                           (agenda . 3)
;;                           (projects . 3)))
;;   :config
;;   (dashboard-setup-startup-hook)
;;   (dashboard-modify-heading-icons '((recents . "file-text")
			      ;; (bookmarks . "book"))))

;; (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

(map! :leader
      (:prefix ("d" . "dired")
       :desc "Open dired" "d" #'dired
       :desc "Dired jump to current" "j" #'dired-jump)
      (:after dired
       (:map dired-mode-map
        :desc "Peep-dired image previews" "d p" #'peep-dired
        :desc "Dired view file" "d v" #'dired-view-file)))
;; Make 'h' and 'l' go back and forward in dired. Much faster to navigate the directory structure!
(evil-define-key 'normal dired-mode-map
  (kbd "h") 'dired-up-directory
  (kbd "l") 'dired-open-file) ; use dired-find-file instead if not using dired-open package
;; If peep-dired is enabled, you will get image previews as you go up/down with 'j' and 'k'
(evil-define-key 'normal peep-dired-mode-map
  (kbd "j") 'peep-dired-next-file
  (kbd "k") 'peep-dired-prev-file)
(add-hook 'peep-dired-hook 'evil-normalize-keymaps)
;; Get file icons in dired
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
;; With dired-open plugin, you can launch external programs for certain extensions
;; For example, I set all .png files to open in 'sxiv' and all .mp4 files to open in 'mpv'
(setq dired-open-extensions '(("gif" . "sxiv")
                              ("jpg" . "sxiv")
                              ("png" . "sxiv")
                              ("mkv" . "mpv")
                              ("mp4" . "mpv")))

(setq doom-theme 'doom-outrun-electric)

;; (use-package emojify
;;   :hook (after-init . global-emojify-mode))

(emms-all)
(emms-default-players)
(emms-mode-line 1)
(emms-playing-time 1)
(setq emms-source-file-default-directory "~/Music/"
      emms-playlist-buffer-name "*Music*"
      emms-info-asynchronously t
      emms-info-functions '(emms-info-tinytag) ;; when using tinytag
      emms-browser-default-covers  'emms-browser-cache-thumbnail-async
      emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find)
(map! :leader
      (:prefix ("a" . "EMMS audio player")
       :desc "Go to emms playlist" "a" #'emms-playlist-mode-go
       :desc "Emms pause track" "x" #'emms-pause
       :desc "Emms stop track" "s" #'emms-stop
       :desc "Emms play previous track" "p" #'emms-previous
       :desc "Emms play next track" "n" #'emms-next))

(map! :leader
      (:prefix ("e". "evaluate/EWW")
       :desc "Evaluate elisp in buffer" "b" #'eval-buffer
       :desc "Evaluate defun" "d" #'eval-defun
       :desc "Evaluate elisp expression" "e" #'eval-expression
       :desc "Evaluate last sexpression" "l" #'eval-last-sexp
       :desc "Evaluate elisp in region" "r" #'eval-region))

;; (setq browse-url-browser-function 'eww-browse-url)
;; (map! :leader
;;       :desc "Search web for text between BEG/END"
;;       "s w" #'eww-search-words
;;       (:prefix ("e" . "evaluate/EWW")
;;        :desc "Eww web browser" "w" #'eww
;;        :desc "Eww reload page" "R" #'eww-reload))

(setq doom-font (font-spec :family "monospace" :size 20)
      doom-variable-pitch-font (font-spec :family "Ubuntu" :size 20)
      doom-big-font (font-spec :family "Source Code Pro" :size 24))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))
(setq global-prettify-symbols-mode t)

(setq ivy-posframe-display-functions-alist
      '((swiper                     . ivy-posframe-display-at-point)
        (complete-symbol            . ivy-posframe-display-at-point)
        (counsel-M-x                . ivy-display-function-fallback)
        (counsel-esh-history        . ivy-posframe-display-at-window-center)
        (counsel-describe-function  . ivy-display-function-fallback)
        (counsel-describe-variable  . ivy-display-function-fallback)
        (counsel-find-file          . ivy-display-function-fallback)
        (counsel-recentf            . ivy-display-function-fallback)
        (counsel-register           . ivy-posframe-display-at-frame-bottom-window-center)
        (dmenu                      . ivy-posframe-display-at-frame-top-center)
        (nil                        . ivy-posframe-display))
      ivy-posframe-height-alist
      '((swiper . 20)
        (dmenu . 20)
        (t . 10)))
(ivy-posframe-mode 1) ; 1 enables posframe-mode, 0 disables it.

(map! :leader
      (:prefix ("v" . "Ivy")
       :desc "Ivy push view" "v p" #'ivy-push-view
       :desc "Ivy switch view" "v s" #'ivy-switch-view))

(setq display-line-numbers-type t)
(map! :leader
      :desc "Comment or uncomment lines" "TAB TAB" #'comment-line
      (:prefix ("t" . "toggle")
       :desc "Toggle line numbers" "l" #'doom/toggle-line-numbers
       :desc "Toggle line highlight in frame" "h" #'hl-line-mode
       :desc "Toggle line highlight globally" "H" #'global-hl-line-mode
       :desc "Toggle truncate lines" "t" #'toggle-truncate-lines))

;; (require 'smtpmail)
(setq user-mail-address "hhai2105@gmail.com"
      user-full-name  "Hai Nguyen"
      ;; I have my mbsyncrc in a different folder on my system, to keep it separate from the
      ;; mbsyncrc available publicly in my dotfiles. You MUST edit the following line.
      ;; Be sure that the following command is: "mbsync -c ~/.config/mu4e/mbsyncrc -a"
      ;; mu4e-get-mail-command "mbsync -c ~/.config/mu4e/mbsyncrc -a"
      ;; mu4e-update-interval  300
      ;; mu4e-main-buffer-hide-personal-addresses t
      ;; message-send-mail-function 'smtpmail-send-it
      ;; starttls-use-gnutls t
      ;; smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      ;; mu4e-sent-folder "/hhai2105/Sent"
      ;; mu4e-drafts-folder "/hhai2105/Drafts"
      ;; mu4e-trash-folder "/hhai2105/Trash"
      ;; mu4e-maildir-shortcuts
      ;; '(("/hhai2105/Inbox"      . ?i)
      ;;   ("/hhai2105/Sent Items" . ?s)
      ;;   ("/hhai2105/Drafts"     . ?d)
        ;; ("/hhai2105/Trash"      . ?t))
      )

(defvar my-mu4e-account-alist
  '(("acc1-domain"
     (mu4e-sent-folder "/hha2105/Sent")
     (mu4e-drafts-folder "/hhai2105/Drafts")
     (mu4e-trash-folder "/hhai2105/Trash")
     (mu4e-compose-signature
       (concat
         "Hai Nguyen\n"
         "hhai2105@gmail.com\n"))
     (user-mail-address "hha2105@gmail.com")
     (smtpmail-default-smtp-server "smtp.googlemail.com")
     (smtpmail-smtp-server "smtp.googlemail.com")
     (smtpmail-smtp-user "hhai2105@gmail.com")
     (smtpmail-stream-type starttls)
     (smtpmail-smtp-service 587))
    ("haihnguyen"
     (mu4e-sent-folder "/haihnguyen/Sent")
     (mu4e-drafts-folder "/haihnguyen/Drafts")
     (mu4e-trash-folder "/haihnguyen/Trash")
     (mu4e-compose-signature
       (concat
         "Hai Nguyen\n"
         "haihnguyen@umass.edu\n"))
     (user-mail-address "haihnguyen@umass.edu")
     (smtpmail-default-smtp-server "smtp.googlemail.com")
     (smtpmail-smtp-server "smtp.googlemail.com")
     (smtpmail-smtp-user "haihnguyen@umass.edu")
     (smtpmail-stream-type starttls)
     (smtpmail-smtp-service 465))
    ;; ("acc3-domain"
    ;;  (mu4e-sent-folder "/acc3-domain/Sent")
    ;;  (mu4e-drafts-folder "/acc3-domain/Drafts")
    ;;  (mu4e-trash-folder "/acc3-domain/Trash")
    ;;  (mu4e-compose-signature
    ;;    (concat
    ;;      "John Boy\n"
    ;;      "acc3@domain.com\n"))
    ;;  (user-mail-address "acc3@domain.com")
    ;;  (smtpmail-default-smtp-server "smtp.domain.com")
    ;;  (smtpmail-smtp-server "smtp.domain.com")
    ;;  (smtpmail-smtp-user "acc3@domain.com")
    ;;  (smtpmail-stream-type starttls)
    ;;  (smtpmail-smtp-service 587))
    ))

(defun my-mu4e-set-account ()
  "Set the account for composing a message."
  (let* ((account
          (if mu4e-compose-parent-message
              (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                (string-match "/\\(.*?\\)/" maildir)
                (match-string 1 maildir))
            (completing-read (format "Compose with account: (%s) "
                                     (mapconcat #'(lambda (var) (car var))
                                                my-mu4e-account-alist "/"))
                             (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                             nil t nil nil (caar my-mu4e-account-alist))))
         (account-vars (cdr (assoc account my-mu4e-account-alist))))
    (if account-vars
        (mapc #'(lambda (var)
                  (set (car var) (cadr var)))
              account-vars)
      (error "No email account found"))))

(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)

(map! :leader
      (:prefix ("-" . "open file")
       :desc "Edit agenda file" "a" #'(lambda () (interactive) (find-file "~/Org/agenda.org"))
       :desc "Edit doom config.org" "c" #'(lambda () (interactive) (find-file "~/.config/doom/config.org"))
       :desc "Edit eshell aliases" "e a" #'(lambda () (interactive) (find-file "~/.config/doom/eshell/aliases"))
       :desc "Edit eshell aliases" "e p" #'(lambda () (interactive) (find-file "~/.config/doom/eshell/profile"))
       :desc "Edit doom init.el" "i" #'(lambda () (interactive) (find-file "~/.config/doom/init.el"))
       :desc "Edit doom packages.el" "p" #'(lambda () (interactive) (find-file "~/.config/doom/packages.el"))))

(map! :leader
      :desc "org babel tangle" "m B" #'org-babel-tangle)
(after! org
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
   (setq org-directory "~/Org/"
         org-agenda-files '("~/Org/agenda.org")
         org-default-notes-file (expand-file-name "notes.org" org-directory)
         org-ellipsis " ▼ "
         org-log-done 'time
         org-journal-dir "~/org/journal/"
         org-journal-date-format "%B %d, %Y (%A) "
         org-journal-file-format "%Y-%m-%d.org"
         org-hide-emphasis-markers t
         ;; ex. of org-link-abbrev-alist in action
         ;; [[arch-wiki:Name_of_Page][Description]]
         org-link-abbrev-alist    ; This overwrites the default Doom org-link-abbrev-list
            '(("google" . "http://www.google.com/search?q=")
              ("arch-wiki" . "https://wiki.archlinux.org/index.php/")
              ("ddg" . "https://duckduckgo.com/?q=")
              ("wiki" . "https://en.wikipedia.org/wiki/"))
            org-todo-keywords        ; This overwrites the default Doom org-todo-keywords
          '((sequence
             "TODO(t)"           ; A task that is ready to be tackled
             "BLOG(b)"           ; Blog writing assignments
             "GYM(g)"            ; Things to accomplish at the gym
             "PROJ(p)"           ; A project that contains other tasks
             "VIDEO(v)"          ; Video assignments
             "WAIT(w)"           ; Something is holding up this task
             "|"                 ; The pipe necessary to separate "active" states and "inactive" states
             "DONE(d)"           ; Task has been completed
             "CANCELLED(c)" )))) ; Task has been cancelled

(map! :leader
      (:prefix ("r" . "registers")
       :desc "Copy to register" "c" #'copy-to-register
       :desc "Frameset to register" "f" #'frameset-to-register
       :desc "Insert contents of register" "i" #'insert-register
       :desc "Jump to register" "j" #'jump-to-register
       :desc "List registers" "l" #'list-registers
       :desc "Number to register" "n" #'number-to-register
       :desc "Interactively choose a register" "r" #'counsel-register
       :desc "View a register" "v" #'view-register
       :desc "Window configuration to register" "w" #'window-configuration-to-register
       :desc "Increment register" "+" #'increment-register
       :desc "Point to register" "SPC" #'point-to-register))

;; (map! :leader
      ;; :desc "Ssh into my nextcloud" "\\ n" #'(lambda () (interactive) (find-file "/scp:derek@distrotube.net"))))

;; (setq shell-file-name "/bin/bash"
;;       vterm-max-scrollback 5000)
;; (setq eshell-rc-script "~/.config/doom/eshell/profile"
;;       eshell-aliases-file "~/.config/doom/eshell/aliases"
;;       eshell-history-size 5000
;;       eshell-buffer-maximum-lines 5000
;;       eshell-hist-ignoredups t
;;       eshell-scroll-to-bottom-on-input t
;;       eshell-destroy-buffer-when-process-dies t
;;       eshell-visual-commands'("bash" "fish" "htop" "ssh" "top" "zsh"))
;; (map! :leader
;;       :desc "Eshell" "e s" #'eshell
;;       :desc "Counsel eshell history" "e h" #'counsel-esh-history)

(require 'tex-site)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTex t)
(global-font-lock-mode t)

(map! :leader
      (:prefix ("w" . "window")
       :desc "Winner redo" "<right>" #'winner-redo
       :desc "Winner undo" "<left>" #'winner-undo))

(set-file-template! "/math\\.tex$" :trigger "__math.tex" :mode 'latex-mode)
(set-file-template! "/manifest\\.json" :trigger "__manifest.json" :mode 'json-mode)

(require 'key-chord)
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

(setq select-enable-clipboard t)

(setq default-input-method "japanese")

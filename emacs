;; emacs configuration by walther

;; set up package repositories, autoinstall, and so on
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(setq package-enable-at-startup nil)
(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.
Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

;; List of packages I want
(ensure-package-installed
 'evil
 'magit
 'monokai-theme
 'powerline
 'haskell-mode
 )

;; Package-specific enables

;; powerline
(require 'powerline)
(powerline-default-theme)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

;; ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(ido-vertical-mode 1)

;; end package-specific enables

;; Theme, look, appearance
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'monokai t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(global-linum-mode 1)
(setq inhibit-startup-screen t)

;; Behaviour, key combos
(global-set-key (kbd "C-S-p") 'execute-extended-command) ;; Old habits die slowly; from sublime text
(setq mouse-wheel-scroll-amount '(3)) ;; three lines at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling


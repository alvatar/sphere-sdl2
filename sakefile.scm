(define modules '(sdl2))

(define-task clean ()
  (sake:default-clean))

(define-task compile ()
  (let ((cc-options "-w -I/usr/local/include/SDL2")
        (ld-options "-L/usr/local/lib -lSDL2"))
    (for-each (lambda (m)
                (sake:compile-c-to-o (sake:compile-to-c m)
                                     cc-options: cc-options
                                     ld-options: ld-options))
              modules)))

(define-task install ()
  (for-each sake:install-compiled-module modules)
  (sake:install-system-sphere))

(define-task uninstall ()
  (sake:uninstall-system-sphere))

(define-task all (compile install)
  'all)

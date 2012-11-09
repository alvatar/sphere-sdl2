(define modules '(sdl2))

(define-task clean ()
  (sake:default-clean))

(define-task compile ()
  (let ((cc-options "-w -I/usr/local/include/SDL2")
        (ld-options "-L/usr/local/lib -lSDL2"))
    (for-each (lambda (m)
                (sake:compile-to-c m)
                (sake:compile-to-o m
                                   cc-options: cc-options
                                   ld-options: ld-options)
                (sake:compile-to-c m
                                   version: '(debug)
                                   compiler-options: '(debug))
                (sake:compile-to-o m
                                   version: '(debug)
                                   compiler-options: '(debug)
                                   cc-options: cc-options
                                   ld-options: ld-options))
              modules)))

(define-task install ()
  (for-each (lambda (m)
              (sake:install-compiled-module m)
              (sake:install-compiled-module m version: '(debug)))
            modules)
  (sake:install-system-sphere))

(define-task uninstall ()
  (sake:uninstall-system-sphere))

(define-task all (compile install)
  'all)

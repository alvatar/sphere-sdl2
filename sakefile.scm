(define modules
  '(sdl2
    sdl2-image
    sdl2-mixer
    sdl2-ttf))

(define-task compile ()
  (for-each (lambda (module)
              (sake#compile-module module compiler-options: '(debug))
              (sake#compile-module module))
            modules))

(define-task install ()
  (for-each (lambda (m) (sake#install-compiled-module m versions: '(() (debug)))) modules)
  ;(make-directory "lib/android")
  ;(copy-file "src/android/libs" "lib/android/libs")
  )

(define-task force-install ()
  (sake#install-sphere-to-system))

(define-task all (compile install)
  'all)

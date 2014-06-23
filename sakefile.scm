(define modules
  '(sdl2
    sdl2-image
    sdl2-mixer
    sdl2-ttf
    ))

(define-task compile ()
  ;; This fixes and issue in OSX: pkg-config not finding Gl
  (if (eq? (sake#host-platform) 'osx)
      (setenv "PKG_CONFIG_PATH" "/opt/X11/lib/pkgconfig/"))
  (for-each (lambda (m) (sake#compile-module m compiler-options: '(debug))) modules)
  (for-each sake#compile-module modules))

(define-task post-compile ()
  ;;(make-directory "lib/android")
  ;;(copy-file "src/android/libs" "lib/android/libs")
  (for-each (lambda (m) (sake#make-module-available m versions: '(() (debug)))) modules))

(define-task install ()
  (sake#install-sphere-to-system extra-directories: '("deps")))

(define-task test ()
  (sake#test-all))

(define-task clean ()
  (sake#default-clean))

(define-task all (compile post-compile)
  'all)

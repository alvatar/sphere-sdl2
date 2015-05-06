(include "~~lib/ssrun/tasks/core.scm")

(define libraries
  `(((spheres/sdl2 sdl2)
     .
     ,(lambda (lib)
        (ssrun#compile-library
         lib
         cond-expand-features: '(debug)
         cc-options: "-I../../deps/SDL2-2.0.3/include/ -w"
         ld-options: "-lSDL2")))
    ((spheres/sdl2 sdl2-image)
     .
     ,(lambda (lib)
        (ssrun#compile-library
         lib
         cond-expand-features: '(debug)
         cc-options: "-I../../deps/SDL2-2.0.3/include/ -I../../deps/SDL2_image-2.0.0 -w"
         ld-options: "-lSDL2 -lSDL2_image")))
    ((spheres/sdl2 sdl2-mixer)
     .
     ,(lambda (lib)
        (ssrun#compile-library
         lib
         cond-expand-features: '(debug)
         cc-options: "-I../../deps/SDL2-2.0.3/include/ -I../../deps/SDL2_mixer-2.0.0 -w"
         ld-options: "-lSDL2 -lSDL2_mixer")))
    ((spheres/sdl2 sdl2-ttf)
     .
     ,(lambda (lib)
        (ssrun#compile-library
         lib
         cond-expand-features: '(debug)
         cc-options: "-I../../deps/SDL2-2.0.3/include/ -I../../deps/SDL2_ttf-2.0.12 -w"
         ld-options: "-lSDL2 -lSDL2_ttf")))))

(define-task (compile library) ()
  ;; This fixes and issue in OSX: pkg-config not finding GL
  ;; (if (eq? (sake#host-platform) 'osx)
  ;;     (setenv "PKG_CONFIG_PATH" "/opt/X11/lib/pkgconfig/"))
  (if library
      (let ((entry (assoc library libraries))) ((cdr entry) (car entry)))
      (for-each (lambda (entry) ((cdr entry) (car entry))) libraries)))

(define-task (test file) ()
  (if file
      (ssrun#run-file (string-append "test/" file))
      (ssrun#run-all-files "test/")))

(define-task clean ()
  (ssrun#clean-libraries (map car libraries)))

(define-task all (compile)
  (void))

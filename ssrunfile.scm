(include "~~lib/ssrun/tasks/core.scm")

(define (sdl2-config-cc)
  (string-append
   (with-input-from-process
    (list path: "sdl2-config"
	  arguments: '("--cflags")) read-line)
   "-w"))

(define (sdl2-config-ld . static)
  (with-input-from-process
   (list path: "sdl2-config"
	 arguments: (list (if (null? static) 
			  "--libs" 
			  "--static-libs")))
   read-line))
  
(define libraries
  `(((spheres/sdl2 sdl2)
     .
     ,(lambda (lib)
	(ssrun#compile-library
	   lib
	   cond-expand-features: '(debug)
	   cc-options: (sdl2-config-cc)
	   ld-options: (sdl2-config-ld))))
    ((spheres/sdl2 sdl2-image)
     .
     ,(lambda (lib)
        (ssrun#compile-library
         lib
         cond-expand-features: '(debug)
         cc-options: (sdl2-config-cc)
         ld-options: (string-append (sdl2-config-ld) " " "-lSDL2_image"))))
    ((spheres/sdl2 sdl2-mixer)
     .
     ,(lambda (lib)
        (ssrun#compile-library
         lib
         cond-expand-features: '(debug)
         cc-options: (sdl2-config-cc)
         ld-options: (string-append (sdl2-config-ld) " " "-lSDL2_mixer"))))
    ((spheres/sdl2 sdl2-ttf)
     .
     ,(lambda (lib)
        (ssrun#compile-library
         lib
         cond-expand-features: '(debug)
         cc-options: (sdl2-config-cc)
         ld-options:  (string-append (sdl2-config-ld) " " "-lSDL2_ttf"))))))

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

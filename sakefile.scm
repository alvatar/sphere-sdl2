(define lib-directory "lib/")
(define lib-name "sdl2")
(define lib-suffix ".o1")

(define-task init ()
  (make-directory (current-build-directory)))

(define-task clean (init)
  (delete-file (current-build-directory))
  (delete-file lib-directory))

(define-task compile (init)
  (gambit-eval-here
   '(begin
      (include "~~prelude/prelude#.scm")
      (compile-file "module.scm" output: "build/sdl2.o1" cc-options: "-w -I/usr/local/include/SDL2" ld-options: "-L/usr/local/lib -lSDL2"))))

(define-task install (compile)
  (make-directory lib-directory)
  (delete-file (string-append lib-directory lib-name lib-suffix))
  (copy-file (string-append (current-build-directory) lib-name lib-suffix)
             (string-append lib-directory lib-name lib-suffix)))

(define-task all (compile install)
  '(compile and install))

(define lib-directory "lib/")
(define lib-name "sdl2")
(define lib-suffix ".o1")
(define c-suffix ".c")

(define-task init ()
  (make-directory (current-build-directory)))

(define-task clean (init)
  (delete-file (current-build-directory))
  (delete-file lib-directory))

(define-task compile (init)
  (let ((module-maker-object (string-append (current-build-directory) "make-module-o-" lib-name ".scm"))
        (module-maker-c (string-append (current-build-directory) "make-module-c-" lib-name ".scm")))
    ;; Prepare module maker for native object target
    (call-with-output-file
        module-maker-object
      (lambda (file)
        (display
         (string-append
          "(%include base: ffi)"
          "(include  \"../src/" lib-name ".scm\")")
         file)))
    ;; Prepare module maker for C target
    (call-with-output-file
        module-maker-c
      (lambda (file)
        (display
         (string-append
          "(%include base: ffi#)"
          "(include  \"../src/" lib-name ".scm\")")
         file)))
    (gambit-eval-here
     `(begin
        (include "~~prelude/prelude#.scm")
        ;; Compile object
        (compile-file ,module-maker-object
                      output: "build/sdl2.o1"
                      cc-options: "-w -I/usr/local/include/SDL2"
                      ld-options: "-L/usr/local/lib -lSDL2")
        ;; Compile to C
        (compile-file-to-target
         ,module-maker-c
         output: ,(string-append (current-build-directory) lib-name c-suffix))))
    (delete-file module-maker-object)
    (delete-file module-maker-c)))
  
  

(define-task compile-to-c (init)
  (gambit-eval-here
   `(begin
      (include "~~prelude/prelude#.scm")
      )))

(define-task install (compile compile-to-c)
  (make-directory lib-directory)
  (delete-file (string-append lib-directory lib-name lib-suffix))
  (delete-file (string-append lib-directory lib-name c-suffix))
  (copy-file (string-append (current-build-directory) lib-name lib-suffix)
             (string-append lib-directory lib-name lib-suffix))
  (copy-file (string-append (current-build-directory) lib-name c-suffix)
             (string-append lib-directory lib-name c-suffix)))

(define-task all (compile install)
  '(compile and install))

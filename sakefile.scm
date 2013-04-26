(define library-modules
  '((sdl2 . "-L/usr/local/lib -lSDL2")
    (sdl2-image . "-L/usr/local/lib -lSDL2_image")
    (sdl2-mixer . "-L/usr/local/lib -lSDL2_mixer")
    (sdl2-ttf . "-L/usr/local/lib -lSDL2_ttf")))

(define glue-modules
  '(android-main))

(define-task clean ()
  (sake:default-clean))

(define-task compile ()
  (for-each (lambda (module-info)
              (let ((module (car module-info))
                    (cc-options "-w -I/usr/local/include/SDL2")
                    (ld-options (cdr module-info)))
                (sake:compile-c-to-o (sake:compile-to-c module compiler-options: '(debug))
                                     cc-options: cc-options
                                     ld-options: ld-options)
                (sake:compile-c-to-o (sake:compile-to-c module)
                                     cc-options: cc-options
                                     ld-options: ld-options)))
            library-modules))

(define-task compile:android ()
  (let* ((platform "android-9")
         (fusion-path (%sphere-path 'fusion))
         (toolchain-path (string-append fusion-path "platform/" platform)))
    (if (not (file-exists? toolchain-path))
        (shell-command (string-append "mkdir -p " toolchain-path)))
    (if (not (file-exists? (string-append toolchain-path "/bin")))
        (shell-command
         (string-append
          "$ANDROID_NDK_PATH/build/tools/make-standalone-toolchain.sh --platform="
          platform
          " $NDK_PLATFORM --install-dir="
          toolchain-path)))
    ;;(sake:compile-c-to-o (sake:compile-to-c 'android-main compiler-options: '(debug)))
    ;;(sake:compile-c-to-o (sake:compile-to-c 'android-main))
    ;; (shell-command
    ;;  (string-append
    ;;   "export PATH=" toolchain-path "/bin:$PATH"
    ;;   " && mkdir -p ext/SDL/build"
    ;;   " && cd ext/SDL/build"
    ;;   " && ../configure --host=arm-linux-androideabi --prefix="
    ;;   toolchain-path
    ;;   " && make -j "
    ;;   " && make install"))
    (shell-command
     (string-append
      "export PATH=" toolchain-path "/bin:$PATH"
      " && cd ext/SDL/"
      " && ln -sf ../SDL android-project/jni/SDL"
      " && cd android-project"
      " && rm -fR jni/src"
      " && ndk-build -j"
      " && cp libs/armeabi/libSDL2.so " toolchain-path "/lib"))))

(define-task install ()
  (for-each (lambda (m) (sake:install-compiled-module (car m) versions: '(() (debug)))) library-modules)
  (for-each (lambda (m) (sake:install-compiled-module m versions: '(() (debug)))) glue-modules)
  (sake:install-sphere-to-system))

(define-task uninstall ()
  (sake:uninstall-sphere-from-system))

(define-task all (compile install)
  'all)

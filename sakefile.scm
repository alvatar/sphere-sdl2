(define modules '(sdl2 android-main))

(define-task clean ()
  (sake:default-clean))

(define-task compile ()
  (let ((cc-options "-w -I/usr/local/include/SDL2")
        (ld-options "-L/usr/local/lib -lSDL2"))
    (sake:compile-c-to-o (sake:compile-to-c 'sdl2 compiler-options: '(debug))
                         cc-options: cc-options
                         ld-options: ld-options)
    (sake:compile-c-to-o (sake:compile-to-c 'sdl2)
                         cc-options: cc-options
                         ld-options: ld-options))
  (sake:compile-c-to-o (sake:compile-to-c 'android-main compiler-options: '(debug)))
  (sake:compile-c-to-o (sake:compile-to-c 'android-main)))

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
  (for-each (lambda (m) (sake:install-compiled-module m versions: '(() (debug)))) modules)
  (sake:install-sphere-to-system))

(define-task uninstall ()
  (sake:uninstall-sphere-from-system))

(define-task all (compile install)
  'all)

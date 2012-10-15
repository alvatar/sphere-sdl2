(sphere: "sdl2")
(dependencies:
 (sdl2
  (include
   (base: ffi#))
  (load
   (base: ffi)))
 ((sdl2: sdl2 version: (debug))
  (include
   (base: ffi# version: (debug)))
  (load
   (base: ffi version: (debug)))))

(sphere: "sdl2")
(dependencies:
 (sdl2
  (include
   (base: ffi-macros)
   (sdl2: sdl2-header))
  (load
   (base: ffi)))
 ((sdl2: sdl2 version: (debug))
  (include
   (base: ffi-macros version: (debug))
   (sdl2: sdl2-header version: (debug)))
  (load
   (base: ffi version: (debug)))))

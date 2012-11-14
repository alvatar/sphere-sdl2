(sphere: "sdl2")
(dependencies:
 (sdl2
  (include
   (base: ffi-macros)
   (sdl2: sdl2-macros))
  (load
   (base: ffi)))
 ((sdl2: sdl2 version: (debug))
  (include
   (base: ffi-macros version: (debug))
   (sdl2: sdl2-macros version: (debug)))
  (load
   (base: ffi version: (debug)))))

(sphere: "sdl2")
(dependencies:
 (sdl2
  (prelude
   (core: ffi-header)
   (sdl2: sdl2-header))
  (load
   (core: ffi)))
 ((sdl2: sdl2 version: (debug))
  (include
   (core: ffi-macros version: (debug))
   (sdl2: sdl2-header version: (debug)))
  (load
   (core: ffi version: (debug)))))

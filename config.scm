(sphere: "sdl2")
(dependencies:
 (sdl2
  (cc-options (pkg-config--cflags "sdl2") "-w")
  (ld-options (pkg-config--libs "sdl2"))
  (include
   (core: ffi-macros))
  (prelude
   (core: ffi-prelude)
   (sdl2: sdl2-prelude)))
 (sdl2-image
  (cc-options (pkg-config--cflags "SDL2_image") "-w")
  (ld-options (pkg-config--libs "SDL2_image"))
  (include
   (core: ffi-macros))
  (prelude
   (core: ffi-prelude)
   (sdl2: sdl2-prelude))
  (load (= sdl2)))
 (sdl2-mixer
  (cc-options (pkg-config--cflags "SDL2_mixer") "-w")
  (ld-options (pkg-config--libs "SDL2_mixer"))
  (include
   (core: ffi-macros))
  (prelude
   (core: ffi-prelude)
   (sdl2: sdl2-prelude))
  (load (= sdl2)))
 (sdl2-ttf
  (cc-options (pkg-config--cflags "SDL2_ttf") "-w")
  (ld-options (pkg-config--libs "SDL2_ttf"))
  (include
   (core: ffi-macros))
  (prelude
   (core: ffi-prelude)
   (sdl2: sdl2-prelude))
  (load (= sdl2))))

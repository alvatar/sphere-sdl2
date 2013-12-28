(sphere: "sdl2")
(dependencies:
 (android-main
  (load
   (sdl2: sdl2)))
 (sdl2
  (cc-options (pkg-config--cflags "sdl2"))
  (ld-options (pkg-config--libs "sdl2"))
  (prelude
   (core: ffi-header)
   (sdl2: sdl2-header)))
 (sdl2-image
  (cc-options (pkg-config--cflags "SDL2_image"))
  (ld-options (pkg-config--libs "SDL2_image"))
  (prelude
   (core: ffi-header)
   (sdl2: sdl2-header)))
 (sdl2-mixer
  (cc-options (pkg-config--cflags "SDL2_mixer"))
  (ld-options (pkg-config--libs "SDL2_mixer"))
  (prelude
   (core: ffi-header)
   (sdl2: sdl2-header)))
 (sdl2-ttf
  (cc-options (pkg-config--cflags "SDL2_ttf"))
  (ld-options (pkg-config--libs "SDL2_ttf"))
  (prelude
   (core: ffi-header)
   (sdl2: sdl2-header))))

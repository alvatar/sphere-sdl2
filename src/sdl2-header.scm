(c-declare "#include \"SDL.h\"")

(c-define-type SDL_BlitMap* (pointer "SDL_BlitMap"))
(c-define-type SDL_bool "SDL_bool")
(c-define-type SDL_EventType int)
(c-define-type SDL_GLattr int)
(c-define-type SDL_GLContext (pointer void))
(c-define-type SDL_PixelFormat*  (pointer "SDL_PixelFormat"))
(c-define-type SDL_Window* (pointer "SDL_Window"))
(c-define-type SDL_WindowEventID int)
(c-define-type SDL_WindowFlags int)
(c-define-type SDL_Rect "SDL_Rect")
(c-define-type SDL_Rect* (pointer SDL_Rect))
(c-define-type SDL_Scancode int)
(c-define-type SDL_Keycode int32)

(c-struct SDL_WindowEvent
          (type unsigned-int32)
          (timestamp unsigned-int32)
          (windowID unsigned-int32)
          (event unsigned-int8)
          (data1 int)
          (data2 int))

(c-struct SDL_Keysym
          ;; for C++ compatibility, I would need a way to instruct the c-struct
          ;; macro to cast this when assigning.
          (scancode SDL_Scancode)
          (sym SDL_Keycode)
          (mod unsigned-int16)
          (unicode unsigned-int32))

(c-struct SDL_KeyboardEvent
          (type unsigned-int32)
          (timestamp unsigned-int32)
          (windowID unsigned-int32)
          (state unsigned-int8)
          (repeat unsigned-int8)
          (keysym SDL_Keysym voidstar))

(c-struct SDL_MouseButtonEvent
          (type unsigned-int32)
          (windowID unsigned-int32)
          (button unsigned-int8)
          (state unsigned-int8)
          (x int)
          (y int))

(c-union SDL_Event
         (type unsigned-int32)
         (window SDL_WindowEvent voidstar)
         (key SDL_KeyboardEvent voidstar)
         (button SDL_MouseButtonEvent voidstar))

(c-struct SDL_Surface
          (format SDL_PixelFormat*)
          (w int)
          (h int)
          (pitch int)
          (pixels void*)
          (userdata void*)
          (clip_rect SDL_Rect)
          (refcount int))

(##namespace ("sdl2#"
              SDL_CreateWindow
              SDL_Init
              SDL_INIT_VIDEO
              SDL_WINDOWPOS_CENTERED
              SDL_WINDOW_OPENGL
              SDL_WINDOW_BORDERLESS
              SDL_GetWindowSize
              SDL_GL_CreateContext
              SDL_Log
              make-SDL_Event
              SDL_Event-pointer
              SDL_PollEvent
              SDL_Event-type
              SDL_Event-window
              SDL_WindowEvent-event
              SDL_QUIT
              SDL_MOUSEBUTTONDOWN
              SDL_KEYDOWN
              SDL_WINDOWEVENT
              SDL_WINDOWEVENT_SIZE_CHANGED
              SDL_WINDOWEVENT_MINIMIZED
              SDL_WINDOWEVENT_RESTORED
              SDL_WINDOWEVENT_RESIZED
              SDL_LogInfo
              SDL_GL_Extension_Supported
              SDL_GL_SwapWindow
              SDL_Delay
              SDL_LOG_CATEGORY_APPLICATION))

(cond-expand
 ((or compile-to-o compile-to-c)
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

  (c-union SDL_Event
           (type unsigned-int32)
           (window SDL_WindowEvent voidstar)
           (key SDL_KeyboardEvent voidstar))

  (c-struct SDL_Surface
            (format SDL_PixelFormat*)
            (w int)
            (h int)
            (pitch int)
            (pixels void*)
            (userdata void*)
            (clip_rect SDL_Rect)
            (refcount int)))
 (else))

;;; Copyright (c) 2013 by Álvaro Castro Castilla. All Rights Reserved.
;;; SDL2 Foreign Function Interface

(c-declare "#include \"SDL.h\"")

(c-define-type SDL_BlitMap* (pointer "SDL_BlitMap"))
(c-define-type SDL_bool "SDL_bool")
(c-define-type SDL_EventType int)
(c-define-type SDL_BlendMode int)
(c-define-type SDL_GLattr int)
(c-define-type SDL_GLContext (pointer void))
(c-define-type SDL_PixelFormat*  (pointer "SDL_PixelFormat"))
(c-define-type SDL_Window* (pointer "SDL_Window"))
(c-define-type SDL_WindowEventID int)
(c-define-type SDL_WindowFlags int)
(c-define-type SDL_Scancode int)
(c-define-type SDL_Keycode int)

(c-define-struct SDL_Color
                 (r unsigned-int8)
                 (g unsigned-int8)
                 (b unsigned-int8))

(c-define-struct SDL_WindowEvent
                 (type unsigned-int32)
                 (timestamp unsigned-int32)
                 (windowID unsigned-int32)
                 (event unsigned-int8)
                 (data1 int)
                 (data2 int))
(c-define-struct SDL_Keysym
                 (scancode SDL_Scancode)
                 (sym SDL_Keycode)
                 (mod unsigned-int16)
                 (unicode unsigned-int32))
(c-define-struct SDL_KeyboardEvent
                 (type unsigned-int32)
                 (timestamp unsigned-int32)
                 (windowID unsigned-int32)
                 (state unsigned-int8)
                 (repeat unsigned-int8)
                 (keysym SDL_Keysym))
(c-define-struct SDL_MouseButtonEvent
                 (type unsigned-int32)
                 (windowID unsigned-int32)
                 (button unsigned-int8)
                 (state unsigned-int8)
                 (x int)
                 (y int))
(c-define-union SDL_Event
                (type unsigned-int32)
                (window SDL_WindowEvent)
                (key SDL_KeyboardEvent)
                (button SDL_MouseButtonEvent))

(c-define-struct SDL_Rect
                 (x int)
                 (y int)
                 (w int)
                 (h int))

(c-define-struct SDL_Surface
                 (format SDL_PixelFormat*)
                 (w int)
                 (h int)
                 (pitch int)
                 (pixels (pointer void))
                 (userdata (pointer void))
                 (clip_rect SDL_Rect)
                 (refcount int))
